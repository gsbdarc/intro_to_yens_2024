---
title: 4. Running Code on the Yens
layout: page
nav_order: 7 
updateDate: 2024-09-17
---

# {{ page.title }}

## Cloning a Git Repository
When you want to work with code that someone else has already written, like an example from class or an open-source project, you'll often need to download it to your own environment. In Git, the process of copying an entire project from a remote location (like GitHub) to your local machine (or the Yens) is called **cloning**.

Today, we’ll be working with code examples stored in a Git repository on GitHub, which also contains the source for this class website. To get started, you’ll need to clone this repository to your home directory on the Yens. Run the following command to do that:

```bash
SUNetID@yenX:~$ git clone https://github.com/gsbdarc/intro_to_yens_2024.git
```

Once you've run that command, change your working directory to the `~/intro_to_yens_2024/examples/` folder.

## Yen Software (Modules)
There's a number of software packages available for use on the Yen servers.  Here is the current list:

* AMPL 
* Anaconda
* AWS CLI 
* bats
* dotnet
* Google Drive
* Go
* GSL
* Gurobi
* HDF5
* Intel-python
* Julia
* KNitro
* Ludwig 
* Mathematica
* Matlab
* Microsoft-R
* mosek
* OpenMPI
* Podman 
* PostgreSQL
* Python
* PyTorch
* R
* rclone
* RStudio
* SAS
* Singularity
* Stata
* Tensorflow
* Tomlab

## Loading the appropriate software

We use Linux module system to load the software into your current environment. Linux modules are used on research servers.
The advantage of the module system is that as a system user you do not need to install the software yourself nor do you need to mess with setting up the paths correctly.
You simply load it and unload it in your current session and the correct paths get added to your environment variables. For software like
Python, R and Julia, etc the user still needs to install their own libraries or packages. We will go over the details of how
to install packages later in this course. Another advantage of the module system is that several versions of the same sofware
can coexist and if your research uses a specific version of software you can stick with it even though the newer versions of that software exist.

### See available software

Check the current list of available software and versions on the Yen servers with the following command:


```bash
$ module avail
```

You should see the following:
```bash

------------------------------------------- Global Aliases --------------------------------------------
   statamp/17 -> stata/17

--------------------------------------- /software/modules/Core ----------------------------------------
   R/3.6.3                     julia/1.0.0                     rclone/1.54.0
   R/4.0.2                     julia/1.0.2                     rclone/1.60.0
   R/4.1.3                     julia/1.2.0                     rclone/1.62.2
   R/4.2.1                     julia/1.3.1                     rclone/1.63.1      (D)
   R/4.3.0              (D)    julia/1.5.1                     sas/9.4
   ampl/20231031               julia/1.6.2                     singularity/3.4.0
   anaconda/5.2.0              julia/1.7.3                     singularity/3.11.5 (D)
   anaconda3/5.2.0             julia/1.8.0                     stata-mp/now
   anaconda3/2022.05           julia/1.9.2                     stata-mp/16
   anaconda3/2023.09    (D)    julia/1.10.2           (D)      stata-mp/17        (D)
   awscli/2.13.22              knitro/12.0.0                   stata-mp/18
   bats/1.5.0                  knitro/12.1.1                   stata/now
   bbcp/17.12.00.00.0          knitro/12.3.0                   stata/16
   dotnet/2.1.500              knitro/14.0.0          (D)      stata/17           (D)
   dotnet/3.0.0-p2      (D)    ludwig/0.8.6           (g)      stata/18
   emacs/27.2                  mathematica/11.2                statamp/now
   gcloud/448.0.0              matlab/R2018a                   statamp/16
   gdrive/2.1.0                matlab/R2018b                   statamp/17         (D)
   go/1.13                     matlab/R2019b                   statamp/18
   gsl/2.7.1                   matlab/R2021b                   tensorflow/2       (g)
   gurobi/8.0.1                matlab/R2022a                   tomlab/8.8
   gurobi/9.0.2                matlab/R2022b          (D)      xstata-mp/now
   gurobi/9.5.2                matlab/R2024a                   xstata-mp/16
   gurobi/10.0.0        (D)    microsoft-r-open/3.5.3          xstata-mp/17       (D)
   gurobipy/9.5.2              mosek/10.2                      xstata-mp/18
   gurobipy/10.0.0      (D)    openmpi/4.1.0                   xstata/now
   gurobipy3/9.5.2             postgresql/15.1        (g)      xstata/16
   gurobipy3/10.0.0     (D)    python/3.10.5          (D)      xstata/17          (D)
   hdf5/1.12.0                 python/3.10.11                  xstata/18
   intel-python/2019.4         python/3.11.3                   xstatamp/now
   intel-python3/2019.4        pytorch/2.0.1          (g)      xstatamp/16
   intel/2019.4                pytorch/2.1.2          (g,D)    xstatamp/17        (D)
   julia/0.7.0                 rclone/1.47.0                   xstatamp/18

  Where:
   g:  built for GPU
   D:  Default Module

If the avail list is too long consider trying:

"module --default avail" or "ml -d av" to just list the default modules.
"module overview" or "ml ov" to display the number of modules for each name.

Use "module spider" to find all possible modules.
Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".
```

If you are looking for all available R modules, you can filter `module avail` command as follows:

```bash
$ module avail R/
```

You should see the list of all avaible R versions that are already installed on the Yen server:

```bash
------------------------------------------------ /software/modules/Core -------------------------------------------------
   R/3.6.3    R/4.0.2    R/4.1.3    R/4.2.1    R/4.3.0 (D)

  Where:
   D:  Default Module

```

{: .note}
If you do not see the software or a particular software version that you need for your research, please email us with the addition request at [gsb_darcresearch@stanford.edu](mailto:gsb_darcresearch@stanford.edu).


If there are multiple versions of the same software, the default version is indicated by a `(D)` next to the module name.
For example, the default R version is currently `R/4.3.0`. If you are happy with the default version, you can simple type:

```bash
$ module load R
```

and the default version will be loaded. You can also use the shorthand `ml` instead of typing `module load` and `module list`.
If you want to downgrade to an older R version, you
can specify the version number:

```bash
$ ml purge
$ ml R/4.1.3
```

To see currently loaded modules, use:

```bash
$ module list
```

Or with a shorthand:
```bash
$ ml
```

You should see:

```bash
Currently Loaded Modules:
  1) R/4.1.3
```


If you want to switch R versions, you can use:

```bash
$ ml swap R/4.2.1
```

Then, run:
```bash
$ ml
```

You should see:

```bash
Currently Loaded Modules:
  1) R/4.2.1
```

You can unload an individual module with:

```bash
$ module unload R 
```

Or with a shorthand `-`:
```bash
$ ml R
$ ml
$ ml -R
$ ml
```
Or you can unload all modules that you have currently loaded with:

```bash
$ ml purge
```

Now, if you run

```bash
$ ml
```

You will see:

```bash
No modules loaded
```

Linux modules only modify your current working environment which means that if you lose connection to the Yens or close your terminal window, you will need to reload the modules. But all of the libraries or packages that you have installed as a user will persist and only need to be installed once.

Once the software you want to use is loaded, the binary is available for you to use from the command line.
For example, if you want to install R packages or run interactive R console, type:

```bash
$ R
```

The interactive R console will open with the R version matching the module you have loaded:

```R
R version 4.3.0 (2023-04-21) -- "Already Tomorrow"
Copyright (C) 2023 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

>
```

Type `q()` to exit out of R:

```R
> q()
Save workspace image? [y/n/c]: n
```


## Managing R Software Libraries and Versions
Every R version will also have its own library separate from other versions. For example, R 4.0 will have its user-installed
packages side by side with R 4.3 library containing the user-installed packages specific to that version.

When upgrading your R version (e.g., to run code with a newly released R version), you must first install packages that are needed for your script to run for that specific R version. However, once the package is
installed, you can load it in your scripts without the need for repeated installations upon each login.

Moreover, if you require access to a newer software version that is not currently available on the system, please don't hesitate to [contact DARC](mailto:gsb_darcresearch@stanford.edu) to request its installation.

### Installing R Packages 

{: .important }
The recommended way to install your R packages is using the command line (not RStudio on JupyterHub and not the terminal in JupyterHub).

### Navigate to Examples Folder
```bash
$ cd intro_to_yens_2024/examples 
$ ls -ltr
```

Load the R module with the version that you want (R 4.3 is the current default).

For example, let's use the newest R version available on the yens:

```bash
$ ml R
```

Start interactive R console by typing `R`.

Let's install two multiprocessing packages on the Yens that we will use for the R example.

```R
> install.packages('foreach')
```
If this is your first time installing R package for this R version on the Yens, you will be asked to create a personal library
(because users do not have write permissions to the system R library). Answer `yes` to both questions:

```R
Warning in install.packages("foreach") :
  'lib = "/software/free/R/R-4.3.0/lib/R/library"' is not writable
Would you like to use a personal library instead? (yes/No/cancel) yes

Would you like to create a personal library
‘~/R/x86_64-pc-linux-gnu-library/4.3’
to install packages into? (yes/No/cancel) yes
```
This creates a new personal R 4.3 library in your home directory. The library path is
`~/R/x86_64-pc-linux-gnu-library/4.3` where all of the user packages will be installed. Once the library is created, next
package will be installed there automatically.

Pick any mirror in the US.

```R
Installing package into ‘/home/users/nrapstin/R/x86_64-pc-linux-gnu-library/4.3’
(as ‘lib’ is unspecified)
--- Please select a CRAN mirror for use in this session ---
Secure CRAN mirrors

 1: 0-Cloud [https]
 2: Australia (Canberra) [https]
...
74: USA (IA) [https]
75: USA (MI) [https]
76: USA (OH) [https]
77: USA (OR) [https]
78: USA (TN) [https]
79: USA (TX 1) [https]
80: Uruguay [https]
81: (other mirrors)

Selection: 77
```

If the package is successfully installed, you should see:

```R
* DONE (foreach)

The downloaded source packages are in
        ‘/tmp/RtmpsYpzoP/downloaded_packages’
```

Then install `doParallel` package:

```R
> install.packages("doParallel")
```

```R
The downloaded source packages are in
        ‘/tmp/Rtmpwy8WeV/downloaded_packages’
```

We can then quit out of R without saving workspace image:

```R
> q()
Save workspace image? [y/n/c]: n
```
-------------------------
Throughout this course, we will explore practical examples that showcase the power of data analytics and research computing.
One such example involves Monte Carlo simulations to calculate Net Present Value (NPV) – a fundamental concept in economics and finance.

## Introducing an R Example


Our Monte Carlo NPV simulation involves the following steps:

1. Randomly generate cash flows over a specified number of periods.
2. Assign a random discount rate to each trial, representing different scenarios.
3. Calculate the NPV for each trial using the generated cash flows and discount rate.
4. Repeat this process for a substantial number of trials (e.g., 50,000) to obtain a distribution of NPV values.
5. Analyze the results to understand the range and characteristics of NPV outcomes.

See code [here](https://github.com/gsbdarc/intro_to_yens_2024/blob/main/examples/investment-npv-serial.R).

### Running Serial R Script on the Command Line
If you want to simply run the script, you can do so from the command line.

{: .important }
Because this R code uses multiprocessing and the yens are a shared computing environment, we need to be careful about how R sees and utilizes the shared cores on the yens.


We never use `detectCores()` function on the shared systems, so instead, we will hard code the number of cores for
the script to use in this line in the R script:

```R
ncore <- 1
```

After loading the R module, we can run this script with `Rscript` command on the command line:

```bash
$ Rscript investment-npv-serial.R
```

```bash
Loading required package: iterators
Loading required package: parallel
   user  system elapsed
 28.230   0.043  28.277
Parallel NPV Calculation (using 1 cores):
       V1
 Min.   :-677.7345
 1st Qu.: -95.4161
 Median :   1.1104
 Mean   :  -0.1139
 3rd Qu.:  96.7678
 Max.   : 707.4085
```
Again, running this script is active as long as the session is active (terminal stays open and you do not lose connection).
