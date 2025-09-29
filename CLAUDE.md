# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the Super Happy Dev House Oregon wiki project - a community-editable wiki site built with Gollum wiki engine, backed by GitHub. The project aims to create a simple, maintainable wiki for a free monthly developer meetup in the Salem/Corvallis/Monmouth area.

## Key Project Goals

1. Build a Gollum-based wiki with Docker deployment
2. Enable community editing via GitHub pull requests
3. Create welcoming, informative content for event attendees
4. Keep infrastructure simple and low-maintenance

## Project Structure

The target structure for this wiki project:
- `Home.md` - Wiki landing page
- `Events/` - Event documentation and templates
- `Getting-Started/` - First-timer guides and code of conduct
- `Resources/` - Project ideas and learning resources
- `Community/` - Lightning talks and project showcases
- `Venues/` - Venue information
- `images/` - Wiki images
- Docker configuration for deployment

## Development Commands

### Local Development
```bash
# Build and run with Docker Compose
docker-compose up

# Run Gollum directly (if Ruby/Gollum installed)
gollum --port 4567 --host 0.0.0.0 --ref main --allow-uploads page --live-preview --h1-title
```

### Docker Operations
```bash
# Build Docker image
docker build -t shdh-oregon-wiki .

# Run container
docker run -p 4567:4567 -v $(pwd):/wiki shdh-oregon-wiki
```

## Technical Requirements

### Gollum Configuration
- Port: 4567
- Host: 0.0.0.0 for container accessibility
- Branch: main
- Upload support enabled for pages
- Live preview enabled for development
- Production mode: --no-edit flag to force PR workflow

### Docker Requirements
- Ruby 3.2 Alpine base image
- Non-root user for security
- Health checks included
- Volume mounting for local development

## Content Guidelines

### Markdown Standards
- Use friendly, welcoming tone
- Headers should be descriptive and hierarchical
- Internal links use `[[Page-Name]]` format
- External links use standard markdown `[text](url)`
- Include navigation helpers on major pages

### Page Requirements
- Every page should have clear purpose
- Include "New here?" callouts where appropriate
- Use templates for recurring content (events, venues)
- Keep mobile readability in mind

## Deployment Considerations

1. Production should disable direct editing (--no-edit flag)
2. All changes go through GitHub PR workflow
3. Deployed on Render with auto-deploy from GitHub
4. Environment should be containerized for consistency

## Security Notes

- Run containers as non-root user
- No public write access in production
- Validate user-submitted content
- Use PR review process for all wiki changes