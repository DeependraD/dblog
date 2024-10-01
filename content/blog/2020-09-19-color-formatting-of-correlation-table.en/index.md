---
title: Color formatting of correlation table
author: Deependra Dhakal
date: '2020-09-19'
slug: color-formatting-of-correlation-table
categories:
  - R
tags:
  - R
  - correlation
  - table
subtitle: ''
summary: ''
authors: []
lastmod: '2020-09-19T08:39:45+05:45'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
math: yes
---
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />



# Correlation

Correlation is a bivariate summary statistic. It basically talks of direction and magnitidue of association of two variables. Besides formatting with significance stars, color coding correlation coefficient table might be helpful to pick patterns out in a quick glimpse.

Table <a href="#tab:correlation-with-color">1</a> presents correlation matrix of yield and yield component traits (a blue `\(\rightarrow\)` red color profile represents increasing magnitude of positive correlation between traits). Following code is helpful if somebody provides a correlation table with stars in it and tells you to prettify it. Note that lower or upper halves only cannot be used to determine the discrete color values so full column is required.


```r
# don't use underscore with this kablestyling
# list.files(here::here("content", "post", "data"))

correlation_mat <- read_csv(here::here("content", "blog", "data", "correlation_matrix.csv")) %>% 
  select(-1) %>% 
  mutate_if(is.numeric, as.character) %>% 
  as.matrix()

# construct symmetric matrix
correlation_mat[upper.tri(correlation_mat)] <- t(correlation_mat)[upper.tri(correlation_mat)]
correlation_mat <- correlation_mat %>% as_tibble()

rb_nextgen <- function(x){
  # generates a function for palette generation
  color_fun <- colorRampPalette(c(rgb(0.7, 0.7, 0.95, 0.5), rgb(0.95, 0.7, 0.7, 0.5)), alpha = TRUE)
  # generate a palette of length equal to length of vector
  length_vec <- length(x)
  generated_colors <- color_fun(n = length_vec)[as.numeric(cut(parse_number(x), breaks = length_vec))]
}

correlation_mat <- correlation_mat %>%
  mutate_all(function(x)kableExtra::cell_spec(x, "html", bold = TRUE, background = rb_nextgen(x)))
correlation_mat[upper.tri(correlation_mat)] <- NA

correlation_mat %>% 
  knitr::kable(format = "html",
               caption = "Correlation table with color",
               escape = F,
               booktabs = T,
               linesep = "",
               align = "c", digits = 2) %>%
  kableExtra::kable_styling(position = "center",
                            latex_options = c("scale_down", "HOLD_position"),
                            full_width = FALSE) %>%
  kableExtra::row_spec(row = 0, bold = TRUE)
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>Table 1: Correlation table with color</caption>
 <thead>
  <tr>
   <th style="text-align:center;font-weight: bold;"> V1 </th>
   <th style="text-align:center;font-weight: bold;"> V2 </th>
   <th style="text-align:center;font-weight: bold;"> V3 </th>
   <th style="text-align:center;font-weight: bold;"> V4 </th>
   <th style="text-align:center;font-weight: bold;"> V5 </th>
   <th style="text-align:center;font-weight: bold;"> V6 </th>
   <th style="text-align:center;font-weight: bold;"> V7 </th>
   <th style="text-align:center;font-weight: bold;"> V8 </th>
   <th style="text-align:center;font-weight: bold;"> V9 </th>
   <th style="text-align:center;font-weight: bold;"> V10 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">1</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(179, 179, 242, 0.5) !important;">-0.516*</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">1</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">0.983**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(179, 179, 242, 0.5) !important;">-0.516*</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">1</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(179, 179, 242, 0.5) !important;">-0.398</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(200, 179, 220, 0.5) !important;">-0.02</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(179, 179, 242, 0.5) !important;">-0.44</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">1</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(235, 179, 186, 0.5) !important;">0.794**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(200, 179, 220, 0.5) !important;">-0.086</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(235, 179, 186, 0.5) !important;">0.812**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(179, 179, 242, 0.5) !important;">-0.530*</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">1</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">0.923**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(186, 179, 235, 0.5) !important;">-0.377</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">0.918**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(179, 179, 242, 0.5) !important;">-0.486</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(235, 179, 186, 0.5) !important;">0.825**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">1</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">0.853**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(179, 179, 242, 0.5) !important;">-0.458</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">0.854**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(179, 179, 242, 0.5) !important;">-0.548*</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(235, 179, 186, 0.5) !important;">0.817**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(235, 179, 186, 0.5) !important;">0.819**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">1</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(227, 179, 193, 0.5) !important;">0.674**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(179, 179, 242, 0.5) !important;">-0.573*</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(227, 179, 193, 0.5) !important;">0.638*</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(193, 179, 227, 0.5) !important;">-0.222</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(220, 179, 200, 0.5) !important;">0.388</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(220, 179, 200, 0.5) !important;">0.547*</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(235, 179, 186, 0.5) !important;">0.815**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">1</span> </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(227, 179, 193, 0.5) !important;">0.669**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(179, 179, 242, 0.5) !important;">-0.549*</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(227, 179, 193, 0.5) !important;">0.638*</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(186, 179, 235, 0.5) !important;">-0.334</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(220, 179, 200, 0.5) !important;">0.442</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(227, 179, 193, 0.5) !important;">0.567*</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">0.863**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">0.976**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">1</span> </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(235, 179, 186, 0.5) !important;">0.763**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(179, 179, 242, 0.5) !important;">-0.547*</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(235, 179, 186, 0.5) !important;">0.760**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(179, 179, 242, 0.5) !important;">-0.5</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(227, 179, 193, 0.5) !important;">0.616*</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(227, 179, 193, 0.5) !important;">0.697**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">0.955**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">0.926**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">0.960**</span> </td>
   <td style="text-align:center;"> <span style=" font-weight: bold;    border-radius: 4px; padding-right: 4px; padding-left: 4px; background-color: rgba(242, 179, 179, 0.5) !important;">1</span> </td>
  </tr>
</tbody>
</table>


