---
title: 7. Understanding Cluster Components 
layout: page
nav_order: 7
updateDate: 2024-08-16
---

# {{ page.title }}
---

## Data Movement from NFS to CPU
Imagine you write a Python program that loads and filters a CSV file. When working on a research computing cluster (the Yens), it's essential to understand how data moves from ZFS to the processing unit (CPU) on a particular Yen computer (also called node) that will load and process the CSV files (the data).

### Key Components

1. **CPU (Central Processing Unit)**: The primary component that processes instructions and data. 
2. **RAM (Random Access Memory)**: Temporary storage that provides fast access to data for the CPU. There is a memory hierarchy with fastest but smallest registers that are closes to the CPU but hold the least amount of data for processing to the largest main memory (RAM) that is further from the CPU.
3. **Storage**: On the Yens, storage is a Network File System (NFS), called ZFS. Storage, also called disk(s) or hard drive(s), allows multiple computers (Yen nodes) to access files (i.e., CSV file) over a network as if they were on the local hard drive. 
Storage medium can be:
	- Hard disk drives, HDDs ("spinning disks"), which are slower to access but cheaper because they have moving parts 
	- Solid-state drives, SSDs (flash-based) which are more expensive but offer faster data read/writes

For example, ZFS project spaces use HDDs but local to each node, we have SSDs which can be accessed at `/tmp` path where a running program can output temporary files and read and write them very quickly.   

### Kitchen Analogy

Imagine the Yens as a kitchen:

- **Registers (Ingredients in Hand)**: Registers are like the ingredients you hold in your hand while cooking. They are the quickest to access and use, but you can only hold a small amount at a time.
- **L1 Cache (Spice Rack Next to Stove)**: The L1 cache is like a spice rack right next to your stove. It stores a small amount of frequently used ingredients, making them very quick to access.
- **L2 Cache (Drawer by the Stove)**: The L2 cache is like a drawer by the stove where you keep utensils and slightly larger quantities of frequently used items. It’s a bit further away than the spice rack but still very accessible.
- **L3 Cache (Cabinet Near the Stove)**: The L3 cache is like a cabinet near the stove. It stores larger quantities of ingredients and tools that you use often but not as frequently as those in the L1 and L2 caches.
- **RAM (Fridge)**: The RAM is like your fridge. It stores all the ingredients you need for your recipes, making them quickly accessible compared to going to the grocery store. You can store a fair amount of items, but there's a limit to how much you can keep in the fridge at once.
- **CPU (Stove)**: The CPU is like the stove in your kitchen. It has multiple burners (cores) that allow you to cook multiple dishes (process tasks) simultaneously. Each burner can operate independently, just as each CPU core can process different instructions at the same time. When cooking a meal (processing a task), you bring ingredients to the stove (from fridge if the meal is small, from the store when cooking a large meal, or drawer when using frequenty used ingredients).
- **ZFS (Grocery Store)**: Storage is like the grocery store where all your ingredients are stored. Retrieving ingredients from the store requires time and effort, similar to accessing data from the NFS. 
- **Network (Highway)**: Highway from your house to the grocery store with certain number of lanes and speed limit that determine how fast you can get to the store and back.
	- **Network Latency (Speed Limit)**: The time it takes (dependent on the speed limit and traffic congestion) for you to drive to the grocery store and back. Lower latency means you can transport ingredients more quickly. 
	- **Network Bandwidth (Number of Lanes)**: The number of lanes on the highway to the grocery store. Higher bandwidth means you can move more data at once. In our analogy, this means you can transport ingredients in larger quantities. 

