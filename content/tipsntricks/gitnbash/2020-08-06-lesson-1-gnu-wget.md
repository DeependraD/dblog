---
date: "2020-08-06"
draft: false
linktitle: wget
menu:
  gitnbash:
    parent: Bash
    weight: 1
title: The wget command
toc: true
type: docs
weight: 1
tags: ['command', 'gnu']
---

## Bulk download using wget 

The other day, I had to make a bulk download of pdf files. This was most easily accomplished using wget command.

```
wget -P ~/ddhakal/ https://epaper.ekantipur.com/kathmandupost/download/2019-06-{10..30}
```

Here,

- `-P`: provides directory prefix for the downloaded file.
- {10..30}: in shell generates a sequence of numbers starting from 10 to 30 with an increment of 1.

For more on gnu `wget` refer to the online man page: https://www.gnu.org/software/wget/manual/wget.html
