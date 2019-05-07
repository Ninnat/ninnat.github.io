---
layout: post
title: Notebook: representation theory of Lie groups
subtitle:
date: 2019-04-08
categories:
  - Notebooks
tags:
---

*Epistemic status: thought process*

# Why so (semi)simple?

*God gave the Devil pretty much a free hand in building things, but told him to keep off certain objects to which He Himself would attend... Semisimple groups were among the special items.*

<div style="text-align: right"> Harish-Chandra, attributed to Claude Chevalley [^1] </div>

# Why linear representation?

Groups are things that act. [^2] The way I like to think about group representations is that they "linearize" group actions. A symmetry of a set $X$ is some particular permutation of its elements. Given a group element $g \in G$ and $x \in X$, we write the image of $x$ under the action of $g$ as $gx$. The action should respect the group structure:
$$\begin{align}
	1x &= x, & g_1 (g_2 x) &= (g_1 g_2)x,
\end{align}$$
for all $g_1,g_2 \in G$ and all $x \in X$, where $1$ is the identity element of the group. In other words, a *$G$-action* is a [group homomorphism](https://en.wikipedia.org/wiki/Group_homomorphism) from $G$ to the group $\mathrm{Aut} X$ of all symmetries of $X$. Any $G$-action partitions a set into a disjoint union of $G$-orbits. Thus, to study a group action, it suffices to study all of its orbits i.e. [transitive actions](http://mathworld.wolfram.com/TransitiveGroupAction.html). Every transitive action $Gx$ comes in the form of a group action on a coset space $G/G_x$ (of all right [cosets](https://en.wikipedia.org/wiki/Coset) $gG_x$),  where $G_x$ is a *stabilizer subgroup* of all elements in $G$ that leave $x$ fixed. This is the content of the [*orbit-stabilizer theorem*](https://gowers.wordpress.com/2011/11/09/group-actions-ii-the-orbit-stabilizer-theorem/). [^3]

In principle then, all one needs to do to study group actions is to study all possible subgroups of $G$. The problem is that "the subgroup structure of a group is *just horrible*." [^4] Take the cyclic groups $\mathbb{Z}_n$ for example. There is no uniform description of the subgroup structure for all $n$ since the subgroups correspond to the divisors of $n$. But irreps of every finite group correspond to [conjugacy classes](https://en.wikipedia.org/wiki/Conjugacy_class) of the group, all of which are singletons for commutative groups (not just cyclic groups!) [^5]

In general, one "linearizes" any $G$-action on $X$ by considering the (left) *permutation representation* $k[X]$ on the set $k^X$ of all functions $f$ on $X$ with values in the [field](https://en.wikipedia.org/wiki/Field_(mathematics)) $k$ [^6]
$$\begin{align}
	gf(x) &\coloneqq f(g^{-1}x).
\end{align}$$
(The inverse is required for the action to be a homomorphism.) Since one can add together functions and multiply them by scalars in $k$, $k^X$ has the structure of a vector space, having as a basis the indicator functions
$$\begin{align}
	\delta_y (x) &=
		\begin{cases}
			1, & x = y, \\
			0, & x \neq y.
		\end{cases}
\end{align}$$
Thus, the permutation representation of $G$ can be realized as matrices on $k^X$. [Fundamental](https://en.wikipedia.org/wiki/Maschke%27s_theorem) [results](https://en.wikipedia.org/wiki/Peter%E2%80%93Weyl_theorem) in representation theory of finite and compact groups states that when $X=G$ itself and $k$ is algebraically closed, these matrices simultaneously and uniquely (without multiplicity) block diagonalized into irreducible matrix representations of $G$
$$\begin{align}
  \C[G] \cong \bigoplus_{\lambda\in\hat{G}} \End V_{\lambda},
\end{align}$$
and every irrep of $G$ appears in the decomposition, $\hat{G}$ denoting the set of all $G$-irreps.

A miracle when $G$ is semisimple is that one can recover $G$ itself from $\hat{G}$! This is the subject of (classical) [Tannaka duality](http://web.science.mq.edu.au/~street/CT90Como.pdf).

### References

[^1]: Rebecca A. Herb, [*Harish-Chandra and His Work*](https://projecteuclid.org/euclid.bams/1183657040) 1991

[^2]: The notion of group first appeared in the late 18th centuries as permutations of roots of a polynomial that culminated in [Galois' unsolvability of quintics](https://en.wikipedia.org/wiki/Galois_theory). Not until the work of Cayley in 1854 that the abstract definition was given in terms of a set equipped with a certain kind of binary operation.  Indeed, by [Cayley's theorem](https://en.wikipedia.org/wiki/Cayley%27s_theorem), every finite group is a subgroup of some permutation group.

[^3]: For infinite groups, any coset space $G/K$ with $K$ a stabilizer subgroup is a homogeneous space with a smooth $G$-action because every stabilizer subgroup is (topologically) closed \cite[Theorem 3.26, p.36]{Kirillov}.

[^4]: Ian Grojnowski, *Representation Theory* in Timothy Gowers (ed.) *The Princeton Companion to Mathematics* 2008

[^5]: This follows from [Schur's lemma](https://en.wikipedia.org/wiki/Schur%27s_lemma).

[^6]: The size of $Y^X$ when $K$ is finite is $|Y|^{|X|}$ as suggested by the notation. For example, the number of functions from a set of $n$ alphabets taking values in $\mathbb{Z}_2$ is $2^n$. This set is nothing but $\{0,1\}^n$, the set of all bit strings of length $n$.
