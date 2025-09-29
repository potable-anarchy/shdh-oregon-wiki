# Use Ruby 3.2 Alpine for smaller image size
FROM ruby:3.2-alpine

# Install required system dependencies
RUN apk add --no-cache \
    git \
    build-base \
    cmake \
    icu-dev \
    openssl-dev \
    && rm -rf /var/cache/apk/*

# Create non-root user for security
RUN addgroup -g 1000 wiki && \
    adduser -D -u 1000 -G wiki wiki

# Set working directory
WORKDIR /wiki

# Install Gollum and required gems
# Note: github-markdown removed due to Alpine compilation issues
# Gollum will use redcarpet or kramdown as fallback
RUN gem install \
    gollum \
    redcarpet \
    kramdown \
    kramdown-parser-gfm \
    rouge \
    && gem cleanup

# Copy wiki content
COPY . /wiki

# Remove any existing .git directory and fix ownership
RUN rm -rf /wiki/.git && \
    chown -R wiki:wiki /wiki

# Switch to non-root user BEFORE git operations
USER wiki

# Initialize git repo as wiki user
# This ensures the repository is owned by wiki user
RUN git config --global user.email "wiki@render.com" && \
    git config --global user.name "Render Wiki" && \
    git config --global init.defaultBranch main && \
    git init && \
    git add . && \
    git commit -m "Initial wiki content"

# Expose Gollum's default port
EXPOSE 4567

# Health check to ensure service is running
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:4567 || exit 1

# Start Gollum in production mode
# --no-edit forces all changes through Git/GitHub
CMD ["gollum", "--port", "4567", "--host", "0.0.0.0", "--ref", "main", "--allow-uploads", "page", "--h1-title", "--no-edit"]
