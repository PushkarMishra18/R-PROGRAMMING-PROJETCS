install.packages("deSolve")
install.packages("ggplot2")

library(deSolve)
library(ggplot2)

# SIR function
sir_model <- function(time, state, parameters) {
  with(as.list(c(state, parameters)), {
    dS <- -beta * S * I
    dI <- beta * S * I - gamma * I
    dR <- gamma * I
    return(list(c(dS, dI, dR)))
  })
}


init <- c(S = 0.99, I = 0.01, R = 0.0)
params <- c(beta = 0.3, gamma = 0.1)
times <- seq(0, 100, by = 1)

output <- ode(y = init, times = times, func = sir_model, parms = params)
output <- as.data.frame(output)

library(ggplot2)

ggplot(data = output, aes(x = time)) +
  geom_line(aes(y = S, color = "Susceptible")) +
  geom_line(aes(y = I, color = "Infected")) +
  geom_line(aes(y = R, color = "Recovered")) +
  labs(title = "SIR Model Simulation",
       y = "Proportion", color = "Compartment") +
  theme_minimal()

