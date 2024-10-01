---
title: 'Cluster dendrogram: An introduction and showcase'
author: Deependra Dhakal
date: '2020-09-07'
slug: cluster-dendrogram-an-introduction-and-showcase
categories:
  - R
tags:
  - tidyverse
subtitle: ''
summary: ''
authors: []
lastmod: '2020-09-07T22:12:28+05:45'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---



A cluster analysis is a classification problem. It is dealt in several ways, one of which is hierarchial agglomeration. The method allows for easy presentation of high dimensional data, more of so when the number of observations is readily fitted into a visualization. 

Here's I deal with a case of clustering typically seen in agriculture and field research where a researcher tests typically a large number of genotypes and seeks to see them organized into distinguishable clusters using dendrogram. Data concerns observations on disease incidence in rice genotypes of various stages -- germinating seed to maturity nearing crop. Following provides a descriptive summary of the observation variables.  


```r
rice_path <- read_csv(here::here("content", "blog", "data", "rice_genotypes_blight_pathology_disease.csv"))
landraces <- read_csv(here::here("content", "blog", "data", "rice_genotypes_blight_pathology_landraces.csv"))
skimr::skim(rice_path)
```


Table: Table 1: Data summary

|                         |          |
|:------------------------|:---------|
|Name                     |rice_path |
|Number of rows           |60        |
|Number of columns        |3         |
|_______________________  |          |
|Column type frequency:   |          |
|numeric                  |3         |
|________________________ |          |
|Group variables          |None      |


**Variable type: numeric**

|skim_variable        | n_missing| complete_rate|   mean|    sd|     p0|    p25|    p50|    p75|   p100|hist  |
|:--------------------|---------:|-------------:|------:|-----:|------:|------:|------:|------:|------:|:-----|
|severity_percent     |         0|             1|  58.79| 10.34|  33.33|  51.86|  59.26|  66.67|  81.49|▂▅▇▇▂ |
|mean_audpc           |         0|             1| 239.55| 38.59| 134.26| 216.88| 243.06| 263.89| 305.56|▁▃▆▇▅ |
|final_seed_incidence |         0|             1|  51.70|  8.67|  30.00|  46.00|  52.67|  58.00|  69.33|▂▃▇▇▃ |

Scaling the data in all columns avoids the trouble with interpretation, particularly with all the different units of measurement in each variable.


```r
# scale data and prepare
rice_path_disease <- scale(rice_path)

# distance and clustering
dist_euclidean <- dist(rice_path_disease, "euclidean")
# hclust_ave <- hclust(dist_euclidean, method = "ave")
hclust_ave <- hclust(dist_euclidean, method = "ward.D2") # ward has high clustering power
hclust_ave$labels <- landraces$landraces[1:60][hclust_ave$order]

# extract data
hclust_ave_data <- ggdendro::dendro_data(hclust_ave, type = "rectangle")

# determine number of clusters
clust_five <- cutree(hclust_ave, k=5)
clust_df <- tibble(label=names(clust_five), cluster=factor(clust_five))

# merge the labels, with clust.df
hclust_ave_data[["labels"]] <- merge(hclust_ave_data[["labels"]], clust_df, by="label")
```



```r
clustering_dendrogram <- ggplot() + 
  geom_segment(data=hclust_ave_data[["segments"]], aes(x=x, y=y, xend=xend, 
                                        yend=yend)) + 
  geom_text(data=hclust_ave_data[["labels"]], aes(x, y, label=label, hjust=0, color=cluster), 
            size=2.2) +
  coord_flip() + scale_y_reverse(expand=c(0.2, 0)) + 
  theme(axis.line.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.text.y=element_blank(),
        axis.title.y=element_blank(),
        panel.background=element_rect(fill="white"),
        panel.grid=element_blank()) +
  labs(caption = "Hierarchical clustering using euclidean distance and \nward's method for agglomeration and \nshowing five clusters in dendrogram")

# ggsave("./clustering_dendrogram.png", plot = clustering_dendrogram, device = "png", 
#          width = 8, height = 6, units = "in", dpi = 240)
```

While we use certain method in clustering, its efficacy as a classifer can be checked with `cluster::agnes()`.


```r
# methods to assess
m <- c("average", "single", "complete", "ward")
names(m) <- c("average", "single", "complete", "ward")

# function to compute coefficient
ac <- function(x) {
  agnes(rice_path_disease, method = x)$ac
}

map_dbl(m, ac)
```

```
##   average    single  complete      ward 
## 0.8171988 0.7323511 0.8932563 0.9257491
```

