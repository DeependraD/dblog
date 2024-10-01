---
title: Dealing with factors
author: Deependra Dhakal
date: '2017-05-18'
slug: []
categories:
  - R
  - factor
  - blog
tags:
  - R
  - factors
---
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />
<script src="{{< blogdown/postref >}}index_files/kePrint/kePrint.js"></script>
<link href="{{< blogdown/postref >}}index_files/lightable/lightable.css" rel="stylesheet" />



## A `factor` is an headache

I have a dataset, cleaning which has been a pain lately. I'm going to use 20 observations of the imported dataset in this post to demonstrate how pathetically have I been advancing with it. 

<table class="table table-striped table-hover" style="font-size: 10px; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:center;font-weight: bold;"> plot </th>
   <th style="text-align:center;font-weight: bold;"> jan_23_2017 </th>
   <th style="text-align:center;font-weight: bold;"> jan_26_2017 </th>
   <th style="text-align:center;font-weight: bold;"> jan_29_2017 </th>
   <th style="text-align:center;font-weight: bold;"> feb_02_2017 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;font-weight: bold;"> 1 </td>
   <td style="text-align:center;"> 0 </td>
   <td style="text-align:center;"> 0 </td>
   <td style="text-align:center;"> b </td>
   <td style="text-align:center;"> am </td>
  </tr>
  <tr>
   <td style="text-align:center;font-weight: bold;"> 2 </td>
   <td style="text-align:center;"> f </td>
   <td style="text-align:center;"> s </td>
   <td style="text-align:center;"> 1p </td>
   <td style="text-align:center;"> 10p </td>
  </tr>
  <tr>
   <td style="text-align:center;font-weight: bold;"> 3 </td>
   <td style="text-align:center;"> b </td>
   <td style="text-align:center;"> a </td>
   <td style="text-align:center;"> sm </td>
   <td style="text-align:center;"> 3p </td>
  </tr>
  <tr>
   <td style="text-align:center;font-weight: bold;"> 4 </td>
   <td style="text-align:center;"> b </td>
   <td style="text-align:center;"> b </td>
   <td style="text-align:center;"> ap </td>
   <td style="text-align:center;"> 2 </td>
  </tr>
  <tr>
   <td style="text-align:center;font-weight: bold;"> 5 </td>
   <td style="text-align:center;"> 0 </td>
   <td style="text-align:center;"> b </td>
   <td style="text-align:center;"> bp </td>
   <td style="text-align:center;"> s </td>
  </tr>
  <tr>
   <td style="text-align:center;font-weight: bold;"> 6 </td>
   <td style="text-align:center;"> b </td>
   <td style="text-align:center;"> a </td>
   <td style="text-align:center;"> sp </td>
   <td style="text-align:center;"> 3 </td>
  </tr>
</tbody>
</table>

Providing it a context, the columns represent multiple observations of same variable at different dates, as apparent from the column names.

One can observe from the `str(head_boot)` that the dataframe has only 20 observations. Had a larger dataframe been subsetted, the factors with their usual nuisance carry over the all the levels, even currently unused ones. To demonstrate this, below I present how many factor levels the original dataframe had and what changes after a `subset` (`slice`, `filter` have same feature) operation.



```r
# original dataframe
head_boot %>% 
  select_if(is.factor) %>% 
  map_int(function(x)length(levels(x)))
```

```
## jan_23_2017 jan_26_2017 jan_29_2017 feb_02_2017 
##           5           6          14          15
```

```r
# subsetted to obtain a dataframe where one factors has either "s" or "0" levels only
subset.data.frame(head_boot, 
                  subset = head_boot$jan_23_2017 %in% c("s", "0"), 
                  select = sapply(head_boot, is.factor)) %>% 
  map_int(function(x)length(levels(x)))
```

```
## jan_23_2017 jan_26_2017 jan_29_2017 feb_02_2017 
##           5           6          14          15
```


All factor levels are retained ! 

A prophylactic measure is avoiding at all importing of character data columns as a factor. This could be done using setup option: `options(stringsAsFactors = FALSE)` ahead of import. Still, after the import many options exist. Some of the best alternatives out are listed below:

1. Use `subsetted_df$factor_col[, drop=TRUE]`, where a vector of factor values is indexed with drop argument.

2. Convert factor columns of subsetted dataframe first to character and then back to factors class.

3. Use `forcats::fct_drop(f)` for more reliable NA handling

4. Use `droplevels()` or `droplevels.data.frame()`


To give a realistic feel to data, factor levels may be recoded or relabelled with more informative labels.


```r
suit_labels <- factor(c("before_boot_n_boot", "heading", "anthesis"), 
                      levels = c("before_boot_n_boot", "heading", "anthesis"), 
                      ordered = T)

# what are all the levels
head_boot_lvl <- head_boot %>% 
  select_if(is.factor) %>% 
  map(levels) %>% 
  unlist() %>% 
  unique()

# create all combinations of factor levels of the dataset
# purrr::cross_df preserves the order, tidyr::crossing doesn't
possible_hb_lvl <- cross_df(list(post  = factor(c("m", "", "p"), ordered = TRUE), 
      pre = factor(c("b", "f", "a", "s", "1", "2", 
                     "3", "4", "10", "11", "12"), ordered = TRUE))) %>% 
  select(rev(everything())) %>% 
  # arrange(match(post, c("m", "", "p"))) %>% # don't need this ordering 
  unite(col = "pre_post", sep = "") %>% 
  add_row(pre_post = "0", .before = 1) %>% 
  mutate(pre_post = factor(pre_post, levels = pre_post, ordered = TRUE))

# mutate original dataframe to represent ordinal factors
head_boot <- head_boot %>% 
  mutate_if(is.factor, function(x)factor(x, levels = possible_hb_lvl$pre_post, labels = possible_hb_lvl$pre_post, ordered = TRUE))

# function to recode factor levels (better to use `fct_recode()`)
fct_minimize <- function(x)case_when(x < "1m" ~ suit_labels[1], 
                                     x >= "1m" & x < "10m" ~ suit_labels[2], 
                                     x >= "10m" ~ suit_labels[3], 
                                     TRUE ~ NA)

# mutate original dataframe with function to recode factor levels
head_boot <- head_boot %>% 
  mutate_if(is.factor, fct_minimize)

str(head_boot)
```

```
## tibble [20 × 5] (S3: tbl_df/tbl/data.frame)
##  $ plot       : num [1:20] 1 2 3 4 5 6 7 8 9 10 ...
##  $ jan_23_2017: Ord.factor w/ 3 levels "before_boot_n_boot"<..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ jan_26_2017: Ord.factor w/ 3 levels "before_boot_n_boot"<..: 1 1 1 1 1 1 1 2 1 1 ...
##  $ jan_29_2017: Ord.factor w/ 3 levels "before_boot_n_boot"<..: 1 2 1 1 1 1 2 2 2 1 ...
##  $ feb_02_2017: Ord.factor w/ 3 levels "before_boot_n_boot"<..: 1 3 2 2 1 2 2 3 2 1 ...
```

A more telling dataframe looks like the one below.


```r
knitr::kable(head(head_boot), format = "html", align = "c") %>% 
  kableExtra::kable_styling(bootstrap_options = c("striped", "hover"), 
                            font_size = 10, position = "center") %>% 
  kableExtra::row_spec(0, bold = TRUE) %>% 
  kableExtra::column_spec(1, bold = TRUE)
```

<table class="table table-striped table-hover" style="font-size: 10px; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:center;font-weight: bold;"> plot </th>
   <th style="text-align:center;font-weight: bold;"> jan_23_2017 </th>
   <th style="text-align:center;font-weight: bold;"> jan_26_2017 </th>
   <th style="text-align:center;font-weight: bold;"> jan_29_2017 </th>
   <th style="text-align:center;font-weight: bold;"> feb_02_2017 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;font-weight: bold;"> 1 </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
  </tr>
  <tr>
   <td style="text-align:center;font-weight: bold;"> 2 </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> heading </td>
   <td style="text-align:center;"> anthesis </td>
  </tr>
  <tr>
   <td style="text-align:center;font-weight: bold;"> 3 </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> heading </td>
  </tr>
  <tr>
   <td style="text-align:center;font-weight: bold;"> 4 </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> heading </td>
  </tr>
  <tr>
   <td style="text-align:center;font-weight: bold;"> 5 </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
  </tr>
  <tr>
   <td style="text-align:center;font-weight: bold;"> 6 </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> before_boot_n_boot </td>
   <td style="text-align:center;"> heading </td>
  </tr>
</tbody>
</table>


## Visualizing data

Bar plotting of the ordinal data might reveal interesting insights, so let's prepare ggplot graphs.


```r
walk2(.x = head_boot %>% select(jan_23_2017:feb_02_2017) %>% colnames(),
      .y = as.character(strptime(str_subset(colnames(head_boot), "^\\w{3}_\\d{2}"), 
                                 format = "%b_%d_%Y")),
      .f = ~print(ggplot(aes(x = get(.x)), data = head_boot) +
                    geom_bar(position = "dodge", stat = "count", width = .5) +
                    xlab(.y) +
                    theme(axis.text.x = element_text(angle = 40, size = 9, vjust = 0.6))))
```

<div class="figure" style="text-align: center">
<img src="{{< blogdown/postref >}}index_files/figure-html/ggbar-viz-1.png" alt="Growth stages at different dates" width="672" />
<p class="caption">Figure 1: Growth stages at different dates</p>
</div><div class="figure" style="text-align: center">
<img src="{{< blogdown/postref >}}index_files/figure-html/ggbar-viz-2.png" alt="Growth stages at different dates" width="672" />
<p class="caption">Figure 2: Growth stages at different dates</p>
</div><div class="figure" style="text-align: center">
<img src="{{< blogdown/postref >}}index_files/figure-html/ggbar-viz-3.png" alt="Growth stages at different dates" width="672" />
<p class="caption">Figure 3: Growth stages at different dates</p>
</div><div class="figure" style="text-align: center">
<img src="{{< blogdown/postref >}}index_files/figure-html/ggbar-viz-4.png" alt="Growth stages at different dates" width="672" />
<p class="caption">Figure 4: Growth stages at different dates</p>
</div>

With dplyr, It's seemless to obtain a tabular summary of what has been visualized above.


```r
# credit: https://stackoverflow.com/a/46340237/6725057
head_boot %>% 
  select_if(is.factor) %>% 
  tidyr::gather(date, stage) %>% 
  dplyr::group_by(date, stage) %>% 
  dplyr::count() %>% 
  dplyr::ungroup() %>% 
  tidyr::spread(date, n) %>% 
  knitr::kable(format = "html", align = "c") %>% 
  kableExtra::kable_styling(bootstrap_options = c("striped", "hover"), 
                            font_size = 10, position = "center") %>% 
  kableExtra::row_spec(0, bold = TRUE) %>% 
  kableExtra::column_spec(1, bold = TRUE)
```

<table class="table table-striped table-hover" style="font-size: 10px; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:center;font-weight: bold;"> stage </th>
   <th style="text-align:center;font-weight: bold;"> feb_02_2017 </th>
   <th style="text-align:center;font-weight: bold;"> jan_23_2017 </th>
   <th style="text-align:center;font-weight: bold;"> jan_26_2017 </th>
   <th style="text-align:center;font-weight: bold;"> jan_29_2017 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;font-weight: bold;"> anthesis </td>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;font-weight: bold;"> before_boot_n_boot </td>
   <td style="text-align:center;"> 6 </td>
   <td style="text-align:center;"> 19 </td>
   <td style="text-align:center;"> 15 </td>
   <td style="text-align:center;"> 12 </td>
  </tr>
  <tr>
   <td style="text-align:center;font-weight: bold;"> heading </td>
   <td style="text-align:center;"> 8 </td>
   <td style="text-align:center;"> 1 </td>
   <td style="text-align:center;"> 5 </td>
   <td style="text-align:center;"> 8 </td>
  </tr>
</tbody>
</table>

