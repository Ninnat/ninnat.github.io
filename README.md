# Personal site (Quarto + gwern-style margin sidenotes)

## What's in here

- `_quarto.yml` — site config (nav, footer, theme).
- `index.qmd` — homepage: short intro + curated (hand-picked) writing list.
- `writing/` — all posts live here as `.qmd` files; `writing/index.qmd` is the
  full auto-generated listing (newest first).
- `about/index.qmd` — longer bio / CV / contact page.
- `assets/css/style.css` — the visual theme (serif type, margin column,
  sidenote styling, light/dark mode via `prefers-color-scheme`).
- `_lua/sidenotes.lua` — a Pandoc filter that turns ordinary Markdown
  footnotes into Tufte/gwern-style margin sidenotes at build time. This is
  plain static HTML/CSS (the "checkbox hack"), not JavaScript re-injecting
  content after load — which is specifically why LaTeX math inside a
  sidenote renders correctly (this was the thing that broke under
  bigfoot.js on Jekyll).
- `.github/workflows/publish.yml` — GitHub Actions workflow that renders
  the site and deploys it to GitHub Pages on every push to `main`.

## Writing a new post

Add a new `.qmd` file under `writing/`, e.g. `writing/my-new-post.qmd`:

```markdown
---
title: "My New Post"
description: "One sentence, used in the listing and link previews."
date: 2026-10-01
categories: [tag1, tag2]
---

Body text. Inline math like $x^2$ works anywhere. A sidenote is just an
ordinary footnote:[^1]

[^1]: This becomes a margin note automatically. It can contain math too:
  $\int_0^1 x\,dx = \tfrac12$.
```

It will automatically appear in `/writing/index.qmd`. To also feature it
on the homepage, add a short hand-written entry to the curated list in
`index.qmd`.

## Before you publish

1. Replace every `[bracketed placeholder]` in `index.qmd` and
   `about/index.qmd` with your real bio, links, and CV.
2. In `_quarto.yml`, set `website.site-url` to your real GitHub Pages URL
   (e.g. `https://<username>.github.io` or `https://<username>.github.io/<repo>`).
3. Delete `writing/example-post.qmd` once you have real posts (or keep it
   as a reference for the sidenote/math syntax).
4. If your repo is a *project* page rather than a user/org page (i.e. the
   URL will be `<username>.github.io/<repo>`, not `<username>.github.io`),
   set `execute-dir: project` is not needed, but you should *not* need any
   `baseurl`/`base-path` changes — Quarto's GitHub Pages output uses
   relative links throughout. If you hit broken asset paths after
   deploying, that's the usual cause; ask and it's a one-line fix.

## Local preview

Requires the [Quarto CLI](https://quarto.org) (or `pip install quarto-cli`,
which is how this project was built and tested).

```bash
quarto preview
```

This opens a live-reloading local server.

## Publishing to GitHub Pages

1. Create a new GitHub repository and push this folder to it (see below).
2. In the repo's Settings → Pages, set "Source" to **GitHub Actions**.
3. Push to `main` — the included workflow (`.github/workflows/publish.yml`)
   renders the site with Quarto and deploys it automatically. Check the
   "Actions" tab for build status; the Pages URL appears there once it
   succeeds.

```bash
cd <this-folder>
git init
git add -A
git commit -m "Initial commit: Quarto site"
git branch -M main
git remote add origin https://github.com/<your-username>/<your-repo>.git
git push -u origin main
```

Then enable Pages via Actions as described above (only needed once).

## Design notes / how the sidenote layout works

- The readable column is a fixed width (`--content-width` in
  `style.css`); the page reserves matching space on the right
  (`--sidenote-width`) for margin notes, which float into it using the
  classic Tufte-CSS "negative margin" technique.
- Below `1100px` wide there's no room for a margin column, so sidenotes
  automatically collapse into "tap to expand inline" notes (no JS beyond
  a plain HTML checkbox) — you never navigate away from your place in the
  text, on any screen size.
- Quarto's own default listing "categories" sidebar is disabled
  (`#quarto-margin-sidebar { display: none }`) because that margin column
  is reserved for sidenotes in this theme.
- Colors, fonts and spacing are all CSS custom properties at the top of
  `style.css` — that's the fastest place to adjust the look.
