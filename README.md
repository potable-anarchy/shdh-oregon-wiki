# Super Happy Dev House Oregon Wiki

A community-editable wiki for Super Happy Dev House Oregon - a free, monthly meetup for developers, makers, and tech enthusiasts in the Salem/Corvallis/Monmouth area.

## 🚀 Quick Start

### Run Locally with Docker

```bash
# Clone the repository
git clone https://github.com/yourusername/shdh-oregon-wiki.git
cd shdh-oregon-wiki

# Start the wiki with Docker Compose
docker-compose up

# Visit http://localhost:4567
```

### Run Without Docker

Requires Ruby 3.0+ and Git installed.

```bash
# Install Gollum
gem install gollum github-markdown redcarpet

# Start the wiki
./start-wiki.sh

# Visit http://localhost:4567
```

## 📁 Project Structure

```
shdh-oregon-wiki/
├── Home.md                    # Wiki landing page
├── About.md                   # About SHDH Oregon
├── Events/
│   ├── Upcoming.md           # Next events
│   ├── Past.md               # Event archive
│   └── Event-Template.md     # Template for new events
├── Getting-Started/
│   ├── First-Time.md         # First-timer guide
│   ├── What-To-Bring.md      # Packing checklist
│   └── Code-of-Conduct.md    # Community guidelines
├── Resources/
│   ├── Project-Ideas.md      # Inspiration for projects
│   ├── Learning.md           # Learning resources
│   └── Tools.md              # Recommended tools
├── Community/
│   ├── Lightning-Talks.md    # Talk archives
│   └── Projects.md           # Community project showcase
├── Venues/
│   └── Salem-Library.md      # Venue information
├── images/                    # Wiki images
├── _Footer.md                # Site-wide footer
├── Dockerfile                # Production container
├── docker-compose.yml        # Development setup
└── start-wiki.sh            # Startup script
```

## 🚢 Deployment

### Deploy to Render

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

1. Create a new Web Service on [Render](https://render.com)
2. Connect your GitHub repository
3. Use these settings:
   - **Environment**: Docker
   - **Docker Command**: Leave blank (uses Dockerfile CMD)
   - **Port**: 4567
   - **Health Check Path**: `/`
   - **Auto-Deploy**: Yes (for automatic updates)
4. Click "Create Web Service"

The `render.yaml` file is already configured for one-click deployment.

### Manual Docker Deployment

```bash
# Build the image
docker build -t shdh-oregon-wiki .

# Run in production (read-only mode)
docker run -d \
  --name shdh-wiki \
  -p 4567:4567 \
  --restart unless-stopped \
  shdh-oregon-wiki

# Run with editing enabled (development)
docker run -d \
  --name shdh-wiki-dev \
  -p 4567:4567 \
  -v $(pwd):/wiki \
  --restart unless-stopped \
  shdh-oregon-wiki \
  gollum --port 4567 --host 0.0.0.0 --ref main --allow-uploads page --live-preview --h1-title
```

## 🤝 Contributing

We welcome contributions! The wiki content is managed through GitHub pull requests.

### How to Contribute

1. **Fork** this repository
2. **Create a branch** for your changes
   ```bash
   git checkout -b add-new-resource
   ```
3. **Make your edits** to the markdown files
4. **Commit** your changes
   ```bash
   git add .
   git commit -m "Add new learning resource for Python beginners"
   ```
5. **Push** to your fork
   ```bash
   git push origin add-new-resource
   ```
6. **Open a Pull Request** on GitHub

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

### Local Development

For local development with live reload:

```bash
# Start with docker-compose (recommended)
docker-compose up

# Or use the startup script
./start-wiki.sh --dev
```

This enables editing directly in the browser at http://localhost:4567

## 📝 Writing Wiki Pages

### Markdown Basics

- Pages use [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/)
- Internal links: `[[Page-Name]]` or `[[Custom Text|Page-Name]]`
- Images: Upload to `images/` folder and reference with `[[images/filename.png]]`
- Headers create automatic table of contents

### Page Naming

- Use hyphens for spaces: `First-Time.md`
- Organize in folders: `Events/2024-January.md`
- Special pages start with underscore: `_Footer.md`, `_Sidebar.md`

## 🔧 Configuration

### Environment Variables

- `PORT`: Port to run Gollum on (default: 4567)
- `RACK_ENV`: Set to `production` for read-only mode

### Gollum Options

Edit `start-wiki.sh` or Docker CMD to modify:

- `--no-edit`: Disable web editing (production)
- `--allow-uploads`: Enable file uploads
- `--live-preview`: Enable live preview
- `--mathjax`: Enable math rendering
- `--user-icons`: Enable user avatars

## 📜 License

MIT License - See [LICENSE](LICENSE) file for details.

## 🆘 Support

- **Wiki Issues**: [GitHub Issues](https://github.com/yourusername/shdh-oregon-wiki/issues)
- **Event Questions**: shdh-oregon@example.com
- **Community Chat**: [Discord](https://discord.gg/example) (coming soon)

## 🏗️ Roadmap

- [ ] Custom CSS theme
- [ ] Search functionality
- [ ] Event RSVP integration
- [ ] Project gallery
- [ ] Member directory (opt-in)
- [ ] Automated backups

---

Built with ❤️ by the Super Happy Dev House Oregon community