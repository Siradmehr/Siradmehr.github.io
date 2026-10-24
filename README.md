# Personal website

The original Franklin.jl template, with Home, Blog, and CV navigation.
Centered GitHub, Google Scholar, and LinkedIn icons appear below the homepage bio.
Edit `index.md` for the bio and profile links. The existing `/Contact/` URL remains
available with both email addresses.

## Preview

Use Julia 1.12 and Franklin 0.10.97 or newer:

```sh
julia --project=. -e 'using Pkg; Pkg.instantiate(); using Franklin; serve()'
```

## Add a post

Copy `templates/blog-post.md` into `blog/` with a new filename. Set its title,
date, publication date, and summary, then write the body. The blog list updates
automatically on a full build. Keep drafts in `templates/`, which is excluded
from the build. Posts with RSS metadata are included in `feed.xml`.

## Update the CV

Replace `_assets/Cv.pdf`. The homepage and CV page link to this file.

## Build and deploy

```sh
julia --project=. -e 'using Franklin; optimize(prerender=false, minify=false, suppress_errors=false)'
```

Push to `master` or `main` to run the GitHub Pages workflow. Local edits alone do
not publish the site.
