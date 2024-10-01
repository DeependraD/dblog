---
title: Linear mixed model formulation
author: Deependra Dhakal
date: '2018-12-09'
slug: linear-mixed-model-formulation
categories:
  - R
  - Plant Breeding
tags:
  - R
header:
  caption: ''
  image: ''
---
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />



## Introduction

Mixed models are quite tricky, in that, while being very powerful extensions of linear models, they are somewhat difficult to conceptualize and otherwise to specify. Mixed models have, in addition to usual fixed effect combination of factors, random effects structure. These structure need to be specified in the model formula in `R`. While formula specification of a model is unique in it's own respect, the formuala expression too leads to an object with differnt properties than a regular `R` object. Although, the complexity of formula syntax can arbitrary (constrained by classess and methods working on that), a general guideline is applicable for most of the mixed modeling utilities. These include: `lme4`, `nlme`, `glmmADMB` and `glmmTMB`.

Here, I steal a very useful tabulation, published in [Mixed Models FAQ](https://bbolker.github.io/mixedmodels-misc/glmmFAQ.html#model-specification) by Ben Bolker, of different patterns in model formula specification.

### Interpretation of model formula

<table class="table table-striped" style="font-size: 12px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">(\#tab:model-formula-interpret)Model formula and it's interpretation</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Formula </th>
   <th style="text-align:left;"> Meaning </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> <code>(1|group)</code> </td>
   <td style="text-align:left;"> random group intercept </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <code>(x|group)</code> = <code>(1+x|group)</code> </td>
   <td style="text-align:left;"> random slope of x within group with correlated intercept </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <code>(0+x|group)</code> = <code>(-1+x|group)</code> </td>
   <td style="text-align:left;"> random slope of x within group: no variation in intercept </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <code>(1|group) + (0+x|group)</code> </td>
   <td style="text-align:left;"> uncorrelated random intercept and random slope within group </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <code>(1|site/block)</code> = <code>(1|site)+(1|site:block)</code> </td>
   <td style="text-align:left;"> intercept varying among sites and among blocks within sites (nested random effects) </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <code>site+(1|site:block)</code> </td>
   <td style="text-align:left;"> fixed effect of sites plus random variation in intercept among blocks within sites </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <code>(x|site/block)</code> = <code>(x|site)+(x|site:block)</code> = <code>(1 + x|site)+(1+x|site:block)</code> </td>
   <td style="text-align:left;"> slope and intercept varying among sites and among blocks within sites </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <code>(x1|site)+(x2|block)</code> </td>
   <td style="text-align:left;"> two different effects, varying at different levels </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <code>x*site+(x|site:block)</code> </td>
   <td style="text-align:left;"> fixed effect variation of slope and intercept varying among sites and random variation of slope and intercept among blocks within sites </td>
  </tr>
  <tr>
   <td style="text-align:left;"> <code>(1|group1)+(1|group2)</code> </td>
   <td style="text-align:left;"> intercept varying among crossed random effects (e.g. site, year) </td>
  </tr>
</tbody>
</table>

