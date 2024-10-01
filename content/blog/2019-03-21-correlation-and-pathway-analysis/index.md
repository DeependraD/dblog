---
title: Correlation and pathway analysis with path diagrams
author: Deependra Dhakal
date: '2019-03-21'
link-citations: yes
math: yes
slug: correlation-and-pathway-analysis
categories:
  - R
  - agriculture
tags:
  - plant breeding
header:
  caption: ''
  image: ''
  preview: yes
---
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />



# Background

Correlation study is one of the most extensively yet not fully appreciated topic. It forms the backbone of several other inferential studies. Path analysis, on a similar note, is a derived technique that explains directed dependencies among a set of variables. It is almost exactly a century old now and still finds uses in several fields of causal inference. 

In oder to understand the process of causal inference (thought to be successor of path analysis), it is important to understand the basics about categories of variables. Below I have pointed out some of the concepts.

Exogenous variable: Fully independent variable. Has only single arrow exitting from them. No single-headed arrows point at exogenous variables.

Endogenous variable: Variables that are solely dependent variables, or are both independent and dependent variables, are termed 'endogenous'. Graphically, endogenous variables have at least one single-headed arrow pointing at them.

The Figure <a href="#fig:exogenous-endogenous">1</a>, two exogenous variables (Exogenous1 and Exogenous2) are modeled as being correlated as depicted by the double-headed arrow. Both of these variables have direct and indirect (through Endogenous2) effects on Endogenous1 (the two dependent or 'endogenous' variables/factors). In most real-world models, the endogenous variables may also be affected by variables and factors stemming from outside the model (external effects including measurement error). These effects are depicted by the "Influencer a" and "Influencer b" (error) terms in the model.

<div class="figure" style="text-align: center">
<img src="{{< blogdown/postref >}}index_files/figure-html/exogenous-endogenous-1.png" alt="Variable types and modeling of relationship among them" width="672" />
<p class="caption">Figure 1: Variable types and modeling of relationship among them</p>
</div>

This is one formulation of the several conceivable models, an alternative could assume that endogenous variable Endogenous2 has no role in relating Exogenous1 to Endogenous1 (No indirect effects). This could be represented as shown in Figure <a href="#fig:endogenous-exogenous2">2</a>. Now the fit/likelihood of these these two models could be tested statistically.

<div class="figure" style="text-align: center">
<img src="{{< blogdown/postref >}}index_files/figure-html/endogenous-exogenous2-1.png" alt="Variable types and modeling of relationship among them (alternative model)" width="672" />
<p class="caption">Figure 2: Variable types and modeling of relationship among them (alternative model)</p>
</div>

# Correlation analysis

After correlation matrix has been obtained, it is ready to be imported as is for analysis. Here, for example sake, an arbitrary correlation matrix has been used. To simulate a more messy and realistic scenario, we will use encoded correlation sheet where values are augmented with significance stars. The dataset looks is shown in Table <a href="#tab:corr-mat">1</a>.

<div style="border: 2px solid #22d0dd; padding: 10px; overflow-x: scroll; width:100%; "><table class="table table-striped table-hover table-condensed table-responsive" style="font-size: 12px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">(\#tab:corr-mat)Correlation matrix of 10 variables with value encodings</caption>
 <thead>
  <tr>
   <th style="text-align:left;"> Variable </th>
   <th style="text-align:left;"> v1 </th>
   <th style="text-align:left;"> v2 </th>
   <th style="text-align:left;"> v3 </th>
   <th style="text-align:left;"> v4 </th>
   <th style="text-align:left;"> v5 </th>
   <th style="text-align:left;"> v6 </th>
   <th style="text-align:left;"> v7 </th>
   <th style="text-align:left;"> v8 </th>
   <th style="text-align:left;"> v9 </th>
   <th style="text-align:right;"> v10 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;"> V1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> V2 </td>
   <td style="text-align:left;"> -0.516* </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> V3 </td>
   <td style="text-align:left;"> 0.983** </td>
   <td style="text-align:left;"> -0.516* </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> V4 </td>
   <td style="text-align:left;"> -0.398 </td>
   <td style="text-align:left;"> -0.02 </td>
   <td style="text-align:left;"> -0.44 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> V5 </td>
   <td style="text-align:left;"> 0.794** </td>
   <td style="text-align:left;"> -0.086 </td>
   <td style="text-align:left;"> 0.812** </td>
   <td style="text-align:left;"> -0.530* </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> V6 </td>
   <td style="text-align:left;"> 0.923** </td>
   <td style="text-align:left;"> -0.377 </td>
   <td style="text-align:left;"> 0.918** </td>
   <td style="text-align:left;"> -0.486 </td>
   <td style="text-align:left;"> 0.825** </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> V7 </td>
   <td style="text-align:left;"> 0.853** </td>
   <td style="text-align:left;"> -0.458 </td>
   <td style="text-align:left;"> 0.854** </td>
   <td style="text-align:left;"> -0.548* </td>
   <td style="text-align:left;"> 0.817** </td>
   <td style="text-align:left;"> 0.819** </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> V8 </td>
   <td style="text-align:left;"> 0.674** </td>
   <td style="text-align:left;"> -0.573* </td>
   <td style="text-align:left;"> 0.638* </td>
   <td style="text-align:left;"> -0.222 </td>
   <td style="text-align:left;"> 0.388 </td>
   <td style="text-align:left;"> 0.547* </td>
   <td style="text-align:left;"> 0.815** </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> V9 </td>
   <td style="text-align:left;"> 0.669** </td>
   <td style="text-align:left;"> -0.549* </td>
   <td style="text-align:left;"> 0.638* </td>
   <td style="text-align:left;"> -0.334 </td>
   <td style="text-align:left;"> 0.442 </td>
   <td style="text-align:left;"> 0.567* </td>
   <td style="text-align:left;"> 0.863** </td>
   <td style="text-align:left;"> 0.976** </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> V10 </td>
   <td style="text-align:left;"> 0.763** </td>
   <td style="text-align:left;"> -0.547* </td>
   <td style="text-align:left;"> 0.760** </td>
   <td style="text-align:left;"> -0.5 </td>
   <td style="text-align:left;"> 0.616* </td>
   <td style="text-align:left;"> 0.697** </td>
   <td style="text-align:left;"> 0.955** </td>
   <td style="text-align:left;"> 0.926** </td>
   <td style="text-align:left;"> 0.960** </td>
   <td style="text-align:right;"> 1 </td>
  </tr>
</tbody>
</table></div>

# Path analysis

Detailed process of getting data ready for computing path coefficients is shown serially in code below. After completing the cleaning process, two matrix objects, one of dependent (`corr_maty`) and the other with explainatory variables (`corr_matx`) is required to pass to agricolae function `path.analysis()`.



Now the prepared matrix objects look like what is shown in Tables <a href="#tab:corrx-matrix">2</a> and <a href="#tab:corry-matrix">3</a>.

<div style="border: 2px solid #22d0dd; padding: 10px; overflow-x: scroll; width:100%; "><table class="table table-striped table-hover table-condensed table-responsive" style="font-size: 12px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">(\#tab:corrx-matrix)Correlation matrix of explainatory variables</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> V1 </th>
   <th style="text-align:right;"> V2 </th>
   <th style="text-align:right;"> V4 </th>
   <th style="text-align:right;"> V5 </th>
   <th style="text-align:right;"> V6 </th>
   <th style="text-align:right;"> V7 </th>
   <th style="text-align:right;"> V8 </th>
   <th style="text-align:right;"> V9 </th>
   <th style="text-align:right;"> V10 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> V1 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> -0.516 </td>
   <td style="text-align:right;"> -0.398 </td>
   <td style="text-align:right;"> 0.794 </td>
   <td style="text-align:right;"> 0.923 </td>
   <td style="text-align:right;"> 0.853 </td>
   <td style="text-align:right;"> 0.674 </td>
   <td style="text-align:right;"> 0.669 </td>
   <td style="text-align:right;"> 0.763 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V2 </td>
   <td style="text-align:right;"> -0.516 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> -0.020 </td>
   <td style="text-align:right;"> -0.086 </td>
   <td style="text-align:right;"> -0.377 </td>
   <td style="text-align:right;"> -0.458 </td>
   <td style="text-align:right;"> -0.573 </td>
   <td style="text-align:right;"> -0.549 </td>
   <td style="text-align:right;"> -0.547 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V4 </td>
   <td style="text-align:right;"> -0.398 </td>
   <td style="text-align:right;"> -0.020 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> -0.530 </td>
   <td style="text-align:right;"> -0.486 </td>
   <td style="text-align:right;"> -0.548 </td>
   <td style="text-align:right;"> -0.222 </td>
   <td style="text-align:right;"> -0.334 </td>
   <td style="text-align:right;"> -0.500 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V5 </td>
   <td style="text-align:right;"> 0.794 </td>
   <td style="text-align:right;"> -0.086 </td>
   <td style="text-align:right;"> -0.530 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.825 </td>
   <td style="text-align:right;"> 0.817 </td>
   <td style="text-align:right;"> 0.388 </td>
   <td style="text-align:right;"> 0.442 </td>
   <td style="text-align:right;"> 0.616 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V6 </td>
   <td style="text-align:right;"> 0.923 </td>
   <td style="text-align:right;"> -0.377 </td>
   <td style="text-align:right;"> -0.486 </td>
   <td style="text-align:right;"> 0.825 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.819 </td>
   <td style="text-align:right;"> 0.547 </td>
   <td style="text-align:right;"> 0.567 </td>
   <td style="text-align:right;"> 0.697 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V7 </td>
   <td style="text-align:right;"> 0.853 </td>
   <td style="text-align:right;"> -0.458 </td>
   <td style="text-align:right;"> -0.548 </td>
   <td style="text-align:right;"> 0.817 </td>
   <td style="text-align:right;"> 0.819 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.815 </td>
   <td style="text-align:right;"> 0.863 </td>
   <td style="text-align:right;"> 0.955 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V8 </td>
   <td style="text-align:right;"> 0.674 </td>
   <td style="text-align:right;"> -0.573 </td>
   <td style="text-align:right;"> -0.222 </td>
   <td style="text-align:right;"> 0.388 </td>
   <td style="text-align:right;"> 0.547 </td>
   <td style="text-align:right;"> 0.815 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.976 </td>
   <td style="text-align:right;"> 0.926 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V9 </td>
   <td style="text-align:right;"> 0.669 </td>
   <td style="text-align:right;"> -0.549 </td>
   <td style="text-align:right;"> -0.334 </td>
   <td style="text-align:right;"> 0.442 </td>
   <td style="text-align:right;"> 0.567 </td>
   <td style="text-align:right;"> 0.863 </td>
   <td style="text-align:right;"> 0.976 </td>
   <td style="text-align:right;"> 1.000 </td>
   <td style="text-align:right;"> 0.960 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V10 </td>
   <td style="text-align:right;"> 0.763 </td>
   <td style="text-align:right;"> -0.547 </td>
   <td style="text-align:right;"> -0.500 </td>
   <td style="text-align:right;"> 0.616 </td>
   <td style="text-align:right;"> 0.697 </td>
   <td style="text-align:right;"> 0.955 </td>
   <td style="text-align:right;"> 0.926 </td>
   <td style="text-align:right;"> 0.960 </td>
   <td style="text-align:right;"> 1.000 </td>
  </tr>
</tbody>
</table></div>

<div style="border: 2px solid #22d0dd; padding: 10px; overflow-x: scroll; width:100%; "><table class="table table-striped table-hover table-condensed table-responsive" style="font-size: 12px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">(\#tab:corry-matrix)Correlation matrix of dependent variable</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> V3 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> V1 </td>
   <td style="text-align:right;"> 0.983 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V2 </td>
   <td style="text-align:right;"> -0.516 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V4 </td>
   <td style="text-align:right;"> -0.440 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V5 </td>
   <td style="text-align:right;"> 0.812 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V6 </td>
   <td style="text-align:right;"> 0.918 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V7 </td>
   <td style="text-align:right;"> 0.854 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V8 </td>
   <td style="text-align:right;"> 0.638 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V9 </td>
   <td style="text-align:right;"> 0.638 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> V10 </td>
   <td style="text-align:right;"> 0.760 </td>
  </tr>
</tbody>
</table></div>

We could check to see if dimensions of the matrix match, which is necessary for the calculation.


```r
dim(corr_matx)
```

```
## [1] 9 9
```

```r
dim(corr_maty)
```

```
## [1] 9 1
```



```r
# Using agricolae function
path_coeffs <- agricolae::path.analysis(corr_matx, corr_maty)$Coeff
```

```
## Direct(Diagonal) and indirect effect path coefficients 
## ======================================================
##         V1      V2       V4      V5      V6     V7      V8      V9   V10
## V1   0.856  0.0619 -0.02896  0.6345  0.0449 -1.809 -0.2189 -0.1043  1.55
## V2  -0.442 -0.1199 -0.00146 -0.0687 -0.0183  0.971  0.1861  0.0856 -1.11
## V4  -0.341  0.0024  0.07276 -0.4235 -0.0236  1.162  0.0721  0.0521 -1.01
## V5   0.680  0.0103 -0.03856  0.7991  0.0401 -1.732 -0.1260 -0.0689  1.25
## V6   0.790  0.0452 -0.03536  0.6593  0.0486 -1.737 -0.1776 -0.0884  1.41
## V7   0.730  0.0549 -0.03987  0.6529  0.0398 -2.120 -0.2646 -0.1346  1.94
## V8   0.577  0.0687 -0.01615  0.3101  0.0266 -1.728 -0.3247 -0.1522  1.88
## V9   0.573  0.0658 -0.02430  0.3532  0.0276 -1.830 -0.3169 -0.1559  1.95
## V10  0.653  0.0656 -0.03638  0.4923  0.0339 -2.025 -0.3007 -0.1497  2.03
## 
## Residual Effect^2 =  0.0121
```

```r
# path_coeffs
```


In fact, the path coefficients is just the result of matrix product between inverse matrix, of explainatory variables, and the dependent variable. For any [Well-posed problem](https://en.wikipedia.org/wiki/Well-posed_problem) being modeled as ordinary least squares problem let us consider known vector `\(A\)` and `\(b\)`. Now, we seek to find vector `\(\mathbf{x}\)`. This could be solved as shown in the Equation (1). 

`\begin{equation}
\tag{1}
{\displaystyle A\mathbf {x} =\mathbf {b}} \\
{\displaystyle \mathbf{x} =A^{-1}\mathbf {b}}
\end{equation}`

Hence the solution for vector `\(\mathbf x\)` gives the direct effects path coefficients, between two variables. Then the indirect coefficients ($Z$) are scalar products of direct effects ($\mathbf {x}$) and correlation matrix of explainatory variables ($A$).

$$
Z = \mathbf {x} . A
$$



