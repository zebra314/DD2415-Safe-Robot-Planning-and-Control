# Tutorial 1 - A

Verification

- Analyze whether a system meets a specification (e.g., avoiding collisions).

Synthesis

- Design control strategies to ensure a system meets desired specifications.

Control Barrier Functions (CBF)

- CBFs ensure the robot stays within a safe, obstacle-free set.
- Static CBFs are time-invariant, while dynamic CBFs adjust over time based on obstacle movements.

Convex Hull

- The convex hull of obstacle trajectories can be used to define a conservative safe region.

Halfspaces

- Halfspaces represent linear constraints for the barrier functions.

Safety Filter

- A safety filter modifies the reference control input to ensure safety constraints are met while staying as close as possible to the reference input.
- The process is formulated as a quadratic program (QP).

Dynamic CBFs

- Time-varying CBFs adapt to obstacle movements, enabling less conservative behavior while ensuring safety.

What is the difference between the verification and synthesis processes?

- Verification involves analyzing if the system meets the desired specifications (e.g., avoiding collisions). Synthesis involves designing a control strategy to guarantee these specifications are met.

What is the purpose of Control Barrier Functions (CBFs)?

- CBFs ensure the robot remains within a safe set, preventing collisions with obstacles. They are used to enforce safety constraints during control synthesis.

How is a convex hull used in defining safety constraints?

- The convex hull of obstacle trajectories forms a conservative safe region. Its edges define linear constraints (halfspaces) that can serve as CBFs to avoid collisions.

Why is the static halfspace constraint considered conservative?

- It assumes the robot must stay within a fixed safe region, even when obstacles are far away, limiting the robot's movement unnecessarily.

What is the goal of a safety filter in control synthesis?

- The safety filter adjusts the reference control input to ensure the system satisfies safety constraints while deviating minimally from the reference input.

How is the safety constraint included in the optimization problem?

- The safety constraint is linearized and included in the optimization problem as an inequality, ensuring the control input satisfies the barrier function's invariance condition.

What are the benefits of using time-varying CBFs?

- Time-varying CBFs adapt to changes in the environment, allowing the robot to move closer to the goal while maintaining safety, reducing unnecessary conservatism.

How is the dynamic obstacle trajectory handled between discrete time steps?

- Linear interpolation is used to estimate the obstacle's position between time steps, creating a continuous trajectory for use in dynamic CBFs.

What are the requirements for a valid Control Barrier Function?

- A valid CBF must be continuous in time and continuously differentiable with respect to the system state and control input.

What is the objective of the quadratic program in the safety filter?

- The objective is to minimize the deviation from the reference control input while satisfying safety constraints, ensuring the robot follows the desired path safely.