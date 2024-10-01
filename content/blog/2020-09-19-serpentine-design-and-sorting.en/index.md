---
title: Serpentine design and sorting
author: Deependra Dhakal
date: '2020-09-19'
slug: serpentine-design-and-sorting
categories:
  - R
  - doe
tags:
  - doe
  - R
subtitle: ''
summary: ''
authors: []
lastmod: '2020-09-19T12:13:33+05:45'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

# Take a grid and serpentine it row-wise or column-wise

This fn joins two matrices alternately columnwise, which is why this is the source of inspiration for generating serpentine design.


```r
alternate.cols <- function(m1, m2) {
  cbind(m1, m2)[, order(c(seq(ncol(m1)), seq(ncol(m2))))]
}
```

A custom function to create a serpentine design in whatever fashion specified:


```r
serpentine <- function(x, columnwise=TRUE){
  if (columnwise) {
    odd <- x[, seq(1, by=2, length.out = ncol(x)/2)] # odd x
    rev_even <- x[, seq(from = 2, 
                        by=2, 
                        length.out = (ifelse((ncol(x)%%2 != 0), 
                                             ((ncol(x)/2)-1), 
                                             (ncol(x)/2))))][seq(dim(x)[1],1),] # or, even[rev(1:nrow(x)),] # reversed even x
    alternate_cbind <-  cbind(odd, rev_even)[, order(c(seq(ncol(odd)), 
                                                       seq(ncol(rev_even))))]
    return(alternate_cbind)}
  else {
    odd <- x[seq(1, by=2, length.out = nrow(x)/2),] # odd x
    rev_even <- x[seq(from = 2, by=2, length.out = (ifelse((nrow(x)%%2 != 0), 
                                                           ((nrow(x)/2)-1), 
                                                           (nrow(x)/2)))), ][, seq(dim(x)[2],1)] # or, even[, rev(1:ncol(x))] # reversed even x
    alternate_rbind <-  rbind(odd, rev_even)[order(c(seq(nrow(odd)), 
                                                     seq(nrow(rev_even)))), ]
    return(alternate_rbind)
  }
}
```

Let's see the function in action


```r
grid <- matrix(seq(from = 1, by = 1, length.out = 6*7), nrow = 6, byrow = TRUE)

serpentine(grid, columnwise = TRUE)
```

```
##      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
## [1,]    1   37    3   39    5   41    7
## [2,]    8   30   10   32   12   34   14
## [3,]   15   23   17   25   19   27   21
## [4,]   22   16   24   18   26   20   28
## [5,]   29    9   31   11   33   13   35
## [6,]   36    2   38    4   40    6   42
```

```r
serpentine(grid, columnwise = FALSE)
```

```
##      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
## [1,]    1    2    3    4    5    6    7
## [2,]   14   13   12   11   10    9    8
## [3,]   15   16   17   18   19   20   21
## [4,]   28   27   26   25   24   23   22
## [5,]   29   30   31   32   33   34   35
## [6,]   42   41   40   39   38   37   36
```

Test it with any design matrix, such as one below:


```r
design_mat <- data.frame(row = c(rep(letters[1:4], each = 5)), col = c(rep(letters[22:26], times = 4)))
```

`serpentine_sorter()` requires `serpentine()` to be available in the namespace to work.

Given a row-col ordering of a design, this function will convert any vector of that order to serpentine sorted order.


```r
serpentine_sorter <- function(x, ncols, byrow = FALSE, columnwise = FALSE){
  
  # Arguments
  # x   vector which will be re-ordered
  # ncols   An integer specifying number of columns in design matrix where x belongs to
  # byrow   Logical: is the design matrix order filled column-level wise(_first_) and row-level wise(_second_)?
  #         Note that here, the name of argument is somewhat misleading. Look [sorting](./sorting.R) example
  #         to learn how sorting is done with multiple column specifications.
  # columnwise  Logical: Should the serpentine generation be done column wise or row wise?
  
  as.vector(t(serpentine(matrix(rev(x), ncol = ncols, 
                                byrow = byrow)[, ncols:1],
                         columnwise = columnwise)))
}
```

Test with a vector `x` in a row-col design matrix with 20 columns ordered column-level wise(_first_) followed by row-level wise(_second_).


```r
## or the following will generate necessary length of index
row_a <- 1:20
col_b <- 1:12
addition <- rep(seq(0, by = length(row_a), length.out = length(col_b)), each = length(row_a))
revved <- rep(c(row_a, rev(row_a)), times = length(col_b)/2)

alternating <- addition + revved
length(alternating)
```

```
## [1] 240
```

