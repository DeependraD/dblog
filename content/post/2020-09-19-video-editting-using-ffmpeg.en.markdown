---
title: Video editting using ffmpeg
author: Deependra Dhakal
date: '2020-09-19'
slug: video-editting-using-ffmpeg
categories:
  - R
tags:
  - ffmpeg
  - r
  - shell
subtitle: ''
summary: ''
authors: []
lastmod: '2020-09-19T06:30:36+05:45'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
---

## Background

Video editing and format conversion has, up untill recently, been a subject of much domain knowledge. Open source tool [ffmpeg](https://ffmpeg.org) is so versatile a toolbox that almost any media file can be tamed to our need.

I got chance to learn more of it's feature of trimming and merging media files. This was a nice experience but considering I was working under stress of deadline of assignment on oral presentation, and working late, this was very much a pleasing experience to my health, it turned out.

## Video trimming

There are two major operation types -- one involving reencoding the other involving copy operation. Former type lets you specify custom keyframe and additionally allows file to play starting at the desired point on a player that does not support edit lists, or ensures that the cut portion is not actually in the output file (interestingly some information is still copied! in trimming process if not reencoded)^[https://stackoverflow.com/a/18449609/6725057]. Finding keyframes is also possible using ffprobe.

This is done by following call:

```
ffmpeg -ss 00:00:03 -i movie.mp4 -t 00:00:08 cut.mp4
```

Here, 

`-ss`:  Using `-ss timestart` before `-i input_file.ext`, sets the beginning of the generated video to the nearest keyframe found before your specified timestamp.

`-t`: This is the actual time period, not the end time of original video. To start at 3s and end at 8s use `-t 5`. But the recent version supports `-to` which is specification of end time.

In order to continue to the end of video omit `-t/-to`.

Next option is to just copy the stream. This is also the fastest method to achieve trimming.

```
ffmpeg -ss 00:01:00 -i input.mp4 -to 00:02:00 -c:v copy -c:a copy output.mp4

```

## Video merging

```
ffmpeg -i part1.mkv -i part2.mkv -i part3.mkv -i part4.mkv -i part5.mkv -i part6.mkv \
       -filter_complex "[0:v] [0:a] [1:v] [1:a] [2:v] [2:a] [3:v] [3:a] [4:v] [4:a] [5:v] [5:a] 
                        concat=n=6:v=1:a=1 [v] [a]" \
       -map "[v]" -map "[a]" output.mkv

```
