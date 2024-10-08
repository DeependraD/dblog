---
title: 'Piecewise Linear Function: An Introduction'
author: Deependra Dhakal
date: '2020-08-06'
slug: piecewise-linear-function-an-introduction
categories:
  - R
tags:
  - tidyverse
subtitle: ''
summary: ''
authors: []
lastmod: '2020-08-06T15:50:31+05:45'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---



## Definition and meaning

[Wikipedia](https://en.wikipedia.org/wiki/Piecewise_linear_function) defines a piecewise linear function as:

> "a function defined on a (possibly unbounded) interval of real numbers, such that there is a collection of intervals on each of which the function is an affine function"

## Example


```r
# piecewise linear functions using if statements

# piecewise linear function defined using if for cases.
pw.function <- function(t) {
  if(t < 0.5) {
    0.7 * t/0.5
  } else {
    0.7 + 0.3*(t-0.5)/0.5
  }
}

pw.function <- Vectorize(pw.function)

tibble(t = seq(0.05:0.99, by = 0.05)) %>% 
  mutate(pfun_out = pw.function(t)) %>%
  ggplot() +
  geom_line(aes(x = t, y = pfun_out), group = "combined_grp")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/piecewise-simple-1.png" width="768" />

## Application

In segmentation and curve fitting. For a larger discourse refer to [segmented](https://cran.r-project.org/package=segmented) package in cran.
