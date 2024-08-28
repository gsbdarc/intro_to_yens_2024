---
title: 10. Transferring Files to and from Yen Servers
layout: page
nav_order: 10 
updateDate: 2024-08-16

# {{ page.title }}
In the course of your data processing pipeline, you will often need to transfer data to Yen servers for analysis and subsequently move the resulting files back to your local machine.

## Using `scp` for File Transfers

### Transferring Files to Yens Servers

To transfer one or more files, you can use the `scp` command. The `scp` command takes two arguments, the source path (what files or directories you are copying) and the destination path (where the files/directories will be copied to).

```bash
$ scp <source_path> <destination_path>
```

When transferring data to the Yens from your local machine, the `<source_path>` is the path to the file(s) on your local computer while the `<destination_path>` is the path on the Yens where the files from your local machine will be transferred to.

For instance, to transfer a file named `mydata.txt` to your project space on Yen servers, execute:

```bash
$ scp mydata.txt <SUNetID>@yen.stanford.edu:/zfs/projects/students/<my_project_dir>
```
The `scp` command uses `ssh` for file transfer, so you'll be prompted for your password and Duo authentication.

If you want to transfer all CSV files from a particular directory, use the following:

```bash
$ scp *.csv <SUNetID>@yen.stanford.edu:/zfs/projects/students/<my_project_dir>
```

{: .note}
`scp` command above uses `yen.stanford.edu` which means the transfer will go through the interactive yens. For faster transfers, we can use `yen-transfer` node.

To use the Yen Data Transfer Node, called `yen-transfer`, we can modify the `scp` command as follows:


```bash
$ scp *.csv <SUNetID>@yen-transfer.stanford.edu:/zfs/projects/students/<my_project_dir>
```

### Transferring Folders to Yen Servers
On your local machine, open a new terminal and navigate to the parent directory of the folder that
you want to transfer to the Yens with the `cd` command.

Once you are in the parent directory of the folder you want to transfer, run the following to copy the folder to the Yens:

```bash
$ scp -r my_folder/ <SUNetID>@yen.stanford.edu:/zfs/projects/students/<my_project_dir>
```
The `-r` flag is used to copy folders (**r**ecursively copy files). Replace `<SUNetID>` with your SUNet ID and `<my_project_dir>` with the destination path on the Yen's file system, ZFS.

Let's illustrate this with an example. We'll create an empty folder called `test_from_local` and transfer it to the home directory on Yen servers:

Run from a local terminal (not connected to the Yens):

```bash
$ mkdir test_from_local
$ scp -r test_from_local/ <SUNetID>@yen.stanford.edu:~
```

### Transferring Files from Yen Servers
When transferring data from the Yens to your local machine, the `<source_path>` is the path to the file(s) on the Yens while the `<destination_path>` is the path on your local machine where the files from the Yens will be transferred to.

To copy files from Yen servers to your local machine, open a new terminal without connecting to the Yens. Use the `cd` command to navigate to the local directory where you want to copy the files to. Then run:

```bash
$ cd <my_local_folder>
$ scp -r <SUNetID>@yen.stanford.edu:/zfs/projects/students/<my_project_dir>/results .
```

In this example, we're copying the `results` folder from the Yen's ZFS file system to your local directory (`.` signifies the current directory). If you're copying files (not directories), omit the `-r` flag. To transfer multiple files, use the wildcard `*` to match several files.

### Using Other Transfer Tools
See <a href="https://rcpedia.stanford.edu/faqs/rclone.html" target="_blank">rclone</a> and <a href="https://rcpedia.stanford.edu/faqs/rsync.html" target="_blank">rsync</a> pages to learn two additional transfer tools.
