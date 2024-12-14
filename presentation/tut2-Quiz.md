# Tutorial 2 - Quiz

1. Differential Dynamic Programming (DDP)

- DDP can handle safety constraints natively.
  - ==Incorrect==
  - DDP does not natively handle constraints, including safety constraints.
  - Constraints are often handled by augmenting the method with additional techniques like penalty methods, barrier functions.

- DDP is based on a linearization of constraints and quadraticization of the objective function to obtain a QP.
  - ==Correct==
  - DDP uses local linearization of the system dynamics and quadraticization of the cost function around the current nominal trajectory. This allows the algorithm to iteratively solve a sequence of simpler Quadratic Programming (QP) problems.
  - Differen  tial Dynamic Programming (DDP) is an iterative method used for solving nonlinear optimal control problems.
  - It involves linearizing the dynamics and quadraticizing the cost function, but it does not directly solve a Quadratic Program (QP) in each iteration. Instead, it solves a sequence of Riccati-like equations to update the control policy.

- Actuation constraints can be encoded as additional nonlinearity in the dynamics model.
  - ==Correct==
  - Actuation constraints, such as torque limits, can be incorporated into the dynamics model, making the model nonlinear and allowing DDP to handle these constraints during the optimization process.

- DDP requires twice continuously differentiable constraint and objective functions.
  - ==Correct==
  - The second-order derivatives are used to compute the Hessian of the cost function and the constraints, which are essential for solving the QP subproblems in DDP.

2. The given optimization problem is:

$$
\min x^T Q x \\
\text{s.t. } Ax \leq B
$$

where:

- \( Q \) is positive definite.
- \( A = \begin{bmatrix} -10 & 0 & 1 \\ 2 & 3 & 1 \end{bmatrix} \)
- \( B = \begin{bmatrix} -3 \\ 2 \\ 1 \end{bmatrix} \)

The problem is infeasible, converges to a local minimum, feasible or non-convex?

- ==is feasible==
- For a linear constraint set to be feasible, there must exist at least one vector x that satisfies all the constraints. This means $Ax ≤ B$ must have a solution. We can do this by checking if the feasible region is non-empty.
- The objective function $x^T Q x$ is quadratic. Since Q is positive definite, this is a convex(凸性) objective. The constraint set defined by linear inequalities is also convex. Therefore, this is a convex optimization problem.
- Due to convexity, any local minimum is also a global minimum, so the problem converges to a global minimum.

3. $$ 
minimize \space x^4 - 6x^3 + x^2 + 3x + 1 \\
\text{subject to:} \\
\begin{bmatrix} 1 \\ -1 \end{bmatrix} x \leq \begin{bmatrix} 5 \\ 2 \end{bmatrix}
$$

To solve this problem, you use a gradient-based optimization scheme with a small stepsize (e.g. steepest descent). You initialize the optimizer with an initial guess of $x_0 = 5$. Which of the following statements are true?

- The solution does not exist.
  - ==Incorrect==
  - The function f(x) is continuous, and the constraint $−1≤x≤5$ forms a compact (closed and bounded) domain. According to optimization theory, a solution exists for a continuous function over a compact domain.
- The solution will converge to a global minimum.
  - ==Correct==
  - $f'(x)=4x^3−18x^2+2x+3$, $f'(x) = 0, when \space x = -0.34, 0.5, 4.34$. From the graph of the function, we can see that the global minimum is at x = 4.34. Since the function is continuous and the domain is compact and we start from x = 5, the optimizer will converge to the global minimum.
- The problem is non-convex.
  - ==Correct==
  - A function is convex if its second derivative $f''(x)≥0$ for all x in the domain. However, The sign of $f''(x) = 12x^2-36x+2$ changes with 𝑥, meaning the function is not convex.
- The solution will converge to a local minimum.
  - ==Incorrect==
  
4. Choose the correct statements about sampling-based motion planning algorithms:

- Complete algorithms are also resolution complete.
  - ==Incorrect==
  - Complete algorithms guarantee finding a solution if one exists, while resolution completeness only guarantees finding a solution if one exists within the discretization or resolution of the sampling.
  - A complete algorithm is not necessarily resolution complete.
- Introducing bias into sampling means that the sampling-based motion planning algorithm will necessarily loose probabilistic completeness.
  - ==Incorrect==
  - Introducing bias in sampling (e.g., to guide the search toward specific areas) does not necessarily eliminate probabilistic completeness.
  - Probabilistic completeness is retained as long as the biased sampling ensures coverage of the entire state space as the number of samples increases.
  - As long as the bias doesn't eliminate the possibility of exploring the entire configuration space, probabilistic completeness can be maintained.
- Only uniform sampling can be dense.
  - ==Incorrect==
  - Various sampling strategies can achieve dense coverage of the configuration space.
- RRT* is probabilistically complete and asymptotically optimal.
  - ==Correct==
  - It has two key properties: probabilistic completeness and asymptotic optimality.
  - Probabilistic completeness: As the number of samples approaches infinity, the probability of finding a solution approaches 1.
  - Asymptotic optimality: As the number of samples increases, the found solution converges to the optimal solution.

5. Consider the following RRT* tree with a new sample (x_rand = x_new). The radius around x_new shows the near area within which nodes are considered for rewiring. How does the tree look like after x_new is connected to it and after rewiring?
- Adding the new sample x_new to the tree.
- Checking the near radius around x_new for potential rewiring.
- Updating the tree structure by rewiring to lower-cost paths through x_new.

6. Choose the correct statements about sampling-based motion planning algorithms for systems with differential constraints:

- Kinodynamic planning cannot be done with sampling-based motion planning approaches.
  - ==Incorrect==
  - Sampling-based motion planning algorithms (e.g. RRT#) can handle systems with differential constraints, such as kinodynamic planning.
- Nonholonomic planning cannot be done with sampling-based motion planning approaches.
  - ==Incorrect==
  - Nonholonomic systems, which have constraints on their velocities (e.g., a car-like robot), can be planned using sampling-based approaches.
  - Algorithms like RRT and PRM (Probabilistic Roadmaps) can be extended to account for nonholonomic constraints, often by incorporating a steering function or sampling valid trajectories.
- In phase space, just like in configuration space, it is always a good idea to use Euclidean distance to define the nearest state.
  - ==Incorrect==
  - Euclidean distance is often inappropriate in phase space (state + velocity) because it does not account for the dynamics of the system.
  - For systems with differential constraints, metrics that account for the dynamics (e.g., time or control effort) are usually more suitable.
- Having to solve the Boundary Value Problem is one of computational bottlenecks of sampling-based planning.
  - ==Correct==
  - (Determining a feasible trajectory between two states given the system's dynamics.)

8.Feedback motion primitives:

- Linearization error cannot be considered in construction of feedback motion primitives for nonlinear systems.
  - ==Incorrect==
  - Linearization errors can be considered when constructing feedback motion primitives for nonlinear systems.
- To be able to chain two feedback motion primitives, the outlet of the first motion primitive (reachable set after execution) has to be a subset of the inlet of the subsequent motion primitive.
  - ==Correct==
- The multi-step control design attempts to compute the control inputs for a few time steps as a function of the initial state.
  - ==Correct==

9. The system is represented by the state-space equation:

$$
x_{k+1} = \begin{bmatrix} 10 & 0 \\ 0 & -3 \end{bmatrix} x_k + \begin{bmatrix} 0 \\ 1 \end{bmatrix} u_k
$$

What is the minimum number of steps required for a multi-step feedback controller to control the given system?

- A system is said to be controllable if, given any initial state, there exists a control input that can steer the system to any desired final state in a finite number of steps.
- For a linear time-invariant (LTI) system like the one given, a necessary and sufficient condition for controllability is that the controllability matrix, Cm, has full rank.
- $A = \begin{bmatrix} 10 & 0 \\ 0 & -3 \end{bmatrix}$, $B = \begin{bmatrix} 0 \\ 1 \end{bmatrix}$
- Controllability matrix: $[B, AB] = \begin{bmatrix} 0 & 0 \\ 1 & -3 \end{bmatrix}$
- Rank(Cm) = 1 < 2, so the system is not controllable.