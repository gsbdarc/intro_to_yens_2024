---
title: 10. Monitoring Usage
layout: page
nav_order: 13 
updateDate: 2024-08-16
---

# {{ page.title }}
---
## Monitoring Your Resource Footprint

Certain parts of the GSB research computing infrastructure provide 
environments that are managed by a scheduler (like Yen-Slurm or Sherlock). In these cases it is not necessary for individuals to monitor resource usage themselves. 

However, when working on systems like the interactive yens where resources like **CPU**, **RAM**, and **disk space** are shared among many researchers,
 it is important that all users be mindful of how their work impacts the larger community. 

{: .important }
When using interactive yens, use the ```htop``` and ```userload``` commands to monitor CPU and RAM usage. Use the ```gsbquota``` command to monitor disk quota.

### CPU & RAM

Per our Community Guidelines, CPU usage should always be limited to 48 CPU cores/threads per user at any one time on yen[2-5] and up to 12 CPU cores on yen1. 
Some software (R and RStudio, for example) default to claiming all available cores unless told to do otherwise. 
These defaults should always be overwritten when running R code on the yens. Similarly, when working with multiprocessing code in languages like Python, 
care must be taken to ensure your code does not grab everything it sees. Please refer to our parallel processing in <a href="https://rcpedia.stanford.edu/topicGuides/r.html" target="_blank">R</a> and <a href="https://rcpedia.stanford.edu/topicGuides/parallelProcessingPython.html" target="_blank">Python</a> for information about how to limit resource consumption when using common packages.

One easy method of getting a quick snapshot of your CPU and memory usage is via the ```htop``` command line tool. Running ```htop``` shows usage graphs and a process list that is sortable by user, top CPU, top RAM, and other metrics. Please use this tool liberally to monitor your resource usage, especially if you are running multiprocessing code on shared systems for the first time. 

The ```htop``` console looks like this:

![htop output for well-behaved code](../assets/images/proc_monitoring.png)

{: .warning }
Note that in certain cases greedy jobs may be terminated automatically to preserve the integrity of the system.

The `userload` command will list the total amount of resources (CPU & RAM) all your tasks are consuming on that particular Yen node.

```bash
userload
```
If the output is empty, you are not utilizing any CPU or RAM on this Yen node.

### Disk

Unlike personal home directories which have a 50 GB quota, faculty project directories on yens/ZFS are much bigger (1 T default). 
Disk storage is a finite resource, however, so to allow us to continue to provide large project spaces please always be aware of your disk footprint. This includes compressing files when you are able, and removing intermediate and/or temp files whenever possible. 

## Example
We are going to continue using the same R example and experiment running it on multiple cores and monitoring our resource consumption.

To monitor the resource usage while running a program, we will need three terminal windows that are all connected to the **same** yen server.

Check what yen you are connected to in the first terminal:

```bash
hostname
```

Then `ssh` to the same yen in the second and third terminal windows. So if I am on `yen3`, I would open **two** new terminals and `ssh` to 
the `yen3` in both so I can monitor my resources when I start running the R program on `yen3`.

```bash
ssh yen3.stanford.edu
cd intro_to_yens_2024/examples
```

Once you have **three** terminal windows connected to the same yen, run the `investment-npv-serial.R` program after loading the R module
in one of the terminals:

```bash
ml R
Rscript investment-npv-serial.R 
```

Once the program is running, monitor your usage with `userload` command in the second window:

```bash
userload
```

{: .tip }
You can refresh a particular command with `watch`. So, you can run `watch userload` and the output will refresh every 2 seconds (by default). 

Run `htop -u $USER` in the third window, where `$USER` is your SUNet ID:

```
htop -u $USER
```

While the program is running you should see about 1 CPU core is being utilized in `userload` output and one R process is running in `htop` output because we
specified 1 core in our R program.

```bash
userload
nrapstin         | 0.99 Cores | 0.00% Mem on yen3.stanford.edu
```

Let's run the same program with more cores. See code [here](https://github.com/gsbdarc/intro_to_yens_2024/blob/main/examples/investment-npv-parallel.R).
 
Then rerun:

```bash
Rscript investment-npv-parallel.R
```

You should see:
```bash
Loading required package: iterators
Loading required package: parallel
   user  system elapsed
297.135   1.781 123.176
Parallel NPV Calculation (using 8 cores):
       V1
 Min.   :-709.5883
 1st Qu.: -96.3171
 Median :   0.2777
 Mean   :   0.1964
 3rd Qu.:  96.8101
 Max.   : 754.5522
```

While the program is running, you should see 8 R processes running in the `htop` output because we
specified 8 cores in our R program and about 8 CPU cores being utilized in `userload` output. The program will run faster since we are using 8 cores instead of 1 but does not get you 8X speedup because of parallelization overhead. 

![](../assets/images/monitor-2.png)

### Passing the Number of Cores as a Command-Line Argument
The last modification we’ll make is to allow our R script to take the number of cores as a command-line argument. This is useful because it gives you the flexibility to specify the number of CPU cores you want to use for parallel processing each time you run the script, without needing to edit the script itself. This can be especially helpful when running the same script on different machines or with different computational resources.

See the modified [script](https://github.com/gsbdarc/intro_to_yens_2024/blob/main/examples/investment-npv-parallel-args.R) called `investment-npv-parallel-args.R`. 

To run the script, you can use the following command:

```bash
Rscript investment-npv-parallel-args.R 8
```
In this example, `8` is the number of cores you are requesting. The script will use this value to determine how many cores should be allocated for parallel processing. You can adjust the number of cores based on the resources available and remember to adhere to community guidelines.
 
Monitor your CPU usage while the program is running in the other terminal window with `htop` and `userload`.
