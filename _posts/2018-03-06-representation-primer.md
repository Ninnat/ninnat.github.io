---
layout: post
title: Representation Theory Primer
subtitle: Basic definitions, Schur's lemma, and Fourier analysis
date: 2018-03-06
categories:
  - representation theory
tags:

---

*As a general warning, these primers are mainly here just to set up notations and introduce basic definitions and facts that I will refer to in my main posts, so they are a bit lacking in motivation.

The following is adapted from Chapter 2 of my thesis, which is an introduction to the representation theory of Lie groups and their associated homogeneous spaces.*

Group representations are a special kind of group homomorphisms.  A *group homomorphism* between two groups is a map $\varphi:G \to G'$
that respects the group composition law: $$\begin{aligned}
\varphi(g_1)\varphi(g_2) &= \varphi(g_1 g_2)\end{aligned}$$ for all
$g_1,g_2 \in G$. This implies, among other things, that if $e$ is the
identity element of $G$, then $\varphi(e)$ is the identity element of
$G'$, and $\varphi(g)^{-1} = \varphi(g^{-1})$. The *kernel* $\ker \varphi$ of a
homomorphism $\varphi$ is the set of elements of $G$
that are sent to the identity element.

A *representation* of a group $G$ is a homomorphism from $G$ to
$\gr{GL}{V}$, the group of all invertible matrices on $V$,
$$\begin{aligned}
\rep: G \to \gr{GL}{V}.\end{aligned}$$
We also say that $(\rep,V)$ is a
$G$-representation. When no confusion arises, we also call the vector space $V$ itself a
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
representation with the generator [^1]
$$\begin{aligned}
\rep(e) &= \begin{pmatrix}
1 & 1 \\
0 & 1
\end{pmatrix},\end{aligned}$$
which cannot be diagonalized. A
representation $V$ is *completely reducible* if for any
subrepresentation $W \subset V$, there is a complementary
subrepresentation $W'\subset V$ such that $V \simeq W \oplus W'$.

As every vector space comes with the dual space, every representation comes with the dual representation. Recall that the
dual space $V^*$ of a complex vector space is the vector space of all
linear maps from $V$ to $\mathbb{C}$. Since $V^*$ and $V$ have the same
dimension, they are isomorphic as vector spaces $V^* \simeq V$ but not
naturally. (We do not assume the Hermitian inner product structure for a
moment.) Nevertheless, if we pick an ordered basis $\{ \ket{v_j} \}$, an
isomorphism amounts to the transposition---simply flipping the ket
$\ket{v_j}$ to the bra $\bra{v_j}$. The *dual representation*
$(\rep^*,V^*)$ of a representation $(\rep,V)$ can be defined in [several ways](https://math.berkeley.edu/~reb/courses/261/31.pdf), which can be quite confusing. We follow Fulton and Harris [^2] and define the *right action* $\bra{u} \rep^*(g)$ so that
$$\begin{aligned}
(\bra{u} \rep^* (g) ) (\rep(g) \ket{v}) &= \braket{u|v},
\end{aligned}$$
for all $\ket{u},\ket{v} \in V$ and $g \in G$. (The inverse is necessary
to make $\rep^*$ a group homomorphism.) Note that if we want to turn the
right action to the *left action* on $u$, the matrix
representation of $\rep^*(g)$ is given by the transpose
$\rep^T(g^{-1})$ so that $\bra{u} \rep^*(g) = \bra{\rep^T(g^{-1})u}$.

A representation is *unitary* if it is equivalent to a representation in which every $\rep(g)$ is a unitary
operator, $$\begin{aligned}
\rep\dgg (g) \rep(g) &= \id,\end{aligned}$$ where $\rep\dgg (g)$ is the
entry-wise complex conjugate transpose of $\rep(g)$. For a unitary
representation, the right-action version of the dual representation
coincides with the *Hermitian dual representation* $\rho\dgg (g)$, while
the left-action version coincides with the *complex conjugate
representation*. High energy physicists like to use the latter, signifying the dual representation by an overbar.

## Intertwiners and Schur's lemma

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
</center>
<!-- $$\begin{aligned}
\xymatrix{V\ar[r]^{\varphi}\ar[d]_{\rep_1(g)} & W\ar[d]^{\rep_2(g)} \\
    V\ar[r]^{\varphi} & W}\end{aligned}$$-->
In other words, $\varphi$
commutes with the $G$-action: $$\begin{aligned}
\varphi \rep_1 (g) &= \rep_2 (g) \varphi.\end{aligned}$$
The set of all
such intertwiners forms a subspace of $\text{Hom}(V,W)$ denoted by
$\text{Hom}_G (V,W)$ or, again, $\text{End}_G (V)$ when
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
    \end{cases}
\end{aligned}$$

**Lemma** (Schur):

1.  Every intertwiner between irreps of $G$ is either an isomorphism or
    zero,

2.  For a finite-dimensional irrep $V$ in an algebraically closed field
    $K$, $\text{End}_G (V)$ is proportional to the identity operator,
    $\text{End}_G (V) = k\id$, $k \in K$.

*Proof.* The first observation is proved by noting that the image and the kernel
of an intertwiner are subrepresentations. If either is nontrivial, then
the irrep has a nontrivial subrepresentation, which is a contradiction.

For the second observation, let $\varphi \in \text{End}_G (V)$ and
$\lambda$ be an eigenvalue (which exists because $K$ is algebraically
closed). Consider $\varphi - \lambda \id$. It is also in
$\text{Hom}_G (V)$ because $\id$ commutes with every operator on $V$.
But $\ker (\varphi - \lambda \id)$ is a subrepresentation. Therefore
$\varphi - \lambda \id$ must be the zero map i.e.
$\varphi = \lambda \id$. $\square$

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

Another consequence of Schur's lemma is the "orthogonality of matrix elements.

**Theorem**: Let $G$ be a finite group and $d_{\lambda}$ be the dimension of an irrep $\rep_{\lambda}$ of $G$.
$$\begin{aligned}
    \frac{1}{|G|} \sum_g  \rep_{\lambda}(g)_{jk} \left( \rep_{\lambda'}(g)_{mn} \right)^*
    &= \frac{1}{d_{\lambda}} \delta_{\lambda \lambda'} \delta_{jm} \delta_{kn}
    \end{aligned}$$
That is, the matrix elements
$(d_{\lambda} / |G|)^{1/2} \rep_{\lambda}(g)_{jk}$ of irreps are
orthonormal as functions over $G$.

*Proof*. For any linear map $A:V_{\lambda'} \to V_{\lambda}$, its twirl
$$\begin{aligned}
    \frac{1}{|G|} \sum_{g \in G} \rep_{\lambda}(g) A \rep_{\lambda'}(g^{-1})
\end{aligned}$$
is an intertwiner between the two irreps. Therefore,
by Schur's lemma, it is either proportional to the identity or the zero
operator. Setting $A = \ketbra{k}{n}$,
$$\begin{aligned}
    \frac{1}{|G|} \sum_{g \in G} \rep_{\lambda}(g) \ketbra{k}{n} \rep_{\lambda'}(g^{-1})
    &=  N \delta_{\lambda \lambda'} \id_{d_{\lambda}},
\end{aligned}$$
Taking the trace gives $N = \delta_{kn}/d_{\lambda}$
and taking the $j,m$ matrix element gives the desired result. $\square$

## Every finite-dimensional representation of a compact group is unitary and completely reducible

Any finite-dimensional representation of a compact group, possessing a
Haar measure, is unitary. A measure $dg$ on $G$ is a *Haar measure* when
it is left-invariant i.e. for any integrable function $f$,
$$\begin{aligned}
\int dg_1 f(g_2 g_1) &= \int dg_1 f(g_1),\end{aligned}$$
and normalized,
$$\begin{aligned}
\int dg &= 1.\end{aligned}$$
For a compact group, it is unique and also
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

## Isotypic decomposition

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
    V_{\mu} \otimes V_{\nu} &\stackrel{G}{\simeq} \bigoplus_{\lambda \in \hat{G}} V_{\lambda} \otimes \mathbb{C}^{n^{\lambda}_{\mu\nu}}.
\end{aligned}$$
The collection of $\lambda$ that appears in the direct sum is called the
*Clebsch-Gordan series*, and the overlap between vectors in
$V_{\mu} \otimes V_{\nu}$ and vectors in $V_{\lambda}$ are
*Clebsch-Gordan coefficients*. When $G$ is a unitary group, the $n^{\lambda}_{\mu\nu}$ are called *Richardson-Littlewood coefficients*.

## Fourier analysis

For a finite group $G$, define an orthonormal basis
$\{\ket{g}|g\in G\}$. Its complex span, the *group algebra*
$\mathbb{C}[G]$, is an algebra (a vector space in which two vectors can
be multiplied) with multiplication $*$ inherited from group
multiplication $\ket{g_1}*\ket{g_2} = \ket{g_1g_2}$: $$\begin{aligned}
\left( \sum_{g_1} f_{g_1} \ket{g_1} \right) * \left( \sum_{g_2} h_{g_2} \ket{g_2} \right)
&= \sum_{g_1,g_2} f_{g_1} h_{g_1^{-1} g} \ket{g}.\end{aligned}$$ Here
the expression on the right is a discrete analogue of the convolution
$(f*h)(x) = \int dy f(x)h(y-x)$. $\mathbb{C}[G]$ can also be naturally
thought of as a representation of $G$ by left multiplication
$\rep_L(g_1) \ket{g_2} = \ket{g_1 g_2}$, called the *left regular
representation* $(\rep_L,\mathbb{C}[G])$, or right multiplication
$\rep_R(g_1)\ket{g_2} = \ket{g_2 g_1^{-1}}$, called the *right regular
representation* $(\rep_R,\mathbb{C}[G])$. When $G$ is infinite, we can
interpret $\mathbb{C}[G]$ to be the convolution algebra of functions on
$G$, provided that we agree on what we mean by a function. The standard
choice is for $\mathbb{C}[G]$ to be $L^2(G)$, the space of
square-integrable functions. The group action on a function is dual to
the action on group algebra, $$\begin{aligned}
\rep(g)f(x) &= f(g^{-1} x),\end{aligned}$$ $x \in G$, since a function
is a linear map from $G$ to $\mathbb{C}$.

A central result in representation theory is
the isotypic decomposition of $\mathbb{C}[G]$:
$$\begin{aligned}
\mathbb{C}[G] &\stackrel{G}{\simeq} \bigoplus_{\lambda \in \hat{G}} V_{\lambda} \otimes \text{Hom}_G (V_{\lambda},\mathbb{C}[G])
\stackrel{G}{\simeq} \bigoplus_{\lambda \in \hat{G}} V_{\lambda} \otimes \mathbb{C}^{\dim V_{\lambda}}.
\end{aligned}$$
In words, every irrep appear as many times as its dimension in the regular representation.
Since the left and right representations commute,
$\mathbb{C}[G]$ can also be thought of as a representation of
$G \times G$. Under this $G \times G$-action, $\mathbb{C}[G]$ decomposes
in the multiplicity-free manner:
$$\begin{aligned}
\label{eq:regular decomposition}
\mathbb{C}[G] \stackrel{G \times G}{\simeq} \bigoplus_{\lambda \in \hat{G}} V_{\lambda} \otimes V_{\lambda}^*
\stackrel{G \times G}{\simeq} \bigoplus_{\lambda \in \hat{G}} \text{End}(V_{\lambda}),
\end{aligned}$$
where the representation $(\rep_L \otimes \id, G\times G)$ acts on
$V_{\lambda}$ and $(\id \otimes \rep_R, G\times G)$ acts on $V_{\lambda}^* $. The result is sometimes a part of so-called **Maschke's theorem** and can be proved entirely in the language of semisimple algebras [^3]. Another route (which I took in my thesis) is to use [*Frobenius reciprocity*](http://math.uchicago.edu/~may/REU2015/REUPapers/Chaves.pdf).

The unitary change of basis from $\{\ket{g}\}$ to an orthonormal basis
on the right hand side of \eqref{eq:regular decomposition} is the *Fourier transform*. Its explicit matrix form, given an orthonormal basis
$\{\ket{\lambda,j,k}|1\le j,k\le d_{\lambda}\}$ for each
$V_{\lambda} \otimes V_{\lambda}^* $, is
$$\begin{aligned}
\label{Fourier transform:unitary}
U_{\text{FT}} &= \sum_{g \in G} \sum_{\lambda \in \hat{G}} \sum_{j,k=1}^{d_{\lambda}} \sqrt{\frac{d_{\lambda}}{|G|}} \rep_{\lambda}(g)_{jk} \ketbra{\lambda,j,k}{g} = \sum_{g\in G} \ketbra{\tilde{g}}{g},
\end{aligned}$$
$\ket{\tilde{g}}$ being the Fourier transform of the discrete delta
function $\ket{g}$: $$\begin{aligned}
\label{Fourier transform}
\ket{\tilde{g}} &= \sum_{\lambda \in \hat{G}} \sum_{j,k=1}^{d_{\lambda}} \sqrt{\frac{d_{\lambda}}{|G|}} \rep_{\lambda}(g)_{jk} \ket{\lambda,j,k}.
\end{aligned}$$
(Note the choice of the constant $1/\sqrt{|G|}$, akin to using
$1/(2\pi)$ in the continuous Fourier transform, is necessary for
$U_{\text{FT}}$ to be unitary).

For the cyclic group $\mathbb{Z}_n$, this is just the discrete Fourier
transform
$$\begin{aligned}
\label{Fourier transform:Z_n}
U_{\text{FT}} = \frac{1}{\sqrt{n}} \sum_{x,y=0}^{n-1} e^{2\pi ixy/n} \ketbra{y}{x}.  
\end{aligned}$$
More generally, for any abelian group, $$\begin{aligned}
\label{Fourier transform:abelian}
\ket{\tilde{g}} &= \frac{1}{\sqrt{|G|}} \sum_{\lambda \in \hat{G}} \chi_{\lambda}(g) \ket{\lambda},
\end{aligned}$$
where $\chi_{\lambda}(g)$ is a one-dimensional irrep of $G$, also called
an *(irreducible) [character](https://en.wikipedia.org/wiki/Character_theory)*. The Fourier transform on an abelian group is much more well-behaved than
the general case because the collection of all distinct irreps $\hat{G}$
also comes equipped with the abelian group structure.
$$\begin{aligned}
\chi^{-1}(g) &= \chi(g^{-1}) = \chi^* (g) \\
\chi(g_1)\chi(g_2) &= \chi(g_1 g_2).
\end{aligned}$$
In this case,
$\hat{G}$ is called the *dual group*. The *[compact-discrete duality](https://en.wikipedia.org/wiki/Pontryagin_duality)*
states that $\hat{G}$ is compact if $G$ is discrete and vice versa. Familiar dual pairs are
$G = \hat{G} = \mathbb{Z}_d$, $G = \hat{G} = \mathbb{R}$, and
$G = \gr{U}{1}$ dual to $\hat{G} = \mathbb{Z}$.

For compact groups, we have the celebrated

**Theorem** (Peter-Weyl):
For a compact Lie group $G$ and $V_{\lambda}$ its irrep,
the orthogonal direct sum
$\bigoplus_{\lambda \in \hat{G}} V_{\lambda} \otimes V_{\lambda}^*$ is
dense in $L^2(G)$ with respect to the supremum norm
$||f||_{\infty} = \sup |f(g)|$. Moreover, every $V_{\lambda}$ is
finite-dimensional.

In other words, every function in $L^2(G)$ can be approximated
arbitrarily closely in the supremum norm by a finite linear combinations
of the matrix elements
$\{ \sqrt{d_{\lambda}} \rep_{\lambda}(g)_{jk} \}$. Thus, the matrix elements are not only orthonormal but also complete. This is a generalization of Fourier analysis and orthogonal polynomials and special functions to arbitrary groups.

[^1]: Not to be confused with physicists'
(infinitesimal) "generators\" of a Lie group which are Lie algebra
elements

[^2]: Page 4 of William Fulton and Joe Harris, *Representation Theory: A First Course*, Springer, 1999

[^3]: Pavel Etingof *et al.*,
*Introduction to Representation Theory*, AMS, 2011
