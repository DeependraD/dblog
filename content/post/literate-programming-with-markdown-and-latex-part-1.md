---
title: 'Literate programming with markdown and $\LaTeX$: Part 1'
author: Deependra Dhakal
date: '2018-12-20'
slug: literate-programming-with-markdown-and-latex-part-1
categories:
  - latex
  - open-souce
  - productivity
tags:
  - productivity
  - open-source
math: yes
header:
  caption: ''
  image: ''
---

# Introduction

$\LaTeX$ is a Turing complete langauge besides being one of the popular typesetting systems in action since a very long ago. $\LaTeX$ workflows are fully reproducible and extremely customizable, hence its popularity over WYSIWYG softwares.

This my first in a series of lessons about easing the workflow with $\LaTeX$. I do not expect an all encompassing content, even for something that sets forth the starting point. I could only hope that with passage of time the code and workflow does not break, and even if it does, it does so with audibility.

Since I mostly integrate my R workflows with $\LaTeX$ in Rmarkdown documents, and very rarely fully in the typetting system, this post will be meaningful when connected to `pdf_document*` rendering of rmarkdowns. One major thing one should heed before setting forth on literate programming with $\LaTeX$ and R is the role of intermediate engine -- pandoc. It is a critical horse that hauls the conversion to pdf (or virtually any other document formats). Get this in [GitHub](https://github.com/jgm/pandoc/releases).

## Tip 1

Best rmarkdown pdf output rendering header would be, as of this moment:

```
output: 
  bookdown::pdf_document2:
    toc: yes
    toc_depth: 3
    keep_tex: yes
```

## Tip 2

A typical $\LaTeX$ document header will contain following packages loaded at its preamble. Generally, use these $\LaTeX$ packages in conjunction with R package `kableExtra`.

Note, however, the order of package specification might have to be tweaked. Anyway, if reordering has to be done (in case of package/option clash), always compile from the intermediate `.tex` file to cut short the time/resource to render output from rmd again.

```
header-includes:
- \usepackage{booktabs}
- \usepackage{longtable}
- \usepackage{array}
- \usepackage{multirow}
- \usepackage[table]{xcolor}
- \usepackage{wrapfig}
- \usepackage{float}
- \usepackage{colortbl}
- \usepackage{pdflscape}
- \usepackage{tabu}
- \usepackage{threeparttable}
- \usepackage[normalem]{ulem}
- \usepackage{xcolor}
- \usepackage{rotating}
- \newcommand{\blandscape}{\begin{landscape}}
- \newcommand{\elandscape}{\end{landscape}}
- \usepackage{subfig}
- \usepackage[format=hang,labelfont=bf,margin=0.5cm,justification=centering]{caption}
```
The assignment of \\blandscape and \\elandscape allows specification of landscape version of a page wherever desired within markdown body. However, pdflscape is a more advanced package that allows for change as well as automatic display of orientation in the document.

## Tip 3

To specify current system's date in output use following in yaml header.

```
date: "`r Sys.Date()`"
```
## Tip 4

A setup code chunk will mostly find its place at the uppermost chunk position, usually after yaml header. It usually consists of the following.

```
library(tidyverse)
knitr::opts_chunk$set(tidy = TRUE, cache = TRUE, 
                      echo = FALSE, 
                      tidy.opts = list(width.cutoff=50), 
                      eval = TRUE, warning = FALSE, message = FALSE,
                      fig.align = "center", fig.width = 5,
                      fig.asp = 0.9, out.width = "0.7\\linewidth")
options(knitr.kable.NA = "", digits = 3, knitr.table.format = "latex")

```
## Tip 5

For the tip mentioned in Tip 2, there is now a recommended way of loading $\LaTeX$ packages: Setting yet another setup options' argument:

```
options(kableExtra.latex.load_packages = TRUE) # this is the default
```

## Tip 6

Don't forget to check on the booktabs in your table. With this, some other useful features of a `kable()` are:

```
kable(df, format = "latex", 
      caption = "This is a dataframe table", 
      digits = 3, booktabs = TRUE,
      align = 'l') %>% 
  kableExtra::kable_styling(latex_options = c("striped", 
                                              "hold_position", "scale_down"), 
                            full_width = FALSE, font_size = 11, position = "center")
```

## Tip 7

- Make use of kableExtra function `landscape()` to lay table in landscape orientation.
- Make use of `kable()` function with argument `longtable = TRUE` to get enable page breaks in table.
- Note that above two options are mutually exclusive.

