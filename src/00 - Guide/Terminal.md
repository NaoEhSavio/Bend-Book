# Terminal

The exploration is not terminating, we are just getting started.

If you already know how to work with terminals, skip to the [Installation](./Installation.md) step.

## What is a Terminal

A terminal can be described as an interface for users to communicate with the computer.

They are our command-line interface, a place where we type commands and the computer process it.

You can customize your terminal the way you want and feel most comfortable with.

Command-lines in a terminal follow a "left to right" hierarchy, the left side always come first and the computer interprets them in this order.

Before explaining terminal commands to you, there is a very important command that you need to understand, the sudo command. sudo is the abbreviation of "super user do" that, when used, allows a user to get privileges of another user (usually the super user) to securely perform specific tasks within the system in a administrator controllable manner. You will need to use the sudo command in a lot of cases.

## Terminal Commands

When double clicking a folder in order to open it, your computer basically understand and does the `cd folder` command; the same happens when renaming a file, the computer will understand it as using the command `mv oldfilename.bend` `newfilename.bend`.

The terminal is simply a command line where you type those commands directly to your computer. As this is extensively used in this guide book, it is recommended that you get familiar with this by playing with the commands below (just be careful with some of them, like `rm`).

For now, let's take a look at a few of the most used terminal commands. Even though everything that is used in this guide will be explained, if you want to dive deeper into terminal commands, look up to this this [link](https://www.git-tower.com/blog/command-line-cheat-sheet/).

### List of Commands

```md
cd
ls
mkdir
rm
mv
touch
clear
```

#### Directory related commands

- The command `cd` stands for "Change Directory", and it navigates through them.

| Command &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | Description |
| :- | :------------- |
| `cd` | `Home`: Goes back to your base folder (main folder).|
| `cd ..`  | `Back`: Moves to the previous folder. |
| `cd 'folderName'` | `Through Files`: Will take you to that folder specified. |

- The command `ls` stands for "List Files", and lists the content of the current folder.

| Command &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | Description |
| :- | :------------- |
| `ls` | `Listing`: Will show you a list of the files and folders </br> in the current folder that you are in.|
| `ls -la` | `Deeper Listing`: Will show a more detailed version of </br> the ls command, with it's hidden files or folders. |

- The command `mkdir` , that stands for "Make Directory", creates a new folder.

| Command &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | Description |
| :--| :------------- |
| `mkdir folderName` |`Creating`: Works by creating a folder with the specified</br>  name. For example:</br>`mkdir exampleFolder` creates it with the name </br> "exampleFolder"|

#### File related commands

- The command rm stands for "Remove", and removes the specified file or folder.

| Command  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | Description |
| :-------------------- | :------------- |
| `rm fileName` | `Removing Files`: Removes the file specified in it.|
| `rm -r folderName` | `Removing Folders`: Removes a folder in the same way </br> as  mkdir creates it, you need to specify which </br> folder you want to remove.|

-
  - *This command is **VERY DANGEROUS!** If possible, **DO NOT USE IT**, there are a lot of memes on the internet from people using rm to delete important folders. Avoid everything that has the rm command on internet, otherwise, use it by your own discretion and responsibility!*

- The command `mv`stands for "Move", and has two functionalities, to move and rename files or folders.

| Command | Description |
| :-------------------- | :------------- |
| `mv fileName /folderName` | `Moving things`: Using command moves the fileName </br> file to the folderName folder. In order for this command</br> to work, it is needed to write the file name </br> followed by the name of the directory that you want to</br> send the file to. For example: </br>`mv bendFile.bend /newDirectory` to move a file to a </br>  folder inside the current folder.</br>`mv bendFile.bend ../folderName`  to take a file to a </br> folder in a previous folder by using "../" before the name </br>of the folder. |
| `mv oldFileName newFileName` | `Renaming things`: The command changes the name of a </br> file or folder to the name specified in the second </br> parameter. For example:</br>`mv oldName.bend newName.bend` to rename a file from </br> "oldName.bend" to "newName.bend".</br>`mv oldbendFolder newbendFolder` to rename a folder </br> from "oldbendFolder" to "newbendFolder".|

- The command touch can do a couple of complicated things, such as update file access and it's modification time. But, right now we are only gonna use it to create new files.

| Command  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | Description |
| :-------------------- | :------------- |
| `touch` | `Creating Flies`: The command creates (if this file do </br> not exists yet) a new file. For example:</br> `touch newfile.bend` will create a .bend file with the </br> specified  name.|

#### Output related command

- The command clear will clear your command line.

| Command  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | Description |
| :-------------------- | :------------- |
| `clear` | `Cleaning up the mess`: The command will clear the </br>command line window. Use it when your terminal is </br>just a giant text wall and you will have a fresh new </br>terminal. It's very refreshing,</br> trust me!.|

The command will clear the command line window. Use it when your terminal is just a giant text wall and you will have a fresh new terminal. It's very refreshing, trust me!

With this basic commands, proceed to the [Bend Installation](./Installation.md), as we are using the terminal to do so. If you already have bend installed in your computer, proceed to the section [Text Editors](./IDE.md).
