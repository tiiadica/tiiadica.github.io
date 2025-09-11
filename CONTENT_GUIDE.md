# Content Creation Guide for The Royal Family

This website uses Jekyll to make publishing new articles easy and efficient. Follow this guide to add new content without needing to modify any code.

## Quick Start

1. **Create a new post file** in the `_posts/` directory
2. **Use the naming format**: `YYYY-MM-DD-title-slug.md`
3. **Add front matter** with required fields
4. **Write your content** in Markdown
5. **Commit and push** to publish

## Post File Structure

### File Naming
Posts must be named using this exact format:
```
YYYY-MM-DD-title-slug.md
```

Examples:
- `2025-01-15-royals-spring-training-preview.md`
- `2025-02-20-kc-current-season-recap.md`
- `2025-03-10-chiefs-draft-analysis.md`

### Front Matter
Every post must start with front matter (between `---` lines):

```yaml
---
layout: post
title: "Your Article Title Here"
date: 2025-01-15 10:00:00 -0600
categories:
  - royals
  - current
  - podcast
  - opinion
  - updates
  - stats
  - world
  - supportkc
author: staff
featured: false
description: "Brief description for SEO and social sharing"
image: "/assets/images/your-image.jpg"  # Optional
image_alt: "Alt text for the image"      # Optional
---
```

### Required Fields
- `layout`: Always use `post`
- `title`: The article headline
- `date`: Publication date and time with timezone
- `categories`: One or more categories (see list below)
- `author`: Usually `staff`

### Optional Fields
- `featured`: Set to `true` to show in featured section
- `description`: SEO description (recommended)
- `image`: Path to featured image
- `image_alt`: Alt text for accessibility

## Available Categories

The site supports these categories with color coding:

- **royals**: Kansas City Royals content (blue)
- **current**: KC Current content (teal)
- **podcast**: Podcast episodes and audio content (gold)
- **opinion**: Opinion pieces and editorials (light blue)
- **updates**: General updates and announcements
- **stats**: Statistics and data analysis (dark)
- **world**: World sports content (green)
- **supportkc**: Local KC sports support (white)

## Content Writing

### Markdown Formatting
Write your content using Markdown syntax:

```markdown
# Main Heading

## Section Heading

### Subsection Heading

**Bold text** and *italic text*

- Bullet point
- Another bullet point

1. Numbered list
2. Another item

[Link text](https://example.com)

![Image alt text](/assets/images/image.jpg)

> Quote text
```

### Images
1. Add images to `/assets/images/`
2. Reference them with: `![Alt text](/assets/images/filename.jpg)`
3. For featured images, set the `image` field in front matter

## Example Post

Create a file named `2025-01-15-example-post.md`:

```markdown
---
layout: post
title: "Royals Sign New Star Player: What This Means for 2025"
date: 2025-01-15 14:30:00 -0600
categories:
  - royals
author: staff
featured: true
description: "Analysis of the Royals' latest signing and its impact on the upcoming season"
---

The Kansas City Royals made waves today with their latest signing, bringing aboard a player who could change the trajectory of the 2025 season.

## What We Know

The details of the contract include:

- Multi-year deal worth significant investment
- Immediate impact expected
- Strong clubhouse presence

### Analysis

This signing demonstrates the organization's commitment to winning now while building for the future.

*What do you think about this move? Share your thoughts in the comments.*
```

## Publishing Process

1. **Create your post file** following the naming convention
2. **Add it to the `_posts/` directory**
3. **Commit the changes**: `git add _posts/your-new-post.md`
4. **Push to publish**: The site will automatically rebuild

## Local Testing (Optional)

To preview your posts locally before publishing:

1. Install dependencies: `bundle install`
2. Start the server: `bundle exec jekyll serve`
3. View at: `http://localhost:4000`

## Tips for Success

### SEO Best Practices
- Write descriptive titles (50-60 characters)
- Include meta descriptions
- Use relevant categories
- Add alt text to images

### Content Guidelines
- Keep paragraphs short and scannable
- Use headers to break up content
- Include relevant links
- End with engagement prompts

### Categories Usage
- Use 1-3 relevant categories per post
- Don't over-categorize
- Be consistent with category names

## Troubleshooting

### Common Issues

**File won't appear:**
- Check file naming format
- Ensure date is not in the future
- Verify front matter syntax

**Broken formatting:**
- Check Markdown syntax
- Ensure proper YAML formatting in front matter
- Validate image paths

**Categories not working:**
- Use lowercase category names
- Check spelling against available categories
- Ensure proper YAML list format

## Support

If you encounter issues or need help:
1. Check this guide first
2. Verify your Markdown and YAML syntax
3. Test locally if possible
4. Contact the technical team for assistance

---

*Last updated: January 2025*