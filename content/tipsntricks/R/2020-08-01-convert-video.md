---
date: "2020-08-01"
draft: false
linktitle: Media file conversion using ffmpeg
menu:
  R:
    parent: Random thoughts
    weight: 1
title: Media file conversion using ffmpeg
toc: true
type: docs
weight: 1
tags: ['shell', 'ffmpeg', 'r']
---

Converting back and forth between different video formats is relatively is easy with GUIs but with command line tools it much streamlined and efficient, not to say it is highly programmable.

Obtain the full location of an ffmpeg build. For example, in windows it could be:

```
"C:\\Users\\Dell\\ddhakal\\applications\\ffmpeg-20200110-3d894db-win64-static"
```

To run the conversion in R which in-turn, connects to system's shell application, save the command inside single quotes. For instance, we could convert webm video to mp4 video using following command:

```
command_list <- 'C:\\Users\\Dell\\ddhakal\\applications\\ffmpeg-4.2.1-win64-static\\bin>ffmpeg.exe -i "C:\\Users\\Dell\\ddhakal\\music\\OneRepublic, Seeb - Rich Love.webm" -c:v libx264 -crf 32 -c:a aac -b:a 256k "C:\\Users\\Dell\\ddhakal\\music\\OneRepublic, Seeb - Rich Love.mp4"'
```

Another likely case is conversion of audio stream in a media file alongside the video stream. For example, webm audio stream is converted to an mp3 here, 

```
command_list <- 'C:\\Users\\Dell\\ddhakal\\applications\\ffmpeg-4.2.1-win64-static\\bin>ffmpeg.exe -i "C:\\Users\\Dell\\ddhakal\\music\\OneRepublic, Seeb - Rich Love.webm" -c:v libx264 -crf 32 -c:a aac -b:a 256k "C:\\Users\\Dell\\ddhakal\\music\\OneRepublic, Seeb - Rich Love.mp4"'
```

Generate a full list of media files to be converted for later use with `glue` to form the list of conversion commands, separately for each files.

```
nepali_audio <- list.files("C:/Users/Dell/ddhakal/music/", pattern = ".webm", 
           full.names = T)[-1]

nepali_audio_names <- nepali_audio %>% 
  stringr::str_remove_all(".*(?=/)/")
```
