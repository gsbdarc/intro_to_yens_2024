---
title: 13. Yen Policies
layout: page
nav_order: 13
updateDate: 2024-08-28
---


# {{ page.title }}
<div class="row">
    <div class="col-lg-12">
      <H1> </H1>
    </div>
  </div>
  <div class="row">
    <div class="col-lg-12">
     <div class="fontAwesomeStyle"><i class="fas fa-tachometer-alt"></i> Platform Limits</div>
<iframe class="airtable-embed" src="https://airtable.com/embed/shrGC2dYzvDSgJfXa?backgroundColor=purple" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>
   </div>
    <div class="col col-md-2"></div>
  </div>
<br>

## Best Practices


This page outlines usage guidelines for the yens with respect to system resources. 

The yen systems comprise a *shared* cluster that hosts many researchers at the GSB. As these are powerful systems (256 CPU's and 1 TB RAM on yen[2-5] and 32 CPU's and 1.5 TB RAM on yen1), it is common for them to be used for complex jobs that may take hours, days or even longer to complete. For this reason it is important that all users of these systems understand how to limit their momentary resource footprints so that the larger community is not negatively impacted. 

When using the yens, please adhere to some community best practices: 

- Be aware of your resource footprint
- Restrict your code to a maximum of 12 cores and 320 GB of RAM on yen1 and to 48 cores and 192 GB of RAM on yen[2-5]
- Clean up temporary files to free up disk space
- Use `gsbquota` to ensure you don't exceed your quota
- Check in on large jobs periodically 
- Avail yourself of platform-specific techniques that limit resource gobbling
- When in doubt, ask!


### Be Aware

Take the time to understand how your code will impact the environment in which it runs. Is your platform configured to claim all available resources (please fix that)? 
Are you actively using all of the RAM you have (consider saving to disk or clearing that out)? Is one of the yens particularly impacted during conference season (try another yen)? 
**You are part of a community, and overuse impacts everyone**. Please be a good neighbor!

### Monitor Your Children

Unix `top` and `htop` are typical, easy to understand tools that can provide quick insights into all the system’s processes, including your own. Columns in both tools can be sorted by CPU, RAM, VRAM, or PID. `htop` also provides nice CPU graphs. Make sure your job is behaving as expected - pay particular attention to processes that use *increasing* amounts of RAM or try to use all available CPUs.  If you notice a problem, halt your job and fix the issue before restarting it.

If you are claiming too much CPU or RAM at one time then your jobs will be automatically killed, or the DARC team may contact you directly to ask you to terminate your job. This is always a drag for everybody. Please don’t make us do this. 
