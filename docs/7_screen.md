---
title: 7. How Do I Run a Job that Continues after I Log Out?
layout: page
nav_order: 10 
updateDate: 2024-09-18
---

# {{ page.title }}


## Running Scripts in the Background with `&`
When working on the Yens, there are times when you'll want your scripts or commands to keep running even after you've logged out, especially if they take a long time to finish. One way to do this is to run your scripts in the background by appending `&` to your command. This allows you to continue working in the same terminal without waiting for the script to finish. If you log out, the process will continue running. After you log back in, you can bring the process back to the foreground by using the `fg` command. But make sure you connect to the same machine.

{: .warning }
While there is no time limit for the long running jobs, the Yens do get rebooted every 2 months and all running jobs are stopped. 

 
For example:

- To run a script in the background, use:

```
python my_script.py &
```
This will start the script and free up your terminal.

- When you log back in, you can view background jobs using:

```
jobs
```

And bring it back to the foreground with:

```
fg %1
```

`%1` refers to the job number. When you run multiple processes in the background, each gets assigned a job number. You can list all background jobs running on that Yen node using the `jobs` command. The output will show each job with a number (like `[1]`, `[2]`, etc.). `%1` corresponds to the job with the number `1`. If you wanted to bring job number `2` to the foreground, you would use `fg %2`.


## Running Long Processes with `screen`

Alternatively, you can use the `screen` command, which allows you to run your processes in a separate session that continues running in the background, even after you've disconnected. You can later reconnect to that session to check the status of your tasks. But make sure you connect to the same machine.

To set up a screen, use:

```bash
screen -S <sessionname>
```

For example, let's name our session `npv`:

```bash
screen -S npv
```

This will take you to a new terminal with a blank view and a command prompt at the top of the page. 
Here, you can start issuing commands as usual and in particular, you can start a script that you expect to run for a long time.

{: .note }
Screens are not tied to your user, but rather to the specific Yen that you started the screen in. So do not expect your screen session on `yen1` to appear in `yen2`.

Let's run our serial R script again. This time, we will let it run in a screen (if you had modules loaded, 
starting a screen preserves these in the new terminal started by `screen`). So, we can start our R process:

```bash
Rscript investment-npv-serial.R 
```

Once your script is going, you can exit out of this screen session with the keyboard shortcut `ctrl + a + d`, which will return you to your original terminal. 

You should see that the screen was detached:

```bash
[detached from 3630208.npv]
```

You can list any screen sessions that you are running on the particular Yen server you are logged onto by typing:
```
screen -ls
```

You should see something like:
```bash
There is a screen on:
	3630208.npv	(09/19/2023 10:33:47 AM)	(Detached)
1 Socket in /run/screen/S-nrapstin.
```

If you exit out of the server here, you can be assured that the scripts in your screen sessions will continue to run.

To return to any existing screen session, you simply need to type:
```bash
screen -r <sessionname>
```

For example, to go back to the screen we detached from earlier:

```bash
screen -r npv 
```

If you are actively printing to the console in your script, you may notice that you cannot scroll up through the log of print statements when you are in a screen. 
In order to activate the "scroll mode", you can use the keyboard shortcut `ctrl + a` and then hit `esc`. 
In this mode, you can scroll using the up and down arrow keys. Once you are finished scrolling, you can exit out of the mode by hitting the `q` or `esc` keys.

You may run into a situation where you are disconnected or timed out from the Yens while you are attached to a screen session. 
When you log back onto the Yens and try to reconnect to that session again, you may find that you cannot re-attach to the screen, since it's already "attached".
 In order to return to that session, you can just use this command:
```bash
screen -dr <sessionname>
```

This detaches the previous connection to that screen session and then returns you to the screen.

Finally, once you are finished with a screen session, all you have to do is type:
```
exit
```

Check that you no longer have screen sessions running:
```bash
screen -ls
```

```bash
No Sockets found in /run/screen/S-nrapstin.
```

{: warning }
Screen sessions should only be started from a regular terminal, not JupyterHub terminal. Screens will not persist in Jupyter.


{: .tip }
Stay tuned for the afternoon session, where we’ll dive into Slurm and how to run scheduled jobs. This is a powerful alternative to using `screen` or running jobs in the background, providing more flexibility and control over long-running tasks.

