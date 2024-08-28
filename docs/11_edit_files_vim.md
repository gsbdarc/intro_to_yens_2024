---
title: 11. Editing Files on the Command Line
layout: page
nav_order: 11
updateDate: 2024-08-16
---

# {{ page.title }}
---

- Sometimes, you'll need to edit files directly in the shell; a popular program to do so is called **Vim**

- Vim (and other shell-based text editors) are powerful, but take time getting used to; don’t worry, you can always use Jupyter Editor. 
    - It's good to use Vim for now to keep getting used to the shell

- To create a new file and open it with Vim, use the command `vim` with a path to a file that doesn't yet exist passed as an argument:

```bash
SUNetID@yen4:~$ vim input.txt
```

- You can open an existing file by using `vim` with a path to a file that already exists passed as an argument

- Because the shell is text-based, Vim is controlled completely via the keyboard
    - With practice, not moving between the mouse and keyboard makes editing a lot faster 

- Vim is a *modal editor*, meaning it has different modes for different ways of manipulating file contents; today, we’ll focus just on two modes:
    - **Command mode** is the default mode; it is for moving around a file and making edits (e.g. deleting words/lines); you can always press `<ESC>` (the escape key) to go to Command mode
    - **Insert mode** is for (surprise, surprise) inserting new text; enter Insert mode by pressing `i` when in Command mode (should see `–INSERT–` at the bottom of the terminal if in Insert mode)
- In either mode, you can move the cursor around using the arrow keys

- The file `input.txt` you just created should be empty; press `i` to enter Insert mode, and then type `Hello, world!`

- When you're done typing, go from Insert mode back to Command mode (press `<ESC>`)

- Once you're in Command mode, press `:` to signal that you’re going to enter a Vim command
    - There are many other powerful commands to move around files (e.g. moving cursor word by word instead of character by character) and modify text (e.g. deleting whole words) more quickly, but we don’t have time to cover them
    - To learn more, see [here](https://missing.csail.mit.edu/2020/editors/) for concise but more in-depth coverage of Vim’s features, and [here](https://drive.google.com/file/d/1sBbdrk_UcfX_tfy1jgxBaomwhDWKli2T/view?usp=sharing) for a cheat sheet

- Then type `w` to write your current edits to the file and/or `q` to close the file and quit Vim; press `<ENTER>` (the enter key) to execute; in summary:
    - `:w<ENTER>` writes your current edits to the file but keeps Vim open
    - `:q<ENTER>` closes the file and quits Vim without saving your current edits. Vim will complain. Can overwrite with `:q!`
    - `:wq<ENTER>` writes your current edits to the file, closes it, and then quits Vim
