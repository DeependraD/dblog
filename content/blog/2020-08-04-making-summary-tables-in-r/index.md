---
title: Making Summary Tables in R
author: Deependra Dhakal
date: '2020-08-04'
slug: making-summary-tables-in-r
output:
  blogdown::html_page:
    toc: yes
categories:
  - tidyverse
  - R
tags:
  - R
subtitle: ''
summary: ''
authors: []
lastmod: '2020-08-04T06:38:33+05:45'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---



## Background

Table output of R is one of the richest and satisfying to use feature. Rmarkdown format provides loads of package support to create, format, and present tables beautifully. This is on one aspect extremely useful while on the other end it could very well be daunting as to choose between various package options to use while formating your table. I have a bunch of suggestions and enlistments here to help get off that dilemma.

Once in a while someone writes a blog post and addressess these issues. This is true for this topic too. https://rfortherestofus.com/2019/11/how-to-make-beautiful-tables-in-r/ has wonderfully curated list of several such options. My intnet too is to supplement the information included in the post.

## General purpose tables

Here goes the list of packages:

1. Table output (or in general, dataframe printing) is a more general idea for Rmarkdown documents. It can be set with a print option set in the YAML header.

```
title: Some good amount of table
output:
  html_document:
    df_print: paged 
```

The df_print option can take other values such as default, kable and tibble. More on this at https://bookdown.org/yihui/rmarkdown/html-document.html#data-frame-printing.

2. gt package
3. kable + kableExtra.

Here are a bunch of appealing examples that surely entice you into using this combination of packages.

```
vignette(package = "kableExtra", topic = "awesome_table_in_pdf")
```
Sharla Gelfand also has whole repository maintained for sharing examples on use of kableExtra. Check that out at: https://github.com/sharlagelfand/kableExtra-cookbook

Additionally, I have forked the repo and tried to contribute some of my own hacks (not exactly my own, but learnt elsewhere on the internet) to the bookdown project.

4. [formattable](https://renkun-ken.github.io/formattable/)
5. DT. More at: https://rstudio.github.io/DT/
6. reactable. A demonstration of use at: https://projects.fivethirtyeight.com/2019-womens-world-cup-predictions/
7. flextable: https://davidgohel.github.io/flextable/index.html
8. huxtable. https://hughjonesd.github.io/huxtable/ 
9. rhandsontable. This extremely helpful package in case if you have dirty data and data representation. This lets you manually edit the data like working in a spreadsheet software. More on: https://jrowen.github.io/rhandsontable/
10. pixiedust. https://github.com/nutterb/pixiedust

## Summary tables

### rtables package

For the time of creating this post, the package rtable was available only as github project of G. Becker. In particular, specific branch was used to compile a package. However, as he mentions [here](https://www.youtube.com/watch?v=CBQzZ8ZhXLA), the project has a long history of being released as open-source well after being using as proprietary for some time. 

We start by installing and loading essential libraries.



Throughout, `williams.trees` dataset from the agridat package will be used. Apart from already existing factors and numeric variables, an additional factor is generated from random process because pre-existing `gen` (genotype information) variable is nested in structure. Nested variable means that summary for that is available only for specific grouping and not for overall use.



Using `rtable::split_cols_by`, we split the analysis variable into multiple columns formed by a grouping variable.


```
##             Chanthaburi              HuaiBong               Ratchaburi               SaiThong                Sakaerat                 SiSaKet       
##          D       B       C       D       B       C       D       B       C       D       B       C       D       B       C       D       B       C  
## ————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
## mean   254.7   225.0   270.9   129.8   224.4   215.0   413.2   464.6   512.2   702.6   634.6   593.2   349.1   312.9   343.2   480.1   470.3   471.2
```
  
Row splitting can also be done as shown.


```
##           Chanthaburi    HuaiBong    Ratchaburi    SaiThong     Sakaerat     SiSaKet  
## ——————————————————————————————————————————————————————————————————————————————————————
## D         12 (40.0%)    6 (22.2%)    13 (38.2%)   8 (24.2%)    7 (21.2%)    12 (34.3%)
##   mean      254.67        129.83       413.23       702.62       349.14       480.08  
##   sd        164.54        37.45        131.67       224.19       114.81       228.98  
##   range     493.00        114.00       392.00       545.00       303.00       742.00  
##   max       569.00        189.00       608.00       894.00       538.00       839.00  
##   min        76.00        75.00        216.00       349.00       235.00       97.00   
## B         11 (36.7%)    9 (33.3%)    9 (26.5%)    17 (51.5%)   9 (27.3%)    11 (31.4%)
##   mean      225.00        224.44       464.56       634.65       312.89       470.27  
##   sd        119.19        105.25       161.15       302.51       131.65       194.21  
##   range     311.00        301.00       464.00       967.00       357.00       651.00  
##   max       391.00        397.00       673.00      1083.00       523.00       809.00  
##   min        80.00        96.00        209.00       116.00       166.00       158.00  
## C          7 (23.3%)    12 (44.4%)   12 (35.3%)   8 (24.2%)    17 (51.5%)   12 (34.3%)
##   mean      270.86        215.00       512.25       593.25       343.18       471.17  
##   sd        107.16        86.82        132.98       236.15       197.17       168.65  
##   range     278.00        237.00       438.00       632.00       595.00       518.00  
##   max       415.00        337.00       764.00       899.00       658.00       738.00  
##   min       137.00        100.00       326.00       267.00       63.00        220.00
```

In the previous table we used custom function for summarizing. However, we can use pre-existing helper functions of R like the `summary` function.


```
##          Chanthaburi    HuaiBong    Ratchaburi    SaiThong     Sakaerat     SiSaKet  
##            (N=30)        (N=27)       (N=34)       (N=33)       (N=33)       (N=35)  
## —————————————————————————————————————————————————————————————————————————————————————
## D        12 (40.0%)    6 (22.2%)    13 (38.2%)   8 (24.2%)    7 (21.2%)    12 (34.3%)
##   Mean     254.67        129.83       413.23       702.62       349.14       480.08  
## B        11 (36.7%)    9 (33.3%)    9 (26.5%)    17 (51.5%)   9 (27.3%)    11 (31.4%)
##   Mean     225.00        224.44       464.56       634.65       312.89       470.27  
## C         7 (23.3%)    12 (44.4%)   12 (35.3%)   8 (24.2%)    17 (51.5%)   12 (34.3%)
##   Mean     270.86        215.00       512.25       593.25       343.18       471.17
```

In earlier functions, we used variable as data parameter. But dataset entirely can also be provided as a data parameter if summary involves multiple variables.


```
##                                 Chanthaburi      HuaiBong       Ratchaburi        SaiThong         Sakaerat         SiSaKet   
##                                   (N=30)          (N=27)          (N=34)           (N=33)           (N=33)          (N=35)    
## ——————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————————
## D                               12 (40.0%)       6 (22.2%)      13 (38.2%)       8 (24.2%)        7 (21.2%)       12 (34.3%)  
##   Total genotypes                   12               6              13               8                7               12      
##   Unique genotypes                   4               4               5               4                4                4      
##   Genotypes with > 1 records   8.00 (26.67%)   2.00 (7.41%)    8.00 (23.53%)   4.00 (12.12%)     3.00 (9.09%)    8.00 (22.86%)
## B                               11 (36.7%)       9 (33.3%)       9 (26.5%)       17 (51.5%)       9 (27.3%)       11 (31.4%)  
##   Total genotypes                   11               9               9               17               9               11      
##   Unique genotypes                   4               4               4               5                4                5      
##   Genotypes with > 1 records   7.00 (23.33%)   5.00 (18.52%)   5.00 (14.71%)   12.00 (36.36%)   5.00 (15.15%)    6.00 (17.14%)
## C                                7 (23.3%)      12 (44.4%)      12 (35.3%)       8 (24.2%)        17 (51.5%)      12 (34.3%)  
##   Total genotypes                    7              12              12               8                17              12      
##   Unique genotypes                   3               3               5               3                5                5      
##   Genotypes with > 1 records   4.00 (13.33%)   9.00 (33.33%)   7.00 (20.59%)   5.00 (15.15%)    12.00 (36.36%)   7.00 (20.00%)
```


<!-- Also, insted of letting automatic counting from the given analysis variable, we could  manually supply the column aggregate summary by initially populating the columns counts. This is done using `tapply` or `map` functions. -->

<!-- ```{r custom-summary-fun} -->
<!-- tunique_env <- tapply(williams_tree$gen_generated, williams_tree$env, function(x)length(x)) -->

<!-- stylizer_events <- basic_table() %>% -->
<!--   split_cols_by("env") %>%  -->
<!--   split_rows_by("replicate") %>% -->
<!--   summarize_row_groups() %>%  -->
<!--   add_colcounts() %>%  -->
<!--   analyze(c("gen_generated"), afun = function(df, .N_col, lblstr = NULL){ -->
<!--     x <- df[["gen_generated"]] -->
<!--     in_rows( -->
<!--       "Total genotypes" = rcell(length(x), format = "xx"), -->
<!--       "Unique genotypes" = rcell(length(unique(x)), format = "xx"), -->
<!--       "Genotypes with > 1 records" = rcell((length(x)-length(unique(x))) * c(1, 1/.N_col), format = "xx.xx (xx.xx%)")  -->
<!--       # note that .N_col refers to total number of columns not individual category in a row split -->
<!--     ) -->
<!--   }) -->

<!-- williams_stylizer_custom_table <- build_table(stylizer_events, williams_tree, tunique_env) -->

<!-- williams_stylizer_custom_table -->
<!-- ``` -->

<!-- Here are some of the handy utility functions that can be used on the go. -->

<!-- ```{r} -->
<!-- # for boolean variable indicate Yes or No -->
<!-- yn_as_bool <- function(f) { -->
<!--   function(x, .N_col) { -->
<!--     f(x == "Y", .N_col) -->
<!--   } -->
<!-- } -->

<!-- # provide  a percentage format alongside count in a cell -->
<!-- s_count_perc <- function(x, .N_col) { -->
<!--   rcell(sum(!is.na(x)) * c(1, 1/.N_col), format = "xx (xx.xx%)") -->
<!-- } -->

<!-- # remove all na rows in summary output. -->
<!-- trim_zero_rows <- function(tbl) { -->
<!--  rows = collect_leaves(tbl, TRUE, TRUE) -->
<!--  torn = vapply(rows, function(x){ -->
<!--    identical(unname(unlist(row_values(x))), c(0L, 0L, 0L)) -->
<!--  }, NA, USE.NAMES = FALSE) -->
<!--  tbl[!tron, ] -->
<!-- } -->

<!-- ``` -->

### qwraps2 package

For constructing simple whole sample or subsample summary tables, qwarps package have simple interface. It provides a richly showcased [vignette](https://cran.r-project.org/web/packages/qwraps2/vignettes/summary-statistics.html) using mtcars dataset.

It requires markup language to be set early on in code chunk to render proper format. 



Alternatively, row group name can be used for informing p-value. This is exemplified in the vignette for package.

### gtsummary package

This package is a recent development but has a lot more preview ready examples as vignette. It is richer and more easily extensible in feature because it draws upon the `gt` package. Check vignettes out at cran repo for the package: https://cran.r-project.org/web/packages/gtsummary/index.html.

