---
layout: post
title: Fourier analysis of linear operators [Draft]
subtitle:
date: 2019-09-17
categories:
  - Representation theory
tags:
---

<!-- There are many ways to make new representations from ones. $V\otimes V$, $\Sym^k V$, $\wedge^k V$, the space of polynomials over $V$, or induction.-->

Representation theory is Fourier analysis (substantially generalized). Given a representation $V$ of a group $G$, it decomposes (under some assumptions on $G$ and $V$) into a direct sum of irreducible parts
$$V \underset{G}{\cong} \bigoplus_j \bigoplus^{n_j} V_j $$
with $n_j$ copies of each isomorphic irreducible representation (*irrep*) $V_j$. A Fourier transform is a linear map

# Categories of representations

The standard way to introduce a representation of a group $G$ is as a pair $(\rho,V)$ of a vector space $V$ and a group homomorphism $\rho: G \to \GL(V)$. That is, for $g_1,g_2 \in G$, $\rho(g_1)$ and $\rho(g_2)$ are invertible matrices over a vector space $V$ such that the group structure is respected: $\rho(g_1)\rho(g_2) = \rho(g_1 g_2)$. Group homomorphisms are examples of ubiquitous structure-preserving maps or *morphisms* between mathematical objects. Morphisms for sets are arbitrary (total i.e. defined for all inputs) maps between sets. For vector spaces, we have linear operators. Of course, not only algebraic objects have morphisms. For example, for topological spaces and smooth manifolds, we have continuous maps and smooth maps respectively. (In particular, [homeomorphisms](https://en.wikipedia.org/wiki/Homeomorphism) are isomorphisms between topological spaces, and [diffeomorphisms](https://en.wikipedia.org/wiki/Diffeomorphism) are isomorphisms between smooth manifolds.) Once we have objects and morphisms, we have a *category*. Formally, a **category** $\mathcal{C}$ is a class of objects and morphisms between them such that there is an identity morphism $1\circ f = f\circ 1 = f$ and the composition of morphisms is associative: $(f \circ g) \circ h = f\ \circ (g \circ h)$. It should be emphasized that all the information contained in the definition is about morphisms; the objects can be anything. The lesson here is that morphisms are as important, if not more, than the objects we want to study.

What would be the morphisms in a category of $G$-representations? They are *$G$-equivariant maps* or *intertwiners*. Let $(\rho,V)$ and $(\sigma,W)$ be $G$-representations. A linear map $\varphi:V\to W$ is **$G$-equivariant** if it does not matter if one applies the transformation $g$ on the vector space first or $\varphi$ first. That is, $\varphi\circ\rho(g) = \sigma(g)\circ\varphi$ for all $g \in G$. Pictorially, we say that the following diagram "commutes".
<center>
<img src="/assets/img/2019/intertwiner.png" style="width: 300px;"/>
</center>

When $\rho=\sigma$, this just says that $\varphi$ commutes with $\rho(g)$ for all $g \in G$.
This is a pretty natural definition (and should be formalizable as a [natural transformation](https://en.wikipedia.org/wiki/Natural_transformation) in category theory) but can be made more obvious by thinking of $G$-representations as $k[G]$-*modules*. The notion of a module generalizes that of a vector space by extending the multiplication by scalars to elements of a ring (such as matrices). Given a ring $R$ with an identity, a (left) **$R$-module** is an abelian group $M$ representing "vector addition", and a "scalar multiplication" $R \times M \to M$ a ring homomorphism from $R$ to the endomorphism ring $\End(M)$ that also respects the group addition; in equations,
$$\begin{align}
  1m &= m, \\
  (r+s)m &= rm + sm, \\
  (rs)m &= r(sm), \\
  r(m+n) &= rm + rn,
\end{align}$$
for all $r,s \in R$ and $m,n \in M$. Now the ring $k[G]$ is the matrix ring formally spanned by $g \in G$ over a field $k$ with the convolution product * inherited from the group multiplication:
$$\begin{align}
  \left(\sum_{g_1}f_{g_1} g_1 \right) * \left(\sum_{g_2}h_{g_2} g_2 \right) = \sum_{g_1,g} f_{g_1} h_{g_1^{-1}g} g.
\end{align}$$
 In fact, it is not just a ring but also an algebra (because it is a vector space) called the **group algebra**. Given a $G$-representation, the span of $\rho(g)$ gives a $k[G]$-module. Conversely, given a $k[G]$-module, there is a vector space $V$ over $k$ (because $k\id \in k[G]$), on which the $G$-action gives a group homomorphism $G \to \GL(V)$, that is, a representation. In this language, intertwiners are linear maps that commute with multiplication by scalars in $k[G]$. In other words, they are simply *$k[G]$-linear maps*, generalizing the fact that linear operators (all of which commute with the scalars) are morphisms in the category of vector spaces.

All intertwiners between irreps are characterized by **Schur's lemma**. The space of intertwiners between $G$-representations $V$ and $W$ is denoted by $\Hom_G(V,W)$. Schur's lemma says that, when $k$ is algebraically-closed, intertwiners between irreps behave like the Kronecker delta
$$\begin{align}
  \dim\Hom_G(V,W) \cong
  \begin{cases}
    1, V \cong W, \\
    0, V \not\cong W.
  \end{cases}
\end{align}$$
**Lemma.** *(Schur's lemma)*
- (Burnside) Every intertwiner between irreps is either an isomorphism or zero.
- (Schur) For $k$ algebraically closed, $\End_G(V) = k$. That is, every intertwiner is of the form $k\id$. [^1]

<!-- It will be convenient to use a more sophisticated definition later on (namely $G$-representations as $K[G]$-modules). To understand mathematical objects, we need to understand structure-preserving maps or *morphisms* between them.-->

## "Tensor operators" and the Wigner-Eckart theorem

Given a group $G$ and its subgroup $H\subset G$, any representation $V$ of $G$ can be restricted to $V\bigr|{}_H$ of $H$. (Restriction of an irrep is not necessarily irreducible. Think of the restriction to an abelian $H$.)

## Restriction and induction functors

It is easy to describe what restriction to a subgroup $H\subset G$ does to a $G$-representation.

A regular representation is a *free representation*.


  A useful trick (that I learned from Qiaochu Yuan's [answer](https://math.stackexchange.com/a/25515)) to understand anything in category theory is to first consider as a toy model a [preorder](https://en.wikipedia.org/wiki/Preorder) [^1], a category with only one morphism $x\to y$, which can be though of as a comparison $x\le y$. For example, the product in this category is the infimum and the coproduct is the supremum. A functor between two preorders $A$ and $B$ is a *monotone function* if it is an order-preserving map
  $$ x \le_A y \implies f(x) \le_B f(b). $$
  A pair of monotone functions $f$ and $G$ is an *adjoint pair* if they satisfy the *Galois connection*:
  $$ f(a) \le_B b \iff a \le_A g(b). $$
  Suppose, for instance, that $A = B = \mathbb{N}$, the natural numbers. The monotone function $x \to 2x$ has no inverse but it does have right and left adjoints: the ceiling $\lceil x/2 \rceil$ and the floor $\lfloor x/2 \rfloor$ respectively. The notion of Galois connection generalizes to that of [adjunction](https://en.wikipedia.org/wiki/Adjoint_functors), an example of which in representation theory is [Frobenius reciprocity](https://en.wikipedia.org/wiki/Frobenius_reciprocity).

## Lie algebra and dual representations

# Borel-Weil

The Borel-Weil theorem states that every irreducible representation of a Lie group $G$ is "holomorphically" induced from the torus.

[^1]: The assumption that $k$ is algebraically closed is necessary. Consider a representation of $\Z_4$ on $\R^2$ as discrete rotations with the generator
$$\begin{align*}
\rep(e) = \begin{pmatrix}
0 & -1 \\
1 & 0
\end{pmatrix}.
\end{align*}$$
It is irreducible because $\rho(id)$ cannot be diagonalized over $\R$. But every $\rho(g)$ commutes with matrices of the form $a\id + b\rho(id)$ for some $a,b \in \R$, a two-dimensional real vector space.
