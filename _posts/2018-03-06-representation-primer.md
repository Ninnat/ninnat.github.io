---
layout: post
title: Representation Theory Primer (basic definitions, Schur's lemma, unitary representation, isotypic decomposition)
subtitle:
date: 2018-03-05
categories:
  - representation theory
tags:
---
<!-- First published: *5 Mar 2018*; Status: *In progress* -->

A *group homomorphism* between two groups is a map $\varphi:G \to G'$
that respects the group composition law: $$\begin{aligned}
\varphi(g_1)\varphi(g_2) &= \varphi(g_1 g_2)\end{aligned}$$ for all
$g_1,g_2 \in G$. This implies, among other things, that if $e$ is the
identity element of $G$, then $\varphi(e)$ is the identity element of
$G'$, and $\varphi(g)^{-1} = \varphi(g^{-1})$. The *kernel* of a
homomorphism $\varphi$, $\ker \varphi$, is the set of elements of $G$
that are sent to the identity element.

A *representation* of a group $G$ is a homomorphism from $G$ to
$\gr{GL}{V}$, the group of all invertible matrices on $V$,
$$\begin{aligned}
\rep: G \to \gr{GL}{V}.\end{aligned}$$ We also say that $(\rep,V)$ is a
$G$-representation. When no confusion arises, we also call $V$ a
representation. A representation $\rep$ is said to be *faithful* if the
map $\rho$ is one-one. A *subrepresentation* is a subspace of $V$ stable
under $G$ i.e. closed under every $\rep(g)$. An *irreducible
representation* or *irrep* for short is one that has no nontrivial
subrepresentation.

A reducible representation may not decompose as a direct sum of
subrepresentations. This is true even for a single matrix. A matrix
always has at least one eigenvector in $\mathbb{C}$ but it may not be
diagonalizable. For instance, the group of integers with addition as
group multiplication $(\mathbb{Z},+)$ has a two-dimensional
representation with the generator (not to be confused with physicists'
(infinitesimal) "generators\" of a Lie group which are Lie algebra
elements) $$\begin{aligned}
\rep(e) &= \begin{pmatrix}
1 & 1 \\
0 & 1
\end{pmatrix},\end{aligned}$$ which cannot be diagonalized. A
representation $V$ is *completely reducible* if for any
subrepresentation $W \subset V$, there is a complementary
subrepresentation $W'\subset V$ such that $V \simeq W \oplus W'$.

Every representation comes with the dual representation. Recall that the
dual space $V^*$ of a complex vector space is the vector space of all
linear maps from $V$ to $\mathbb{C}$. Since $V^*$ and $V$ have the same
dimension, they are isomorphic as vector spaces $V^* \simeq V$ but not
naturally. (We do not assume the Hermitian inner product structure for a
moment.) Nevertheless, if we pick an ordered basis $\{ \ket{v_j} \}$, an
isomorphism amounts to the transposition---simply flipping the ket
$\ket{v_j}$ to the bra $\bra{v_j}$. The *dual representation*
$(\rep^*,V^*)$ of a representation $(\rep,V)$ is defined by the *right
action* $\rep^*(g) \bra{u} = \bra{u} \rep(g^{-1})$, so that
$$\begin{aligned}
( \rep^*(g) \bra{u}) (\rep(g) \ket{v}) &= \braket{u|v},\end{aligned}$$
for all $\ket{u},\ket{v} \in V$ and $g \in G$. (The inverse is necessary
to make $\rep^*$ a group homomorphism.) Note that if we want to turn the
right action to the *left action* on $\ket{u}$, the matrix
representation of $\rep^*(g)$ is given by the transpose
$\rep^T(g^{-1})$.

A representation is *unitary* if it is equivalent to a representation in which every $\rep(g)$ is a unitary
operator, $$\begin{aligned}
\rep\dgg (g) \rep(g) &= \id,\end{aligned}$$ where $\rep\dgg (g)$ is the
entry-wise complex conjugate transpose of $\rep(g)$. For a unitary
representation, the right-action version of the dual representation
coincides with the *Hermitian dual representation* $\rho\dgg (g)$, while
the left-action version coincides with the *complex conjugate
representation*. Both conventions are used by physicists.

For complex vector spaces $V$ and $W$, define $\text{Hom}(V,W)$ to be
the vector space of linear maps (linear homomorphisms) from $V$ to $W$.
When $V = W$, this space is also denoted by $\text{End}(V)$
(endomorphisms). Naturally, $\text{Hom}(V,W) \simeq W \otimes V^*$. When
$V$ and $W$ are endowed with $G$-representations $\rep_1$ and $\rep_2$,
respectively, an *intertwiner* between $\rep_1$ and $\rep_2$ is defined
as a linear map $\varphi$ that makes the diagram below commutative for
any $g\in G$.
<center>
<img src="/assets/img/posts/03-2018/intertwiner.png" style="width: 200px;"/>
</center
<!-- $$\begin{aligned}
\xymatrix{V\ar[r]^{\varphi}\ar[d]_{\rep_1(g)} & W\ar[d]^{\rep_2(g)} \\
    V\ar[r]^{\varphi} & W}\end{aligned}$$-->
In other words, $\varphi$
commutes with the $G$-action: $$\begin{aligned}

\varphi \rep_1 (g) &= \rep_2 (g) \varphi.\end{aligned}$$ The set of all
such intertwiners forms a subspace of $\text{Hom}(V,W)$ denoted by
$\text{Hom}_G\allowbreak (V,W)$ or, again, $\text{End}_G (V)$ when
$V \simeq W$. Two representations $V$ and $W$ of $G$ are said to be
*equivalent* $$\begin{aligned}
V \stackrel{G}{\simeq} W\end{aligned}$$ when $\text{Hom}_G (V,W)$
contains an invertible intertwiner. In this case, they are related just
by a change of basis.

Schur proved a collection of elementary but very powerful observations
that, in an algebraically closed field $K$ (such as $\mathbb{C}$),
intertwiners between irreps behave like the Kronecker delta:
$$\begin{aligned}
\text{Hom}_G (V,W) \simeq
    \begin{cases}
        K, & V \simeq W, \\
        0, & V \not\simeq W.
    \end{cases}\end{aligned}$$

[\[lemma:schur\]]{#lemma:schur label="lemma:schur"} (Schur's lemma)

1.  Every intertwiner between irreps of $G$ is either an isomorphism or
    zero,

2.  For a finite-dimensional irrep $V$ in an algebraically closed field
    $K$, $\text{End}_G (V)$ is proportional to the identity operator,
    $\text{End}_G (V) = k\id$, $k \in K$.

The first observation is proved by noting that the image and the kernel
of an intertwiner are subrepresentations. If either is nontrivial, then
the irrep has a nontrivial subrepresentation, which is a contradiction.

For the second observation, let $\varphi \in \text{End}_G (V)$ and
$\lambda$ be an eigenvalue (which exists because $K$ is algebraically
closed). Consider $\varphi - \lambda \id$. It is also in
$\text{Hom}_G (V)$ because $\id$ commutes with every operator on $V$.
But $\ker (\varphi - \lambda \id)$ is a subrepresentation. Therefore
$\varphi - \lambda \id$ must be the zero map i.e.
$\varphi = \lambda \id$.

The assumption that $K$ is algebraically closed is necessary. Consider a
representation of $\mathbb{Z}_4$ on $\mathbb{R}^2$ as discrete rotations
with the generator $$\begin{aligned}
\rep(e) = \begin{pmatrix}
0 & -1 \\
1 & 0
\end{pmatrix}.\end{aligned}$$ It is irreducible because $\rep(e)$ cannot
be diagonalized over $\mathbb{R}$. But every $\rep(g)$ commutes with
matrices of the form $a\id + b\rep(e)$ for some $a,b \in \mathbb{R}$, a
two-dimensional real vector space.

An easy corollary is that every complex irrep of an abelian group is
one-dimensional because $\rep(g_1)$ and $\rep(g_2)$ commute for every
$g_1,g_2 \in G$. So they are all proportional to the identity operator.

Any finite-dimensional representation of a compact group, possessing a
Haar measure, is unitary. A measure $dg$ on $G$ is a *Haar measure* when
it is left-invariant i.e. for any integrable function $f$,
$$\begin{aligned}
\int dg_1 f(g_2 g_1) &= \int dg_1 f(g_1),\end{aligned}$$ and normalized,
$$\begin{aligned}
\int dg &= 1.\end{aligned}$$ For a compact group, it is unique and also
right-invariant $$\begin{aligned}
\int dg_1 f(g_1 g_2) &= \int dg_1 f(g_1).\end{aligned}$$ (Of course,
when $G$ is finite this is just a sum.) Armed with the Haar measure, if
$\rep(g)$ is not unitary under some sesquilinear inner product
$\braket{v|w}$, redefine the inner product to be the average
$\int dg \braket{\rep(g)v|\rep(g)w}$. This new inner product (which
amounts to a change of basis) can be seen to be invariant under the $G$-action: $$\begin{aligned}
\int dg_1 \braket{\rep(g_1)v|\rep^*(g_2) \rep(g_2)|\rep(g_1)w}
&= \int dg_1 \braket{\rep(g_2 g_1)v|\rep(g_2 g_1)w} \\
&= \int dg \braket{\rep(g)v|\rep(g)w}.\end{aligned}$$ where we have used
the left-invariance of the Haar measure. Thus unitarity is not an
additional assumption when we deal with compact groups. The existence of
an invariant inner product also provides an easy proof that every
finite-dimensional representation is completely reducible. Given a
subrepresentation $W$ of $V$, the orthogonal complement $W^{\perp}$ is
also stable under $G$. Therefore, $V \simeq W \oplus W^{\perp}$.

Let $\hat{G}$ be the collection of all inequivalent irreps of $G$. A
completely reducible representation (by definition) decomposes into the
orthogonal direct sum of irreps $V_{\lambda}$ $$\begin{aligned}
V &\stackrel{G}{\simeq} \bigoplus_{\lambda \in \hat{G}} \bigoplus^{n_{\lambda}} V_{\lambda},\end{aligned}$$
each with (possibly zero) *multiplicity* $n_{\lambda}$. A decomposition
is said to be *multiplicity-free* if every $n_{\lambda}$ is either 0 or
1. By Schur's lemma, $$\begin{aligned}
\text{Hom}_G (V_{\lambda},V) &= \bigoplus^{n_{\lambda}} \text{Hom}_G ( V_{\lambda}, V_{\lambda} ) = \mathbb{C}^{n_{\lambda}}.\end{aligned}$$
$\mathbb{C}^{n_{\lambda}}$ is called the *multiplicity space* where
$n_{\lambda} = \dim \text{Hom}_G (V_{\lambda},V)$. Putting these
together, we obtain the *isotypic decomposition* of $V$:
$$\begin{aligned}
V &\stackrel{G}{\simeq} \bigoplus_{\lambda \in \hat{G}} V_{\lambda} \otimes \mathbb{C}^{n_{\lambda}}
\stackrel{G}{\simeq} \bigoplus_{\lambda \in \hat{G}} V_{\lambda} \otimes \text{Hom}_G (V_{\lambda},V).\end{aligned}$$
An important special case is when $V$ is a tensor product of irreps. $V$
may not be irreducible and we have the *Clebsch-Gordan decomposition*
$$\begin{aligned}
    V_{\mu} \otimes V_{\nu} &\stackrel{G}{\simeq} \bigoplus_{\lambda \in \hat{G}} V_{\lambda} \otimes \mathbb{C}^{n^{\lambda}_{\mu\nu}}.\end{aligned}$$
The collection of $\lambda$ that appears in the direct sum is called the
*Clebsch-Gordan series*, and the overlap between a vector in
$V_{\mu} \otimes V_{\nu}$ and a vector in $V_{\lambda}$ is a
*Clebsch-Gordan coefficient*.
