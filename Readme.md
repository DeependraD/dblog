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

## Theme

- This theme is a minor tweak of hugo-apero theme (Made by Alison Hill), started with:

```
blogdown::new_site(theme = "hugo-apero/hugo-apero",
                   format = "toml")
```
  
## Diagnosis and update

Time and again check for hugo updates, especially if the build fails. This could be because of inconsistencies between hugo and blogdown project structure.


## Notes
