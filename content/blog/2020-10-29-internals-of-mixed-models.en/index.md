---
title: Internals of Mixed Models
author: Deependra Dhakal
date: '2020-10-29'
slug: internals-of-mixed-models
categories:
  - R
  - statistics
tags:
  - R
subtitle: ''
summary: ''
authors: []
lastmod: '2020-10-29T06:37:13+05:45'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

Linear mixed models are widely used in Agriculture and Plant Breeding, as of recent. With access to genotype data high resolution phenotype data, it has become more of a requirement to use this family of model.

Mixed models allow for experimental (design or outcome) variables' parameter estimates to have probabilistic distributions -- most commonly normal -- with opportunity to specify different variance-covariance components among the levels of those variables. In this post, I wish to discuss on some of the popular mixed modeling tools and techniques in the R community with links and discussion of the concepts surrounding variations of modeling techniques.

1. For a discussion of when should nesting of certain factor inside other is important what are obvious implications of implicit vs. explicit nesting, refer to:
[](https://stats.stackexchange.com/questions/490888/anova-represenation-of-mixed-model-with-crossed-random-effects-and-uncorrelated)

2. Paul Schmidt has a nice blog discussing different types of variance structure in mixed models and how they are specified using popular statistical packages: https://schmidtpaul.github.io/MMFAIR/variance_structures.html# . His github repo is equally rich in codes on mixed modeling options: [](https://github.com/SchmidtPaul/)

6. Partial pooling in mixed effects models (Links were learnt from https://stats.stackexchange.com/a/396755/126964)

A visual tutorial (https://www.tjmahr.com/plotting-partial-pooling-in-mixed-effects-models/) by Tristan Mahr is excellent in showing how partial pooling works in a mixed model. The blog shows beautiful plots comparing different model families (with no pooling -- linear model for each group, with partial pooling -- group intercept specified random effects model, complete pooling -- average model disregarding group; notice that group is a categorical variable) with respect to coefficient estimates. Also, an interesting graph is that of scatterplot showing intercept and slope estimates in x and y respectively, with arrow depiction of how they are shrunk/pulled towards common center (estimates from complete pooling model). I link graphic below, but for the code generating it refer to the blog. The author (in bonus) also provides a way to visualize the distribution of posterior samples of all coefficient estimates for individual grouping factor from a bayesian model fitting using rstanarm.

For model representation of various pooled, unpooled and partially pooled models, refer to the lecture slides at http://www.utstat.toronto.edu/~guerzhoy/303/lec/lec9/multi.pdf

Here is another resource that shows effects of partial pooling for variance components estimates. https://win-vector.com/2017/09/28/partial-pooling-for-lower-variance-variable-encoding/#more-5245

These slides talk about the degree of pooling and how to quantify it: https://web.as.uky.edu/statistics/users/pbreheny/701/S13/notes/4-18.pdf.


```r
knitr::include_url("https://www.tjmahr.com/figs//2017-06-22-plotting-partial-pooling-in-mixed-effects-models/topgraphic-map-1-1.png")
```

<iframe src="https://www.tjmahr.com/figs//2017-06-22-plotting-partial-pooling-in-mixed-effects-models/topgraphic-map-1-1.png" width="672" height="400px" data-external="1"></iframe>
