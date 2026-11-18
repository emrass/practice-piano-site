# practice-piano.com — landing page

The page at **https://practice-piano.com**. The app itself lives in
[emrass/practice-piano](https://github.com/emrass/practice-piano) and is served from
**https://app.practice-piano.com**.

Plain HTML and CSS, no build step. GitHub Pages serves this repository's `main` branch
directly ("Deploy from a branch", `/ (root)`); every push to `main` is live a minute later.
`CNAME` holds the domain, `.nojekyll` tells Pages to serve the files as they are.

Branches and pull requests get a preview deployment from Cloudflare Workers Builds
(`wrangler.jsonc`, no build command, preview command `npx wrangler preview`).
`.assetsignore` keeps the repository's own files (README, CNAME, git metadata) out of the upload.

Preview locally:

```sh
python3 -m http.server 8090   # then open http://localhost:8090
```

- `img/` — screenshots of the real app (WebP, captured at 2× from the app's dev build with
  Playwright and its fake Web MIDI input), and `og.png`, the image a shared link shows. All of
  them come from the app's `npm run screenshots`, which writes into this folder when the two
  repositories sit side by side. Retake them when the app's UI changes, and keep the feature
  descriptions and alt texts in `index.html` in step with the app.
- `favicon.svg` — a copy of the app's `public/favicon.svg`: the keys, drawn for 16px. The logo in
  the header is the keys too, inlined from the app's `design/system/assets/Logos/practice-piano-keys.svg`.
- `fonts/` — Newsreader (text) and Caveat (the hand-written feedback in the hero), both under
  the SIL Open Font License (see the `OFL-*.txt` files); self-hosted, so the page makes no
  third-party requests.
- The pencil marks in the hero are an SVG overlay in `index.html` whose `viewBox` matches
  `img/hero-scale.webp`; move them if that image changes.
