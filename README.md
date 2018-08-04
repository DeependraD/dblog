# Blogdown site source code repository

This is the source repo that bears the code for target blogdown site at https://rookie.rbind.io/.
The source repo has its remote on https://github.com/deependraD/dblog.

## Site build and serve steps

- When you are done creating/modifying the contents and building/serving a desired site, only then move to **deployment** stage.
- Creating/modifying means to just create a new markdown/rmarkdown post, or modifying any source files that will be built using hugo. Simplest way to do that would be:
  ```
  R -e 'blogdown::new_post(title="create_new_title_for_your_post", author="Deependra", ext=".Rmd")'
  ```
- Building the site with hugo/blogdown entails:
  ```
  R -e "blogdown::build_site()"
  ```
- You may wish to serve (or not) the site locally with:
  ```
  R -e "blogdown::serve_site(port=4005)"
  ```

## Site deployment steps
  
- The deployment is automatic. 
- Hugo builds the site in public folder with netlify providing the necessary commands and rendering the site.

## Content updating on blogdown site

- Clone the `dblog` repo with source
- Then repeat again starting at **Site build and serve steps**
