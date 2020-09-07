---
date: "2020-07-01"
draft: false
linktitle: find
menu:
  gitnbash:
    parent: Bash
    weight: 1
title: Find by doing
toc: true
type: docs
weight: 1
tags: ['find', 'gnu']
---

Using find command is very handy to find any sort of file or a directory.

1. At the very basics,

```
find . # find all the files and directories at the starting at current directory and below.
find # same as above
find . -print # same as above
find -print # same as above
```

2.

```
find / -name abc # find any file/s or dir/s starting at root directory.
```

3.

```
find . -type d -name abc
find . -type f -name "abc.txt"
find . -type f -name "*.txt"
```

4.

```
find /home/deependra/Desktop -type f -name abc # find a file called abc in Desktop directory
find /home/deependra/Desktop -type f -iname abc # this is same as above with alteration of name search as case insensitive. 
```

5. In the "1755", 7 indicates that the owner has all (4(read) + 2(write) + 1(execute) = 7) permissions, 5 indicates that group has (4 + 1 = 5) read and execute permissions only, and latter 5 indicates that others have (4 + 1 = 5) read and execute permissions only either.

```
find / -perm 1755 
```

6.

```
find . -type f -perm /g=s
find . -type f -perm /o=t # sticky bit permission (only owner can delete, copy or move the contents of the given directory or a file).
```

7.

```
find . -perm /u=s # to give a list of contents in which suid is set.
find . -perm /g=s # to give a list of contents in which a group is set.
find . -perm /a=x # to give a list of all executable files
find . -perm /u=r # to give a list of read only files.
```

8.

```
find . -type f -perm 0777 -exec chmod 755{} \; # this will change the permission to 755.
find . -type f -perm 0777 -print0|xargs -0 chmod 755 # same as above but more efficient.
```

9.

```
find . -type f -iname "abc.txt" -exec rm -f {} \; # this will find and remove single file
find . -type f -iname "*.log" -print0|xargs -0 rm -f # same as above
```

10.

```
find . -type f -empty # this will find all the empty files
```

11.

```
find . -type f -name ".*" # this will find all the hidden files
```

12.

```
find . -mtime 10 # contents that were modified exactly 10 days ago.
find . -atime 10 # contents that were accessed exactly 10 days ago.
find . -mtime +10 -mtime -20 # contents that were modified more than ten days ago but less than 20 days ago.
find . -type f -cmin +1 -cmin -5 # files that were changed more than one minutes ago but less than five minutes ago.

watch "find . -cmin -5" # this will keep executing the command inside quotes every two seconds and thus constantly show, in this case, the contents that were modified less than five minutes agoconstantly.
```

13.

```
find . -user root -name "abc.txt" # find the file abc.txt with the root user.
```

14.

```
find . -size -1M # find files that are less than one MB.
find . -size +1M -size -10M # find files that are more than one MB and less than 10 MB.
```

15.

```
# If error is shown while searching such as, No such file or directory...
# then redirect the command to dev/null in a way as shown below:
find . -size +1M -size -3M 2>>/dev/null
```

16.

```
find . -maxdepth 3 -name "*log" # go as far as three subdirectories below the specified search path.
find . -type f -not-name "*.html" # find the files that do not match the specified file name pattern.
```

17.

```
find . -maxdepth 4 -name "*.txt" -exec grep -i "Gene" {} \; # perform the find and pass the files to grep command for search of given pattern "gene".

find . -maxdepth 4 -name "*.txt" -exec grep -i "Gene" {} \+ # perform the find and pass the files to grep command for search of given pattern "gene" more efficiently.
```

18.

```
find .\( -name a.out -o -name '*.o' -o -name 'core'\) -exec rm{} \; # Here, -o is the binary operator "OR".
```

19.

```
find . -size +1G -mtime +300 -exec rm -rf {}; # find and remove the files that are not modified since past 10 months and are above 1GB in size.
```

20.

```
find . -type f -mtime 0 -iname '*.mp3' # find the audio files downloaded today.
```

21.

```
find . -nouser -o -nogroup # find files without a user or group.
```
