---
title: Setting up stage
author: Deependra Dhakal
date: '2020-05-27'
draft: false
linktitle: Setting up stage
menu:
  generaltips:
    parent: General Computing Tips
    weight: 1
toc: true
type: docs
---


## Installing and configuring Ubuntu distro

- For installation, follow [self notes by Steven V Miller](http://svmiller.com/blog/2019/07/notes-to-self-new-linux-installation-r-ubuntu/). SV Miller is a political science professor at clemson university. He has a regularly updated repertoire of blog posts, including those that [instruct student writers](http://svmiller.com/blog/2015/06/dos-and-donts-of-writing-for-students/). As it could be glened from his self note blog posts, he is an avid user of Linux, R and Latex.

- git (if not already installed, for windows) `sudo apt-get install git`
- tmux (`sudo apt-get install tmux`)
- zsh (`sudo apt-get install zsh`)
  - Configure z-shell with [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/) configuration.
- R (described in @r-environment-setup)
- Rstudio (described in @r-environment-setup)
- Miniconda
- Vim (`sudo apt-get install vim`)
- Notepad++
- Jupyter with miniconda in base environment
- Python3 distribution [site](https://www.python.org/downloads/)
- pip
- youtube-dl
- Sagemath in miniconda environment
- Configure dotfiles (https://github.com/deependrad/ProgrammingNotes/dotfiles/)
  - clone and paste the dotfiles directory of this repo to home
  - run `make.sh` file. It backs up existing dotfiles and copies the links for new dotfiles to home directory. Before running the `make.sh` change the permission to grant it execution rights (`chmod +x .make.sh`).
- pdfgrep (preferably expenimental)
  - With required dependencies (libpoppler-dev, libunac1-dev, ...)
- Install calibre
- Rtools (for windows)
- OpenJDK

## R environment setup

- To install R (described in https://cran.r-project.org/bin/linux/ubuntu/README.html):
	- Add secure APT 
	- Add (for xenial) entry like the one below to `/etc/apt/sources.list`. Note the sources.list file is read only, so edit it as root.

```
deb https://cloud.r-project.org/bin/linux/ubuntu xenial-cran40/
```

- To install Rstudio:
	- Install gdebi-core `sudo apt-get install gdebi-core`
	- Download the debian file available at https://rstudio.com/products/rstudio/download/#download
	- `sudo gdebi rstudio*.deb`
- Pandoc (Rstudio comes readybuilt with it). Installing latest [pandoc](https://github.com/jgm/) externally alongside is a good option.
- Tinytex
- R packages (tidyverse, tidymodels, tidyselect, bookdown, blogdown, lme4, janitor, tidytext, gt, ggdag, pdftools, forecast, ape, gganimate, tsibble, binb, xaringan, ggrepel, ggraph, bezier, tint)

## TeX distribution

- TeX distribution with tinytex (from Rstudio)
  - For installation, follow instructions at: https://yihui.org/tinytex/
- Install it as normal user from R tinytex::install_tinytex()
- Use scheme-full to download all collection of latex packages (dont worry for download interruption because installation resumes where it was left before interruption)
