# Tutorial 1 - E

Zonotopes

- A special type of polytope with a center and generators.
- A Minkowski sum of the line segments.
- symmetric to the center.
- convex polytope.

Minkowski sum

- The sum of two sets in the Euclidean space, which can count in linear time.

Minkowski sum of two zonotopes

- Add the centers, c_sum = c1 + c2.
- Add the generators, g_sum = hstack(g1, g2).

Interval Hull

- To reduce the number of generators in the zonotope.
- Over-approximation of the zonotope.
- New generator is a diagonal matrix.
- Upper left is the sum of the first elements of the generators.
- Lower right is the sum of the second elements of the generators.

Why we need to reduce the number of generators?

- The generator will grow exponentially with the number of Minowski sum and will lead to a high memory usage.
- Reduce the complexity of the computation.

The reachable set of a uncertain linear system

- If there is a solution of the system that starts from the initial set I and satisfies the system constraints, then we can say that the system is reachable.

Over-approximation

- The reachable set we get is larger than the actual reachable set.
- If no unsafe set is in the over-approximation, then we can sure that there is no unsafe set in the actual reachable set.

Conservative approximation
$$\Phi_r(Z)\subseteq e^{rA}Z+\Box(\beta_r)$$

$$e^{rA}$$

- State transition matrix
- Compute the reachable set after r time steps
- Propagate the set Z over r time steps

$$\Box(\beta_r) = \{x\in \mathbb{R}^n \;|\; ||x|| \leq \beta_r\}$$

- To bloated the reachable set
