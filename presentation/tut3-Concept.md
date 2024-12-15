# Tutorial 3 - Concept

## Labeled Transition System, LTS

- a tuple $T = (S, Act, δ, I, AP, L)$
  - $S$: a set of states
  - $Act$: a set of actions (events, inputs)
  - $δ$: a transition function, relation, $δ \in S*Act*S$
  - $I$: a set of initial states
  - $AP$: a set of atomic propositions (outputs)
  - $L:S\to2^{AP}$: a labeling function (output map)
    - it tells us which atomic propositions hold in each state
    - $AP$: a set of atomic propositions
    - $2^{AP}$: the power set (subset) of $AP$

## Linear(-time) Temporal Logic, LTL

- a logic for reasoning about the execution path of systems
- Consider the future execution path of a system. 
- Label states with atomic propositions that hold along the path at various points in time.
- Formulas
  - $φ ::= p \mid \neg φ \mid φ_1 \lor φ_2 \mid φ_1 \land φ_2 \mid φ_1 \to φ_2 \mid ⃝φ \mid □φ \mid ◇φ \mid φ_1 U φ_2 $
  - $ ⃝φ$ (next): φ holds in the next state
  - $□φ$ (always): φ holds in all future states
  - $◇φ$ (eventually): φ holds in some future state
  - $φ_1 U φ_2$ (until): φ2 holds in some future state and φ1 holds in all states up to that point
- Examples
  - $□(request \to ◇grant)$
  - $(□request) \to (◇grant)$
  - $□(request \to(request \space U grant))$
  - $□◇request \to □◇grant$
  - $-◇□-active$, not the case that eventually always not active
- Semantics, 語義
  - Let $ \pi = s_0s_1s_2...$ be an infinite sequence of states(=path)
  - $ \pi(i) = s_i$
  - $ \pi^i = s_is_{i+1}s_{i+2}...$
  - $s_i$ is the i-th state in the sequence
  - For each $s_i$, $L(s_i)$ is the set of atomic propositions, it indicates which atomic propositions hold in $s_i$
  - $ \pi \models φ$ means that the path $ \pi$ satisfies the formula $φ$
  - $ \pi, i \models φ$ means that the path $ \pi$ starting from $s_i$ satisfies the formula $φ$
  - $ \pi \models φ \iff φ \in L(s_0)$
  - $ \pi \models φ_1 U φ_2 \iff \exist j \geq i, s.t. \space \pi^j \models φ_2 \space \land \pi^i \models φ_1, \forall 1 \leq i < j$
  - $ \pi \models □φ \iff \forall i \geq 0, \space \pi^i \models φ$
  - $ \pi \models ◇φ \iff \exist i \geq 0, \space \pi^i \models φ$
  - $Fφ \equiv □φ \equiv true Uφ$
  - $Gφ \equiv ◇φ \equiv -F-φ$

## Automata, 自動機

- $\omega$-automata
  - accept infinite sequences of states

## Non-deterministic Finite Automaton, NFA

## Deterministic Finite Automaton, DFA

## Büchi Automaton

## Determinism

- For every state and every possible input, there is at most one next state the automaton can transition to.

## Completeness

- For every state and every possible input, there is at least one transition defined.

## References

- [YT video by Andrei Popescu - Introduction to LTL. Part 1: Basic Intuition](https://www.youtube.com/watch?v=a9fo3dUly8A)
