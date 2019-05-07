---
layout: post
title: Harmonic analysis of linear operators
subtitle:
date: 2019-01-07
categories:
  - Representation theory
tags:
---

*Epistemic status: fairly confident based on examples*

I've been writing a long paper on and off but the pace has been glacial. It is a physics paper (or so I hope) but at its heart is the correspondence between tensor operators and symmetry-adapted functions, not unlike the fact that the decomposition of three-by-three matrices
$$ \text{Trace} + \text{Antisymmetric} + \text{Traceless symmetric} $$
and the decomposition of functions on a sphere into $l=0,1,2$ spherical harmonics are merely different ways of looking at the same phenomena.

The first fact comes from the decomposition of the tensor product representation $3 \otimes 3 \underset{\SO(3)}{\cong} 1 \oplus 3 \oplus 5$


    Without someone else as a sounding board, I'm torn between

## The Setup

*Group-covariant frames* have several applications in quantum information processing. A [*frame*](https://en.wikipedia.org/wiki/Frame_(linear_algebra)) for a vector space $V$ is just a spanning set of $V$, but we can give them a physical meaning when $V$ is related to an inner product space $\C^d$ representing some quantum system. A frame for $\C^d$ itself gives a rank-one quantum measurement. A frame for $\End(\C^d) = \C^{d*} \otimes \C^d$ consists only of [positive operators](https://en.wikipedia.org/wiki/Definiteness_of_a_matrix) gives an informationally-complete measurement. A frame doesn't have to be covariant, but many useful ones do. A set $X$ is *$G$-covariant* if a group $G$ acts transitively on $X$. That is, for any pair $x,y \in X$, there is $g \in G$ that brings $x$ to $y$: $y=gx$. In other words, a $G$-covariant is a $G$-orbit. <!-- (Note that we are not interested whether there is a group $G$ that acts on $X$ transitively. There is always such a group: the permutation group of $X$).--> Usually the transitive $G$-action can be described efficiently and for that reason simplifies our problem. For example, the discrete [Weyl-Heisenberg group](https://en.wikipedia.org/wiki/Heisenberg_group) leads to explicit constructions of various useful frames such as [MUBs](https://en.wikipedia.org/wiki/Mutually_unbiased_bases), [SIC-POVMs](https://en.wikipedia.org/wiki/SIC-POVM), and higher [complex projective designs](https://en.wikipedia.org/wiki/Quantum_t-design).

The search space for covariant frames are well-structured,.

From now on let $G$ be a semisimple Lie group. Then every $G$-covariant frame has the geometry of a coset space $G/K$.

Our construction of a $G$-covariant frame begins with the decomposition of $\End\hilb$. For the even spinor irrep of $\hilb = 8_+$ of $\SO(8)$,
$$\begin{align}
	\End 8_+ \underset{\SO(8)}{\cong} 1 \oplus 28 \oplus 35_+.
\end{align}$$



<!-- Footnotes -->

<!-- [^1]: I just pulled a wool over your eyes. Quasi-probabilties need not be positive, but why are they real-valued? The answer has to do with the facts that, in quantum mechanics, the operators are defined over $\C$, and positive operators over $\C$ are automatically Hermitian. Thus, quasi-probability maps can always be restricted to maps from a *real* vector space of Hermitian operators to $\R$. -->
