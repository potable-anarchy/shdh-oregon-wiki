# Contributing to SHDH Oregon Wiki

Thank you for helping improve the Super Happy Dev House Oregon wiki! This is a community-maintained resource, and we welcome contributions from everyone.

## 🚀 Quick Start

1. **Fork** the repository
2. **Edit** markdown files
3. **Commit** your changes
4. **Push** to your fork
5. **Open** a pull request

## 📝 What to Contribute

### Always Welcome
- ✅ Event documentation and photos
- ✅ Project showcases
- ✅ Learning resources
- ✅ Tool recommendations
- ✅ Venue information updates
- ✅ Bug fixes and typo corrections

### Please Discuss First
- 🤔 Major structural changes
- 🤔 New top-level pages
- 🤔 Removing existing content
- 🤔 Policy changes

### Not Accepted
- ❌ Spam or promotional content
- ❌ Offensive or discriminatory content
- ❌ Personal information without consent
- ❌ Copyright-infringing material

## 🔧 How to Contribute

### Method 1: GitHub Web Interface (Easiest)

1. Navigate to the file you want to edit on GitHub
2. Click the pencil icon (✏️) to edit
3. Make your changes in the web editor
4. Add a commit message describing your change
5. Select "Create a new branch and start a pull request"
6. Submit the pull request

### Method 2: Local Development

```bash
# Fork the repository on GitHub first

# Clone your fork
git clone https://github.com/YOUR-USERNAME/shdh-oregon-wiki.git
cd shdh-oregon-wiki

# Create a new branch
git checkout -b add-awesome-resource

# Make your changes
edit Resources/Learning.md

# Test locally with Docker
docker-compose up
# Visit http://localhost:4567

# Commit your changes
git add .
git commit -m "Add awesome learning resource for Python beginners"

# Push to your fork
git push origin add-awesome-resource

# Open a pull request on GitHub
```

### Method 3: Direct Edit in Gollum (Local Only)

```bash
# Run the wiki locally
docker-compose up

# Edit directly in browser at http://localhost:4567

# Commit changes via Git when done
git add .
git commit -m "Update event information"
git push origin main
```

## 📋 Contribution Guidelines

### Writing Style

#### Tone
- **Friendly** and welcoming
- **Clear** and concise
- **Encouraging** and supportive
- **Inclusive** of all skill levels

#### Formatting
- Use **Markdown** formatting
- Keep paragraphs **short** (3-4 sentences)
- Use **bullet points** for lists
- Include **headers** for organization
- Add **links** for references

#### Examples

Good:
> "New to Git? No problem! Check out these beginner-friendly resources to get started."

Avoid:
> "Everyone should obviously know Git by now, but if you don't, here's a link."

### Markdown Standards

#### Links
```markdown
# Internal wiki links
[[Page Name]]
[[Custom Text|Page-Name]]
[[First-Time|Getting-Started/First-Time]]

# External links
[Link Text](https://example.com)
```

#### Images
```markdown
# Add images to the images/ directory
![Alt text](images/filename.png)
![Event photo](images/events/2024-01-event.jpg)
```

#### Code Blocks
````markdown
```python
def hello_shdh():
    print("Happy hacking!")
```
````

### File Naming

- Use **hyphens** for spaces: `First-Time.md`
- Use **PascalCase** for page names: `Project-Ideas.md`
- Keep names **descriptive** but concise
- Match **existing patterns** in directories

### Adding Event Documentation

When documenting an event:

1. Copy `Events/Event-Template.md`
2. Name it: `Events/YYYY-MM-DD-SHDH-Number.md`
3. Fill in all sections
4. Add photos to `images/events/`
5. Update `Events/Past.md` with summary
6. Submit PR within a week of event

### Adding Your Project

1. Edit `Community/Projects.md`
2. Use the project template provided
3. Include:
   - Brief description
   - Tech stack
   - Links (GitHub, demo)
   - Current status
4. Keep it concise (5-6 lines max)

### Adding Resources

For learning resources or tools:
- Verify links work
- Add brief description
- Categorize appropriately
- Check for duplicates
- Prefer free resources

## 🖼️ Images

### Guidelines
- **Optimize** images (< 500KB preferred)
- **Name** descriptively: `salem-library-entrance.jpg`
- **Get permission** before posting photos of people
- **Use** JPEG for photos, PNG for screenshots
- **Store** in appropriate subdirectory

### Directory Structure
```
images/
├── events/         # Event photos
├── venues/         # Venue photos
├── projects/       # Project screenshots
└── misc/          # Everything else
```

## ✅ Pull Request Checklist

Before submitting your PR:

- [ ] **Preview** your changes locally
- [ ] **Check** all links work
- [ ] **Verify** markdown formatting
- [ ] **Review** for typos
- [ ] **Ensure** content is appropriate
- [ ] **Write** clear commit message
- [ ] **Update** related pages if needed

## 📞 Pull Request Process

1. **Submit** your PR with clear description
2. **Wait** for review (usually 1-3 days)
3. **Respond** to feedback if requested
4. **Celebrate** when merged! 🎉

### Good PR Description

```markdown
## What
Added new learning resource for Rust beginners

## Why
Several attendees at SHDH #3 were asking about Rust resources

## Changes
- Added "Rust by Example" to Resources/Learning.md
- Added link under "Other Languages" section
- Verified link works and resource is free
```

## 🤝 Code of Conduct

All contributors must follow our [[Code of Conduct|Getting-Started/Code-of-Conduct]].

Key points:
- Be respectful
- Be inclusive
- Be constructive
- Be collaborative

## 🙋 Getting Help

### Questions About Contributing?

- **Open an issue** with your question
- **Ask at an event** - find an organizer
- **Email us**: shdh-oregon@example.com
- **Discord** (coming soon)

### Types of Help We Need

#### Immediate Needs
- Event photographers
- Note-takers during events
- Proofreaders
- Resource curators

#### Ongoing Needs
- Wiki maintainers
- Event documentation
- Project showcase updates
- Resource list updates

## 🏆 Recognition

Regular contributors will be:
- Listed in our Contributors section
- Thanked at events
- Given commit access (after 3+ quality PRs)
- Invited to help organize

## 📜 License

By contributing, you agree that your contributions will be licensed under the same license as the project (MIT License).

## 🔄 Keeping Your Fork Updated

```bash
# Add upstream remote
git remote add upstream https://github.com/shdh-oregon/wiki.git

# Fetch upstream changes
git fetch upstream

# Merge changes into your main branch
git checkout main
git merge upstream/main

# Push to your fork
git push origin main
```

## 💡 Contribution Ideas

### Easy First Contributions
- Fix a typo
- Add a learning resource
- Update venue information
- Add your project to the showcase
- Improve formatting

### Larger Contributions
- Document an entire event
- Create a new guide
- Reorganize a section
- Add new venue pages
- Create tutorials

## 🚫 What Not to Do

### Please Avoid
- Mass editing without discussion
- Deleting others' content
- Adding controversial topics
- Including personal information
- Breaking existing links
- Committing large binary files

## 📅 Review Timeline

We aim to review PRs within:
- **Typo fixes**: 1 day
- **Content additions**: 2-3 days  
- **Major changes**: 1 week

If your PR hasn't been reviewed in this timeframe, please ping us!

---

*Thank you for contributing to SHDH Oregon! Your efforts help make our community stronger and more welcoming.*

[[Home]] | [[About]] | [[Code of Conduct|Getting-Started/Code-of-Conduct]]