install.packages(�HMM�)
library(HMM)

# Define the state and observation space
states <- c("Sunny", "Rainy")
observations <- c("Walk", "Shop", "Clean")

# Define the start probabilities
startProbs <- c(0.6, 0.4)

# Define the transition probabilities
transProbs <- matrix(c(0.7, 0.3, 0.4, 0.6), nrow=2)

# Define the emission probabilities
emitProbs <- matrix(c(0.1, 0.4, 0.5, 0.6, 0.3, 0.1), nrow=2)

# Create the HMM
hmm <- initHMM(States=states, Symbols=observations, startProbs=startProbs, transProbs=transProbs, emissionProbs=emitProbs)

# Print the HMM
print(hmm)

# Example observation sequence
example_observations <- c("Walk", "Shop", "Clean")

# Compute the likelihood of the example observation sequence
pred<-forward(hmm,observation=example_observation)
print(pred/-10)
