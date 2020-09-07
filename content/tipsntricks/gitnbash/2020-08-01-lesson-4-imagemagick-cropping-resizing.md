---
date: "2020-07-01"
draft: false
linktitle: Cropping and resizing
menu:
  gitnbash:
    parent: Imagemagick
    weight: 1
title: Cropping and resizing
toc: true
type: docs
weight: 1
tags: ['command', 'imagemagick']
---

## Image resizing and cropping using bash script

This script benefits from following pages:
https://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash
https://stackoverflow.com/questions/18544359/how-to-read-user-input-into-a-variable-in-bash
https://github.com/DeependraD/DeependraD.github.io/blob/sources/deploy.sh

Note: Set the English locale for the `date` command.

```
#!/usr/bin/env bash
export LC_TIME=en_US.UTF-8

msg() {
		printf "\033[1;32m :: %s\n\033[0m" "$1"
	}

msg "To run this script you must have imagemagick library installed."

msg "The input filename must not have spaces or extra dots except for the file extension. The feature allowing for space and space delimiters, such as a new line, in the file will be added soon!"

read -p "Enter fullname of input file: " inputfile

set -- "$inputfile"

IFS="."; declare -a Array=($*)
echo "You just supplied the input file name "${Array[0]}"."${Array[1]}""
read -p "Is it correct name for the image you want to play with? (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

msg "We will resize the \"inputfile.jpg\" to 40 percent its original size. Then the image is inserted into an image of extent 800pixels by 800pixels with transparent background, the final resolution being irrespective of original."

convert "${inputfile}" -resize 40%x40% -gravity center -background transparent -extent 800x800 ""${Array[0]}"1."${Array[1]}""

msg "Now check the directory for the output file \"${Array[0]}"1."${Array[1]}\"."
```
