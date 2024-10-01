---
title: How to quickly view object size
draft: true
author: Deependra Dhakal
date: '2018-10-16'
slug: how-to-quickly-view-object-size
categories:
  - R
tags:
  - R
header:
  caption: 'Tricks of a lobstr :smile:; Source:istock'
  image: 'lobster.jpg'
---

# Background

In object oriented programming, everything is an object -- even functions. One of the defining features of [OOP](https://en.wikipedia.org/wiki/Object-oriented_programming), and especially that of R, is that all objects are characterized by their classes. Each class on the other hand have their repective attributes and methods defined.

Having talked in a brief on some features of object oriented paradigm, it is also imperative to know how the objects are stored in memories. Each block of memory has its unique memory address, which is referenced by the object being saved. Since all objects in R can structurally be represented by an object tree (See this very informative [video](https://www.youtube.com/watch?v=g1h-YDWVRLc) by [Hadley Wickham](http://hadley.nz/)), It can also be drawn that memory allocation of different objects in R is highly structured activity. We could get by most of the curiosities surrounding an object just by knowing its size in memory block. This tutorial is how to just do that.

First off, there are some basic understandings to start with:

- Objects stored in environment could be referenced by their namespace (Using `ls`)
- Erasing namespace (using `rm`) from the environment does not fee up the memory allocated to the object.
- Basic tree structure of an object could be seen using `str()` function.

# Memory basics

## Create an object and store it

Create a list object `x` and store it in the memory.


```r
x <- runif(1e5)
print(object.size(x), units = "KiB", standard = "IEC")
```

```
## 781.3 KiB
```

The object size of the assigned object `x` could be known from the `object.size()` function in base R. Additional print wrapper allows to make printing the output more human readable, for example, I've passed units argument to show the Kilobytes measure of the object and the IEC standard ensures that one KiB is equivalent of 1024 bytes and not 1000 bytes.

Hadley has repacked this above and similar set of exciting functions with added features and improvements in an effort to getting things tidier into **lobstr** package. (See [tidyverse](https://www.tidyverse.org/) movement).


```r
# devtools::install_github("r-lib/lobstr")
require(lobstr)
```

```
## Warning: package 'lobstr' was built under R version 4.2.3
```

```r
obj_size(x)
```

```
## 800.05 kB
```

One quick mention of its functionality is that it allows combined printing of multiple object size/s. For example, take this:


```r
obj_size(x, man = "happy man")
```

```
## 800.17 kB
```

Plural counterpart of the function similar as above exists which prints objects sizes unique to each item, as the name `obj_sizes()` suggests.


```r
obj_sizes(x, man = "happy man")
```

```
##    : 800.05 kB
## man:     120 B
```

To learn more about memory allocation process and some seemingly anomalous features of R, watch the video referenced above about lobstr package and [this](https://www.youtube.com/watch?v=nERXS3ssntw) one about tidy evaluation -- the heart of `rlang` package and an embedded language. For the time being, don't bang your head thinking about what really is happening in the statements below.


```r
y <- list(x, x, x)
purrr::map_dbl(y, obj_size) # size of components of y
```

```
## [1] 800048 800048 800048
```

```r
obj_size(y) # size of complete object y
```

```
## 800.13 kB
```

```r
# assigning some values to y
y[[1]][[1]] <- NA
obj_size(y) # notice how the size of y doubles!
```

```
## 1.60 MB
```

