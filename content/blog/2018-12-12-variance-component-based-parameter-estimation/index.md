---
title: Variance component based parameter estimation of incomplete block designs
author: Deependra Dhakal
date: '2018-12-12'
slug: variance-component-based-parameter-estimation
categories: 
  - R
tags: 
  - R
header:
  caption: ''
  image: ''
---
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />




## Introduction

Variance component models are also suited for analysis of incomplete block designs, besides complete block designs. This post aims to demonstrate exactly that. Using a dataset generated from alpha lattice design, I show how the design can be properly modeled and fit using OLS regression having various fixed model components. This system of model fitting is analogous to classical ANOVA based technique of estimating parameters.

## The dataset

The data is same as introduced earlier in "Design and analysis of balanced randomized complete block (RCBD) experiment" [post](https://rookie.rbind.io/post/design-and-analysis-of-balanced/). It comprises of plant height trait for the maize recorded in multiple replication units, only difference from the earlier post being that the arrangement of observation plots into blocks which are themselves nested within replication will be accounted for. This is the objective of this post: to account for effects of incomplete blocks which was incorporated in the design.

An overview of how the data looks like is shown in Table <a href="#tab:ihyb-height">1</a>.

<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">(\#tab:ihyb-height)Intermediate maturing hybrids with 50 entries each in 3 replicated blocks</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;"> Rep </th>
   <th style="text-align:left;font-weight: bold;"> Block </th>
   <th style="text-align:left;font-weight: bold;"> Plot </th>
   <th style="text-align:left;font-weight: bold;"> Entry </th>
   <th style="text-align:right;font-weight: bold;"> Plant_height </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 270 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 266 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 18 </td>
   <td style="text-align:right;"> 261 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:left;"> 32 </td>
   <td style="text-align:right;"> 224 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> 37 </td>
   <td style="text-align:right;"> 268 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:left;"> 27 </td>
   <td style="text-align:right;"> 268 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> 7 </td>
   <td style="text-align:left;"> 21 </td>
   <td style="text-align:right;"> 277 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> 8 </td>
   <td style="text-align:left;"> 13 </td>
   <td style="text-align:right;"> 264 </td>
  </tr>
</tbody>
</table>

## Model formulation


```r
model_pht <- lm(formula(paste("Plant_height", "~ Rep + Entry + Block%in%Rep")), 
            data = ihyb_multiple)
ANOVA_pht <- anova(model_pht) # model anova
```

<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">(\#tab:anova-print)ANOVA of fixed effects factors with block nested within replication</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:right;font-weight: bold;"> Df </th>
   <th style="text-align:right;font-weight: bold;"> Sum Sq </th>
   <th style="text-align:right;font-weight: bold;"> Mean Sq </th>
   <th style="text-align:right;font-weight: bold;"> F value </th>
   <th style="text-align:right;font-weight: bold;"> Pr(&gt;F) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Rep </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 8534 </td>
   <td style="text-align:right;"> 4267 </td>
   <td style="text-align:right;"> 38.86 </td>
   <td style="text-align:right;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Entry </td>
   <td style="text-align:right;"> 49 </td>
   <td style="text-align:right;"> 42993 </td>
   <td style="text-align:right;"> 877 </td>
   <td style="text-align:right;"> 7.99 </td>
   <td style="text-align:right;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Rep:Block </td>
   <td style="text-align:right;"> 27 </td>
   <td style="text-align:right;"> 3779 </td>
   <td style="text-align:right;"> 140 </td>
   <td style="text-align:right;"> 1.27 </td>
   <td style="text-align:right;"> 0.207 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Residuals </td>
   <td style="text-align:right;"> 71 </td>
   <td style="text-align:right;"> 7796 </td>
   <td style="text-align:right;"> 110 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
</tbody>
</table>









```r
mean_pht # overall mean
```

```
## [1] 267
```

```r
Fstat <- data.frame("Fit Statistics" = c(AIC = AIC(model_pht), BIC = BIC(model_pht)))
Fstat # fit statistics
```

```
##     Fit.Statistics
## AIC           1178
## BIC           1419
```

```r
E <- (ntr - 1) * (nrep - 1)/((ntr - 1) * (nrep - 1) + nrep * (s - 1)) 
# ntr = number of treatments, 
# nrep = number of replications
# s = number of blocks per replication 
E # efficiency factor
```

```
## [1] 0.784
```

```r
CV <- sqrt(Ee) * 100/mean_pht # where, Ee = deviance(model_pht)/df_resid_pht 
CV # model CV 
```

```
## [1] 3.93
```


<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">(\#tab:model-means-and-group)Treatment means and groups for the response variable</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;"> treatment </th>
   <th style="text-align:right;font-weight: bold;"> means </th>
   <th style="text-align:left;font-weight: bold;"> groups </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 24 </td>
   <td style="text-align:right;"> 310 </td>
   <td style="text-align:left;"> a </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 15 </td>
   <td style="text-align:right;"> 300 </td>
   <td style="text-align:left;"> ab </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 14 </td>
   <td style="text-align:right;"> 299 </td>
   <td style="text-align:left;"> ab </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 17 </td>
   <td style="text-align:right;"> 294 </td>
   <td style="text-align:left;"> abc </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 20 </td>
   <td style="text-align:right;"> 289 </td>
   <td style="text-align:left;"> bcd </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 46 </td>
   <td style="text-align:right;"> 283 </td>
   <td style="text-align:left;"> bcde </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 36 </td>
   <td style="text-align:right;"> 282 </td>
   <td style="text-align:left;"> bcde </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 21 </td>
   <td style="text-align:right;"> 282 </td>
   <td style="text-align:left;"> cde </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 9 </td>
   <td style="text-align:right;"> 281 </td>
   <td style="text-align:left;"> cde </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 10 </td>
   <td style="text-align:right;"> 280 </td>
   <td style="text-align:left;"> cdef </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 279 </td>
   <td style="text-align:left;"> cdefg </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 8 </td>
   <td style="text-align:right;"> 278 </td>
   <td style="text-align:left;"> cdefg </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 278 </td>
   <td style="text-align:left;"> cdefg </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 41 </td>
   <td style="text-align:right;"> 277 </td>
   <td style="text-align:left;"> cdefg </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 11 </td>
   <td style="text-align:right;"> 277 </td>
   <td style="text-align:left;"> cdefgh </td>
  </tr>
</tbody>
</table>


Alternatively, analysis and results from analysis could be obtained via agricolae function `PBIB.test()`. 


```r
# vc_model_alpha <- agricolae::PBIB.test(block = block, trt = trt, replication = replication, 
#                      k = sblock, y = y, method = "VC", console = TRUE)
# vc_model_alpha$groups
```

