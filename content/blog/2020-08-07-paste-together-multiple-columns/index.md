---
title: Paste together multiple columns
author: Deependra Dhakal
date: '2020-08-07'
slug: paste-together-multiple-columns
categories:
  - R
tags:
  - R
subtitle: ''
summary: ''
authors: []
lastmod: '2020-08-07T10:20:52+05:45'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---




```r
# # paste together dataframe columns by column index
# take the following df

df <- data.frame(my_number = letters[1:5], 
                 column_odd1 = rnorm(5), 
                 column_even1 = rnorm(5), 
                 column_odd2 = rnorm(5), 
                 column_even2 = rnorm(5), 
                 column_odd3 = rnorm(5), 
                 column_even3 = rnorm(5))

df %>% 
  select(1) %>% 
  bind_cols(data.frame(setNames(lapply(list(c(2,3), c(4, 5), c(6, 7)), function(i) 
    do.call(sprintf, c(fmt = "%0.3f (%0.3f)", # round at third place after decimal. use %s if columns were character type
                       df[i]))), c("new_column1", "new_column2", "new_column3"))))
```

```
##   my_number     new_column1     new_column2     new_column3
## 1         a -0.682 (-1.828) -1.304 (-0.113)  1.121 (-0.586)
## 2         b -1.178 (-0.809)   0.534 (0.524) -1.330 (-0.709)
## 3         c -0.432 (-2.787) -1.586 (-0.105)  1.449 (-0.533)
## 4         d  -1.258 (0.455) -0.071 (-0.786) -0.326 (-0.607)
## 5         e   0.329 (0.525)   0.011 (1.141)  0.043 (-0.228)
```

