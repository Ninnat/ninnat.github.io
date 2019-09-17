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

*Representation theory is Fourier analysis* (substantially generalized). Given a representation $V$ of a group $G$, it decomposes (under some assumptions on $G$ and $V$) into a direct sum of irreducible parts
$$V \underset{G}{\cong} \bigoplus_j \bigoplus^{n_j} V_j $$
with $n_j$ copies of each isomorphic irreducible representation (*irrep*) $V_j$. The canonical Fourier analysis is such a decomposition when the left hand side is the group algebra (introduced below) of $\R$ or $\SO(2) \cong \U(1)$ (for periodic functions) and can be generalized to a large class of groups.

In this post, I want to talk about the decomposition of representations of the form $\End V = V^* \otimes V$, that is, linear operators over $V$, and in cases that $V$ is described more explicitly such as $V$ being a symmetric power $\Sym^k W$ of the defining representation of [classical groups](https://en.wikipedia.org/wiki/Classical_group#The_classical_groups) $A_n,B_n,C_n,D_n$. The decomposition of $\End V$ in the generic form (1) might very loosely count as a "Fourier analysis" but I will be more ambitious and try to relate such decomposition to actual Fourier analysis, more precisely the decomposition of functions on a space equipped with a $G$-action. As a teaser, for $\SO(3)$ we have that
$$\begin{align}
  \lim_{k\to\infty}\End (\Sym^k V) \underset{\SO(3)}{\cong} \bigoplus_{j=0}^{\infty} V_{2j+1},
\end{align}$$
where the right hand side contains *all* [spherical harmonics](https://en.wikipedia.org/wiki/Spherical_harmonics) without redundancy.

<div id="toc"></div>

# Categories of $G$-representations

## Morphisms

The standard way to introduce a representation of a group $G$ is as a pair $(\rho,V)$ of a vector space $V$ and a group homomorphism $\rho: G \to \GL(V)$. That is, for $g_1,g_2 \in G$, $\rho(g_1)$ and $\rho(g_2)$ are invertible matrices over a vector space $V$ such that the group structure is respected: $\rho(g_1)\rho(g_2) = \rho(g_1 g_2)$. Group homomorphisms are examples of ubiquitous structure-preserving maps or *morphisms* between mathematical objects. Morphisms for sets are arbitrary (total i.e. defined for all inputs) maps between sets. For vector spaces, we have linear operators. Of course, not only algebraic objects have morphisms. For example, for topological spaces and smooth manifolds, we have continuous maps and smooth maps respectively. (In particular, [homeomorphisms](https://en.wikipedia.org/wiki/Homeomorphism) are isomorphisms between topological spaces, and [diffeomorphisms](https://en.wikipedia.org/wiki/Diffeomorphism) are isomorphisms between smooth manifolds.)

Once we have objects and morphisms, we have a *category*. Formally, a **category** $\mathcal{C}$ is a class of objects and morphisms between them such that there is an identity morphism $1\circ f = f\circ 1 = f$ and the composition of morphisms is associative: $(f \circ g) \circ h = f\ \circ (g \circ h)$. It should be emphasized that all the information contained in the definition is about morphisms; the objects can be anything. The lesson here is that morphisms are as important, if not more, than the objects we want to study. What would be the morphisms in a category of $G$-representations? They are *$G$-equivariant maps* or *intertwiners*. Let $(\rho,V)$ and $(\sigma,W)$ be $G$-representations. A linear map $\varphi:V\to W$ is **$G$-equivariant** if it does not matter if one applies the transformation $g$ on the vector space first or $\varphi$ first. That is, $\varphi\circ\rho(g) = \sigma(g)\circ\varphi$ for all $g \in G$. Pictorially, we say that the following diagram "commutes".
<center>
<img src="/assets/img/2019/intertwiner.PNG" style="width: 250px;"/>
</center>

When $\rho=\sigma$, this just says that $\varphi$ commutes with $\rho(g)$ for all $g \in G$.
This is a pretty natural definition (and should be formalizable as a [natural transformation](https://en.wikipedia.org/wiki/Natural_transformation) in category theory) but can be made more obvious by thinking of $G$-representations as $k[G]$-*modules*.

### In terms of modules

The notion of a module generalizes that of a vector space by extending the multiplication by scalars to elements of a ring (such as matrices). Given a ring $R$ with an identity, a (left) **$R$-module** is an abelian group $M$ representing "vector addition", and a "scalar multiplication" $R \times M \to M$ a ring homomorphism from $R$ to the endomorphism ring $\End(M)$ that also respects the group addition; in equations,
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

### Schur's lemma

Intertwiners between irreps are completely characterized by **Schur's lemma**, a very basic (easily proved using a little linear algebra) but powerful result. Denote the space of intertwiners between $G$-representations $V$ and $W$ by $\Hom_G(V,W)$ (and $\End_G(V)$ if $V=W$).

**Lemma 1.** (Schur's lemma)

- (Burnside) *Every intertwiner between irreps is either an isomorphism or zero.*
- (Schur) *For $k$ algebraically closed, every intertwiner is of the form $k\id$. That is, $\End_G(V) = k$.* [^1]

It can summarized as follows: when $k$ is algebraically-closed, intertwiners between irreps behave like the Kronecker delta
$$\begin{align}
  \dim\Hom_G(V,W) \cong
  \begin{cases}
    1, V \cong W, \\
    0, V \not\cong W.
  \end{cases}
\end{align}$$


### The meaning of tensor operators
<!-- It will be convenient to use a more sophisticated definition later on (namely $G$-representations as $K[G]$-modules). To understand mathematical objects, we need to understand structure-preserving maps or *morphisms* between them.-->

I claim that one does not really understand the concept of [tensor operators](https://en.wikipedia.org/wiki/Tensor_operator) in physics until one understands intertwiners. Why? Because *tensor operators are, by definition, intertwiners*. This can be seen by unpacking the seemingly circular definition of tensor operators as "operators that act like tensors". For concreteness, let us think about one of the simplest non-trivial cases of a *vector operator*. Let $(R,\R^3)$ be the defining representation of $\SO(3)$ and $\mathbf{r} \in \R^3$. A **vector operator** $T(\mathbf{r})$ has components $T_j \coloneqq T(\mathbf{r}_j):V\to W, j=1,2,3$ that are linear maps between irreps $(\rho,V),(\sigma,W)$ of $\SO(3)$ (that is, $T_j \in\Hom(V,W) = V^* \otimes W$) such that the $G$-action on $\Hom(V,W)$ (a superoperator $\sigma\dgg(R) \circ \rho(R)$) induces a rotation of $\mathbf{r}$: [^2]
$$\begin{align}
  \sigma\dgg(R)T(\mathbf{r}_j)\rho(R) = R_j{}^k T(\mathbf{r}_k).
\end{align}$$
Writing this in the coördinate-independent form
$$\begin{align}
  \sigma\dgg(R)T(\mathbf{r})\rho(R) = T(R\mathbf{r}),
\end{align}$$
one can see that $T$ is nothing but a linear map that makes the following diagram commutes!
<center>
<img src="/assets/img/2019/wigner-eckart.PNG" style="width: 300px;"/>
</center>

By Schur's lemma, $T$ is an isomorphism between $(R,\R^3)$ and its copy within $\Hom(V,W)$ (if the latter exists). [^3] This justifies how we label the components of the image $T_j$ in the same way we label the components of a vector $\mathbf{r} \in \R^3$. More generally, $\R^3$ can be replaced by any
irrep $U$ of $\SO(3)$.

Does anyone remember what [the Wigner-Eckart theorem](https://en.wikipedia.org/wiki/Wigner%E2%80%93Eckart_theorem) says in the form usually taught in a quantum mechanics class? Not me. But the Wigner-Eckart theorem is simply Schur's lemma applied to the intertwiners between $U$ and $\Hom(V,W)$; the basis-independence of the "reduced matrix element" is just the statement that the tensor operator is proportional to the identity $T = c\id$ (because it commutes with every $G$-action because it is $G$-equivariant) in the block isomorphic to the irrep $U$.

For us, a generalization of *spherical tensor operators* will prove convenient to provide a *weight* (of a Lie algebra)-operator basis for the space of linear operators.

## Functors

### The restriction functor

The reason for introducing $G$-representations as a category is that now I can talk about maps between categories: *functors*.

### Adjoint functors

[preorder](https://en.wikipedia.org/wiki/Preorder) [^1], a category with only one morphism $x\to y$, which can be though of as a comparison $x\le y$. For example, the product in this category is the infimum and the coproduct is the supremum. A functor between two preorders $A$ and $B$ is a *monotone function* if it is an order-preserving map
$$ x \le_A y \implies f(x) \le_B f(b). $$
A pair of monotone functions $f$ and $G$ is an *adjoint pair* if they satisfy the *Galois connection*:
$$ f(a) \le_B b \iff a \le_A g(b). $$
Suppose, for instance, that $A = B = \mathbb{N}$, the natural numbers. The monotone function $x \to 2x$ has no inverse but it does have right and left adjoints: the ceiling $\lceil x/2 \rceil$ and the floor $\lfloor x/2 \rfloor$ respectively. The notion of Galois connection generalizes to that of [adjunction](https://en.wikipedia.org/wiki/Adjoint_functors), an example of which in re

### Tensor-Hom adjunction

Given a group $G$ and its subgroup $H\subset G$, any representation $V$ of $G$ can be restricted to $V\bigr|{}_H$ of $H$. (Restriction of an irrep is not necessarily irreducible. Think of the restriction to an abelian $H$.)

### The induction functor

### As a free functor

# Tensor product representations

# Fourier analysis

## A little algebraic geometry

## The Borel subgroup

## Geometric multiplicity-free condition

### Borel-Weil

The Borel-Weil theorem states that every irreducible representation of a Lie group $G$ is "holomorphically" induced from the torus.

### Hermitian symmetric spaces

[^1]: The assumption that $k$ is algebraically closed is necessary. Consider a representation of $\Z_4$ on $\R^2$ as discrete rotations with the generator
$\rho(1) = \begin{pmatrix}
0 & -1 \\
1 & 0
\end{pmatrix}$.
It is irreducible because $\rho(1)$ cannot be diagonalized over $\R$. But every $\rho(g)$ commutes with matrices of the form $a\id + b\rho(1)$ for some $a,b \in \R$, a two-dimensional real vector space.

[^2]: We think of $R$ as both a rotation matrix (the defining representation of $\SO(3)$) and an abstract group element. We also assume the [Einstein summation convention](https://en.wikipedia.org/wiki/Einstein_notation).

[^3]: Why can't there be more than one copy of $(R,\R^3)$ in $\Hom(V,W)$? Because every tensor product $V\otimes W$ of irreducible $\SO(3)$-representations decomposes *without multiplicity*. Wigner gave a characterization of some of these so-called *simply reducible groups* which was then [generalized by Mackey](https://projecteuclid.org/euclid.pjm/1103039895).
