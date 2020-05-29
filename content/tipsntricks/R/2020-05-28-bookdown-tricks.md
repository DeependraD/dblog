---
title: Bookdown tricks
author: Deependra Dhakal
date: '2020-05-27'
draft: false
linktitle: Bookdown tricks
menu:
  R:
    parent: Random thoughts
    weight: 1
toc: true
type: docs
---

## How to make pretty note boxes ?

There are some pretty well versed tricks out there in the twitter sphere that prompted me to initiate this section about enlisting some of those.

{{% toc %}}

My first and foremost encounter was this tweet:

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">I just figured out how to include note boxes in {bookdown} documents thanks to this great tutorial from <a href="https://twitter.com/dcossyle?ref_src=twsrc%5Etfw">@dcossyle</a> <a href="https://t.co/yp2Y8YY8Yx">https://t.co/yp2Y8YY8Yx</a> 💯<a href="https://twitter.com/hashtag/Rstats?src=hash&amp;ref_src=twsrc%5Etfw">#Rstats</a> <a href="https://t.co/F9gopM37Ez">pic.twitter.com/F9gopM37Ez</a></p>&mdash; Dan Quintana (@dsquintana) <a href="https://twitter.com/dsquintana/status/1263562355218284544?ref_src=twsrc%5Etfw">May 21, 2020</a></blockquote>

This feature of adding of custom > div tips (`div tips`) is satisfying for blogdown and html based bookdown projects. Its limitation of being able only to work as expected in `.Rmd` files and not in `.Rmarkdown`, `.md` and not even in xaringan.

There is a simple implementation of the css based trick in a recent post [Long way on return](url link to the post).

Here's another tweet that goes without context, but is beautiful.

{{< tweet 1266175471705886720 >}}

#### Case with hugo-academic

This came totally as a surprise to me that one must set the output format as `blogdown::html_page` with css option. The css file should reside on `static/css/` folder and images should ideally be under `static/img/`. But path reference to the style sheets may be in the format as: `/css/some_style_sheet.css`. Furthermore, the images in stylesheets should define relative path of the image file from the stylesheet location.

# Icon generator online service

1. http://aiconica.net/ 

## File paths in webstyling

https://css-tricks.com/quick-reminder-about-file-paths/

## Online character creator

https://charactercreator.org/


<blockquote class="twitter-tweet"><p lang="en" dir="ltr">in revision, i recommend the following simple experiment <a href="https://t.co/68Ydk0Z96G">pic.twitter.com/68Ydk0Z96G</a></p>&mdash; Reviewer Number 3 (@thirdreviewer) <a href="https://twitter.com/thirdreviewer/status/1265855405256736768?ref_src=twsrc%5Etfw">May 28, 2020</a></blockquote><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script> 

## Amrit gurung tweet

{{< tweet 1266199762836975616 >}}

## Alert shortcode

{{% alert note %}}
A Markdown aside is useful for displaying notices, hints, or definitions to your readers.
{{% /alert %}}

{{% alert warning %}}
Here's some important information...
{{% /alert %}}

## Create a custom widget

1. Involves creation of layouts
2. Writing hugo partial templates

Best resource out there is:

1. On creating widget: https://sourcethemes.com/academic/docs/page-builder/#develop-a-new-widget
2. On template making: https://gohugo.io/templates/introduction/

### Webgallery: my custom widget creation project

1. The webgallery.html widget displays the section content in large blue font.
