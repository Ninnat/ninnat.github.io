---
layout: post
title: The Point of Semisimplicity
subtitle:
date: 2019-04-08
categories:
  - Representation theory
tags:
---

*Epistemic status: thought process*

*God gave the Devil pretty much a free hand in building things, but told him to keep off certain objects to which He Himself would attend... Semisimple groups were among the special items.*

<div style="text-align: right"> Harish-Chandra, attributed to Claude Chevalley [^1] </div>

In mathematics, an algebraic object that is irreducible in the sense that it does not contain a proper sub-object is often called "simple", and a sum of such simple objects are said to be "semisimple".

Application:

The assumption of semisimplicity is less restrictive than it might appear, as the Lie algebra of every compact connected Lie group is a direct sum of a semisimple commutator subalgebra and an abelian center: (Corrollary 1.56 of [knapp2002])
$$\g = [\g,\g] \oplus Z_{\g}.$$
The semisimple part, being equal to its own commutator, consists of traceless operators and the center consists of multiples of identity. In physicists' term, $Z_{\g}$ is the part of Hamiltonians in $\g$ that only shifts the zero of the energy and can be ignored.

Theoretical:

You break two symmetries in the standard semisimple theory: the first one by picking a Cartan subalgebra $\h$ and the second one by choosing a set $\Sigma^+$ of roots to be called positive.

A  **Cartan subalgebra** is a maximal set of commuting operators in the complexified $\g = \g^{\C}_0$ that are simultaneously diagonalizable. $\h_0 \subset \g_0$ is defined to be a real Cartan subalgebra if $\h = \h_0^{\C}$ is a Cartan subalgebra of $\g = \g_0^{\C}$. All Cartan subalgebras of $\g$ are conjugated by operators in $e^{\g}$ (but not necessary in $e^{\g_0}$) hence have the same (complex) dimension called the **rank** of $\g$.


### References

[^1]: Rebecca A. Herb, [*Harish-Chandra and His Work*](https://projecteuclid.org/euclid.bams/1183657040) 1991

[^2]: The notion of group first appeared in the late 18th centuries as permutations of roots of a polynomial that culminated in [Galois' unsolvability of quintics](https://en.wikipedia.org/wiki/Galois_theory). Not until the work of Cayley in 1854 that the abstract definition was given in terms of a set equipped with a certain kind of binary operation.  Indeed, by [Cayley's theorem](https://en.wikipedia.org/wiki/Cayley%27s_theorem), every finite group is a subgroup of some permutation group.

[^3]: For infinite groups, any coset space $G/K$ with $K$ a stabilizer subgroup is a homogeneous space with a smooth $G$-action because every stabilizer subgroup is (topologically) closed \cite[Theorem 3.26, p.36]{Kirillov}.

[^4]: Ian Grojnowski, *Representation Theory* in Timothy Gowers (ed.) *The Princeton Companion to Mathematics* 2008

[^5]: This follows from [Schur's lemma](https://en.wikipedia.org/wiki/Schur%27s_lemma).

[^6]: The size of $Y^X$ when $K$ is finite is $|Y|^{|X|}$ as suggested by the notation. For example, the number of functions from a set of $n$ alphabets taking values in $\mathbb{Z}_2$ is $2^n$. This set is nothing but $\{0,1\}^n$, the set of all bit strings of length $n$.
