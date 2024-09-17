---
title: 1. Introduction to The Shell 
layout: page
nav_order: 1
parent: Beginner Shell
updateDate: 2024-09-17
---

# {{ page.title }}
---

## What is "the shell"?

- Most of us interact with computers day-to-day via **graphical user interfaces**
    - Windows with file contents we navigate with a mouse.

- To automate common research tasks, interact with computers through **a shell** (sometimes called the command line).
    - In this class and in almost all research/industry environments, we use a Unix (Linux/Mac) shell (Windows has a shell too, but it's not used much).

- The shell allows you to interact with your computer via text commands.

- You can also write scripts that automate those interactions.

## Accessing the shell

- **Mac users:** access the shell through the *Terminal* app.

- **Windows users:** have to install third-party software to use the “right” shell
    - We recommend using an app called [GitBash](https://git-scm.com/download/win) (click the link and follow instructions to install either 32-bit or 64-bit version).

- **Linux users:** depending on your specific OS, should be an app called “Shell” or something similar.

*Take 3 minutes to (install and) be sure you can open a terminal.*

## The command line and working directory

- When you first open the terminal, you should see something like this:

```bash
machine_name:~$
```

- The command line prompt above contains the following components:
    - `machine_name` is the name of the computer or host you are using.
    - `~` is a shorthand for your home directory. It indicated that your current *working directory* is your home directory.
    - The `$` is the symbol indicating the command prompt, which shows that the terminal is ready to accept commands. In some systems, the prompt may vary (e.g., `#` for root users).
    - The blank space after the `$` is where you can type your command. 

- For now, focus on **working directory:** where programs you run through the shell will "operate from"
    - Like opening a file browser window to a particular folder, but also a reference point for programs that read and/or manipulate files.
