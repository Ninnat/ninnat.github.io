---
layout: post
title: What is coherent about group coherent states?
subtitle:
date: 2019-02-05
categories:
  - Quantum theory
  - Represention theory
tags:
---

*Epistemic status: exposition*

People dread when I talk about [group orbits](http://mathworld.wolfram.com/GroupOrbit.html) of quantum states as generalized coherent states. They wonder: what do these have in common with the good old Schrödinger and Glauber–Klauder–Sudarshan coherent states that everyone knows and loves from quantum optics? In this blog post, I want to expand slightly upon the three ways to generalize the notion of coherent states presented in
- [Coherent states: Theory and some applications](https://journals.aps.org/rmp/abstract/10.1103/RevModPhys.62.867), Zhang, Feng and Gilmore (1990) [paywalled]

The three generalizations are:
1. Coherent states as eigenstates of lowering operators
2. Coherent states as minimum-uncertainty states
3. Coherent states as an orbit of some fiducial state under a group action

> [...]  the adoption of this definition to generalize the concept of the coherent state has two major drawbacks, the first mathematical and the second physical:
(a) Coherent states cannot be defined in Hilbert spaces of finite dimensionality in this way. In particular, this would preclude the construction of coherent states for compact Lie groups (Perelomov, 1972). Furthermore, states defined in this way have few useful properties and
in particular they are not computationally useful.
(b) The states so defined do not correspond to physically realizable states, except under the special circumstance that the commutator of the annihilation operator (or lowering step operator) and its Hermitian adjoint is a multiple of the identity operator. Therefore, under these conditions one restricts oneself to the electromagnetic field.

> [...] this generalization has several limitations.  First of all, these coherent states can only be constructed for the classically integrable systems in which there exists a set of canonical coordinates and momenta such that the respective Hamiltonians can be reduced to quadrature. This condition requires a flatness condition on the Lie algebra, which reduces the commutation relations to those of the standard photon creation and annihilation operators. Secondly, the wave packets with minimum uncertainty are not unique (see Fig. 1). Different ones may have different properties. Such states may also be incomplete, or even if they are complete it is not certain that a resolution of unity of the standard
form exists (Klauder and Skagerstam, 198S). Thus minimum-uncertainty states appear to have few, if any, useful properties. For example, minimum-uncertainty states do not evolve into minimum-uncertainty states when they are driven by a Hamiltonian linear in the generators in the Lie group.

There is an obvious first answer: the canonical coherent states are also a group orbit, specifically an orbit of the vacuum under the phase-space displacement operators
$ D(\alpha) = \exp (\alpha a\dgg - \alpha^* a), \alpha \in \C$
which, together with complex phases, form a group
$$\begin{align}
  D(\alpha)D(\beta) = e^{(\alpha\beta^* - \alpha^* \beta)/2} \, D(\alpha + \beta), &&
  D^{-1}(\alpha) = D(-\alpha).
\end{align}$$
However, if that is the sole reason to generalize coherent states, it is not obvious anything good will come out of it. So let us look for a better answer.

Advantages of define coherent states according to this definition:
- If the chosen representation is unitary (all representations of compact groups can be made unitary), GCSs can be prepared if the fiducial state can be prepared: just by applying $U(g)$ for some $g \in G$. The implementation might not be easy in practice, but neither is it forbidden by the barebone quantum theory.

- This connects to a subtle but more interesting point that GCSs are stable under the $G$-action. Remember that Schrödinger invented because he wanted *classical* states, more precisely quantum states that would satisfy Bohr's classical-quantum correspondence principle in some way.

  - [Displacement operator by beam splitter](http://qinf.fisica.unimi.it/~paris/PDF/displa.pdf), Matteo Paris (1996)

- Another point: by Schur's lemma, the coherent states form a frame
$$
  \int d\Omega\, \ketbra{\Omega}{\Omega} = \frac{\id}{d}
$$

These counter-examples come from this paper:

II.



- *Coherent states as eigenstates of annihilation operators*--I admit that this is the option that I haven't thought too hard about. Nilpotent group?
