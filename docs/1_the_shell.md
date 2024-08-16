---
title: 1. The Shell 
layout: page
nav_order: 1
parent: Day 1
updateDate: 2024-07-10
---

# {{ page.title }}
---

## What is "the shell"?

- Most of us interact with computers day-to-day via **graphical user interfaces**
    - Windows with file contents we navigate with a mouse

- To automate common research tasks, interact with computers through **a shell** (sometimes called the command line)
    - In this class and in almost all research/industry environments, we use a Unix (Linux/Mac) shell (Windows has a shell too, but it's not used much)

- The shell allows you to interact with your computer via text commands

- You can also write scripts that automate those interactions

## Accessing the shell

- **Mac users:** access the shell through the *Terminal* app

- **Windows users:** have to install third-party software to use the “right” shell
    - We recommend using an app called [MobaXterm](https://mobaxterm.mobatek.net/) (click the link and follow instructions to install)

- **Linux users:** depending on your specific OS, should be an app called “Shell” or something similar

*Take 3 minutes to (install and) be sure you can open a terminal*

## The command line and working directory

- When you first open the terminal, you should see something like this:

```bash
machine_name:~$
```

- The command line prompt above contains the following components:
    - `machine_name` is the name of the computer you're using
    - `~` is your current *working directory*
    - the blank space after the `$` is the command prompt

- For now, focus on **working directory:** where programs you run through the shell will "operate from"
    - Like opening a file browser window to a particular folder, but also a reference point for programs that read and/or manipulate files