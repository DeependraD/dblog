---
title: 'String tip: complex pattern recognition'
author: Deependra Dhakal
date: '2018-12-22'
slug: string-tip-complex-pattern-recognition
categories:
  - R
tags:
  - R
  - tidyverse
header:
  caption: ''
  image: ''
---



## Background

This post is all about examples and use cases. So...Let's break a leg.

1. Extract all words except last one using *anchors* and *look arounds*


```r
nasty_char <- c("I love playing wildly") # remove the last word "wildly"

stringr::str_extract(nasty_char, ".*(?=\\s[:alpha:]*$)")
```

```
## [1] "I love playing"
```

