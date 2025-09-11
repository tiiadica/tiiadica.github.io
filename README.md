# The Royal Family - Kansas City Sports Website

A Jekyll-powered website for Kansas City Royals, KC Current, and local sports coverage.

## 🏆 Features

- **Jekyll-powered blog** for easy content management
- **Category system** with color-coded organization
- **Featured posts** highlighting important content
- **Responsive design** with NES.css theme
- **SEO optimization** with proper meta tags and sitemaps
- **RSS feed** for content syndication
- **Pagination** for easy content browsing

## 📝 Quick Start for Content Creators

**Want to publish a new article?** See the [Content Creation Guide](CONTENT_GUIDE.md) for detailed instructions.

### TL;DR - Publishing New Posts

1. Create a file in `_posts/` named `YYYY-MM-DD-title-slug.md`
2. Add front matter with title, date, categories, etc.
3. Write your content in Markdown
4. Commit and push to publish

Example:
```markdown
---
layout: post
title: "Your Article Title"
date: 2025-01-15 10:00:00 -0600
categories:
  - royals
author: staff
---

Your content here...
```

## 🛠️ Development Setup

### Prerequisites
- Ruby 3.0+
- Bundler

### Local Development
```bash
# Install dependencies
bundle install

# Serve locally
bundle exec jekyll serve

# Build for production
bundle exec jekyll build
```

## 📁 Project Structure

```
├── _config.yml          # Jekyll configuration
├── _layouts/            # Page templates
│   ├── default.html     # Base layout
│   ├── post.html        # Individual post layout
│   └── page.html        # Static page layout
├── _includes/           # Reusable components
│   ├── head.html        # HTML head section
│   ├── featured.html    # Featured posts section
│   └── category-badge.html # Category styling
├── _posts/              # Blog posts (Markdown files)
├── assets/              # Images, CSS, and other assets
├── news/                # Blog archive page
└── categories/          # Category pages
```

## 🎨 Categories

The site supports these content categories:

- **royals** - Kansas City Royals coverage
- **current** - KC Current soccer content  
- **podcast** - Audio content and episodes
- **opinion** - Editorial and opinion pieces
- **updates** - General site updates
- **stats** - Data analysis and statistics
- **world** - Broader sports coverage
- **supportkc** - Local KC sports community

## 🚀 Deployment

The site is configured for GitHub Pages deployment. Changes to the main branch automatically rebuild and deploy the site.

## 📱 Design

- **Theme**: NES.css for retro gaming aesthetic
- **Colors**: Each category has its own color scheme
- **Typography**: Press Start 2P font for headers
- **Responsive**: Mobile-friendly design

## 🔧 Configuration

Key settings in `_config.yml`:
- Site title and description
- Category colors
- Pagination settings
- Plugin configuration
- SEO and social media settings

## 📄 License

This project is for The Royal Family sports coverage website.

---

For detailed content creation instructions, see [CONTENT_GUIDE.md](CONTENT_GUIDE.md).