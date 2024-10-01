---
title: Design and analysis of spit plot experiments
author: Deependra Dhakal
date: '2018-11-27'
slug: design-and-analysis-of-spit-plot-experiments
categories:
  - agriculture
  - factor
  - R
  - Plant Breeding
tags:
  - agriculture
  - R
link-citations: yes
math: yes
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
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />




## Split plot design

## Design and fieldbook template

In a field experiment to test for effects of fungicide on crop, treatment of fungicides may be distinguised into multiple factors -- based on chemical constituent, based on formulation, based on the mode of spray, etc. In a general case scenario where two former factors could be controlled, factor combinations may be organized in several different ways. When fully crossed implementation is not possible, split plot design comes to the rescue.

It is fair to assume that fungicide constituent is relatively difficult to allocate in highly isolated patches, so we can allocate a larger plot parcel to this factor and allocate different levels of formulation to sub-plots.

The design fieldbook seems somewhat similar to that shown in Table <a href="#tab:split-fieldbook">1</a>.



<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">(\#tab:split-fieldbook)Split plot design with main and subplot factors in three replication blocks</caption>
 <thead>
  <tr>
   <th style="text-align:right;font-weight: bold;"> plots </th>
   <th style="text-align:left;font-weight: bold;"> splots </th>
   <th style="text-align:left;font-weight: bold;"> block </th>
   <th style="text-align:left;font-weight: bold;"> trt1 </th>
   <th style="text-align:left;font-weight: bold;"> trt2 </th>
   <th style="text-align:left;font-weight: bold;"> mainplot </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 101 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> Mancozeb + Metalaxyl </td>
   <td style="text-align:left;"> Seed + Foliar </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 101 </td>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> Mancozeb + Metalaxyl </td>
   <td style="text-align:left;"> Control </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 101 </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> Mancozeb + Metalaxyl </td>
   <td style="text-align:left;"> Seed Treatment </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 101 </td>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> Mancozeb + Metalaxyl </td>
   <td style="text-align:left;"> Foliar Spray </td>
   <td style="text-align:left;"> 1 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 102 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> Trichoderma </td>
   <td style="text-align:left;"> Foliar Spray </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 102 </td>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> Trichoderma </td>
   <td style="text-align:left;"> Seed + Foliar </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 102 </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> Trichoderma </td>
   <td style="text-align:left;"> Seed Treatment </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 102 </td>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> Trichoderma </td>
   <td style="text-align:left;"> Control </td>
   <td style="text-align:left;"> 2 </td>
  </tr>
</tbody>
</table>

## Layout plan

An example grid layout plan of the aboveshown design is shown below.

<img src="{{< blogdown/postref >}}index_files/figure-html/split-layout-1.png" width="672" style="display: block; margin: auto;" />

## Analyis of split plot design

Let us take a grain yield dataset. The dataset contains 48 observations. Below, (in Table <a href="#tab:split-grain-yield">2</a>) data head have been shown after import, type-conversion and factor recoding.

<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">(\#tab:split-grain-yield)Split plot design with main and subplot factors in three replication blocks</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;"> rep </th>
   <th style="text-align:left;font-weight: bold;"> density </th>
   <th style="text-align:left;font-weight: bold;"> nitrogen </th>
   <th style="text-align:right;font-weight: bold;"> yield </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> low </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 1503 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> medium_low </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 1866 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> medium_high </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 2469 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> high </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 3786 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> low </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 2299 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> medium_low </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 1892 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> medium_high </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 3517 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> high </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 2851 </td>
  </tr>
</tbody>
</table>


## Calculating variance, and setting hypothesis: A case involving single factor

In the most primitive scenario, manual calculation of variance components could just as easily be done. However, as the number of treatment factors rise, so does the complexity of computation.  Manual calculation of sum of squares and the test statistic could be done as shown below. This, however, only remains valid as long as no grouping factors besides `nitrogen` are present, thus making it a classical scenario of single factor variance partitioning.


```r
mu <- mean(grain_yld$yield) # whole sample mean
ssto <- sum((grain_yld$yield-mu)^2) # total sum of squares
mu.i <- tapply(grain_yld$yield, grain_yld$nitrogen, mean) # nitrogen(factor) means 
sstr <- sum(table(grain_yld$nitrogen)*(mu.i-mu)^2) # nitrogen(factor) sum of squares
sse <- ssto-sstr # error sum of squares
fstat <- (sstr/3)/(sse/45) # F-statistic
```

Source | Sums of Squares | Degrees of Freedom | Mean Square | F-Stat | p-value
------ | --------------- | ------------------ | ----------- | ------ | -------
Treatment | 6.167\times 10^{7} | 3 | 2.056\times 10^{7} | 18.465 | 5.925\times 10^{-8}
Error | 5.01\times 10^{7} | 45 | 1.113\times 10^{6} |  |

$$
`\begin{align*}
   H_0 & : \mu_1 = \mu_2 = \mu_3   
   \\
   H_A & : \mbox{At least one pair of means not equal}
\end{align*}`
$$

Before proceeding for an inference, It is worthwhile to be acquainted with what the distribution looks like.

<img src="{{< blogdown/postref >}}index_files/figure-html/split-grain-hist-1.png" width="672" style="display: block; margin: auto;" />


Getting back to our specific split-plot design case, we develop model and generate the ANOVA table (Table <a href="#tab:split-model1">3</a>). A split plot design is modeled with main plot factor nested within replication and a sub plot factor nested within main plot factor. This essentially partitions the main effects of replication and the main plot factor.

<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">(\#tab:split-model1)Model assumption 1: ANOVA of split plot design with main and subplot factors in three replication blocks</caption>
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
   <td style="text-align:left;"> rep </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3413766 </td>
   <td style="text-align:right;"> 1706883 </td>
   <td style="text-align:right;"> 5.98 </td>
   <td style="text-align:right;"> 0.008 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> density </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 21451719 </td>
   <td style="text-align:right;"> 7150573 </td>
   <td style="text-align:right;"> 25.05 </td>
   <td style="text-align:right;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rep:density </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 6576455 </td>
   <td style="text-align:right;"> 1096076 </td>
   <td style="text-align:right;"> 3.84 </td>
   <td style="text-align:right;"> 0.008 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> density:nitrogen </td>
   <td style="text-align:right;"> 12 </td>
   <td style="text-align:right;"> 73482134 </td>
   <td style="text-align:right;"> 6123511 </td>
   <td style="text-align:right;"> 21.45 </td>
   <td style="text-align:right;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Residuals </td>
   <td style="text-align:right;"> 24 </td>
   <td style="text-align:right;"> 6849756 </td>
   <td style="text-align:right;"> 285406 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
</tbody>
</table>

Alternatively, following model specification could be made by regarding response (yield) as a product of main plot effect and sub plot effect, wherein main plot is nested inside replication (block) (ANOVA shown in Table <a href="#tab:split-model2">4</a>).

<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">(\#tab:split-model2)Model assumption 2: ANOVA of split plot design with main and subplot factors in three replication blocks</caption>
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
   <td style="text-align:left;"> density </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 21451719 </td>
   <td style="text-align:right;"> 7150573 </td>
   <td style="text-align:right;"> 25.05 </td>
   <td style="text-align:right;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> nitrogen </td>
   <td style="text-align:right;"> 3 </td>
   <td style="text-align:right;"> 61673305 </td>
   <td style="text-align:right;"> 20557768 </td>
   <td style="text-align:right;"> 72.03 </td>
   <td style="text-align:right;"> 0.000 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> rep </td>
   <td style="text-align:right;"> 2 </td>
   <td style="text-align:right;"> 3413766 </td>
   <td style="text-align:right;"> 1706883 </td>
   <td style="text-align:right;"> 5.98 </td>
   <td style="text-align:right;"> 0.008 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> density:nitrogen </td>
   <td style="text-align:right;"> 9 </td>
   <td style="text-align:right;"> 11808829 </td>
   <td style="text-align:right;"> 1312092 </td>
   <td style="text-align:right;"> 4.60 </td>
   <td style="text-align:right;"> 0.001 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> density:rep </td>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 6576455 </td>
   <td style="text-align:right;"> 1096076 </td>
   <td style="text-align:right;"> 3.84 </td>
   <td style="text-align:right;"> 0.008 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Residuals </td>
   <td style="text-align:right;"> 24 </td>
   <td style="text-align:right;"> 6849756 </td>
   <td style="text-align:right;"> 285406 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;">  </td>
  </tr>
</tbody>
</table>

It should be the right time, now, to use plotting libraries and generate some beautiful graphs.

<img src="{{< blogdown/postref >}}index_files/figure-html/split-visualization-1.png" width="672" style="display: block; margin: auto;" /><img src="{{< blogdown/postref >}}index_files/figure-html/split-visualization-2.png" width="672" style="display: block; margin: auto;" />

Best to take a look at some diagnostic plots now, just to make sure model assumptions and validity are not being flouted.

<img src="{{< blogdown/postref >}}index_files/figure-html/split-diagnostic-plotting-1.png" width="768" style="display: block; margin: auto;" />

Box-Cox plots helps determine whether or not a transformation is required. To recapitulate the importance of Box-Cox plot, below is an statement quoted from http://www.itl.nist.gov/div898/handbook/eda/section3/eda336.htm, which goes:

> The Box-Cox normality plot shows that the maximum value of the correlation coefficient exists at λ = (x-axis value | maximum y-axis height). The histogram of the data after applying the Box-Cox transformation(were it not indicative of normal) with λ = (x-axis value | maximum y-axis height) shows a data set for which the normality assumption is reasonable. This can be verified with a normal probability plot of the transformed data.

<img src="{{< blogdown/postref >}}index_files/figure-html/transformation-diagnosis-1.png" width="672" style="display: block; margin: auto;" />

Mean separation should proceed as follows.


```
## 
## Study: Duncan multiple comparison among levels of nitrogen
## 
## Duncan's new multiple range test
## for yield 
## 
## Mean Square Error:  285406 
## 
## nitrogen,  means
## 
##   yield  std  r  Min  Max
## 1  2384  710 12 1503 3786
## 2  3714  757 12 2050 5281
## 3  5021 1268 12 3317 7090
## 4  5195 1367 12 3858 7798
## 
## Alpha: 0.05 ; DF Error: 24 
## 
## Critical Range
##   2   3   4 
## 450 473 487 
## 
## Means with the same letter are not significantly different.
## 
##   yield groups
## 4  5195      a
## 3  5021      a
## 2  3714      b
## 1  2384      c
```

Visualize the means resulting from Duncan's test.

<img src="{{< blogdown/postref >}}index_files/figure-html/split-mean-visualization-1.png" width="672" style="display: block; margin: auto;" />
