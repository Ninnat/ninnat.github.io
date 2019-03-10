---
layout: post
title: Harmonic analysis of linear operators
subtitle:
date: 2019-01-07
categories:
  - Representation theory
tags:
---

*Epistemic status: the math is correct for specific examples, but the interpretation is speculative.*

Suppose that we have a classical state space $X$ namely a [phase space](https://en.wikipedia.org/wiki/Phase_space). Functions on $X$ (such as the energy) can be thought of as classical observables. Sometimes we need to be rigorous about what we mean by a "function", but for now let us leave that aside and denote the space of "functions" on $X$ by $F(X)$.

Everybody knows that a quantum state space is a complex Hilbert space $\C^{d+1}$ (the reason for the +1 will be clear in a moment), or rather the pure states are normalized vectors in $C^{d+1}$. Alternatively, we say that the quantum state space is the [complex projective space](https://en.wikipedia.org/wiki/Complex_projective_space) $\C P^d = (\C^{d+1} - \{0\})/\C$ [^1].

Let us put the two together and declare that $X$ can be any [complex submanifold](https://en.wikipedia.org/wiki/Complex_manifold) of $\C P^d$. This might sounds really weird; even though it makes some vague sense that a classical state space would be *some* strict submanifold of a quantum state space, but an arbitrary submanifold can be very large. In fact, we include the possibility that $X$ is the entire $\C P^d$ itself. I hope to come back to this point in a future post, but let just say for now that $X$, being a complex submanifold of $\C P^d$, is automatically [Kähler](https://en.wikipedia.org/wiki/K%C3%A4hler_manifold) and thus has (more than) the [symplectic](https://en.wikipedia.org/wiki/Symplectic_manifold) structure of a classical phase space.

## 1. Covariant frames

I have been thinking a lot about *group-covariant frames*. A [*frame*](https://en.wikipedia.org/wiki/Frame_(linear_algebra)) for a vector space $V$ is just a spanning set of $V$, but they sometimes have physical meaning when $V$ is related to the quantum state space $\C^{d+1}$. A frame for $\C^{d+1}$ itself gives a rank-one quantum measurement. A frame for $\End(\C^{d+1}) = (\C^{d+1})^* \otimes \C^{d+1}$ consists only of [positive operators](https://en.wikipedia.org/wiki/Definiteness_of_a_matrix) gives an informationally-complete measurement. A frame doesn't have to be covariant, but many useful ones do. A set $X$ is *$G$-covariant* if a group $G$ acts transitively on $X$. That is, for any pair $x,y \in X$, there is $g \in G$ that brings $x$ to $y$: $y=gx$. In other words, a $G$-covariant set is nothing but a $G$-orbit. <!-- (Note that we are not interested whether there is a group $G$ that acts on $X$ transitively. There is always such a group: the permutation group of $X$).--> Usually the transitive $G$-action can be described efficiently and for that reason simplifies our problem. For example, the discrete [Weyl-Heisenberg group](https://en.wikipedia.org/wiki/Heisenberg_group) leads to explicit constructions of various useful frames in quantum information processing such as [MUBs](https://en.wikipedia.org/wiki/Mutually_unbiased_bases), [SIC-POVMs](https://en.wikipedia.org/wiki/SIC-POVM), and higher [complex projective designs](https://en.wikipedia.org/wiki/Quantum_t-design).

Me using $X$ for both a covariant frame and a classical state space was intentional. In many (all?) cases, the $G$-orbit has a complex structure as a submanifold and thus can be thought of as a state space.
In my work, I have stumbled upon the identity
$$ F(X) = \lim_{N\to\infty} \End (\Sym^N V_{\lambda})$$
admittedly based on anecdotal observations when $X$ are [spherical varieties](https://en.wikipedia.org/wiki/Spherical_variety) based on [simple Lie groups](https://en.wikipedia.org/wiki/Simple_Lie_group). (There is a technical reason to focus on spherical varieties, but a lot of them are [symmetric spaces](https://en.wikipedia.org/wiki/Symmetric_space) and I hope you will see in this blog post the description of $F(X)$ is especially nice when $X$ is a symmetric space. I also realize it is better to think of the complexified version of the symmetric space and the corresponding [Iwasawa decomposition](https://en.wikipedia.org/wiki/Iwasawa_decomposition)) In the past few months, I can't quite put into words what this identity *means*. Let me try in this blog post.


Recently I have come to believe that for my purpose I should think of $\End(\C^{d+1})$ as "[projectivized](https://en.wikipedia.org/wiki/Projectivization)" $\C^{d+1}$ instead.

Instead, Baez proposing, let us start with a [complex projective variety](https://en.wikipedia.org/wiki/Projective_variety#Complex_projective_varieties) $\C P^n \subset \C^{n+1}$, then take a smallest subspace in $V \subset \C^{n+1}$ whose [projectivized](https://en.wikipedia.org/wiki/Projectivization) space $\mathbb{P}V$ contains $M$ to be its quantization
$$ Q(M) = V. $$
Projectivization gives back
$$ P(V) = M $$

In this way, we have the category ``Class`` of classical state spaces and ``Quant`` of quantum state spaces and a pair of adjoint functors between them, (Note that at this point [Part 3](https://johncarlosbaez.wordpress.com/2018/12/27/geometric-quantization-part-3/), these categories only have the structure of [posets](https://en.wikipedia.org/wiki/Partially_ordered_set).)


[^1]: Arguably, the notion of a quantum superposition is more natural in terms of $C^{d+1}$; it's just vector addition.
