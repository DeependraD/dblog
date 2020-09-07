---
date: "2020-07-01"
draft: false
linktitle: Cylinder
menu:
  gitnbash:
    parent: Imagemagick
    weight: 1
title: Cylinder
toc: true
type: docs
weight: 1
tags: ['draw', 'imagemagick']
---

```
#!usr/bin/env bash
# To create a png of cylinder showing 50% fill. First you need imagemagick library installed to use "convert" function.

convert -size 320x90 canvas:none -stroke snow4 -size 1x90 -tile gradient:white-snow4 \
	  -draw 'roundrectangle 16, 5, 304, 85 20,40' +tile -fill snow \
	    -draw 'roundrectangle 264, 5, 304, 85  20,40' -tile gradient:chartreuse-green \
	      -draw 'roundrectangle 16,  5, 180, 85  20,40' -tile gradient:chartreuse1-chartreuse3 \
	        -draw 'roundrectangle 140, 5, 180, 85  20,40' +tile -fill none \
		  -draw 'roundrectangle 264, 5, 304, 85 20,40' -strokewidth 2 \
		    -draw 'roundrectangle 16, 5, 304, 85 20,40' \( +clone -background snow4 \
		      -shadow 80x3+3+3 \) +swap -background none -layers merge \( +size -font Helvetica \
		        -pointsize 90 -strokewidth 1 -fill red label:'50 %' -trim +repage \( +clone \
			  -background firebrick3 -shadow 80x3+3+3 \) +swap -background none -layers merge \) \
			    -insert 0 -gravity center -append -background white -gravity center -extent 320x200 \
			      cylinder_shaded.png
```
