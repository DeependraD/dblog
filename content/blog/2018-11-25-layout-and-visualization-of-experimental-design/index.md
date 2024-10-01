---
title: Layout and visualization of experimental design
author: Deependra Dhakal
date: '2018-11-25'
slug: layout-and-visualization-of-experimental-design
categories:
  - agriculture
  - Plant Breeding
  - R
tags:
  - agriculture
  - R
header:
  caption: ''
  image: ''
---
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />



# Functional approach to creating and combing multiple plots

This approach highlights features of `gridExtra` package that allows combining multiple grob plots using function calls.
We explicitly use lapply/split or similar class of `purrr` functions to really scale the graphics. 

We load a Hybrid maize trial dataset, with fieldbook generated using `agricolae::design.rcbd()`. The dataset looks as shown in Table <a href="#tab:rcbd-maize-fieldbook">1</a>, after type conversion and cleaning.

<table class="table table-striped" style="font-size: 12px; margin-left: auto; margin-right: auto;">
<caption style="font-size: initial !important;">(\#tab:rcbd-maize-fieldbook)Intermediate maturing hybrids with 50 entries each in 3 replicated blocks</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;"> Rep </th>
   <th style="text-align:left;font-weight: bold;"> Block </th>
   <th style="text-align:left;font-weight: bold;"> Plot </th>
   <th style="text-align:left;font-weight: bold;"> Entry </th>
   <th style="text-align:left;font-weight: bold;"> col </th>
   <th style="text-align:left;font-weight: bold;"> row </th>
   <th style="text-align:right;font-weight: bold;"> tillering </th>
   <th style="text-align:right;font-weight: bold;"> moisture1 </th>
   <th style="text-align:right;font-weight: bold;"> moisture2 </th>
   <th style="text-align:right;font-weight: bold;"> Ear count </th>
   <th style="text-align:right;font-weight: bold;"> Plant height </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> 35 </td>
   <td style="text-align:right;"> 270 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 3.0 </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 266 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:left;"> 18 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:right;"> 30 </td>
   <td style="text-align:right;"> 261 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:left;"> 32 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 4 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> 26 </td>
   <td style="text-align:right;"> 224 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:left;"> 37 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 5 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> 30 </td>
   <td style="text-align:right;"> 268 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:left;"> 27 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 6 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> 20 </td>
   <td style="text-align:right;"> 268 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> 7 </td>
   <td style="text-align:left;"> 21 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 7 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:right;"> 4.5 </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 277 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:left;"> 8 </td>
   <td style="text-align:left;"> 13 </td>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:left;"> 8 </td>
   <td style="text-align:right;">  </td>
   <td style="text-align:right;"> 3.5 </td>
   <td style="text-align:right;"> 4.0 </td>
   <td style="text-align:right;"> 25 </td>
   <td style="text-align:right;"> 264 </td>
  </tr>
</tbody>
</table>

For the given dataset, we can draw on the information that `Rep` variable was used as field level blocking factor (Although separate, `Block`, variable exists, it was nested inside the `Rep`.) Therefore, to begin with, we ignore other spatial grouping variable. Now, since the grid graphics only requires two way represenation of plotting data, we have `row` and `col` information feeding for that.

<!-- ## Plotting function -->



## Plotting call

<img src="{{< blogdown/postref >}}index_files/figure-html/plotting-call-1.png" width="960" style="display: block; margin: auto;" />

# Lattice graphics approach

Using built-in function `desplot()` in desplot package, we can generate similar field design layout. In the plot below, individual entries (a factor variable) are highlighted as cell features. The process follows as shown below. In addition to default plotting, we can also generate serpentine design layout using simple mutating trick. Plus, block grouping has also been added to show the nested factor component.

**Note**: In order to plot in required layout, just specify: `layout = c(number_of_rows, number_of_columns)` argument (Thanks to [Kevin Wright](https://github.com/kwstat) for helping me figure this out.)

<img src="{{< blogdown/postref >}}index_files/figure-html/desplot-layout-1.png" width="960" style="display: block; margin: auto;" />

