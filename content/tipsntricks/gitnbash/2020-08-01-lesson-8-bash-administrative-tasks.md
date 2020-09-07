---
date: "2020-07-01"
draft: false
linktitle: bash administration
menu:
  gitnbash:
    parent: Bash
    weight: 1
title: Bash administration
toc: true
type: docs
weight: 1
tags: ['find', 'gnu']
---

Way to know executable name for an application to launch it in terminal.

1. If you know the name of the program, Try on the command line:

```
find /usr -name 'ipython'
```

2.1 To list all the running process with their PIDs

```
ps -e
```

2.2 Start the program which you are intended to know the name for
2.3 Switch to the terminal and retype command as in 2.1
2.4 Then on command line for the candidate "name_of_the_processes"

```
man name_of_the_process
```

or

```
info name_of_the_process
```

or

```
name_of_the_process -h
```

In order to get PID of a process use the following command and click on the window.

```
xprop | grep PID
```

Then use following to get further info

```
ps aux | grep <PID># without greater/less than sign.
```

To create a bootable kali linux usb device, where name argument for iso file should match with the actual file name to be used. The command should be run from the directory where the file is located by changing directory by "cd" command.

```
dd if=kali-linux-2016.1-amd64.iso of=/dev/sdb bs=512k
```

The alias command fixes the ls parameters. For example type following to see that the color output of ls command is fixed to auto.

```
alias ls
```

To not use default alias in ls. This uses the ls command without the alias

```
\ls
```

Another way to achieve the same is by unaliasing the ls command

```
unalias ls
ls
```

To put back the alias in ls

```
alias ls ls --color=auto
ls
```

A lot of commands in linux are aliases for the other commands(generally modified) so to know which alias is used when we actually enter command use:

```
which ls
```

A long listing version of ls command is:

```
ls -l
```

A long listing version of with all file and folder view can be executed as:

```
ls -al
```

First column contains the user privilages to files/folders for several user ids. To see the different ids use:

```
id
```

To see the files separated by comma use:

```
ls -m
```

To reverse the file listing order use

```
ls -r
```

To use special character to designate the list elements. For e.g. * is used for executable files and / is used for directories

```
ls -F
```

Following command shows ordered list of files/folders sorted by date, most recently modified being shown at last

```
ls -lrt
```

To recurse inside the current list of directories

```
ls -lRt
```

Inside a directory, lists all the files with exe extension

```
ls -aF --file-type *exe
```

"I" nodes for individual files, which is unique to each one of them, can be viewed by:

```
ls -li
```

To link two files use ln command.

```
ln original_file_name link_file_name
```

Now see how node for the individual file shows. It shows that those two files(original and the link files) are identical

```
ls -li
```

The mentioned above node is an example of hard node. A soft node can be created as follows. Use the following command to see the type of file soft node creates

```
ln -s Original_file_name Soft_link_file_name
ls -li
```

To view the contents of a file

```
cat "Desktop/Updating and Basics"
```

To view detailed list of files in current dir

```
ls -l
```

To view all files including system/hidden files

```
ls -a
```

```
To view all files including system/hidden files in detailed view
ls -l -a
```

To clear screen

```
clear
```

To change the current working directory

```
cd Desktop
```

To create a directory(in current directory)

```
mkdir Random_Dir
```

To remove a directory(in current directory)

```
rmdir Random_Dir
```

To create a file in current directory (Does not work if the name is already existing in the directory)

```
touch Name_of_File
```

To copy a existing file

```
cp Name_of_File Name_of_File2
cp "Updating and Basics" "Updating and Basics_playable"
```

To emulate renaming (Moving a file in the same directory with a different target name)

```
mv Name_of_File New_nameoffile
```

To search a file for a word

```
grep emulate "Updating and Basics_playable"
```

To compare two files

```
diff "Updating and Basics" "Updating and Basics_playable"
```

To change the current password of the user

```
passwd
```

To create a variable

```
Name=Deependra
```

To display output in terminal

```
echo hey Deependra!
```

To display the contents of a variable

```
echo $Name
```

To see the help/info

```
info echo
```

To turn the display off after 1 second:

```
sleep 1 && xset -display :0.0 dpms force off
```

To execute an executable on a current directory.

```
./executable_name
```

To open a file or a directory with suitable application use. For example to open the current directory (Home for the user). This may be supplemented by sudo command to provide root access.

```
gnome-open ./
```

Also default file manager can be launched in a given in a indicated folder with following command. For example to open desktop directory:

```
nautilus --browser ./Desktop
```

You can upgrade smoothly through LTS releases whether it's Server or Desktop. # It doesn't matter what you use, you just need to use these commands. For desktop dersion,

```
sudo do-release-upgrade
```

For server version,

```
sudo apt-get install update-manager-core
sudo do-release-upgrade
```

In order to upgrade the whole distribution use:

```
sudo apt-get dist-upgrade
```

To turn the display off after 1 second,

```
sleep 1 && xset -display :0.0 dpms force off
```
