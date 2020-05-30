---
title: Setting up stage
author: Deependra Dhakal
date: '2020-05-27'
draft: false
linktitle: Setting up stage
menu:
  generaltips:
    parent: General Tips
    weight: 1
toc: true
type: docs
---

## List of packages and environment I need to at disposal

- Ubuntu

### System steup: Installing a new Ubuntu distro

- [Self notes by Steven V Miller](http://svmiller.com/blog/2019/07/notes-to-self-new-linux-installation-r-ubuntu/). SV Miller is a political science professor at clemson university. He has a regularly updated repertoire of blog posts, including those that [instruct student writers](http://svmiller.com/blog/2015/06/dos-and-donts-of-writing-for-students/). As it could be glened from his self note blog posts, he is an avid user of Linux, R and Latex.

---

- git (if not already installed, for windows)
- R
- Rstudio
- Miniconda
- Vim
- Notepad++
- Jupyter with miniconda in base environment
- Python
- pip
- youtube-dl
- Sagemath in miniconda environment

### Install Sagemath under miniconda

- Download script for miniconda installation for your distro then run the scrit

---

## R environment and surrounding setup

- Pandoc (Rstudio comes readybuilt with it.)
- Tinytex

### Installing TinyTex 

- Install it as normal user from R tinytex::install_tinytex()
- Use scheme-full to download all collection of latex packages (dont worry for download interruption because installation resumes where it was left before interruption)

---

- Rtools (for windows)
- tidyverse, tidymodels, tidytext
- pdftools
- gt
- ggdag
- OpenJDK

## Formatting and programming tips
For basic publication (all formats including latex and html)

- [Pandoc's github repo with templates](https://github.com/jgm/pandoc-templates)
