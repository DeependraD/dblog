---
title: 'Disease epidemiology: A simulation scenario of infectious viral disease (COVID-19)'
author: Deependra Dhakal
date: '2020-08-07'
slug: disease-epidemiology-a-simulation-scenario-of-infectious-viral-disease-covid-19
categories:
  - R
  - epidemiology
tags:
  - R
  - epidemiology
  - gganimate
subtitle: ''
summary: ''
authors: []
lastmod: '2020-08-07T09:07:35+05:45'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---



## SIR model of COVID-19 epidemiology


```
## # A tibble: 5,555 × 6
##    beta_id  time       S      I      R beta_value
##    <chr>   <dbl>   <dbl>  <dbl>  <dbl>      <dbl>
##  1 1         0   0.7     0.02   0.01          3.2
##  2 1         0.5 0.662   0.0541 0.0134        3.2
##  3 1         1   0.575   0.133  0.0223        3.2
##  4 1         1.5 0.420   0.268  0.0420        3.2
##  5 1         2   0.242   0.411  0.0763        3.2
##  6 1         2.5 0.117   0.491  0.122         3.2
##  7 1         3   0.0521  0.506  0.172         3.2
##  8 1         3.5 0.0235  0.484  0.222         3.2
##  9 1         4   0.0111  0.450  0.269         3.2
## 10 1         4.5 0.00559 0.413  0.312         3.2
## # ℹ 5,545 more rows
```


<img src="{{< blogdown/postref >}}index_files/figure-html/covid-sir-graph-1.png" width="576" />



