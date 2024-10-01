---
title: 'Tidytuesday: Claremont Run, X-men Characters'
author: Deependra Dhakal
date: '2020-08-04'
slug: tidytuesday-tour-de-france
categories:
  - tidyverse
  - R
tags:
  - R
subtitle: ''
summary: ''
authors: []
lastmod: '2020-08-04T11:13:48+05:45'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---




## X men characters



### Data dictionary explore


Table: Table 1: Data summary

|                         |           |
|:------------------------|:----------|
|Name                     |Piped data |
|Number of rows           |308        |
|Number of columns        |9          |
|_______________________  |           |
|Column type frequency:   |           |
|character                |8          |
|numeric                  |1          |
|________________________ |           |
|Group variables          |None       |


**Variable type: character**

|skim_variable | n_missing| complete_rate| min| max| empty| n_unique| whitespace|
|:-------------|---------:|-------------:|---:|---:|-----:|--------:|----------:|
|series        |         0|          1.00|   8|  20|     0|        7|          0|
|title         |        81|          0.74|   4| 237|     0|      225|          0|
|writer        |         2|          0.99|  10|  29|     0|       15|          0|
|artist        |       266|          0.14|   8|  12|     0|        4|          0|
|cover_artist  |        56|          0.82|   8|  54|     0|       46|          0|
|pass_bechdel  |         1|          1.00|   2|   3|     0|        2|          0|
|page_number   |       221|          0.28|   1|   5|     0|       22|          0|
|notes         |       300|          0.03|  17|  63|     0|        8|          0|


**Variable type: numeric**

|skim_variable | n_missing| complete_rate|   mean|    sd| p0| p25| p50|    p75| p100|hist  |
|:-------------|---------:|-------------:|------:|-----:|--:|---:|---:|------:|----:|:-----|
|issue         |         0|             1| 118.45| 91.13|  1|  38| 105| 184.25|  294|▇▅▃▂▅ |

## Exploratory visualization

Source: https://jmablog.com/post/which-x-men-character-had-it-worst/

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-2-1.png" width="1152" />

## Tidybayes modeling

https://joshuacook.netlify.app/post/uncanny-x-men-bayesian-analysis/

## Bechdel testing

https://juliasilge.com/blog/uncanny-xmen/
