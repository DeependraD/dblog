---
title: 'String tip: vectorized pattern replacement'
author: Deependra Dhakal
date: '2018-12-22'
slug: string-tip-vectorized-pattern-replacement
categories:
  - R
  - tidyverse
tags:
  - R
header:
  caption: ''
  image: ''
---



## Example case

Suppose you have a bunch of really filthy names, which makes you puke... You can go about fixing those with the help of `stringi` and `stringr`

Lets say following character vector hosts those filthy names.


```r
filthy <- c("Grains %", "Moisture (gm/kg)", "Plant height (cm)", "White   spaces", "White space  (filth%)")
filthy
```

```
## [1] "Grains %"              "Moisture (gm/kg)"      "Plant height (cm)"    
## [4] "White   spaces"        "White space  (filth%)"
```

Now to get rid of the filth use string manipulation.


```r
filthy %>% 
  stringr::str_squish() %>% # remove any duplicate whitespaces
  stringi::stri_replace_all_fixed(pattern = c(" ", "/", "%",  "(", ")"), 
                                  replacement = c("_", "_per_", "_percent_", "_", "_"), 
                                  vectorize_all = FALSE) %>% # itemwise vector element match for search and replacement
  stringr::str_replace_all("__", "_") %>% 
  stringr::str_replace_all("_$", "")
```

```
## [1] "Grains_percent"            "Moisture_gm_per_kg"       
## [3] "Plant_height_cm"           "White_spaces"             
## [5] "White_space_filth_percent"
```

