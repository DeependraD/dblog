---
title: 'Array operation: Outer product'
author: Deependra Dhakal
date: '2020-07-31'
slug: array-operation-outer-product
categories:
  - R
tags: []
subtitle: ''
summary: ''
authors: []
lastmod: '2020-07-31T22:06:20+05:45'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

Incidentally, I ran into outer product function `outer` today. It is extremely powerful function, in that it computes all combinations of product of two objects. One simplest and obvious demonstration is the multiplication table of numbers. :smile:

We can show multiplication table of numbers 1 through 12 each multiplied 1 through 10.


```r
outer(1:10, 1:12, "*")
```

```
##       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12]
##  [1,]    1    2    3    4    5    6    7    8    9    10    11    12
##  [2,]    2    4    6    8   10   12   14   16   18    20    22    24
##  [3,]    3    6    9   12   15   18   21   24   27    30    33    36
##  [4,]    4    8   12   16   20   24   28   32   36    40    44    48
##  [5,]    5   10   15   20   25   30   35   40   45    50    55    60
##  [6,]    6   12   18   24   30   36   42   48   54    60    66    72
##  [7,]    7   14   21   28   35   42   49   56   63    70    77    84
##  [8,]    8   16   24   32   40   48   56   64   72    80    88    96
##  [9,]    9   18   27   36   45   54   63   72   81    90    99   108
## [10,]   10   20   30   40   50   60   70   80   90   100   110   120
```

Another immediate use can be seen in design and combinatorics. For instance,


```r
# outer product sum and subtraction function
outer(1:5, 1:10, "+")
```

```
##      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
## [1,]    2    3    4    5    6    7    8    9   10    11
## [2,]    3    4    5    6    7    8    9   10   11    12
## [3,]    4    5    6    7    8    9   10   11   12    13
## [4,]    5    6    7    8    9   10   11   12   13    14
## [5,]    6    7    8    9   10   11   12   13   14    15
```

```r
outer(1:5, 1:10, "-")
```

```
##      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
## [1,]    0   -1   -2   -3   -4   -5   -6   -7   -8    -9
## [2,]    1    0   -1   -2   -3   -4   -5   -6   -7    -8
## [3,]    2    1    0   -1   -2   -3   -4   -5   -6    -7
## [4,]    3    2    1    0   -1   -2   -3   -4   -5    -6
## [5,]    4    3    2    1    0   -1   -2   -3   -4    -5
```

Interestingly, outer subtraction of same two numeric vector gives a symmetric matrix with negative elements in upper with respect to lower.


```r
outer(1:5, 1:5, "-")
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,]    0   -1   -2   -3   -4
## [2,]    1    0   -1   -2   -3
## [3,]    2    1    0   -1   -2
## [4,]    3    2    1    0   -1
## [5,]    4    3    2    1    0
```

```r
table(outer(1:5, 1:5, "-"))
```

```
## 
## -4 -3 -2 -1  0  1  2  3  4 
##  1  2  3  4  5  4  3  2  1
```

In genetics, outer product is useful finding genotype combinations from multiple loci. For two loci, combination of genotypes is obtained as:


```r
outer(c("AA", "Aa", "aa"), c("BB", "Bb", "bb"), paste0)
```

```
##      [,1]   [,2]   [,3]  
## [1,] "AABB" "AABb" "AAbb"
## [2,] "AaBB" "AaBb" "Aabb"
## [3,] "aaBB" "aaBb" "aabb"
```

Likewise for gamete formation, we can see that when there are 5 alleles in a diploid organism, possible genotype combinations are:


```r
outer(LETTERS[1:5], LETTERS[1:5], paste0)
```

```
##      [,1] [,2] [,3] [,4] [,5]
## [1,] "AA" "AB" "AC" "AD" "AE"
## [2,] "BA" "BB" "BC" "BD" "BE"
## [3,] "CA" "CB" "CC" "CD" "CE"
## [4,] "DA" "DB" "DC" "DD" "DE"
## [5,] "EA" "EB" "EC" "ED" "EE"
```

