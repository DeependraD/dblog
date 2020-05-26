# Blogdown site source code repository

This is the source repo that bears the code for target blogdown site at https://rookie.rbind.io/.
The source repo has its remote on https://github.com/deependraD/dblog.

## Build instructions

- Rstudio's native build option tends to build all pages without searching for cache, better use `blogdown::serve_site()`.
  - This option builds site so that it is locally renderable too.
  
- Adding only `posts` does not disrupt built.

## Content addition and modification

- Creating/modifying means to just create a new markdown/rmarkdown post, or modifying any source files that will be built using hugo. Simplest way to do that would be:
  ```
  R -e 'blogdown::new_post(title="create_new_title_for_your_post", author="Deependra", ext=".Rmd")'
  ```
  
## Site deployment steps

- Building/serving a desired site, only then move to **deployment** stage.

- Building the site with hugo/blogdown entails:
  ```
  R -e "blogdown::build_site()"
  ```
- You may wish to serve (or not) the site locally with:
  ```
  R -e "blogdown::serve_site(port=4005)"
  ```
- Hugo builds the site in public folder with netlify providing the necessary commands and rendering the site.

## Instructions on updating theme [Hugo academic](https://github.com/gcushen/hugo-academic)

- Current version of hugo-academic template

```
version=$(sed -n 's/^version = "//p' themes/academic/data/academic.toml)
echo -e "Source Themes Academic v$version\n"
```

- Fetch update of submodule

```
  cd themes/hugo-academic
  git fetch
  git log --pretty=oneline --abbrev-commit --decorate HEAD..origin/master
  cd ../../
```

- Merge update to submodule

```
  git submodule update --remote --merge
```

- Update Netlify.toml with required Hugo version

```
  if [ -f ./netlify.toml ]; then
    # Postfix '.0' to Hugo min_version as sadly it doesn't map to a precise semantic version.
    version=$(sed -n 's/^min_version = //p' themes/academic/theme.toml | tr -d '"')
    version="${version}.0"
    echo "Set Netlify Hugo version to v${version}"
    sed -i.bak -e "s/HUGO_VERSION = .*/HUGO_VERSION = \"$version\"/g" ./netlify.toml && rm -f ./netlify.toml.bak
  fi
```

