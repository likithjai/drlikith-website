+++
title = "Getting Started with Static Sites"
date = 2024-01-20
+++

# Getting Started with Static Sites

Static site generators like Zola are perfect for blogs, documentation, and simple websites.

## Why Static Sites?

Static sites offer several advantages:

- **Fast loading times** - No database queries or server-side processing
- **Security** - No server-side code means fewer attack vectors
- **Hosting flexibility** - Can be hosted anywhere that serves static files
- **Version control** - Your entire site can be tracked in Git

## The Zola Workflow

1. Write content in Markdown
2. Create templates using the Tera templating engine
3. Run `zola build` to generate your site
4. Deploy the `public/` folder to your web server

It's that simple! This post demonstrates how easy it is to add new content to your Zola site.
