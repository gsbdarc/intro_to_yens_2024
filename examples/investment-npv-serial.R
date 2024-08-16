# In the context of economics and finance, Net Present Value (NPV) is used to assess 
# the profitability of investment projects or business decisions.
# This code performs a Monte Carlo simulation of Net Present Value (NPV) with 50,000 trials in parallel,
# utilizing multiple CPU cores. It randomizes input parameters for each trial, calculates the NPV,
# and stores the results for analysis.

# load necessary libraries
library(foreach)
library(doParallel)

options(warn=-1)

# set the number of cores here
ncore <- 1

# register parallel backend to limit threads to the value specified in ncore variable
registerDoParallel(ncore)

# define function for NPV calculation
npv_calculation <- function(cashflows, discount_rate) {
  # inputs: cashflows (a vector of cash flows over time) and discount_rate (the discount rate).
  npv <- sum(cashflows / (1 + discount_rate)^(0:length(cashflows)))
  return(npv)
}

# number of trials
num_trials <- 50000

# measure the execution time of the Monte Carlo simulation
system.time({
  # use the foreach package to loop through the specified number of trials (num_trials) in parallel
  # within each parallel task, random values for input parameters (cash flows and discount rate) are generated for each trial
  # these random input values represent different possible scenarios
  results <- foreach(i = 1:num_trials, .combine = rbind) %dopar% {
    # randomly generate input values for each trial
    cashflows <- runif(10000, min = -100, max = 100)  # random cash flow vector over 10,000 time periods. 
    # these cash flows can represent costs (e.g., initial investment) and benefits (e.g., revenue or savings) associated with the project
    discount_rate <- runif(1, min = 0.05, max = 0.15)  # random discount rate at which future cash flows are discounted
    
    # calculate NPV for the trial
    npv <- npv_calculation(cashflows, discount_rate)
    
  }
})


cat("Parallel NPV Calculation (using", ncore, "cores):\n")
# print summary statistics for NPV and plot a histogram of the results
# positive NPV indicates that the project is expected to generate a profit (the benefits outweigh the costs), 
# making it an economically sound decision. If the NPV is negative, it suggests that the project may not be financially viable.
summary(results)
hist(results, main = 'NPV distribution')
