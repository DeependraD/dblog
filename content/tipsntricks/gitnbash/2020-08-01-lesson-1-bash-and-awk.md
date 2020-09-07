---
date: "2020-07-01"
draft: false
linktitle: bash and awk
menu:
  gitnbash:
    parent: Bash
    weight: 1
title: Bash and Awk
toc: true
type: docs
weight: 1
tags: ['command', 'gnu']
---

Use the following command to search for "blocking" characters inside one/more pdf file/s containing character "Statistical" line by line with stated arguments.

```
pdfgrep -Hin -C 120 "blocking" "$(ls | grep "Statistical.*")"
```

Someone advised me to use the following to refer to relative path while addressing the filename issue, but, unfortunate me, it doesn't work.

```
# First create a variable
selfie="$(ls -d ./*.* | grep "3[0-9]")"

#This does just the same as does the above one
selfie="$(ls -d .$pwd/*.* | grep "3[0-9]")"
selfie="$(ls -1 -d .$pwd/*.* | grep "3[0-9]")"

# Then use the following command at the desired search directory
pdfgrep -Hin -C 120 "statistical" $selfie
```

For files not starting with "-" hyphen the code works just fine but for others, Only by passing directly the filename with relative path prepended will result in the search, such as the one below. Otherwise, Passing the variable created with a list of names obtained after grepping for files, some of which containing "-", will break down, parsing the "-" as the argument operator.

```
# For instance, This works just fine
pdfgrep -Hin -C 120 "statistical" "./-Plant Breeding Reviews, Volume 33-Wiley-Blackwell (2010).pdf"
```

The following command is useful to get absolute paths for the searched files with name containing, for example, '29'.

```
readlink -f -- ./-* | grep "29"
```

Then it could be passed to a pdfgrep command for search, as follows.

```
pdfgrep -Hin -C 120 "vector" "$(readlink -f -- ./-* | grep "29")"
```

We can view all the currently running processes using the ps command

```
ps aux
```

Now one can grep it and show the specific process by the name

```
ps aux | grep "example_name"
```

Now since the example_name pid is listed in the output, we can copy and use it in a kill call to kill the process

```
kill -9 "example_name"
```

For a running process and the output appended to a file, the growing file can be viewed using tail commmand, for example

```
ping google.com > tmp.txt
tail -15 -f tmp.txt #in another tab/instance
```

Meanwhile, to stop the ongoing ping process and background it, issue a ctrl-z command in the terminal and

```
bg # to make the process run in background
```

- The "bg" will lead to the process be still run in and the file we targeted to append to will continue to grow.
- Using fg will bring the process in the foreground

We can see the number of lines in a file by using

```
wc -l tmp.txt #tmp.txt is the textfile name
```

We can use cut a specific log files using some delimitter and field identifiers.

```
cut tmp.txt | cut -d ":" -f1 # Here delimitter is colon and the field is to the left of the colon
cut tmp.txt | cut -d ":" -f2 # Here delimitter is colon and the field is to the right of the colon
```

Sort command can be used to sort the text lines in a provided order, for example

```
sort -u tmp.txt #If multiple lines exist with identical values they will be merged into single unique values.
```

Using the awk command we can filter the columns of our interest.

```
awk '{print $1}' tmp.txt
awk '{print $1,$2,$3}' tmp.txt #This will grab first, second and the third columns.
```

A shell script (.sh) starts with the following line:

```
#!/bin/bash
```

To view environment variables,

```
echo "The value of the home is: "
echo $HOME
```

Assign command output to a variable

```
output=$(pwd)
echo "The value of the output variable is ${output}
```
