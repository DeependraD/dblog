---
title: Search and find text in windows command line
author: Deependra Dhakal
date: '2018-12-15'
slug: search-and-find-text-in-windows-command-line
categories:
  - productivity
  - batch
tags: []
header:
  caption: ''
  image: ''
---

## Background

When one has a large text file to sift through, windows command line executables might come to rescue. To illustrate usefulness of some of these tools. I have build herein an example case where you require finding a line with search certain search pattern.

### Case

1. Let us use output of another command and redirect the stdout to a file. Firstly, it is a good idea to `cd /d` into the path of interest. Here the output contains listing of all python packages installed the specified environment. With `>` pipe, we redirect the text output to a file.

```
conda list -n environment_name > path\to\directory\text_file.txt
```

2. Then using `findstr` command search for required pattern. It supports wide variety of search types. First one uses regex pattern search. Now one can check if specific package is installed or not using the this command with the output file above. 

```
findstr /R  "regex_pattern" path\to\directory\text_file.txt
```

3. Search types available in `findstr` can be glanced at using `help findstr`. For sake of simplicity, some of these are:

  - `/B` : Matches pattern if at beginning of line
  - `/E` : Matches pattern if at end of line
  - `/L` : Uses search string literally
  - `/S` : Searches for matching files in current directory and all subdirectories
  - `/I` : Search is not case-sensitive
