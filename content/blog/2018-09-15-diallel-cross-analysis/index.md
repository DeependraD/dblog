---
title: "Diallel cross: A case study of mating designs"
author: "Deependra Dhakal"
date: '2018-09-15'
# categories: "Plant Breeding"
header:
  caption: ''
  image: ''
link-citations: yes
math: yes
slug: diallel-cross-analysis
tags:
- agriculture
- research-review
bibliography: ../bib/2018-09-15-diallel-cross-analysis.bib
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
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>

<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />

# Mating designs

## Introduction

Mating designs allow for partitioning of phenotypic effects – as due to genotype, environment or interacting effects among genes and alleles. Using one or more of these mating schemes, identification of heterotic groups, estimation of general and specific combining abilities and testing of environmental interactions could be done. Progenies resulting from a well designed mating are used for the dissection of trait genetics.

In order to understand genetics of traits and to make effective choice of parents, two contrasting methods of selection should be understood first. Bluntly, selection methods can be stated as either being forward or backward. Forward selection is synonymous to **within-family selection** whereas the concept of backward selection embodies **selection among families**. Ideally, forward selection works best for highly heritable traits – for those traits regulated by few small genes, as opposed to those involving large number of genes with small cumulative effects.

Selection gets more complicated as data on several different individuals belonging to some families is available. \[What we study versus what reality is; Insert soil layer image here\]. Broadly, three distinct modes of selection could be practiced:

1.  Strict within family selection
2.  Selection on within family deviation
3.  Combined family and within family selection; family selection index

When the interest is to exploit the state of heterosis arising from certain combination of parental individuals, the genetic factors contributing well to superior phenotype should be underpinned. The whole process of determining favorable combination among parental individuals should be met with phenotypic data from many progeny, which is retrospective in purpose – thus the name backward selection. Family selection has different variants and serve variying purposes as well.

- Half-sib selection is used to select superier individuals for their GCA.
- Full-sib selection is used to make distinct parental matings in order to induce hybrid vigor by capturing specific combinining abilities

The concept of combining abilities was first laid out by Sprague and Tatum in 1942 ([Sprague and Tatum 1942](#ref-sprague1942general)) in order to generate variance estimates without too much of underlying genetic assumptions. The combining ability test procedure involves making crossess of several different combinations from a set of parents and ascribing the resultant variances statistically to either the genetic additiveness of parental charactersistics or the interacting parental genetic combinations. Thus, the phenotype ($y_i$) of a cross progeny can be modeled as linear combination of additive ($A_i$), dominance ($D_i$) and environmental ($e_i$) effects, is:

`$$y_i = \mu + A_i + D_i + e_i$$`

## Combining ability

Crossing each line with several other lines produces an additional measure in the mean performance of each line in all crosses. This mean performance of a line, when expressed as a deviation from the mean of all crosses, gives what is called the general combining ability (**GCA**) of the lines. The GCA is calculated as the average of all `\(F_1\)`s having this particular line as one parent, the value being expressed as a deviation from the overall mean of crosses. Each cross has an expected value (the sum of GCAs of its two parental lines).

The mean genotypic value of offspring from a particular cross may deviate from value expected considering the population mean and the sum of the parental GCA effects. This deviation is the specific combining ability (**SCA**) for that cross.

The differences of GCA are due to the additive and additive x additive interactions in the base population. The differences in SCA are attributable to nonadditive genetic variance. SCA effects are derived from inter-allelic/intra-loci interactions. Furthermore, the SCA is expected to increase in variance more rapidly as inbreeding in the population reaches high levels. GCA is the average performance of a plant in a cross with different tester lines, while SCA measures the performance of a plant in a specific combination in comparison with other cross combinations.

We can define the mean genotypic value ($G_{AB}$) for the full-sib family produced by crossing parents A and B as the sum of the overall mean `\(\mu\)`, the GCAs of the two parents and the SCA value:

`$$G_{AB} = \mu + GCA_A + GCA_B + SCA_{AB}$$`

The types of interactions that can be obtained (SCA effects) depend upon the mating scheme used to produce the crosses, the most common being the diallel mating design, developed by B. Griffing (1956). Methods such as top cross and poly-cross are also not uncommon. A classical method to estimate dominance genetic variance (D) is to estimate the variance associated with SCA effects of many crosses. The expected value of the observed SCA variance component is 1/4 of the dominance genetic variance in the reference population.

The GCA of each line is calculated as follows:

$$
\mathrm{G_x} = \left[\frac{T_x}{n-2}\right]-\left[\frac{\sum T}{n(n-2)}\right]
$$

Where `\(x\)` represents a specific line. Using fabricated dataset given in Table <a href="#tab:fabricated-diallel"><strong>??</strong></a> following procedures outlines how GCA for Parent 2 (P2) ($GCA_{P2}$) can be calculated.

`\begin{equation}`
`\tag{1} \end{equation}`

<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">
Fabricated data from a diallel cross scheme using 10 parents
</caption>
<thead>
<tr>
<th style="text-align:left;">
Parents
</th>
<th style="text-align:right;">
P1
</th>
<th style="text-align:right;">
P2
</th>
<th style="text-align:right;">
P3
</th>
<th style="text-align:right;">
P4
</th>
<th style="text-align:right;">
P5
</th>
<th style="text-align:right;">
P6
</th>
<th style="text-align:right;">
P7
</th>
<th style="text-align:right;">
P8
</th>
<th style="text-align:right;">
P9
</th>
<th style="text-align:right;">
P10
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P1
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P2
</td>
<td style="text-align:right;width: 7em; ">
2.637
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P3
</td>
<td style="text-align:right;width: 7em; ">
3.300
</td>
<td style="text-align:right;width: 7em; ">
4.87
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P4
</td>
<td style="text-align:right;width: 7em; ">
-0.691
</td>
<td style="text-align:right;width: 7em; ">
8.25
</td>
<td style="text-align:right;width: 7em; ">
5.67
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P5
</td>
<td style="text-align:right;width: 7em; ">
0.130
</td>
<td style="text-align:right;width: 7em; ">
5.36
</td>
<td style="text-align:right;width: 7em; ">
5.86
</td>
<td style="text-align:right;width: 7em; ">
6.43
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P6
</td>
<td style="text-align:right;width: 7em; ">
-0.213
</td>
<td style="text-align:right;width: 7em; ">
2.86
</td>
<td style="text-align:right;width: 7em; ">
4.63
</td>
<td style="text-align:right;width: 7em; ">
2.88
</td>
<td style="text-align:right;width: 7em; ">
2.385
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P7
</td>
<td style="text-align:right;width: 7em; ">
0.331
</td>
<td style="text-align:right;width: 7em; ">
2.37
</td>
<td style="text-align:right;width: 7em; ">
5.32
</td>
<td style="text-align:right;width: 7em; ">
4.24
</td>
<td style="text-align:right;width: 7em; ">
1.717
</td>
<td style="text-align:right;width: 7em; ">
0.572
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P8
</td>
<td style="text-align:right;width: 7em; ">
3.695
</td>
<td style="text-align:right;width: 7em; ">
2.13
</td>
<td style="text-align:right;width: 7em; ">
5.04
</td>
<td style="text-align:right;width: 7em; ">
4.23
</td>
<td style="text-align:right;width: 7em; ">
0.132
</td>
<td style="text-align:right;width: 7em; ">
2.986
</td>
<td style="text-align:right;width: 7em; ">
5.34
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P9
</td>
<td style="text-align:right;width: 7em; ">
3.939
</td>
<td style="text-align:right;width: 7em; ">
5.98
</td>
<td style="text-align:right;width: 7em; ">
5.43
</td>
<td style="text-align:right;width: 7em; ">
7.58
</td>
<td style="text-align:right;width: 7em; ">
3.395
</td>
<td style="text-align:right;width: 7em; ">
0.350
</td>
<td style="text-align:right;width: 7em; ">
6.17
</td>
<td style="text-align:right;width: 7em; ">
4.18
</td>
<td style="text-align:right;width: 7em; ">
</td>
<td style="text-align:right;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P10
</td>
<td style="text-align:right;width: 7em; ">
1.829
</td>
<td style="text-align:right;width: 7em; ">
5.24
</td>
<td style="text-align:right;width: 7em; ">
5.21
</td>
<td style="text-align:right;width: 7em; ">
5.59
</td>
<td style="text-align:right;width: 7em; ">
4.259
</td>
<td style="text-align:right;width: 7em; ">
0.474
</td>
<td style="text-align:right;width: 7em; ">
3.75
</td>
<td style="text-align:right;width: 7em; ">
3.35
</td>
<td style="text-align:right;width: 7em; ">
3.14
</td>
<td style="text-align:right;width: 7em; ">
</td>
</tr>
</tbody>
</table>

Taking the above table of diallel cross data, total of each individual parental line could be computed by summing over all the crossess involving the common parent. Similarly, the grand totals could be
obtained by adding together all the individual parents’ total. The individual parents’ sum and grand total is shown in the Table <a href="#tab:sum-over-ind"><strong>??</strong></a> below.

<table class="table table-striped" style="font-size: 12px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">
Totals of individual lines and grand total of diallel cross
scheme using 10 parents
</caption>
<thead>
<tr>
<th style="text-align:left;">
Parents
</th>
<th style="text-align:right;">
Line total
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;font-weight: bold;">
P1
</td>
<td style="text-align:right;">
15.0
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;">
P2
</td>
<td style="text-align:right;">
39.7
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;">
P3
</td>
<td style="text-align:right;">
45.3
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;">
P4
</td>
<td style="text-align:right;">
44.2
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;">
P5
</td>
<td style="text-align:right;">
29.7
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;">
P6
</td>
<td style="text-align:right;">
16.9
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;">
P7
</td>
<td style="text-align:right;">
29.8
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;">
P8
</td>
<td style="text-align:right;">
31.1
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;">
P9
</td>
<td style="text-align:right;">
40.2
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;">
P10
</td>
<td style="text-align:right;">
32.8
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;">
Total
</td>
<td style="text-align:right;">
324.7
</td>
</tr>
</tbody>
</table>

## Types of diallel mating design

There are four types of popular diallel crossing designs:

1.  Full diallels: All the possible combinations of crosses among parents, including reciprocals and self-fertilization of the parents are made. For a sample of `\(n\)` parents, the full-diallel requires `\(n \times n\)` progenies, a number that quickly becomes unmanageable as more parents are sampled (Table <a href="#tab:full-diallel"><strong>??</strong></a>).

<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">
Full diallel mating scheme using 10 parents
</caption>
<thead>
<tr>
<th style="text-align:left;">
Parents
</th>
<th style="text-align:left;">
P1
</th>
<th style="text-align:left;">
P2
</th>
<th style="text-align:left;">
P3
</th>
<th style="text-align:left;">
P4
</th>
<th style="text-align:left;">
P5
</th>
<th style="text-align:left;">
P6
</th>
<th style="text-align:left;">
P7
</th>
<th style="text-align:left;">
P8
</th>
<th style="text-align:left;">
P9
</th>
<th style="text-align:left;">
P10
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P1
</td>
<td style="text-align:left;width: 7em; ">
P1 x P1
</td>
<td style="text-align:left;width: 7em; ">
P1 x P2
</td>
<td style="text-align:left;width: 7em; ">
P1 x P3
</td>
<td style="text-align:left;width: 7em; ">
P1 x P4
</td>
<td style="text-align:left;width: 7em; ">
P1 x P5
</td>
<td style="text-align:left;width: 7em; ">
P1 x P6
</td>
<td style="text-align:left;width: 7em; ">
P1 x P7
</td>
<td style="text-align:left;width: 7em; ">
P1 x P8
</td>
<td style="text-align:left;width: 7em; ">
P1 x P9
</td>
<td style="text-align:left;width: 7em; ">
P1 x P10
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P2
</td>
<td style="text-align:left;width: 7em; ">
P2 x P1
</td>
<td style="text-align:left;width: 7em; ">
P2 x P2
</td>
<td style="text-align:left;width: 7em; ">
P2 x P3
</td>
<td style="text-align:left;width: 7em; ">
P2 x P4
</td>
<td style="text-align:left;width: 7em; ">
P2 x P5
</td>
<td style="text-align:left;width: 7em; ">
P2 x P6
</td>
<td style="text-align:left;width: 7em; ">
P2 x P7
</td>
<td style="text-align:left;width: 7em; ">
P2 x P8
</td>
<td style="text-align:left;width: 7em; ">
P2 x P9
</td>
<td style="text-align:left;width: 7em; ">
P2 x P10
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P3
</td>
<td style="text-align:left;width: 7em; ">
P3 x P1
</td>
<td style="text-align:left;width: 7em; ">
P3 x P2
</td>
<td style="text-align:left;width: 7em; ">
P3 x P3
</td>
<td style="text-align:left;width: 7em; ">
P3 x P4
</td>
<td style="text-align:left;width: 7em; ">
P3 x P5
</td>
<td style="text-align:left;width: 7em; ">
P3 x P6
</td>
<td style="text-align:left;width: 7em; ">
P3 x P7
</td>
<td style="text-align:left;width: 7em; ">
P3 x P8
</td>
<td style="text-align:left;width: 7em; ">
P3 x P9
</td>
<td style="text-align:left;width: 7em; ">
P3 x P10
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P4
</td>
<td style="text-align:left;width: 7em; ">
P4 x P1
</td>
<td style="text-align:left;width: 7em; ">
P4 x P2
</td>
<td style="text-align:left;width: 7em; ">
P4 x P3
</td>
<td style="text-align:left;width: 7em; ">
P4 x P4
</td>
<td style="text-align:left;width: 7em; ">
P4 x P5
</td>
<td style="text-align:left;width: 7em; ">
P4 x P6
</td>
<td style="text-align:left;width: 7em; ">
P4 x P7
</td>
<td style="text-align:left;width: 7em; ">
P4 x P8
</td>
<td style="text-align:left;width: 7em; ">
P4 x P9
</td>
<td style="text-align:left;width: 7em; ">
P4 x P10
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P5
</td>
<td style="text-align:left;width: 7em; ">
P5 x P1
</td>
<td style="text-align:left;width: 7em; ">
P5 x P2
</td>
<td style="text-align:left;width: 7em; ">
P5 x P3
</td>
<td style="text-align:left;width: 7em; ">
P5 x P4
</td>
<td style="text-align:left;width: 7em; ">
P5 x P5
</td>
<td style="text-align:left;width: 7em; ">
P5 x P6
</td>
<td style="text-align:left;width: 7em; ">
P5 x P7
</td>
<td style="text-align:left;width: 7em; ">
P5 x P8
</td>
<td style="text-align:left;width: 7em; ">
P5 x P9
</td>
<td style="text-align:left;width: 7em; ">
P5 x P10
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P6
</td>
<td style="text-align:left;width: 7em; ">
P6 x P1
</td>
<td style="text-align:left;width: 7em; ">
P6 x P2
</td>
<td style="text-align:left;width: 7em; ">
P6 x P3
</td>
<td style="text-align:left;width: 7em; ">
P6 x P4
</td>
<td style="text-align:left;width: 7em; ">
P6 x P5
</td>
<td style="text-align:left;width: 7em; ">
P6 x P6
</td>
<td style="text-align:left;width: 7em; ">
P6 x P7
</td>
<td style="text-align:left;width: 7em; ">
P6 x P8
</td>
<td style="text-align:left;width: 7em; ">
P6 x P9
</td>
<td style="text-align:left;width: 7em; ">
P6 x P10
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P7
</td>
<td style="text-align:left;width: 7em; ">
P7 x P1
</td>
<td style="text-align:left;width: 7em; ">
P7 x P2
</td>
<td style="text-align:left;width: 7em; ">
P7 x P3
</td>
<td style="text-align:left;width: 7em; ">
P7 x P4
</td>
<td style="text-align:left;width: 7em; ">
P7 x P5
</td>
<td style="text-align:left;width: 7em; ">
P7 x P6
</td>
<td style="text-align:left;width: 7em; ">
P7 x P7
</td>
<td style="text-align:left;width: 7em; ">
P7 x P8
</td>
<td style="text-align:left;width: 7em; ">
P7 x P9
</td>
<td style="text-align:left;width: 7em; ">
P7 x P10
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P8
</td>
<td style="text-align:left;width: 7em; ">
P8 x P1
</td>
<td style="text-align:left;width: 7em; ">
P8 x P2
</td>
<td style="text-align:left;width: 7em; ">
P8 x P3
</td>
<td style="text-align:left;width: 7em; ">
P8 x P4
</td>
<td style="text-align:left;width: 7em; ">
P8 x P5
</td>
<td style="text-align:left;width: 7em; ">
P8 x P6
</td>
<td style="text-align:left;width: 7em; ">
P8 x P7
</td>
<td style="text-align:left;width: 7em; ">
P8 x P8
</td>
<td style="text-align:left;width: 7em; ">
P8 x P9
</td>
<td style="text-align:left;width: 7em; ">
P8 x P10
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P9
</td>
<td style="text-align:left;width: 7em; ">
P9 x P1
</td>
<td style="text-align:left;width: 7em; ">
P9 x P2
</td>
<td style="text-align:left;width: 7em; ">
P9 x P3
</td>
<td style="text-align:left;width: 7em; ">
P9 x P4
</td>
<td style="text-align:left;width: 7em; ">
P9 x P5
</td>
<td style="text-align:left;width: 7em; ">
P9 x P6
</td>
<td style="text-align:left;width: 7em; ">
P9 x P7
</td>
<td style="text-align:left;width: 7em; ">
P9 x P8
</td>
<td style="text-align:left;width: 7em; ">
P9 x P9
</td>
<td style="text-align:left;width: 7em; ">
P9 x P10
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P10
</td>
<td style="text-align:left;width: 7em; ">
P10 x P1
</td>
<td style="text-align:left;width: 7em; ">
P10 x P2
</td>
<td style="text-align:left;width: 7em; ">
P10 x P3
</td>
<td style="text-align:left;width: 7em; ">
P10 x P4
</td>
<td style="text-align:left;width: 7em; ">
P10 x P5
</td>
<td style="text-align:left;width: 7em; ">
P10 x P6
</td>
<td style="text-align:left;width: 7em; ">
P10 x P7
</td>
<td style="text-align:left;width: 7em; ">
P10 x P8
</td>
<td style="text-align:left;width: 7em; ">
P10 x P9
</td>
<td style="text-align:left;width: 7em; ">
P10 x P10
</td>
</tr>
</tbody>
</table>

2.  Half diallels: Each parent is mated with every other parent, excluding selfs and reciprocals. This requires making `\(\frac{n(n-1)}{2}\)` crosses for n parents (Table <a href="#tab:half-diallel"><strong>??</strong></a>).

<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">
Half diallel mating scheme using 10 parents
</caption>
<thead>
<tr>
<th style="text-align:left;">
Parents
</th>
<th style="text-align:left;">
P1
</th>
<th style="text-align:left;">
P2
</th>
<th style="text-align:left;">
P3
</th>
<th style="text-align:left;">
P4
</th>
<th style="text-align:left;">
P5
</th>
<th style="text-align:left;">
P6
</th>
<th style="text-align:left;">
P7
</th>
<th style="text-align:left;">
P8
</th>
<th style="text-align:left;">
P9
</th>
<th style="text-align:left;">
P10
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P1
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P2
</td>
<td style="text-align:left;width: 7em; ">
P2 x P1
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P3
</td>
<td style="text-align:left;width: 7em; ">
P3 x P1
</td>
<td style="text-align:left;width: 7em; ">
P3 x P2
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P4
</td>
<td style="text-align:left;width: 7em; ">
P4 x P1
</td>
<td style="text-align:left;width: 7em; ">
P4 x P2
</td>
<td style="text-align:left;width: 7em; ">
P4 x P3
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P5
</td>
<td style="text-align:left;width: 7em; ">
P5 x P1
</td>
<td style="text-align:left;width: 7em; ">
P5 x P2
</td>
<td style="text-align:left;width: 7em; ">
P5 x P3
</td>
<td style="text-align:left;width: 7em; ">
P5 x P4
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P6
</td>
<td style="text-align:left;width: 7em; ">
P6 x P1
</td>
<td style="text-align:left;width: 7em; ">
P6 x P2
</td>
<td style="text-align:left;width: 7em; ">
P6 x P3
</td>
<td style="text-align:left;width: 7em; ">
P6 x P4
</td>
<td style="text-align:left;width: 7em; ">
P6 x P5
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P7
</td>
<td style="text-align:left;width: 7em; ">
P7 x P1
</td>
<td style="text-align:left;width: 7em; ">
P7 x P2
</td>
<td style="text-align:left;width: 7em; ">
P7 x P3
</td>
<td style="text-align:left;width: 7em; ">
P7 x P4
</td>
<td style="text-align:left;width: 7em; ">
P7 x P5
</td>
<td style="text-align:left;width: 7em; ">
P7 x P6
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P8
</td>
<td style="text-align:left;width: 7em; ">
P8 x P1
</td>
<td style="text-align:left;width: 7em; ">
P8 x P2
</td>
<td style="text-align:left;width: 7em; ">
P8 x P3
</td>
<td style="text-align:left;width: 7em; ">
P8 x P4
</td>
<td style="text-align:left;width: 7em; ">
P8 x P5
</td>
<td style="text-align:left;width: 7em; ">
P8 x P6
</td>
<td style="text-align:left;width: 7em; ">
P8 x P7
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P9
</td>
<td style="text-align:left;width: 7em; ">
P9 x P1
</td>
<td style="text-align:left;width: 7em; ">
P9 x P2
</td>
<td style="text-align:left;width: 7em; ">
P9 x P3
</td>
<td style="text-align:left;width: 7em; ">
P9 x P4
</td>
<td style="text-align:left;width: 7em; ">
P9 x P5
</td>
<td style="text-align:left;width: 7em; ">
P9 x P6
</td>
<td style="text-align:left;width: 7em; ">
P9 x P7
</td>
<td style="text-align:left;width: 7em; ">
P9 x P8
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P10
</td>
<td style="text-align:left;width: 7em; ">
P10 x P1
</td>
<td style="text-align:left;width: 7em; ">
P10 x P2
</td>
<td style="text-align:left;width: 7em; ">
P10 x P3
</td>
<td style="text-align:left;width: 7em; ">
P10 x P4
</td>
<td style="text-align:left;width: 7em; ">
P10 x P5
</td>
<td style="text-align:left;width: 7em; ">
P10 x P6
</td>
<td style="text-align:left;width: 7em; ">
P10 x P7
</td>
<td style="text-align:left;width: 7em; ">
P10 x P8
</td>
<td style="text-align:left;width: 7em; ">
P10 x P9
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
</tbody>
</table>

3.  Partial diallel: Not all the crosses are made. There are no reciprocals or selfs. The goal is to reduce the breeding workload for a given sample of parents by making less than `\(\frac{n(n-1)}{2}\)` crosses for n parents (Table <a href="#tab:partial-diallel"><strong>??</strong></a>).

<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">
Partial diallel mating scheme using 10 parents
</caption>
<thead>
<tr>
<th style="text-align:left;">
Parents
</th>
<th style="text-align:left;">
P1
</th>
<th style="text-align:left;">
P2
</th>
<th style="text-align:left;">
P3
</th>
<th style="text-align:left;">
P4
</th>
<th style="text-align:left;">
P5
</th>
<th style="text-align:left;">
P6
</th>
<th style="text-align:left;">
P7
</th>
<th style="text-align:left;">
P8
</th>
<th style="text-align:left;">
P9
</th>
<th style="text-align:left;">
P10
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P1
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P2
</td>
<td style="text-align:left;width: 7em; ">
P2 x P1
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P3
</td>
<td style="text-align:left;width: 7em; ">
P3 x P1
</td>
<td style="text-align:left;width: 7em; ">
P3 x P2
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P4
</td>
<td style="text-align:left;width: 7em; ">
P4 x P1
</td>
<td style="text-align:left;width: 7em; ">
P4 x P2
</td>
<td style="text-align:left;width: 7em; ">
P4 x P3
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P5
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P5 x P2
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P5 x P4
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P6
</td>
<td style="text-align:left;width: 7em; ">
P6 x P1
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P6 x P4
</td>
<td style="text-align:left;width: 7em; ">
P6 x P5
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P7
</td>
<td style="text-align:left;width: 7em; ">
P7 x P1
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P7 x P4
</td>
<td style="text-align:left;width: 7em; ">
P7 x P5
</td>
<td style="text-align:left;width: 7em; ">
P7 x P6
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P8
</td>
<td style="text-align:left;width: 7em; ">
P8 x P1
</td>
<td style="text-align:left;width: 7em; ">
P8 x P2
</td>
<td style="text-align:left;width: 7em; ">
P8 x P3
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P8 x P5
</td>
<td style="text-align:left;width: 7em; ">
P8 x P6
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P9
</td>
<td style="text-align:left;width: 7em; ">
P9 x P1
</td>
<td style="text-align:left;width: 7em; ">
P9 x P2
</td>
<td style="text-align:left;width: 7em; ">
P9 x P3
</td>
<td style="text-align:left;width: 7em; ">
P9 x P4
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P9 x P6
</td>
<td style="text-align:left;width: 7em; ">
P9 x P7
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P10
</td>
<td style="text-align:left;width: 7em; ">
P10 x P1
</td>
<td style="text-align:left;width: 7em; ">
P10 x P2
</td>
<td style="text-align:left;width: 7em; ">
P10 x P3
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P10 x P6
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P10 x P8
</td>
<td style="text-align:left;width: 7em; ">
P10 x P9
</td>
<td style="text-align:left;width: 7em; ">
</td>
</tr>
</tbody>
</table>

4.  Connected diallels: Two groups (for example, `\(1-6\)` and `\(7-12\)`) of individuals are used to form two diallels (generally partial or other diallel scheme in each group) but they are connected by crossing `\(4 \times 9\)`, `\(7 \times 1\)`, `\(9 \times 3\)` and `\(10 \times 2\)`. In the example below, the second diallel also includes some selfs `\((S)\)` and reciprocals `\((R)\)` (Table <a href="#tab:connected-diallel"><strong>??</strong></a>).

<table class="table table-striped" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">
Connected diallel mating scheme using 12 parents
</caption>
<thead>
<tr>
<th style="text-align:left;">
Parents
</th>
<th style="text-align:left;">
P1
</th>
<th style="text-align:left;">
P2
</th>
<th style="text-align:left;">
P3
</th>
<th style="text-align:left;">
P4
</th>
<th style="text-align:left;">
P5
</th>
<th style="text-align:left;">
P6
</th>
<th style="text-align:left;">
P7
</th>
<th style="text-align:left;">
P8
</th>
<th style="text-align:left;">
P9
</th>
<th style="text-align:left;">
P10
</th>
<th style="text-align:left;">
P11
</th>
<th style="text-align:left;">
P12
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P1
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P2
</td>
<td style="text-align:left;width: 7em; ">
P2 x P1
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P3
</td>
<td style="text-align:left;width: 7em; ">
P3 x P1
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P4
</td>
<td style="text-align:left;width: 7em; ">
P4 x P1
</td>
<td style="text-align:left;width: 7em; ">
P4 x P2
</td>
<td style="text-align:left;width: 7em; ">
P4 x P3
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P4 x P9
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P5
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P5 x P2
</td>
<td style="text-align:left;width: 7em; ">
P5 x P3
</td>
<td style="text-align:left;width: 7em; ">
P5 x P4
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P6
</td>
<td style="text-align:left;width: 7em; ">
P6 x P1
</td>
<td style="text-align:left;width: 7em; ">
P6 x P2
</td>
<td style="text-align:left;width: 7em; ">
P6 x P3
</td>
<td style="text-align:left;width: 7em; ">
P6 x P4
</td>
<td style="text-align:left;width: 7em; ">
P6 x P5
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P7
</td>
<td style="text-align:left;width: 7em; ">
P7 x P1
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P7 x P10
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
P7 x P12
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P8
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P8 x P9
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P9
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P9 x P3
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P9 x P7
</td>
<td style="text-align:left;width: 7em; ">
P9 x P8
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
P9 x P12
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P10
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P10 x P2
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P10 x P8
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P11
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P11 x P10
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
</tr>
<tr>
<td style="text-align:left;font-weight: bold;width: 7em; ">
P12
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
P12 x P7
</td>
<td style="text-align:left;width: 7em; ">
P12 x P8
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;width: 7em; ">
</td>
<td style="text-align:left;">
P12 x P11
</td>
<td style="text-align:left;">
P12 x P12
</td>
</tr>
</tbody>
</table>

With the convenience of using individuals as both male and female parents, diallel mating designs are popular for plant breeding studies. Certain diallel designs allow for estimation of reciprocal cross effects. Diallels cannot be used in dioecious species (female and male flowers occur in different plants). However, factorial designs can be used in dioecious species to estimate dominance genetic variance.

If there are no connections between groups of parents, the design is a diallel in sets. Diallel mating designs provide good evaluation of parents and full-sib families. They also provide estimates of both additive and dominance genetic effects, and genetic gains due to additive and dominance genetic effects if we assume the sample of parents used is sufficient to represent the reference population ([Baker 1978](#ref-baker1978issues); [Holland, Nyquist, and Cervantes-Martı́nez 2003](#ref-holland2003estimating)). One disadvantage of diallels is that the breeding and progeny evaluations can be costly due to large number of crosses required. As evident, For a full diallel with 6 parents, 36 crosses are required; with 12 parents the number of crosses required is 144. On the other hand there is the looming question, if the sample of 6 or 12 individuals from a population provides useful estimate of the reference population genetic variances ([Baker 1978](#ref-baker1978issues)). White, Adams, and Neale ([2007](#ref-white2007forest)) and Hallauer and Miranda Fo ([1988](#ref-hallauer1988quantitative)) have described several other forms of diallel mating designs in detail.

<!-- ## Use of sparse matrices in mating designs -->
<!-- ## Analysis of diallel cross -->

## References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-baker1978issues" class="csl-entry">

Baker, RJ. 1978. “Issues in Diallel Analysis.” *Crop Science* 18 (4): 533–36.

</div>

<div id="ref-hallauer1988quantitative" class="csl-entry">

Hallauer, AR, and JB Miranda Fo. 1988. “Quantitative Genetics in Plant Breeding.” *Iowa State*.

</div>

<div id="ref-holland2003estimating" class="csl-entry">

Holland, James B, Wyman E Nyquist, and Cuauhtemoc T Cervantes-Martı́nez. 2003. “Estimating and Interpreting Heritability for Plant Breeding: An Update.” *Plant Breeding Reviews* 22: 9–112.

</div>

<div id="ref-sprague1942general" class="csl-entry">

Sprague, George F, and Loyd A Tatum. 1942. “General Vs. Specific Combining Ability in Single Crosses of Corn 1.” *Agronomy Journal* 34 (10): 923–32.

</div>

<div id="ref-white2007forest" class="csl-entry">

White, Timothy L, W Thomas Adams, and David B Neale. 2007. *Forest Genetics*. Cabi.

</div>

</div>
