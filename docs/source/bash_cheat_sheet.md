# Bash and Docker Cheat Sheets

## Docker Cheat Sheet

While the tutorial utilizes docker to provide portability and setup simplicity, we have attempted to develop it such that the amount of docker commands is as small as possible.  Below you can find the necessary docker commands to run the tutorial.

| Command | Description |
| ------- | ----------- |
| docker compose up -d | start tutorial containers in detached mode |
| docker exec -it elm-fates /bin/bash | enter elm-fates container shell |
| docker compose down | teardown the tutorial containers |

We also provide a helper script to start the jupyter lab container in your default web browser: `launch_jupyter`.  You will find windows and linux versions of the script, differentiated by the file extension (i.e. `.sh` and `.bat` for linux/mac and windows respectively)

## Bash Cheat Sheet

We have tried to keep shell scripting to a minimum during the tutorial, but some use of terminal
and bash commands is necessary to demonstrate FATES workflows. Below we provide a very brief
introduction to some terms we might use during the tutorial, and a description of some basic
bash commands.

*Shell* - a shell is a command line interpreter that provides a way for a user to interface with the
operating system, typically through commands typed into a terminal. There are different types of shells.

*Bash shell* - a specific type of shell. 

*Shell script* - a generic term for a script that is executed by a shell.

*Bash script* - a script that is executed by a bash shell. Typically starts with #!/bin/bash

*Terminal* - a terminal emulator allows users to access the shell.



Some basic bash commands you will need during the tutorial  are shown below.

| Command | Description |
| ------- | ----------- |
| pwd     | print the working directory i.e. where are you in the file tree |
| ls      | list all the files and directories in the current directory |
| cd      | change directory  a) cd/... to back up one directory, b)  cd to go to the home directory c) cd filepath to go to a specific location |
| mkdir   | make a new directory |
| cp      | copy a file to a new location add -R flag for directories - example is cp foo.txt /newfilepath/ |
| mv      | move a file to a new location or rename a file |
| rm      | remove a  file - warning this is permanent and there are no checks |
| touch   | create a file e.g. touch foo.txt |
| cat     | print the contents of a file e.g. cat foo.txt  |
| head    | print the top 10 lines of a file e.g. head foo.txt |
| tail    | print the last 10 lines of a file e.g.tail foo.txt | 
| man     | look at the manual / help file for a command |

There are many more exhaustive cheat sheets online should you need them. 
