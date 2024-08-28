---
title: 6. JupyterHub on the Yens 
layout: page
nav_order: 6
updateDate: 2024-08-28
---

## Web-based Computing
Web-based computing is available on the interactive Yen servers with <a href="https://jupyterhub.readthedocs.io/en/stable/" target="_blank">JupyterHub</a> without the need to `ssh` from the terminal.  JupyterHub is a platform designed to allow multiple users to launch their own JupyterLab instances on a shared system with minimal user effort. 
It also gives you a terminal, file browser and a way to run Jupyter notebooks with several language kernels including Python 3, R, Julia, MATLAB, SAS, and Stata. 

## Getting Started

To get started, open a web browser and visit one of the following links for each server:

- <a href="https://yen1.stanford.edu/jupyter/" target="_blank">Yen1 https://yen1.stanford.edu/jupyter</a>
- <a href="https://yen2.stanford.edu/jupyter/" target="_blank">Yen2 https://yen2.stanford.edu/jupyter</a>
- <a href="https://yen3.stanford.edu/jupyter/" target="_blank">Yen3 https://yen3.stanford.edu/jupyter</a>
- <a href="https://yen4.stanford.edu/jupyter/" target="_blank">Yen4 https://yen4.stanford.edu/jupyter</a>
- <a href="https://yen5.stanford.edu/jupyter/" target="_blank">Yen5 https://yen5.stanford.edu/jupyter</a>

You will need to login with your SUNet credentials, and then click on `Start My Server`.  From there, you will have access to the web-based computing services available.

![](../assets/images/launch-hub.png)

{: .important }
JupyterHub instances on each `yen` server are INDEPENDENT of each other! If you launch a server on `yen3`, it will only use resources available on `yen3`.

{: .warning }
JupyterHub does not work well on Safari - we recommend using a different browser.

## Recommended Use of JupyterHub 

JupyterHub is a great tool for interactive computing, data analysis, and visualization. It is not however recommended for running long jobs or computationally intensive tasks. For these tasks, we recommend using the Yen servers directly. 

The typical development workflow is to use JupyterHub and more specifically the Jupyter Notebooks and RStudio, for prototyping and testing code, and then running the final version on the Yen servers or Slurm Cluster.


![](../assets/images/jupyter_in_yens.png)


## Features of JupyterHub

We recommend taking a look at the <a href="https://jupyter-notebook.readthedocs.io" target="_blank">official documentation</a> for JupyterHub if you have any questions on the features below!

The JupyterLab interface looks like:

![](../assets/images/jupyterhub.png)

The front panel has a Launcher interface from which you can start notebooks with different language kernels and custom environment kernels.

## File Browser
The JupyterHub instances will automatically launch from your home directory on the Yens. 
Your home directory is a file icon shown by the red arrow:

![](../assets/images/file-browser.png)

The current directory is also displayed at the top of the file browser.

Clicking on the home icon (folder icon), returns the file browser back to your home where you can access any directories that are accessible from your home on the Yens.

![](../assets/images/home-dir-zfs.png)

Double click on the `zfs` directory in your home directory to navigate to your ZFS project files.


## File Upload and Download
----------------------------
![](../assets/images/jupyter_upload.png)

One very useful feature of JupyterHub is the ability to upload and download files from ZFS. 
First, make sure you are in the proper directory. Then, to upload, click the up arrow on the top left of your screen to select a file from your local machine to upload to the Yens.

![](../assets/images/jupyter_download.png)

To download, right click the file you would like to download to your local machine, and click "Download".

## Terminal
-------------------------
![](../assets/images/terminal.png)

You can launch a terminal from JupyterHub.  This provides access to commands you would normally run on the command line on the Yens, 
but through the web browser. However, we have seen issues with JupyterHub terminal (as well as VSCode) that modifies or overwrites python paths and environment variables so for package installations, we recommend using a terminal outside of JupyterHub.

Let's open up a Terminal and navigate to the rf_bootcamp_2024


```bash
$ cd rf_bootcamp_2024/examples/python_examples/
$ ls
```
This should show all the different examples available in the `rf_bootcamp_2024` directory.


## Notebook
![](../assets/images/jupyternotebook.png)

Notebooks allow you to write code and execute it on the yens in your web browser. 
Code is written into cells, which can be run in any order on demand. 
You can also include text, images, and plots to make your code read like a lab notebook.  


If there's a specific programming language you'd like to see installed contact the [DARC team](mailto:gsb_darcresearch@stanford.edu) 

### Notebook Organization
When working in a notebook, it is important to keep meticulous documentation. Common practice is to use markdown cells to document the purpose different sections of your code and either markdown or comments to describe the code itself.



![](../assets/images/jupyter_notebook_example.png)


You will see in this example that the first cell contains library imports and subsequent cells contain section headers and code. 

{: .note}
In the file browser of the above image you can see  python file. Once you are confident in your section snippets, it is common practice to copy and paste them into a Python file for final execution.


## RStudio
-----------
![](../assets/images/rstudio.png)

RStudio GUI is also available! Clicking this link will bring up a new tab with a web-based RStudio on the Yens.

If you opened up a notebook and want to get back to the Launcher interface to launch other software as well, click the "+" button in the upper left corner:code 
![](../assets/images/launcher.png)


## Installing Packages
-----------------------
JupyterHub loads packages found in your `~/.local/` directory. 
If you wish to install Python packages to be available in a JupyterHub notebook, we recommend using <a href="https://rcpedia.stanford.edu/topicGuides/pythonEnv.html" target="_blank">Python `venv`</a> environment. 

{: .warning}
!pip installing packages in the Notebook cells will not work as expected.


## Compute Limits

The following limits will be imposed on JupyterHub servers:

<div class="row">
    <div class="col-lg-12">
      <H2> </H2>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">
     <div class="fontAwesomeStyle"><i class="fas fa-tachometer-alt"></i> Compute Limits</div>
<iframe class="airtable-embed" src="https://airtable.com/embed/shrGC2dYzvDSgJfXa?backgroundColor=purple" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>
   </div>
    <div class="col col-md-2"></div>
  </div>

JupyterHub instance will shut down after 3 hours idle (no notebooks actively running code).

{: .warning}
Idle servers shut down will not retain any local packages or variables in the notebooks.  Please save your output.

If your processes require more than these limits, reach out to the <a href="https://rcpedia.stanford.edu/services/researchSupportRequest.html" target="_blank">DARC team</a> for support.

## Text File Editor
-------------------------
![](../assets/images/editor.png)

Finally, you can also edit text files like R scripts directly on JupyterHub. Clicking on Text File icon will open a new file that you can edit. Similarly, clicking on Python File will create an empty `.py` file and clicking on R File will create an empty `.r` file.
You can also navigate to a directory that has the scripts you want to edit and double click on the script name to open it up in the Text Editor.

For example, navigate to `rf_bootcamp_2024/examples/r_examples` folder in file brower first then double click on `investment-npv-parallel.R` file to open it in the text editor:
![](../assets/images/edit-r-script.png)

---
