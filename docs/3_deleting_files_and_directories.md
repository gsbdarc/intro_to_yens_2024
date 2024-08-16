---
title: 3. Deleting Files and Directories
layout: page
nav_order: 3
parent: Day 1
updateDate: 2024-07-10
---

# {{ page.title }}
---

## Deleting files

- When passed paths to non-existent files in an existing directory as arguments, the command `touch` creates a empty files w/ those names there; try it:

```bash
machine_name:~/test_dir/test2$ touch a b
```

- file, pass a path to that file to the program `rm` as an argument; try deleting the file `a` you just created from outside the directory it’s in like so:

```bash
machine_name:~/test_dir/test2$ cd ..
machine_name:~/test_dir$ rm test2/a
machine_name:~/test_dir$ ls test2
```

## Deleting directories

- To delete a directory and its contents (if any), have to pass the `-r` flag to the `rm` program:

```bash
machine_name:~/test_dir$ cd ..
machine_name:~$ rm -r test_dir
```

- *Note:* if you run `rm test_dir` without the `-r` flag, the shell will complain since `test_dir` is a directory, not a file

## Shell program flags

- More generally, an **option** (often called a **flag**) is another way to change the behavior of a program besides an argument

- A shell program knows which argument is which from the order of them, while options have names (e.g. `-r`) that the program can recognize

- As more examples of helpful flags, let's return to the `ls` command that lists the contents of a directory
    - If you specify the `-l` flag when running `ls`, the shell will list the contents of the directory with much more detailed information, such as the size of the file and the last time it was modified
    - If you also specify the `-h` flag, then the file sizes will be provided in "human-readable" form, i.e. in KB, MB, GB, or TB instead of in raw bytes (if you can do the conversions quickly in your head, good on you!)
    - Note that you can specify multiple flags after a `-`, e.g.

    ```bash
    machine_name:~$ ls -lh
    ```

## More resources

We'll only have time to scratch the surface of interacting with computers via the shell today and tomorrow; See lessons [1](https://missing.csail.mit.edu/2020/course-shell/) and [3](https://missing.csail.mit.edu/2020/shell-tools/) of [the Missing Semester](https://missing.csail.mit.edu) open-source MIT course on miscellaneous software engineering skills for more in-depth information and tips about making the most of the shell.