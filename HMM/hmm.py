import numpy as np
import matplotlib.pyplot as plt

# Define the states (hidden variables)
states = ["Sunny", "Rainy"]
num_states = len(states)

# Define the observations (observable variables)
observations = ["Umbrella", "No Umbrella"]
num_observations = len(observations)

# Transition probability matrix (A)
transition_matrix = np.array([
    [0.7, 0.3],  # Transition from Sunny to Sunny, Sunny to Rainy
    [0.4, 0.6]   # Transition from Rainy to Sunny, Rainy to Rainy
])

# Initial state probabilities (π)
initial_probabilities = np.array([0.6, 0.4])  # Start with a 60% chance of being Sunny

# Emission probability matrix (B)
emission_matrix = np.array([
    [0.2, 0.8],  # Probability of observing Umbrella, No Umbrella when Sunny
    [0.7, 0.3]   # Probability of observing Umbrella, No Umbrella when Rainy
])

# Sequence of observations
observed_sequence = ["Umbrella", "Umbrella", "No Umbrella", "No Umbrella"]

# Initialize the forward probability matrix
num_observations = len(observed_sequence)
num_states = len(states)
forward_matrix = np.zeros((num_observations, num_states))

# Initialize the first row of the forward matrix
for i in range(num_states):
    forward_matrix[0][i] = initial_probabilities[i] * emission_matrix[i][observations.index(observed_sequence[0])]

# Fill in the rest of the forward matrix
for t in range(1, num_observations):
    for j in range(num_states):
        observation_index = observations.index(observed_sequence[t])
        forward_matrix[t][j] = sum(forward_matrix[t-1][i] * transition_matrix[i][j] * emission_matrix[j][observation_index] for i in range(num_states))

# Plot the forward probabilities for the "Sunny" state
plt.figure(figsize=(10, 6))
plt.plot(range(len(observed_sequence)), forward_matrix[:, 0], label="Sunny")
plt.xlabel("Time Step")
plt.ylabel("Forward Probability")
plt.title("Forward Probability for 'Sunny' State in Hidden Markov Model")
plt.legend()
plt.show()

# Plot the forward probabilities for the "Rainy" state
plt.figure(figsize=(10, 6))
plt.plot(range(len(observed_sequence)), forward_matrix[:, 1], label="Rainy")
plt.xlabel("Time Step")
plt.ylabel("Forward Probability")
plt.title("Forward Probability for 'Rainy' State in Hidden Markov Model")
plt.legend()
plt.show()
