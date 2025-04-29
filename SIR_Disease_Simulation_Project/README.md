# SIR Disease Simulation Project

## Overview
Is project mein humne ek disease ke spread ko simulate kiya hai using SIR (Susceptible-Infected-Recovered) model. Simulation aur visualization ke liye R language ka use hua hai (`deSolve` aur `ggplot2` packages ke saath).

## Files
- **sir_model_simulation.R** – Main R script jo model define karta hai, solve karta hai aur plot generate karta hai.
- **sir_model_output_plot.png** – Output plot ka image file.

## Requirements
- R
- Packages:
  - deSolve
  - ggplot2

## How to Run
1. R ya RStudio install karo.
2. Ye packages install karo (agar already nahi hain):
   ```R
   install.packages("deSolve")
   install.packages("ggplot2")
