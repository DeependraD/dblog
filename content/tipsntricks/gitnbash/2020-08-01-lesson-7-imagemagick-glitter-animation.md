---
date: "2020-07-01"
draft: false
linktitle: Animation
menu:
  gitnbash:
    parent: Imagemagick
    weight: 1
title: Animation composition
toc: true
type: docs
weight: 1
tags: ['find', 'gnu']
---

```
#!usr/bin/bash

msg() {
		printf "\033[1;32m :: %s\n\033[0m" "$1"
	}

printf "\033[6;46mName: %s\nSurname: %s\n\033[0m" "Deependra" "Dhakal"

msg "Creating glitter..."
```

The layers composition methods makes it a lot easier to generate simple animations, such as glitter.

First we need some glitter that is large enough to cover the image being processed. Here, in this example, we generate three image glitter animation from some random specks images.

Initially, a raw black and white glitter on pure transparency, generating 3 frames of glitter by separating the three color channels into black and white channel images will be created. It is basically a raw starting point for generating any other type of glitter. The '30%' threshold controls how many 'dots' there are per frame. The script follows:

```
convert -size 400x400 xc: +noise Random -separate \
	null: \( xc: +noise Random -separate -threshold 25% -negate \) \
	-compose CopyOpacity -layers composite \
	-set dispose background -set delay 20 -loop 0 glitter_overlay.gif
```

From this 'raw' glitter one can overlay it using a 'Screen' alpha composition to only brighten some color, to generate a glitter of a specific color. Here we use the Border Flatten Method. Just a plain color...

```
msg "Adding colors..."

convert glitter_overlay.gif \
	-compose Screen -bordercolor GoldenRod -border 0x0 glitter_gold.gif
```

Using the layer composition, one can also use a single image, or even multiple images to provide a variable colored background. For example here we have generated three Fractal Plasma images, to provide a slightly randomised coloring to the glitter pattern.

```
convert glitter_overlay.gif null: -size 400x400 \
	plasma:red-firebrick plasma:red-firebrick plasma:red-firebrick \
	-compose Screen -layers composite glitter_plasma.gif
```

To apply a glitter like this to an image, there are a number of different methods. Typically you mask the glitter to a specific shape and or background. For this can either use a transparent shape (composited using DstIn).


```
msg "Creating transparent mask..."

convert -size 400x400 -fill white -background none -font "Times-New-Roman-Bold" -gravity center -pointsize 120 label:"Sangita" glitter_mask_trans.gif

convert glitter_plama.gif null: glitter_mask_trans.gif -matte \
	-compose DstIn -layers composite glitter_masked_trans.gif
```

Or a black and white mask image (composited using CopyOpacity)

```
msg "Creating a black and white mask..."
convert -size 400x400 -fill white -background black -font "Times-New-Roman-Bold" \
	-gravity center -pointsize 120 label:"Sangita" glitter_mask.gif

convert glitter_plasma.gif null: glitter_mask.gif +matte \
	-compose CopyOpacity -layers composite glitter_masked.gif
```

Ok since we have a area that has been masked, we can now complete the image, generally by overlaying the masked glitter on the original image.

```
msg "Overlaying mask..."

convert glitter_masked.gif -size 400x400 \
	null: gradient:gold1-gold4 -compose DstOver -layers composite \
	null: \( -fill none -background none -stroke white -strokewidth 2 \
	-font "Times-New-Roman-Bold" -gravity center -pointsize 120 label:"Sangita" \) \
	-compose over -layers composite glittered_letter.gif
```

This last example also cleaned up any GIF transparency problems by the removal of all transparency from the final image and the overlay of a smooth border around the glittered region.

```
msg "Rendering animation complete."
```
