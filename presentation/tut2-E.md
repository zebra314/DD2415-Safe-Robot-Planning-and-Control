# Tutorial 2 - E

Zonotopes for Uncertainty Modeling

- Initial state uncertainties and control input uncertainties are modeled using zonotopes, which allow efficient representation and propagation of uncertainty in high-dimensional spaces.
- The method involves defining zonotopes for the initial set $X_0$ and input set $U$, which are then visualized and sampled for generating trajectories.

Sampling-Based Simulation

- It is a method to simulate the system dynamics and disturbances by sampling the initial state and input sets.
- The smaples are generated from the points within the zonotopes. The center of the zonotope is the ideal point, and the generators represent the uncertainty.

Linear Model Fitting

- The linear model is trained using the sampled data points to predict the system dynamics.
- It maps the initial states to input states from start to end time steps.
- This simplifies the complex dynamics into a linear form for reachability analysis.
- The training and testing datasets ensure that the model's generalization capability is assessed, with errors quantified to ensure the approximation's reliability and also prevent overfitting.

Reachable Set Calculation

- The linear model is used to compute reachable sets $R_x$ and $R_u$, considering the combined effect of the initial uncertainties and control inputs.
- The Minkowski sum of these sets is visualized to represent the system's reachable states after $N_s$ time steps.

Why is the reachable set much larger than the actual sampled final states?

- Because the reachable set represents the theoretical bounds of states that can be achieved under the given control constraints and dynamics, whereas the actual sampled final states are a subset of this set, determined by the specific sampled trajectories.
- These control sequences may not fully explore the entire space of possible inputs u.
- If we apply the edge control inputs, we may see the final states reaching the boundary of the reachable set, but the actual states may not reach that boundary due to the sampling limitations.
