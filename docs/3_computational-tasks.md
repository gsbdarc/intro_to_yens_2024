---
title: 3. Computationally Intensive Empirical Tasks 
layout: page
nav_order: 6
updateDate: 2024-08-16
---

# {{ page.title }}
---
## Why Use a Computing Cluster?
In many research scenarios, tasks can exceed the capabilities of your laptop due to limitations in memory or processing power. Here's why moving to a compute cluster like the Yens can be essential:

### Common Tasks Requiring a Computing Cluster
- **Analyzing Large Datasets**: Large volumes of data require more memory and processing power.
- **Running Many Instances of a Simulation**: Simulations can be computationally intensive and time-consuming.
- **Estimating Parameters for Structural Models**: Complex models need significant computational resources.
- **Training/Fine-tuning Large Language Models**: Such models require extensive processing power and (GPU) memory.

### Memory Issues
- **RAM vs. Storage**: Data is stored on the hard drive (also called "storage" or disk) and is copied to RAM (Random Access Memory or simply "memory") when in use. RAM is much faster (100-1000x) than even the best SSDs.
- **Impact of Insufficient RAM**: When you run out of RAM, processes slow down as they move to the hard drive.
- **Monitor Memory Usage**: If you encounter issues running a script, check your memory usage. If your dataset is larger than half your RAM, your laptop will struggle. Most modern laptops have 4-16 GB of RAM.

### Runtime Issues
- **CPU Role**: Memory is where information is stored, but the CPU does the work. The CPU (Central Processing Unit) executes tasks and is rated by processing speed (Hz) and the number of cores.
- **Sequential vs. Parallel Processing**:
	- Sequential tasks (instructions that must be performed in order) can be time-consuming. For example, a function `runSimulation()` taking 1 minute per run would need 1000 minutes to run 1000 times sequentially on a single laptop.
	- Parallel processing can significantly reduce this time if we don't have to carry out the instructions in order. With 100 laptops, the same task would take just 10 minutes.

### Parallelization and Multiple CPUs
- **Side Effect-Free Functions**: Functions that do not change anything outside their local environment can be parallelized, as they have no 'side effects'.
- **Benefits of Parallelization**: Multiple CPUs can work simultaneously, provided their work has no interacting side effects. However, this often increases memory usage due to data duplication (trade-off between runtime and memory optimization).
- **Parallelizeing Your Research Code**: While parallelizing processes can save time, it requires time-consuming coding.
