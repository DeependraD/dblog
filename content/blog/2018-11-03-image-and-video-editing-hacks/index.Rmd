---
title: Image and video editing hacks using ffmpeg
author: Deependra Dhakal
date: '2018-11-03'
slug: image-and-video-editing-hacks
categories:
  - "image editing"
tags: []
header:
  caption: ''
  image: ''
---

# Compose a slideshow

This is beginner's tutorial for starting up with open source [ffmpeg](https://www.ffmpeg.org/) library.

In the beginning, it's shown how we can convert an image gallery to a video slideshow. For example we have a directory called `images` filled with photos that we want to knit together to obtain a slideshow. A video, however, has an additional time/length attribute besides the attribute that controls which order the images are sawn together in. Along with these, several other features underlie a video composition, some of which will be discussed in this tutorial.    

In an ideal scenario we start off at the directory of images (`images`). 

In windows machine,

```
cd images\
```
In `r` interface

```
setwd("./images/")
```

Now before stitching images together, we need to specify the order in which that will be done. File name plays a role in that. For the sake of easiness, we ignore a situation where filename alphabets specify the order. Let's assume that, ordering is specified by numerics; i.e. 1, 2, 3, ... n. 

Talking about an actual case scenario, most modern digital cameras produce well named image files, like IMG_01.\*, or IMG_002\*. An `r` code to list all the files in the current directory is shown below.

```
filenames <- list.files(".", ".JPG")
```
The command saves the list of filenames in the ascending order of alphanumerics that appear in the filename prefix. This is important step in order to also ensure that original filename can be recovered after tampering with the names. Filenames might come in all sorts of peculiar name formats -- some even devoid of any. Nevertheless, it is always desirable that the original filenames are renamed to correctly represent an ordered file presentation.

This could be done by a creating a vector equal to the length of files (`len(filenames)`).

```
chfilenames <- paste("IMG_", sprintf("%03d", seq_along(filenames)), ".JPG", sep = "")
stringr::str_pad(seq_along(filenames), width = 3, pad = "0") # this also pads "0" in numbers
```

Now just replace the original file-names with new, order specified file-names using low level `R` function.

```
file.rename(from = chfilenames, to = chfilenames)
```

Finally to weave a video use ffmpeg. Note that ffmpeg should be added to path for calling from shell (`cmd`) readily.

```
ffmpeg.exe -y -framerate 1/2 -start_number 1 -i "IMG_%03d.JPG" -c:v libx264 -pix_fmt yuv420p -s:v 1280x720 output_filename.mp4
```

- -framerate in fraction represents 2 seconds per frame

- -y: to overwrite existing file

- -f: to force any operation

- image2pipe: plugin that allows to pipe input; while passing input use "-i -" in the command syntax

- -s 1280x720: scale the images

- -qscale is a way to set quality, but -qscale alone is ambiguous. Use -qscale:v for video and -qscale:a for audio encoders that support it. Don't use this option unless you know what it means.

- x264 has a better option for setting quality: -crf. The Constant Rate Factor is a constant quality encoding mode. Lower values mean better quality, but anything below 18 might not be visually better. The default is 23, but something like 20 would be better since YouTube re-encodes your video again.

- -pix_fmt yuv420p should be used to enable 4:2:0 downsampling for the PNG input, which usually isn't downsampled at all (4:4:4, as observed in your output) and often contains an Alpha channel. YouTube won't handle this correctly.

- -r is for -rate; it is specification of output frame rate in Hz.

- -r is not needed for setting the output framerate, as YouTube will handle almost all frame rates anyway. When reading 10 images per second as input, changing the output frame rate to something higher (e.g. 30) will only duplicate frames, which is not necessary.

- Generally, unconventional resolutions like `-s:v 1380x720` are avoided. Think about using the native 16:9 (720p resolution; 1280 x 720) and regenerating your plots if necessary. This will save from troubles mainly relating to letterboxing on YouTube, and sticking to unusual dimensions might prevent your video from being shown in full resolution or offered at 720p quality settings.

- Use the MP4 container instead of MOV, which YouTube suggests you to use. MP4 is virtually identical in functionality to MOV, but has better support in playback devices. In general, prefer that over MOV when you can.

# Video format conversion

Besides these, converting videos back and forth between formats is really easy either. For example, an easy way to convert high compression mkv format to mp4 so that most decoder could play the video can be accomplished by the following.

```
ffmpeg -i inputfilename.mkv outputfilename.mp4
```

# Muxing streams

Often times, we may have isolated streams of audio and videos; For example, only video stream may be extracted from a stream with noisy voice recordings in the background and we may desire to add in some music or alikes. So, the easiest way to do that would be:

```
# Following command uses both the streams to mux together into a media format

ffmpeg -i "input_audio.mp3" -i input_video.mp4 -vcodec copy -acodec copy -shortest output_format.mp4
```
Note that the length of output media is equal to the duration of the shortest stream specified by `-shortest` flag. 

# Batch conversion of videos using Rstudio and its shell interface

Firstly, load the following libraries.

```
require(tidyverse)
require(glue)
```

Then specify the input filenames, and output filenames alike through extension pattern substitution. `purrr` and `stringr` libraries come to the rescue.

```
# input filename
iflist <- map(c(".mkv", ".webm"), 
              ~list.files(path = ".", 
                          recursive = T, pattern = .x, full.names = TRUE)) %>% 
  unlist()

# output filename
oflist <- str_replace_all(iflist, "\\.\\w*$", ".mp4")
```

Now, get the batch script run at once. All three lines, for example as in the code below may selected and ran, if there are three media files of interest.

```
# glue function demo
glue("I love {iflist[1]} and hate {oflist[1]}")
# call CMD shell for conversion from R
# shell(cmd = "ffmpeg --help")
# run all in sequence and not in a single statement

shell(cmd = glue('ffmpeg -i "{iflist[1]}" "{oflist[1]}"'))
shell(cmd = glue('ffmpeg -i "{iflist[2]}" "{oflist[2]}"'))
shell(cmd = glue('ffmpeg -i "{iflist[3]}" "{oflist[3]}"'))
```

This is all for now. Enjoy media editing with open source tools.
