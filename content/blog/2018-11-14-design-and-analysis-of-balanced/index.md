---
title: Design and analysis of balanced randomized complete block (RCBD) experiment
author: Deependra Dhakal
date: '2018-11-14'
slug: design-and-analysis-of-balanced
link-citations: yes
math: yes
tags:
  - agriculture
  - R
header:
  caption: ''
  image: ''
bibliography: ["../bib/2018-11-14-design-and-analysis-of-balanced.bib"]
---

<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>

<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />

## Introduction

Balanced block designs are a class of randomized experimental design that contain equal number of records for a particular level of categorical variable across all blocks.

## Example 1

Let us generate some data from random process mimicking a single factor process consisting of 3 levels.

A glimpse of what data looks like is shown in Table <a href="#tab:single-factor-data">1</a>.

<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">
(#tab:single-factor-data)Single factor data involving 30 treatments comprising 3 complete blocks
</caption>
<thead>
<tr>
<th style="text-align:left;font-weight: bold;">
Treatment
</th>
<th style="text-align:left;font-weight: bold;">
Block
</th>
<th style="text-align:right;font-weight: bold;">
Value
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Treatment1
</td>
<td style="text-align:left;">
a
</td>
<td style="text-align:right;">
-0.629
</td>
</tr>
<tr>
<td style="text-align:left;">
Treatment2
</td>
<td style="text-align:left;">
a
</td>
<td style="text-align:right;">
-2.565
</td>
</tr>
<tr>
<td style="text-align:left;">
Treatment3
</td>
<td style="text-align:left;">
a
</td>
<td style="text-align:right;">
-1.637
</td>
</tr>
<tr>
<td style="text-align:left;">
Treatment4
</td>
<td style="text-align:left;">
a
</td>
<td style="text-align:right;">
-1.367
</td>
</tr>
<tr>
<td style="text-align:left;">
Treatment5
</td>
<td style="text-align:left;">
a
</td>
<td style="text-align:right;">
-1.596
</td>
</tr>
<tr>
<td style="text-align:left;">
Treatment6
</td>
<td style="text-align:left;">
a
</td>
<td style="text-align:right;">
-2.106
</td>
</tr>
<tr>
<td style="text-align:left;">
Treatment7
</td>
<td style="text-align:left;">
a
</td>
<td style="text-align:right;">
-0.488
</td>
</tr>
<tr>
<td style="text-align:left;">
Treatment8
</td>
<td style="text-align:left;">
a
</td>
<td style="text-align:right;">
-2.095
</td>
</tr>
</tbody>
</table>

The `agricolae::design.rcbd()` function generates design and the field book associated with the design. The field book looks like the one below in Table <a href="#tab:single-factor-des-fieldbook">2</a>

<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">
(#tab:single-factor-des-fieldbook)Single factor RCBD fieldbook comprising of 3 replicated blocks and 30 treatments
</caption>
<thead>
<tr>
<th style="text-align:right;font-weight: bold;">
plots
</th>
<th style="text-align:left;font-weight: bold;">
block
</th>
<th style="text-align:left;font-weight: bold;">
treatments
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;">
101
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
Treatment28
</td>
</tr>
<tr>
<td style="text-align:right;">
102
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
Treatment5
</td>
</tr>
<tr>
<td style="text-align:right;">
103
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
Treatment27
</td>
</tr>
<tr>
<td style="text-align:right;">
104
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
Treatment24
</td>
</tr>
<tr>
<td style="text-align:right;">
105
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
Treatment9
</td>
</tr>
<tr>
<td style="text-align:right;">
106
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
Treatment16
</td>
</tr>
<tr>
<td style="text-align:right;">
107
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
Treatment3
</td>
</tr>
<tr>
<td style="text-align:right;">
108
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
Treatment30
</td>
</tr>
</tbody>
</table>

### Box Plots

To deal with real case scenario, let’s import a dataset from hybrid maize trial of intermediate duration maturing types, which was conducted on summer of 2018. The plant height trait will be dealt.

After import, type conversion and cleaning the data looks like as shown in Table <a href="#tab:ihyb-height">3</a>

<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">
(#tab:ihyb-height)Intermediate maturing hybrids with 50 entries each in 3 replicated blocks
</caption>
<thead>
<tr>
<th style="text-align:left;font-weight: bold;">
Rep
</th>
<th style="text-align:left;font-weight: bold;">
Block
</th>
<th style="text-align:left;font-weight: bold;">
Plot
</th>
<th style="text-align:left;font-weight: bold;">
Entry
</th>
<th style="text-align:left;font-weight: bold;">
col
</th>
<th style="text-align:left;font-weight: bold;">
row
</th>
<th style="text-align:right;font-weight: bold;">
tillering
</th>
<th style="text-align:right;font-weight: bold;">
moisture1
</th>
<th style="text-align:right;font-weight: bold;">
moisture2
</th>
<th style="text-align:right;font-weight: bold;">
Ear count
</th>
<th style="text-align:right;font-weight: bold;">
Plant height
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:right;">
</td>
<td style="text-align:right;">
3.0
</td>
<td style="text-align:right;">
3.5
</td>
<td style="text-align:right;">
35
</td>
<td style="text-align:right;">
270
</td>
</tr>
<tr>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:right;">
</td>
<td style="text-align:right;">
3.0
</td>
<td style="text-align:right;">
3.5
</td>
<td style="text-align:right;">
25
</td>
<td style="text-align:right;">
266
</td>
</tr>
<tr>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
18
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
3
</td>
<td style="text-align:right;">
</td>
<td style="text-align:right;">
3.5
</td>
<td style="text-align:right;">
4.0
</td>
<td style="text-align:right;">
30
</td>
<td style="text-align:right;">
261
</td>
</tr>
<tr>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
4
</td>
<td style="text-align:left;">
32
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
4
</td>
<td style="text-align:right;">
</td>
<td style="text-align:right;">
4.0
</td>
<td style="text-align:right;">
4.5
</td>
<td style="text-align:right;">
26
</td>
<td style="text-align:right;">
224
</td>
</tr>
<tr>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
5
</td>
<td style="text-align:left;">
37
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
5
</td>
<td style="text-align:right;">
</td>
<td style="text-align:right;">
4.0
</td>
<td style="text-align:right;">
4.5
</td>
<td style="text-align:right;">
30
</td>
<td style="text-align:right;">
268
</td>
</tr>
<tr>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
6
</td>
<td style="text-align:left;">
27
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
6
</td>
<td style="text-align:right;">
</td>
<td style="text-align:right;">
4.0
</td>
<td style="text-align:right;">
4.5
</td>
<td style="text-align:right;">
20
</td>
<td style="text-align:right;">
268
</td>
</tr>
<tr>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
7
</td>
<td style="text-align:left;">
21
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
7
</td>
<td style="text-align:right;">
</td>
<td style="text-align:right;">
4.0
</td>
<td style="text-align:right;">
4.5
</td>
<td style="text-align:right;">
25
</td>
<td style="text-align:right;">
277
</td>
</tr>
<tr>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
13
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
8
</td>
<td style="text-align:right;">
</td>
<td style="text-align:right;">
3.5
</td>
<td style="text-align:right;">
4.0
</td>
<td style="text-align:right;">
25
</td>
<td style="text-align:right;">
264
</td>
</tr>
</tbody>
</table>

Although the block component exists for given dataset, for the sake of making case with analysing single factor RCBD experiment, we ignore the factor the effect.

A good thing to start with is plots of the data. Box plots are good for checking constant variances and to look for outliers.

<img src="{{< blogdown/postref >}}index_files/figure-html/boxplot1-1.png" width="672" style="display: block; margin: auto;" /><img src="{{< blogdown/postref >}}index_files/figure-html/boxplot1-2.png" width="672" style="display: block; margin: auto;" />

### Balanced?

It is always a good idea to check to see if the data is balanced.

``` r
table(ihyb_multiple$Entry)
```

    ## 
    ##  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 
    ##  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3 
    ## 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 
    ##  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3  3

``` r
# with(ihyb_multiple, table(Entry, Rep)) # if two way table is to be generated
```

### Means

The means for each factor level can be calculated, as well as for combination of different factor levels. The notation for the an interaction is “A:B”.

    ##   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20 
    ## 278 243 279 245 256 273 249 278 281 280 276 268 273 300 300 266 294 272 260 290 
    ##  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40 
    ## 281 270 271 311 256 264 277 272 267 258 245 237 256 258 261 283 276 267 241 235 
    ##  41  42  43  44  45  46  47  48  49  50 
    ## 277 274 248 260 246 283 255 248 246 263

    ##   1   2   3 
    ## 257 274 270

### Treatment Mean Plots/Interaction Plots

The other plot that is useful is the treatment means plot. It is a good idea to look at it both ways and look for possible interactions.

<img src="{{< blogdown/postref >}}index_files/figure-html/ex1tmplot-1.png" width="672" style="display: block; margin: auto;" />

### Running the ANOVA

After the priliminary diagnostics is done, and transformations are made (if required), next we model the variable relationships.

There are two ways to conduct the variance analysis in R – one specifying a regression model, the other by speficying a variance component model. Since, we are dealing with single factor experiment with replicates, we can use model formula `\(A+B\)` for specifying the regressors or a.k.a grouping variables (in case of factorial ANOVA), where `\(A\)` is the factor of interest and `\(B\)` is the recogizable source of source variation controlled through replication/blocking. The standard model for a randomized complete block design (with `\(s = 1\)` observation on each treatment in each block) is

$$
Y_{hi} = \mu + \theta_h + \tau_i + \epsilon_{hi}, \\
\epsilon_{hi}\sim N(0, \sigma^2), \\
{\epsilon_{hi}}'s\ are\ mutually\ independent, \\
h = 1,..., b;\ i = 1,..., v ,
$$

Where `\(\mu\)` is a constant, `\(\theta_h\)` is the effect of the `\(h_{th}\)` block, `\(\tau_i\)` is the effect of `\(i_{th}\)` treatment, `\(Y_{hi}\)` is the random variable representing the measurement on treatment `\(i\)` observed on block `\(j\)`, and `\(\epsilon_{hi}\)` is the random error associated. This form of standard model is called *block-treatment model*.

This model is limiting in that it does not include a term for interaction between blocks and treatments. However, including the interaction term in the model will lead to absence of degrees of freedom for estimation of error variance. It is also imperative to assume, in several blocking experiments, that interaction is non significant. There appears to be a case where interaction component could be estimated: when block size is increased during the design. For further explaination refer to Dean, Voss, and Draguljić ([2017](#ref-dean2017complete)).

The block-treatment model is similar to two-way main-effects model for two treatment factors in a completely randomized design with one observation per cell. The only difference between CRD and RCBD here is that in former experimental units are randomly assigned to treatment combinations (and, therefore to the levels of both factors) while in RCBD, the experimental units are randomly assigned to the levels of the treatment factor only. The levels of the block factor represent intentional groupings of the experimental units.

The standard block-treatment model implementation of RCB design using Plant height as response variable is coded below. The model ANOVA is shown in Table <a href="#tab:rcb-block-treatment">4</a>. We first plot the residuals and the Box-Cox plot to check assumptions. Once we are satisfied, we can examine the ANOVA.

``` r
res <- aov(`Plant height` ~ Rep + Entry, data=ihyb_multiple)
plot(res,1)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/ex1anova-1.png" width="672" style="display: block; margin: auto;" />

``` r
# # test for homogeneity of variance
# bartlett.test(`Plant height`~Rep,data=ihyb_multiple)
# bartlett.test(`Plant height`~Entry,data=ihyb_multiple)

# boxcox diagnostics
boxCox(res) # if lambda parameter lies near to zero then, log transformation is useful to maintain assumption about distribution of the variable for further tests.
```

<img src="{{< blogdown/postref >}}index_files/figure-html/ex1anova-2.png" width="672" style="display: block; margin: auto;" />

The residuals look good and the Box-Cox plot indicates no transformation is needed.

<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">
(#tab:rcb-block-treatment)Single factor RCBD ANOVA
</caption>
<thead>
<tr>
<th style="text-align:left;font-weight: bold;">
</th>
<th style="text-align:right;font-weight: bold;">
Df
</th>
<th style="text-align:right;font-weight: bold;">
Sum Sq
</th>
<th style="text-align:right;font-weight: bold;">
Mean Sq
</th>
<th style="text-align:right;font-weight: bold;">
F value
</th>
<th style="text-align:right;font-weight: bold;">
Pr(\>F)
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Rep
</td>
<td style="text-align:right;">
2
</td>
<td style="text-align:right;">
8534
</td>
<td style="text-align:right;">
4267
</td>
<td style="text-align:right;">
36.13
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
Entry
</td>
<td style="text-align:right;">
49
</td>
<td style="text-align:right;">
42993
</td>
<td style="text-align:right;">
877
</td>
<td style="text-align:right;">
7.43
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
Residuals
</td>
<td style="text-align:right;">
98
</td>
<td style="text-align:right;">
11575
</td>
<td style="text-align:right;">
118
</td>
<td style="text-align:right;">
</td>
<td style="text-align:right;">
</td>
</tr>
</tbody>
</table>

### Means and Tukey HSD

R has some additional commands to find means as well as the effects of each factor level (think `\(\alpha_i\)` and `\(\beta_i\)`). Since both the replication and the entry effects are significant, we require Tukey pairwise comparisons test to distinguish which two among the levels of each factors are different.

``` r
model.tables(res,"means")
```

    ## Tables of means
    ## Grand mean
    ##     
    ## 267 
    ## 
    ##  Rep 
    ## Rep
    ##   1   2   3 
    ## 257 274 270 
    ## 
    ##  Entry 
    ## Entry
    ##   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20 
    ## 278 243 279 245 256 273 249 278 281 280 276 268 273 300 300 266 294 272 260 290 
    ##  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40 
    ## 281 270 271 311 256 264 277 272 267 258 245 237 256 258 261 283 276 267 241 235 
    ##  41  42  43  44  45  46  47  48  49  50 
    ## 277 274 248 260 246 283 255 248 246 263

``` r
model.tables(res,"effects")
```

    ## Tables of effects
    ## 
    ##  Rep 
    ## Rep
    ##      1      2      3 
    ## -10.36   7.38   2.99 
    ## 
    ##  Entry 
    ## Entry
    ##      1      2      3      4      5      6      7      8      9     10     11 
    ##  11.58 -24.09  11.95 -22.35 -10.92   5.71 -17.76  10.96  13.62  13.51   8.85 
    ##     12     13     14     15     16     17     18     19     20     21     22 
    ##   1.51   5.70  33.25  33.36  -0.60  27.36   4.59  -6.52  22.89  13.87   2.79 
    ##     23     24     25     26     27     28     29     30     31     32     33 
    ##   4.48  43.87 -10.42  -2.96   9.91   5.26   0.38  -9.21 -21.58 -30.30 -11.11 
    ##     34     35     36     37     38     39     40     41     42     43     44 
    ##  -8.43  -5.73  15.82   8.63  -0.37 -25.54 -32.37  10.48   7.07 -18.90  -7.32 
    ##     45     46     47     48     49     50 
    ## -20.85  16.13 -12.41 -19.16 -21.05  -3.55

``` r
# tukey honestly significant difference
TukeyHSD(res, "Entry")$Entry %>% head()
```

    ##       diff   lwr    upr  p adj
    ## 2-1 -35.67 -72.3  0.952 0.0691
    ## 3-1   0.37 -36.3 36.996 1.0000
    ## 4-1 -33.93 -70.6  2.693 0.1200
    ## 5-1 -22.50 -59.1 14.127 0.9159
    ## 6-1  -5.86 -42.5 30.762 1.0000
    ## 7-1 -29.34 -66.0  7.289 0.3913

Since there are significant differences between the entries, a plot of the means may be appropriate. We can use the `model.tables()` to obtain the means (it behaves similar to `tapply()`).

<img src="{{< blogdown/postref >}}index_files/figure-html/ex1meanplots-1.png" width="672" style="display: block; margin: auto;" />

## Example 2

In this example, we wish to see how the addition of sulphur and nitrogen affect the yield (bushels per acre) of soybeans(data source: “http://personal.psu.edu/\~mar36/stat_461/sulpher.csv”). The final goal is to determine which combination, if any, of sulphur and nitrogen produces the highest yield.

    ## # A tibble: 6 × 3
    ##   nitrogen sulpher yield
    ##      <dbl>   <dbl> <dbl>
    ## 1        0       0  4.48
    ## 2        0       0  4.52
    ## 3        0       0  4.63
    ## 4        0       3  4.7 
    ## 5        0       3  4.65
    ## 6        0       3  4.57

    ## # A tibble: 6 × 5
    ##   nitrogen sulpher yield sulf  nitf 
    ##      <dbl>   <dbl> <dbl> <fct> <fct>
    ## 1        0       0  4.48 0     0    
    ## 2        0       0  4.52 0     0    
    ## 3        0       0  4.63 0     0    
    ## 4        0       3  4.7  3     0    
    ## 5        0       3  4.65 3     0    
    ## 6        0       3  4.57 3     0

A quick look at the data and a check to see if it is balanced. Do the treatment means plots indicate a significant interaction?

<img src="{{< blogdown/postref >}}index_files/figure-html/ex2dataplots-1.png" width="672" style="display: block; margin: auto;" /><img src="{{< blogdown/postref >}}index_files/figure-html/ex2dataplots-2.png" width="672" style="display: block; margin: auto;" /><img src="{{< blogdown/postref >}}index_files/figure-html/ex2dataplots-3.png" width="672" style="display: block; margin: auto;" />

    ##     nitf
    ## sulf 0 20
    ##    0 3  3
    ##    3 3  3
    ##    6 3  3
    ##    9 3  3

<img src="{{< blogdown/postref >}}index_files/figure-html/ex2dataplots-4.png" width="672" style="display: block; margin: auto;" /><img src="{{< blogdown/postref >}}index_files/figure-html/ex2dataplots-5.png" width="672" style="display: block; margin: auto;" />

### Residuals and Box-Cox plot

``` r
res.2 <- aov(yield~sulf*nitf,data=ex.2)
plot(res.2,1)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/ex2assumptions-1.png" width="672" style="display: block; margin: auto;" />

``` r
boxCox(res.2)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/ex2assumptions-2.png" width="672" style="display: block; margin: auto;" />

There seems to be no issues with the assumptions of ANOVA, so we will proceed to interpreting the results.

<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">
(#tab:ex2anova)Single factor RCBD ANOVA
</caption>
<thead>
<tr>
<th style="text-align:left;font-weight: bold;">
term
</th>
<th style="text-align:right;font-weight: bold;">
df
</th>
<th style="text-align:right;font-weight: bold;">
sumsq
</th>
<th style="text-align:right;font-weight: bold;">
meansq
</th>
<th style="text-align:right;font-weight: bold;">
statistic
</th>
<th style="text-align:right;font-weight: bold;">
p.value
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
sulf
</td>
<td style="text-align:right;">
3
</td>
<td style="text-align:right;">
3.069
</td>
<td style="text-align:right;">
1.023
</td>
<td style="text-align:right;">
286
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
nitf
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:right;">
7.832
</td>
<td style="text-align:right;">
7.832
</td>
<td style="text-align:right;">
2186
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
sulf:nitf
</td>
<td style="text-align:right;">
3
</td>
<td style="text-align:right;">
3.760
</td>
<td style="text-align:right;">
1.253
</td>
<td style="text-align:right;">
350
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
Residuals
</td>
<td style="text-align:right;">
16
</td>
<td style="text-align:right;">
0.057
</td>
<td style="text-align:right;">
0.004
</td>
<td style="text-align:right;">
</td>
<td style="text-align:right;">
</td>
</tr>
</tbody>
</table>

Based on the two-factor ANOVA analysis of soybean yield, there appears to be an interaction between the use of sulpher and nitrogen (F=349.78, num df=3, dem df=16, p-value=0). Since the interaction is significant, discussing the main effects individual is not possible, even though they themselves are significant (both p-values \< 0.001). Applying nitrogen does increase yield but the amount of increase depends on the amount of sulpher used.

Since the interaction is significant, a good way to comprehend results is via a bar graph with grouping letters.

    ## [1] "sulf"      "nitf"      "sulf:nitf"

    ##   3   6   9   0 
    ## "a" "b" "c" "d"

    ##  3:0  6:0  9:0 0:20 3:20 6:20 9:20  0:0 
    ##  "a"  "b"  "c"  "c"  "d"  "c"  "e"  "a"

    ##  0:0 0:20  3:0 3:20  6:0 6:20  9:0 9:20 
    ## 4.54 5.75 4.64 7.05 5.24 5.81 5.91 6.30

<img src="{{< blogdown/postref >}}index_files/figure-html/ex2groups1-1.png" width="672" style="display: block; margin: auto;" />

From the above plot, it appears that a combination of 3 units of sulpher and 20 units of nitrogen produce the highest yield of soybeans.

## References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-dean2017complete" class="csl-entry">

Dean, Angela, Daniel Voss, and Danel Draguljić. 2017. “Complete Block Designs.” In *Design and Analysis of Experiments*, 305–47. Springer.

</div>

</div>
