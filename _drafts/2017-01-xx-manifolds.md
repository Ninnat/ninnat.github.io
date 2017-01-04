---
layout: post
title: Smooth manifolds
subtitle: Basic definitions
categories:
  - Geometry
tags:
---
Status: *in progress*

Some of my future posts will contain these ideas with a lot of hand-waving. This post is a future reference for those who can't tolerate hand-waving. Beware that this is much terser than the average blog post.

# Topology

While the defining property of discrete mathematical objects are often the kind of interactions between elements of a set (making it a group, ring, field, vector space, module etc.), in continuous mathematics one focus on subsets.

 In topology, one can get a lot of mileage out of the notion of open and closed sets. As you might know, a set can be open, closed, or both (clopen). ("Sets are not doors!") One can define an open map to be a map that maps any open set to an open set and one can define a closed map to be a map that maps any closed set to a closed set. It turns out that there are more useful things to do. A map is *continuous* if the pre-image of any open set is open, or equivalently, if the pre-image of any closed set is closed. This definition of continuity is exactly the same as the familiar one in $\mathbb{R}^{n}$ defined by sequences and their limits, and more elegant since it can be generalized to a space in which there is no *a priori* notion of norm or distance. (Why the pre-image? As you can verify by thinking of a constant map, for example, an open map or a close map is not necessary continuous.)

A *topological space* is a pair $\left(X,\mathcal{T}\right)$ of a set $X$ and a topology $T$ on $X$ i.e. a collection of subsets of $X$, called *open subsets*, with the following properties:

- $X$ and $\emptyset$ are open. (Thus, $X$ and $\emptyset$ are clopen.)
- A union of open sets is open.
- A finite intersection of open sets is open.

(Topological spaces can also be defined using [other set properties](https://en.wikipedia.org/w/index.php?title=Topological_space&oldid=756637885#Definition).)

A *homeomorphism* is a continuous bijection whose inverse is also continuous. We call a property that is invariant under a homeomorphism a *topological invariant*.

# Topological Manifolds

A topological space $M$ is a **topological manifold** of dimension $n$ (a topological invariant) if

* $M$ is Hausdorff. [^1]
* $M$ is second-countable i.e. it has a countable basis.
* $M$ is locally Euclidean i.e. $\forall p\in M$, there is an open set $U$ and a homeomorphism $\varphi$ to an open subset $\hat{U}$ of $\mathbb{R}^{n}$:

$$ \begin{aligned}
  \varphi:U  \to\hat{U} \subset \mathbb{R}^{n}.
\end{aligned} $$

Note that locally Euclidean spaces [may not be Hausdorff](https://en.wikipedia.org/w/index.php?title=Non-Hausdorff_manifold&oldid=756962961#Line_with_two_origins), so the first requirement is crucial. Some authors leave out the second-countability requirement.

# Smooth Manifolds

The notion of a topological manifold does not yet provide enough structure for doing calculus because smoothness is not a topological invariance. Warning: a bunch of definitions is coming. It seems more natural to me to build the definitions top-down rather than bottom-up from charts.

- A *smooth manifold* is a topological manifold $M$ of $n$ dimensions with a so-called smooth structure or a maximal smooth atlas.
- A *maximal atlas* is a maximal collection of charts that are all pairwise smoothly compatible and whose domain covers $M$.
- A **chart** is a pair $\left(U,\varphi\right)$ of an open subset $U\subset M$ and a homeomorphism $\varphi:M\to\varphi(U)\subset\mathbb{R}^{n}$.

Two charts $\left(U,\varphi\right),\left(V,\psi\right)$ are smoothly
compatible if $U\cap V=\emptyset$ (making the definition vacuous) or if the transition map $\psi\circ\varphi^{-1}:\varphi(U\cap V)\to\psi(U\cap V)$ is smooth, meaning that all of its partial derivatives of all orders exist and are continuous. This is the same as the definition of smoothness in calculus, as the transition map is a map from $\mathbb{R}^{n}$ to itself.

# Smooth Maps

We streamline the approach to define smooth transition maps to define smooth maps between manifolds.

A map $F:M\to N$ between smooth manifolds is a *smooth map* if for every $p\in M$, there exists smooth charts $\left(U,\varphi\right)$ containing $p$ and $\left(V,\psi\right)$ containing $F(p)$, $F(U)\subset V$ [^2] and the composite map $\psi\circ F\circ\varphi^{-1}$ is smooth from $\varphi(U)$ to $\psi(V)$.

-------------------------

## Appendix

What of the requirement $F(U)\subset V$? If it is left out, one would want to modify the definition so that $\psi\circ F\circ\varphi^{-1}$ needs only be smooth from $\varphi(U\cap F^{-1}(V))$, whose domain has to be in the pre-image of $V$, to $\psi(V)$. However, consider the function $f:\mathbb{R}\to\mathbb{R}$ with $$ \begin{aligned} f(x)  = \begin{cases} 1,\ \text{for} \ x \ge 0 \\ 0,\  \text{otherwise} \end{cases} \end{aligned} $$ which is not differentiable at the origin. Choose $U=(-1,1)$, and open $V$ with a closed pre-image, say, $V=\left(\frac{1}{2},\frac{3} {2}\right)$ and $\varphi=\psi=\mbox{Id}$. Then $\varphi\left(U\cap f^{-1}(V)\right)=\varphi\left((-1,1)\cap 0,\infty)\right)=[0,1)$, on which $\psi\circ f\circ\varphi^{-1}=f$ is certainly smooth, in conflict with the desired notion of smoothness. In fact, $f$ is not even continuous. The point is that, without the restriction, one can deliberately pick $V$ such that one doesn't see the discontinuity in its pre-image.

<!--
-------------------------
-->

[^1]: Given $p\neq q\in X$ a Hausdorff space, there exist open sets $U$ containing $p$ and $V$ containing $q$ such that $U\cap V=\emptyset$ i.e. any two points in $X$ can be separated. Why Hausdorff? Several reasons coming from our intuition of what constitutes a well-behaved space can be given. For example, if a space is not Hausdorff, a limit point may not be unique, and a finite subset may not be closed. Being Hausdorff also rules out the [trivial topology](https://en.wikipedia.org/w/index.php?title=Trivial_topology&oldid=651331293) (with more than one point).

[^2]: See [Appendix](#appendix) for a counterexample if this requirement is left out.
