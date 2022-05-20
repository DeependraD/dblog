[![Netlify Status](https://api.netlify.com/api/v1/badges/18a87094-431d-442a-aa56-ef675f6563da/deploy-status)](https://app.netlify.com/sites/rookie/deploys)

# Blogdown site source code repository

This is the source repo that bears the code for target blogdown site at https://rookie.rbind.io/.
The source repo has its remote on https://github.com/deependraD/dblog.

## Build instructions

- Rstudio's native build option tends to build all pages without searching for cache, so better use `blogdown::serve_site()` to quicken the build process.
  - This option builds site so that it is locally renderable too.
  
- Building/serving a desired site, only then move to **deployment** stage.

- Hugo builds the site in public folder with netlify providing the necessary commands and rendering the site.

## Content addition and modification

- Creating/modifying means to just create a new markdown/rmarkdown post, or modifying any source files that will be built using hugo. Simplest way to do that would be:
  
  ```
  R -e 'blogdown::new_post(title="create_new_title_for_your_post", author="Deependra", ext=".Rmd")'
  ```
  
## Diagnosis and update

Time and again check for hugo updates, especially if the build fails. This could be because of inconsistencies between hugo and blogdown project structure. Also check for the Hugo academic repo once in a while so that in case any [breaking changes]() are made, be noted about in time. These changes are addressed in released notes with instructions for fixing website. Also equally worth noting is that, some `hugo-academic` theme updates require certain minimum version of hugo to build.

### Instructions on updating theme [Hugo academic](https://github.com/gcushen/hugo-academic)

Obtain a submodule of the remote theme repository under `theme/` and update it periodically. Check tutorial on submodules (https://git-scm.com/book/en/v2/Git-Tools-Submodules) for understanding the details.

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

## Notes

- Post: Time series analysis of cointegrated economic variables
  - Trim `weather_nepal/` data to make the files smaller
