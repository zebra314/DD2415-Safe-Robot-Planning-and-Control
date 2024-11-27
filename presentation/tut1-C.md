# Tutorial 1 - C

The obstacle model

- First order integrator model.
- Uniform distribution with multiple variables(two axes).
- Using the ellipse to cover 90% of the distribution and a zonotope to enclose the ellipse.

Linear Quadratic Regulator (LQR)

- A method to control the system (find the close loop K) by minimizing the cost function.
- $$J = \int_{t=0}^{T} (x_t^T Q x_t + u_t^T R u_t)dt$$
- Use Q to penalize the state and R to penalize the control input.
- Consider the trade-off between the state and control input.

How to deal with the uncertainty in the system?

- Add the disturbance to the system(inflatten the zonotope) and make sure the new zonotope includes all the possible states.

How to check the collision with the obstacle?

- First, compute the zonotope of the robot and the obstacle, then check whether these two zonotopes intersect.

In the system function, what does the A and B matrix represent?

- A is the state transition matrix, representing how system evolves by time without control input.
- B represents how the control input affects the system.
- By adjusting A and B, we can choose how the system been optimized, like to better track the reference or to reduce the control input.

How to extend to the more complex system, like multiple obstacles?

- Compute the reachable set of each obstacle and check the collision with each of them.

What is the limitation of LQR?

- It is difficult to handle the non-linear and time-varying system.
- Rely on the model of the system.
- The cost to compute the zonotope in high dimension is high.
