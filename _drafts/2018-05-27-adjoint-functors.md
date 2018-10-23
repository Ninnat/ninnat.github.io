---
layout: post
title: Induction of representations as an adjoint functor
subtitle:
date: 2018-05-27
categories:
  - Representation theory
  - Category theory
tags:
---

In representation theory, one comes across a general procedure called
*induction* that creates a representation of a group from a
representation of its subgroup. The concept has tremendous utility, but
that is not what this post is about. Take a look at one of the
definitions and ask yourself why induction is defined in this way: given
a representation $(\krep,W)$ of a subgroup $K$ of a group $G$, the
representation $\ind{\krep}{K}{G}$ induced from $(\krep,W)$ is the space
of right-$K$-covariant functions $f:G \to W$ such that for every
$k \in K$ and $g \in G$,[^1]
$$\begin{align}
    f(gk) = \krep(k^{-1}) (f(g)),
\end{align}$$
($\sigma(k^{-1})$ is acting on $f(g) \in W$),
with the action
$$\begin{aligned}
    \ind{\krep}{K}{G}(g)f(x) = f(g^{-1}x).
\end{aligned}$$
We will also write $\ind{W}{K}{G}$ when we want to emphasize the vector space. When
it is clear what is the group and the subgroup, we will simply write
$\ind{\krep}{}{}$ or $\ind{W}{}{}$.

It is not at all obvious what this definition accomplishes. For example,
one might hope that the restriction of $\ind{\krep}{}{}$ back to $K$
gives the original representation $\krep$, or that $\ind{\krep}{}{}$ is
irreducible if $\krep$ is irreducible. Both of these statements turn out
to be false in general. In fact, given an arbitrary representation of $K$, it might
not even be possible to find a representation of $G$ with such
properties. For induction to be an inverse of the restriction, for
example, induction must preserve the dimension. But $G$ may not have any
representation with the same dimension as $\krep$.

A hint as to why the construction is useful comes from looking at
intertwiners—in this case, intertwiners to $\ind{\krep}{}{}$. From the
definition of induction, one can prove the *Frobenius reciprocity*
theorem:
$$\begin{align}
    \text{Hom}_G (\rep,\ind{\krep}{K}{G}) \simeq \text{Hom}_K (\res{\rep}{G}{K},\krep),
\end{align}$$
where $\res{\rep}{G}{K}$ is the restriction of a $G$-representation
$\rep$ down to $K$. In category theory, this reciprocal relation means
that induction is a (right) *adjoint* of restriction, a "best
approximation" to being an inverse of restriction. The adjective
"right\" indicates that $\ind{\krep}{}{}$ appears in the right slot of
$\text{Hom}_G$. So from the categorical[^2] point of view, we have
approached induction the wrong way. We should start from something like
"induction should be some kind of an inverse to restriction" and then
derive the definition (1). This is the goal of this post.

You may notice that I said "one of the definitions" above. There is
another, generally non-isomorphic definition of
induction—let's call it *coinduction*—as a left adjoint of
restriction:
$$\begin{aligned}
    \text{Hom}_G (\coind{\krep}{K}{G},\rep) \simeq \text{Hom}_K (\krep,\res{\rep}{G}{K}).
\end{aligned}$$
We will see that both induction and coinduction have simpler
descriptions involving tensor products of modules. The choice between
induction and coinduction arises naturally because one needs to choose
to take the tensor product either from the left or from the right, as
they are not the same for non-commutative modules.

## Categories

A class of objects and morphisms between them is a *category* if the composition of morphisms is again a morphism, the composition of morphisms is associative: $(f \circ g) \circ h = f \circ (g \circ h)$, and there is an identity morphism $1$. Note that there is no "internal structure" to the objects. All the essential definitions are in the morphisms.

 The collection of morphisms between objects $X$ and $Y$ in the category is denoted by $\text{Hom}(X,Y)$.

A *category* $\mathcal{C}$ is a class of objects and morphisms between them. If $X$ and $Y$ are *objects* in $\mathcal{C}$, the collection of *morphisms* between $X$ and $Y$ is denoted by $\text{Hom}(X,Y)$. They are also represented diagrammatically as arrows $f:X \to Y$ for $f \in \text{Hom}(X,Y)$. For $\mathcal{C}$ to be a category, there must be a identity morphism and the compositions of morphisms must be associative. Here are some categories.

- **Set** of all sets. Since there is no set of all sets ([Russell's paradox](https://en.wikipedia.org/wiki/Russell%27s_paradox)), the word "class" in the definition of a category cannot be replaced by "set". The morphisms are arbitrary maps between sets.
- **Grp** of all groups, **Ring** of all rings, and **Field**${}_p$ of all fields with [characteristic](https://en.wikipedia.org/wiki/Category_of_rings#Category_of_fields) $p=0$ or a prime number with the respective homomorphisms as morphisms. (There is no homomorphism between fields of different characteristics.)
- **Top** of topological spaces with continuous maps as morphisms. In particular, homeomorphisms are isomorphisms.
- **Man**$^{\infty}$ of smooth manifolds with infinitely differentiable maps as morphisms. In particular, diffeomorphisms are isomorphisms.
- **Vec**${}_k$ of vector spaces over a field $k$ with linear maps as morphisms.
- **Rep**$(G)$ of representations of a group $G$ with intertwiners as morphisms.

[^1]: For Lie groups, the definition requires additional analytical
    quantifiers. For instance, in the definition in Knapp's *Lie Groups: Beyond Introduction* 2nd ed. for compact Lie groups, the subgroup $K$ needs to be (topologically) closed and eq. (1) only need to be true for almost
    every pair $k \in K$ and $g \in G$.

[^2]: I use "categorical" in a mathematical context to mean "related to
    category theory"
