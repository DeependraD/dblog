---
date: "2020-07-01"
draft: false
linktitle: vim 1
menu:
  gitnbash:
    parent: Vim
    weight: 1
title: "Vim : Lesson 1"
toc: true
type: docs
weight: 1
tags: ['gnu', 'vim']
---

### Highlight search matches

### To enable search match highlighting:

`:set hlsearch` or `:hls`

### To disable search match highlighting:

`:nohlsearch` or 
`:nohls` or 
`:set hohlsearch` to completely turn it off during session

### To search and replace some strings use following:

1. `:%s/==.*/ `
  - `%s` searches for the string in all lines, not only in the current line.
  - `/` performs forward search. `?` should perform a backward search.
  - `==.*` is the search pattern where any string with any number of characters preceded by "==" will be matched.
  - `/ ` (notice there is a space char) specifies that match be replaced by " "(a space).

2. `:%s/==.*//d`

### To resize the current windows size

  - CTRL+W+-    ; This will decrease the window size
  - CTRL+SHIFT++    ; This will increase the window size
