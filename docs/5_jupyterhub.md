---
title: 5. JupyterHub on the Yens 
layout: page
nav_order: 8 
updateDate: 2024-09-17
---

# {{ page.title }}

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

We recommend taking a look at the [official documentation](https://jupyter-notebook.readthedocs.io)  for JupyterHub if you have any questions on the features below!

The JupyterLab interface looks like:

![](../assets/images/jupyterhub_main.png)

There are several components to the JupyterLab interface:
- The settings menu
- The Left Panel
- The Right Panel

## Left Panel
### File Browser Tab
Let's focus on the left panel for now. The first tab open in the left panel is the file browser, which allows you to navigate the file system of the Yens. When you first open JupyterHub, you will be in your home directory. The path to your home directory is `/home/users/SUNetID/`

If we navigate to the `intro_to_yens_2024` directory, we should see the following structure in the file browser:

<div style="display: flex; align-items: left;"> 
    <div style="flex: 1;"> 
        <img src="../assets/images/jupyter_left_sidebar.png" alt="JupyterHub Left Sidebar" style="max-width: 100%; width: 800px; height: auto;"/> 
    </div> 
    <div style="flex: 2; padding-left: 20px;"> 
        <p>Currently, we are in the **file browser tab**, indicated by the folder icon.</p> 
        <p>In this tab, you can manipulate the file system on the Yens through a graphical user interface (GUI), much like the file system on your own computer. Here, you can create new launcher windows using the [Launcher](#){: .btn .btn-blue }, add folders, upload files, and restart kernels.</p> 
        <p>Below the search bar is the file path. Clicking on the **home icon** (folder icon) will return the file browser to your home directory, allowing you to access any directories that are accessible from your home on the Yens system.</p> 
    </div> 
</div>


### Running Tab 
<div style="display: flex; align-items: left;"> 
    <div style="flex: 1;"> 
        <img src="../assets/images/jupyter_running_tab.png" alt="JupyterHub Left Sidebar" style="max-width: 100%; width: 800px; height: auto;"/> 
    </div> 
    <div style="flex: 2; padding-left: 20px;"> 
        <p>Currently, we are in the **file browser tab**, indicated by the folder icon.</p> 
        <p>In this tab, you can manipulate the file system on the Yens through a graphical user interface (GUI), much like the file system on your own computer. Here, you can create new launcher windows using the [Launcher](#){: .btn .btn-blue }, add folders, upload files, and restart kernels.</p> 
        <p>Below the search bar is the file path. Clicking on the **home icon** (folder icon) will return the file browser to your home directory, allowing you to access any directories that are accessible from your home on the Yens system.</p> 
    </div> 
</div>


## File Upload and Download
----------------------------

One very useful feature of JupyterHub is the ability to easily upload and download files to and from the ZFS file system. This allows you to transfer data between your local machine and the Yens system, which is especially useful for importing datasets or saving results.

### Upload
To upload a file from your local machine to JupyterHub:

![](../assets/images/jupyter_upload.png)

1. Navigate to the correct directory in JupyterHub where you want the file to be uploaded.

2. Click the up arrow button located at the top left of your screen:

3. A file explorer window will open, allowing you to select the file from your local machine.

4. After selecting the file, it will appear in the directory you are currently in on JupyterHub.


### Download
To download a file from JupyterHub to your local machine:

![](../assets/images/jupyter_download.png)

1. Right-click the file in the file browser that you want to download.

2. In the menu that appears, select Download.

{: .warning}
This is not the correct place to load/download massive dataset or files. For these types of operations, we recommend using the Yen servers directly.

## Terminal
-------------------------
![](../assets/images/terminal.png)

You can launch a terminal from JupyterHub. This provides access to commands you would normally run on the command line on the Yens, 
but through the web browser. However, we have seen issues with JupyterHub terminal (as well as VSCode) that modifies or overwrites python paths and environment variables so for package installations, we recommend using a terminal outside of JupyterHub.

Let's open up a Terminal and navigate to the `intro_to_yens_2024`


```bash
$ cd intro_to_yens_2024/examples/
$ ls
```
This should show all the different examples available in the `intro_to_yens_2024` directory.


## Right Panel
### Notebook

![](../assets/images/jupyter_notebook.png)

In the top right corner of the notebook, you can see the current **kernel** being used.(Python 3 (ipykernel)) A kernel is the computational engine that runs your code, and each notebook is linked to a **language-specific kernel** (e.g., Python, R, Julia).

The notebook is composed of **cells**, which can be executed individually or all at once. You can run individual cells using the **Run** button (single arrow) or by pressing `Shift + Enter`. To run all cells in sequence, you can use the **Run All** button (double arrow). This flexibility allows you to interact with the kernel in a modular and dynamic way, making it easy to run, test, and modify code in parts or as a whole. Clicking on the cycle icon will restart the kernel.

There are two main types of cells:

1. **Code cells**: These cells are where you write and run code. When a code cell is executed, the code is sent to the Jupyter kernel for processing. The result of the execution, if any, will be displayed directly below the cell. You can run code cells in any order, and the kernel will keep track of the session's state (such as variables and functions) across all cells.

2. **Markdown cells**: These cells are used for writing formatted text using Markdown. In addition to plain text, you can include headings, lists, links, images, mathematical equations (using LaTeX), and plots. This makes Markdown cells useful for documenting your code, explaining concepts, or providing context, so your notebook reads like a digital lab notebook.

By combining these two types of cells, you can create an interactive document that documents your code, captures results, and provides explanations or visualizations, all in one place.

If there's a specific programming language you'd like to see installed contact the [DARC team](mailto:gsb_darcresearch@stanford.edu) 



### Notebook Organization
When working in a notebook, it's essential to maintain clear and thorough documentation. A common practice is to use **Markdown cells** to explain the purpose of different sections of your code, while Markdown or comments within the code itself can describe specific lines or functions.

![](../assets/images/jupyter_notebook_example.png)

 
In the example above, the first cell is a Markdown cell that provides context or explanation. The following code cell contains library imports, and subsequent cells include both section headers (in Markdown) and code.

{: .note}
In the file browser of the above image, you can see a Python file. Once you have finalized your code snippets in the notebook, it’s a common practice to copy them into a Python script (.py) for more permanent execution or for integration into larger projects. This allows you to run the code outside of the notebook environment, either from the command line or as part of a larger program.

#### Quick Tip about Cells
- **Execution Order**: Cells can be run in any order, but running them out of sequence may cause errors if earlier cells define variables or functions needed later.
- **Restarting the Kernel**: Restarts clear memory, so you'll need to re-run cells to restore the notebook’s state.
- **Interactive Output**: Code cells can generate interactive elements like plots and widgets.
- **Persistent Output**: Cell outputs are saved even after closing the notebook, but you'll need to re-run cells if the kernel is restarted.
- **Shortcuts**: Use `Shift + Enter` to quickly run cells. When the margin of the cells is selected `D+D` will delete a cell, `A` will insert a cell above, and `B` will insert a cell below.


If you opened up a notebook and want to get back to the Launcher interface to launch other software, click the "+" button in the upper left corner 
![](../assets/images/jupyterhub_launcher.png)

## RStudio
-----------
![](../assets/images/rstudio.png)

RStudio GUI is also available! Clicking this link will bring up a new tab with a web-based RStudio on the Yens.

## Installing Packages
-----------------------
JupyterHub loads packages found in your `~/.local/` directory. 
If you wish to install Python packages to be available in a JupyterHub notebook, we recommend using <a href="https://rcpedia.stanford.edu/topicGuides/pythonEnv.html" target="_blank">Python `venv`</a> environment. Then using a terminal to load the environment and install the packages.

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

{: .important}
JupyterHub instance will shut down after **3 hours** idle (no notebooks actively running code).

{: .warning}
Idle servers shut down will not retain any local packages or variables in the notebooks.  Please save your output.

If your processes require more than these limits, reach out to the <a href="https://rcpedia.stanford.edu/services/researchSupportRequest.html" target="_blank">DARC team</a> for support.

## Text File Editor
-------------------------
![](../assets/images/editor.png)

Finally, you can also edit text files like R scripts directly on JupyterHub. Clicking on Text File icon will open a new file that you can edit. Similarly, clicking on Python File will create an empty `.py` file and clicking on R File will create an empty `.r` file.
You can also navigate to a directory that has the scripts you want to edit and double click on the script name to open it up in the Text Editor.

For example, navigate to `intro_to_yens_2024/examples/` folder in file brower first then double click on `investment-npv-parallel.R` file to open it in the text editor:
![](../assets/images/edit-r-script.png)

---
