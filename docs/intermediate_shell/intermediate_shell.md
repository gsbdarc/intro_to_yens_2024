---
title: Intermediate Shell
layout: page
nav_order: 1
parent: Intermediate Shell
updateDate: 2024-09-16
---

# {{ page.title }}
---
Welcome to the Intermediate Shell section! You’ve used the shell before, and now we’re going to strengthen your core skills. We’ll assume you already know how to navigate directories, manipulate files, and run basic commands. Here, we’ll focus on improving efficiency, understanding shell behavior, and using tools that will make your life easier when working on the command line.

## Topics Covered

- Navigating Efficiently with Shortcuts
- Understanding File Permissions
- Working with Input/Output Redirection
- Using Wildcards for Pattern Matching
- Introduction to File Search with `find`

---

### 1. Navigating Efficiently with Shortcuts
Mastering the shell is about working efficiently. Here are some shortcuts and tips to help you speed up your navigation:

- `cd -`: Switch back to the previous directory you were in.
- `~`: The tilde character represents your home directory, so `cd ~` takes you home.
- **Tab Completion**: Start typing a command or file name and press `Tab` to auto-complete.
- `Ctrl + r`: Search your command history. Press `Ctrl + r` and start typing part of a previous command to find it.

> **Exercise**: 
> 
> - Practice using `cd -` to switch back and forth between two directories.
> - Use tab completion to list files in a directory with a long name.

### 2. Understanding File Permissions

File permissions define who can read, write, and execute files. This is crucial when working on shared systems or remote servers like the Yens cluster.

- **Viewing permissions**: Use `ls -l` to see file permissions.
- **Changing permissions**: The `chmod` command is used to change permissions. For example:
    - `chmod 644 file.txt`: Read/write for the owner, read-only for others.
    - `chmod 755 script.sh`: Read/write/execute for the owner, and read/execute for others.

Permission Structure:
- The first character represents the type (`-` for a file, `d` for a directory).
- The next nine characters represent permissions for the owner, group, and others (e.g., `rwxr-xr-x`).

> **Exercise**: 
> 
> - List the permissions for all files in a directory using `ls -l`.
> - Create a file and experiment with changing its permissions using `chmod`.

---

### 3. Input/Output Redirection
Redirection allows you to control where your command’s output goes and where input comes from.

- **`>`**: Redirects output to a file (overwriting).
    - Example: `echo "Hello" > hello.txt`
- **`>>`**: Appends output to a file.
    - Example: `echo "Goodbye" >> hello.txt`
- **`<`**: Redirects input from a file.
    - Example: `sort < names.txt`
- **Piping (`|`)**: Sends the output of one command as input to another.
    - Example: `ls | grep ".txt"`

> **Exercise**: 
> 
> - Create a text file with multiple lines and experiment with redirecting the output of the `cat` and `sort` commands to new files.
> - Use piping to find files with a specific pattern in their names.

---


### 4. Using Wildcards for Pattern Matching

Wildcards allow you to perform operations on groups of files without typing each filename individually.

- **`*`**: Matches any number of characters.
    - Example: `rm *.txt` deletes all `.txt` files.
- **`?`**: Matches exactly one character.
    - Example: `ls file?.txt` lists files like `file1.txt`, `fileA.txt`, but not `file10.txt`.
- **`[ ]`**: Matches a range or set of characters.
    - Example: `ls file[1-3].txt` matches `file1.txt`, `file2.txt`, and `file3.txt`.

> **Exercise**: 
> 
> - Use `*` to list all `.txt` files in your home directory.
> - Try deleting or moving files using wildcards.

---

### 5. Introduction to File Search with `find`

The `find` command helps you search for files based on specific criteria, such as name, type, or modification date.

- **Find by name**: `find . -name "file.txt"`
- **Find by type**: `find . -type d` (searches for directories)
- **Find by modification time**: `find . -mtime -7` (files modified within the last 7 days)

> **Exercise**: 
> 
> - Use `find` to locate all `.txt` files in your home directory.
> - Try finding files that were modified in the last 3 days.

---

### Conclusion

You’ve now strengthened your core shell skills, focusing on efficient navigation, permissions, redirection, and wildcards. These are foundational skills that will help you become more productive when using the Yens cluster.

Next steps: If you feel comfortable with these topics, head over to the [Advanced Shell](../advanced_shell/advanced_shell.md) section where we’ll dive into more powerful tools like `grep`, `awk`, and `sed` to take your shell usage to the next level!

