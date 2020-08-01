---
title: Website issues to fix
author: Deependra Dhakal
date: '2020-05-27'
draft: false
linktitle: Website issues to fix
advanced:
  css_class: ''
  css_style: 'dd-created'
menu:
  R:
    parent: Random thoughts
    weight: 1
toc: true
type: docs
---

## Issues

Monkeying around with Alison's blog repo locally lately, anybody will understand the work she does is fantastic and it is looks pretty as well.

I have some queries about her whole highly customized hugo-academic https://alison.rbind.io/ site, which some day, I wish to demystify for myself.

1. It has a css file called assets/css/alison.css. I wonder how and where this file is linked to in site pages ?
2. I intend to stylize outputs of markdown files, particularly those with docs type layout written under content/some-folder/some-document-name/some-markdown.md. Is there an yaml option to add custom stylesheet to all docs type, like the one I could add in /content/some-folder/_index.md ? Or can I add yaml option to individually link stylesheets in content/some-folder/some-document-name/some-markdown.md ?

Is there anything specific about those (https://rookie.rbind.io/tipsntricks/r/) "docs" type that could prettify them. Links to the github source are available from `Edit this page` option shown at the bottom of each page. These may be modified through adjustment of partial templates.

3. Another issue I have experienced is that hugo-academic mentions that we can refer to assets/css/some-css.css files to any documents. But I can't seem to use it in posts or docs type pages. But when you have a css under static/ it does work for rmarkdown posts, because you have a css option for blogdown::html_page(). Is it so, because https://sourcethemes.com/academic/docs/customization/#customize-style-css mentions otherwise ?

5. Lastly, I have a very awkward problem to be answered. Can I link to an external github repo which has a bunch of xaringan html slides (nested inside directories) and show a slideshow presentation on my own website. I mean, I wish to host all presentation files outside the repo and still be able to render it on my site.
