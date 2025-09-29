# Claude Code Prompt: Build SHDH Oregon Wiki with Gollum

## Project Goal

Create a community wiki site for Super Happy Dev House Oregon using Gollum wiki engine, backed by a GitHub repository. The wiki should be simple to maintain, community-editable via pull requests, and easily deployable.

## What I Need You To Do

### 1. GitHub Repository Setup

Create a new GitHub repository structure with:

```
shdh-oregon-wiki/
├── README.md                  # Project info and setup instructions
├── Dockerfile                 # For deployment
├── docker-compose.yml         # For local development
├── .gitignore                # Standard Ruby/Gollum ignores
├── Home.md                    # Wiki landing page
├── About.md
├── Events/
│   ├── Upcoming.md
│   ├── Past.md
│   └── Event-Template.md
├── Getting-Started/
│   ├── First-Time.md
│   ├── What-To-Bring.md
│   └── Code-of-Conduct.md
├── Resources/
│   ├── Project-Ideas.md
│   ├── Learning.md
│   └── Tools.md
├── Community/
│   ├── Lightning-Talks.md
│   └── Projects.md
├── Venues/
│   └── Salem-Library.md
├── images/                    # For wiki images
└── _Footer.md                # Site footer
```

### 2. Write the Dockerfile

Create a production-ready Dockerfile that:
- Uses Ruby 3.2 Alpine image
- Installs Gollum and required dependencies (git, github-markdown, redcarpet)
- Sets working directory to /wiki
- Exposes port 4567
- Configures Gollum to run in production mode
- Runs as non-root user for security

### 3. Write docker-compose.yml

Create a docker-compose.yml for local development that:
- Mounts the local directory as a volume
- Exposes port 4567
- Auto-restarts on file changes
- Includes health check

### 4. Create Initial Wiki Content

Write markdown content for these essential pages:

**Home.md:**
- Welcoming introduction to SHDH Oregon
- Next event info (placeholder format)
- Quick navigation links
- "New here? Start with [[First-Time]]" callout

**About.md:**
- Mission statement from the proposal document
- Brief history of SHDH movement
- Why we're bringing it to Oregon
- Contact information

**Getting-Started/First-Time.md:**
- What to expect at your first event
- What to bring (laptop, project idea, curiosity)
- Parking and arrival info (template)
- Typical schedule walkthrough
- Who to talk to for help

**Getting-Started/Code-of-Conduct.md:**
- Be respectful and inclusive
- Harassment policy
- How to report concerns
- Consequences

**Getting-Started/What-To-Bring.md:**
- Checklist format
- Required: laptop, charger, project idea
- Optional: hardware, snacks to share, business cards
- What NOT to bring

**Events/Upcoming.md:**
- Template for listing next events
- Include: Date, time, location, RSVP link, theme

**Events/Event-Template.md:**
- Reusable template for documenting each event
- Sections: Date, Location, Attendees, Projects Worked On, Lightning Talks, Photos

**Resources/Project-Ideas.md:**
- List of project ideas for people who show up without one
- Categorized: Web, Mobile, Games, Data, Hardware, etc.
- "Or help someone else with their project!"

**Venues/Salem-Library.md:**
- Address and parking info
- WiFi details
- Room location
- Accessibility info
- Venue rules

**_Footer.md:**
- Links to GitHub repo
- "Edit this wiki" instructions
- Contact email
- Social media links (placeholders)

### 5. Write a Comprehensive README.md

Include:
- Project description and purpose
- Screenshot placeholder
- Quick start guide (how to run locally)
- Deployment instructions (Docker, Railway, Render)
- How to contribute to the wiki
- File structure explanation
- License (suggest MIT)

### 6. Deployment Configuration Files

Create a `railway.toml` or equivalent for easy deployment to:
- Railway
- Render
- Fly.io

Choose one and document it in the README.

### 7. Create a CONTRIBUTING.md

Explain:
- How to propose wiki edits via PR
- Markdown formatting guidelines
- How to add images
- How to create new pages
- Who reviews and merges PRs

### 8. Add a GitHub Actions Workflow (Optional)

Create `.github/workflows/deploy.yml` that:
- Validates markdown on PR
- Auto-deploys to production on merge to main
- Or at minimum, checks for broken internal links

### 9. Create a Startup Script

Create `start-wiki.sh` that:
- Starts Gollum with appropriate flags
- Sets up environment
- Can be used in production or locally

## Key Gollum Configuration

Run Gollum with these options:
```bash
gollum --port 4567 \
  --host 0.0.0.0 \
  --ref main \
  --allow-uploads page \
  --live-preview \
  --h1-title \
  --no-edit  # For production, force PR workflow
```

## Special Instructions

1. **Keep it simple** - This is for a community, not enterprise
2. **Use markdown best practices** - Clear headers, proper linking
3. **Include helpful comments** in all config files
4. **Make it newbie-friendly** - Assume contributors are learning Git
5. **Mobile responsive** - Gollum's default CSS is fine, but mention it
6. **Security** - No public write access to production; PR workflow only

## Style Guidelines for Markdown Content

- Use friendly, welcoming tone
- Explain acronyms on first use
- Include examples where helpful
- Use emoji sparingly but warmly (👋 🚀 💻)
- Keep paragraphs short and scannable
- Use checklists and bullet points

## What Success Looks Like

When you're done, I should be able to:
1. Clone the repo
2. Run `docker-compose up`
3. Visit `localhost:4567` and see a working wiki
4. Navigate between pages smoothly
5. See helpful, welcoming content
6. Understand how to deploy it to production
7. Know how to contribute new content

## Deliverables

- Complete file structure as outlined above
- All markdown content files written
- Working Dockerfile and docker-compose.yml
- Comprehensive README with setup instructions
- CONTRIBUTING.md with PR workflow
- .gitignore file
- Optional: GitHub Actions workflow
- Optional: Deployment config for one platform

## Additional Context

This is for Super Happy Dev House Oregon - a free, monthly meetup for developers, makers, and tech enthusiasts in the Salem/Corvallis/Monmouth area. The wiki needs to be:
- Easy for non-technical organizers to update
- Clear for first-time attendees
- Community-editable via Git
- Low maintenance

Please ask clarifying questions if you need more information about any aspect of the project!

---

## After You Build This

I'll review everything, test locally, create the GitHub repo, push the code, and then deploy it. Let me know if you run into any technical constraints or have suggestions for improvements.