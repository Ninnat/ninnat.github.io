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
with $n_j$ copies of each isomorphic irreducible representation (*irrep*) $V_j$. The canonical Fourier analysis is such a decomposition when the left hand side is the group algebra (to be introduced below) of $\R$ or $\SO(2) \cong \U(1)$ (for periodic functions) and can be generalized to a large class of groups.

In this post, I want to talk about the decomposition of representations of the form $\End V = V^* \otimes V$, the space of linear operators over $V$, especially when $V$ is a symmetric power $\Sym^k W$ of some irrep of [the classical groups](https://en.wikipedia.org/wiki/Classical_group#The_classical_groups) $A_n,B_n,C_n,D_n$. The decomposition of $\End V$ in the generic form (1) might very loosely count as a "Fourier analysis" but I will be more ambitious and find a decomposition that is as similar as possible to the canonical Fourier analysis (but now with non-abelian groups). In particular, there will be a space $X$ with symmetry group $G$ such that the space of functions on $X$ decomposes as $G$-representations *without multiplicity*, that is, $n_j$ is either 0 or 1. As a teaser, for $\SO(3)$ we have that
$$\begin{align}
  \lim_{k\to\infty}\End (V_{2k+1}) \underset{\SO(3)}{\cong} \bigoplus_{j=0}^{\infty} V_{2j+1} \cong L^2(S^2),
\end{align}$$
where $V_{2j+1}$ is the unique $(2j+1)$-dimensional ("spin-$j$") irrep of $\SO(3)$. The point is that the space of linear operators on the left contains *all* [spherical harmonics](https://en.wikipedia.org/wiki/Spherical_harmonics) without redundancy, and thus can be identified with the space of (square-integrable) functions on the sphere $S^2$ on the right.

<div id="toc"></div>

# Categories of $G$-representations

## Morphisms

The standard way to introduce a representation of a group $G$ is as a pair $(\rho,V)$ of a vector space $V$ and a group homomorphism $\rho: G \to \GL(V)$. That is, for $g_1,g_2 \in G$, $\rho(g_1)$ and $\rho(g_2)$ are invertible matrices over a vector space $V$ such that the group structure is respected: $\rho(g_1)\rho(g_2) = \rho(g_1 g_2)$. Group homomorphisms are examples of ubiquitous structure-preserving maps or *morphisms* between mathematical objects. Morphisms for sets are arbitrary functions (total i.e. defined for all inputs) between sets. For vector spaces, we have linear operators. Of course, not only algebraic objects have morphisms. For example, for topological spaces and smooth manifolds, we have continuous maps and smooth maps respectively. (In particular, [homeomorphisms](https://en.wikipedia.org/wiki/Homeomorphism) are isomorphisms between topological spaces, and [diffeomorphisms](https://en.wikipedia.org/wiki/Diffeomorphism) are isomorphisms between smooth manifolds.)

Once we have objects and morphisms, we have a *category*. Formally, a **category** $\mathcal{C}$ is a class [^1] of objects and morphisms between them such that there is an identity morphism $1\circ f = f\circ 1 = f$ and the composition of morphisms is associative: $(f \circ g) \circ h = f\ \circ (g \circ h)$. It should be emphasized that all the information contained in the definition is about morphisms; the objects can be anything. The lesson here is that morphisms are as important, if not more, than the objects we want to study. What would be the morphisms in a category of $G$-representations? They are *$G$-equivariant maps* or *intertwiners*. Let $(\rho,V)$ and $(\sigma,W)$ be $G$-representations. A linear map $\varphi:V\to W$ is **$G$-equivariant** if it does not matter if one applies the transformation $g$ on the vector space first or $\varphi$ first. That is, $\varphi\circ\rho(g) = \sigma(g)\circ\varphi$ for all $g \in G$. Pictorially, we say that the following diagram "commutes".
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
for all $r,s \in R$ and $m,n \in M$. A right $R$-module is similarly defined but with the multiplication from the right. Left and right $R$-modules may not coincide if $R$ is a not commutative.  Now the ring $k[G]$ is the matrix ring formally spanned by $g \in G$ over a field $k$ with the convolution product * inherited from the group multiplication:
$$\begin{align}
  \left(\sum_{g_1}f_{g_1} g_1 \right) * \left(\sum_{g_2}h_{g_2} g_2 \right) = \sum_{g_1,g} f_{g_1} h_{g_1^{-1}g} g.
\end{align}$$
 In fact, $k[G]$ is not just a ring but also an algebra (because it is a vector space) called the **group algebra**. Given a $G$-representation, the span of $\rho(g)$ gives a $k[G]$-module. Conversely, given a $k[G]$-module, there is a vector space $V$ over $k$ (because $k\id \in k[G]$), on which the $G$-action gives a group homomorphism $G \to \GL(V)$, that is, a representation. In this language, intertwiners are linear maps that commute with multiplication by scalars in $k[G]$. In other words, they are simply *$k[G]$-linear maps*, generalizing the fact that linear operators (all of which commute with the scalars) are morphisms in the category of vector spaces.

### Schur's lemma

Intertwiners between irreps are completely characterized by **Schur's lemma**, a very basic (easily proved using a little linear algebra) but powerful result. Denote the space of intertwiners between $G$-representations $V$ and $W$ by $\Hom_G(V,W)$ (and $\End_G(V)$ if $V=W$).

**Lemma 1.** (Schur's lemma)

- (Burnside) *Every intertwiner between irreps is either an isomorphism or zero.*
- (Schur) *For $k$ algebraically closed, every intertwiner is of the form $k\id$. That is, $\End_G(V) = k$.* [^2]

It can summarized as follows: when $k$ is algebraically-closed, intertwiners between irreps behave like the Kronecker delta
$$\begin{align}
  \dim\Hom_G(V,W) =
  \begin{cases}
    1, V \cong W, \\
    0, V \not\cong W.
  \end{cases}
\end{align}$$


### The meaning of tensor operators
<!-- It will be convenient to use a more sophisticated definition later on (namely $G$-representations as $K[G]$-modules). To understand mathematical objects, we need to understand structure-preserving maps or *morphisms* between them.-->

I claim that one does not really understand the concept of [tensor operators](https://en.wikipedia.org/wiki/Tensor_operator) in physics until one understands intertwiners. Why? Because *tensor operators are, by definition, intertwiners*. This can be seen by unpacking the seemingly circular definition of tensor operators as "operators that act like tensors". For concreteness, let us think about one of the simplest non-trivial cases of a *vector operator*. Let $(R,\R^3)$ be the defining representation of $\SO(3)$ and $\mathbf{r} \in \R^3$. A **vector operator** $T(\mathbf{r})$ has components $T_j \coloneqq T(\mathbf{r}_j):V\to W, j=1,2,3$ that are linear maps between irreps $(\rho,V),(\sigma,W)$ of $\SO(3)$ (that is, $T_j \in\Hom(V,W) = V^* \otimes W$) such that the $G$-action on $\Hom(V,W)$ (a superoperator $\sigma\dgg(R) \odot \rho(R)$ where $\odot$ is a placeholder for the argument) induces a rotation of $\mathbf{r}$: [^3]
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

By the first part of Schur's lemma, $T$ is an isomorphism between $(R,\R^3)$ and its copy within $\Hom(V,W)$ (if the latter exists). [^4] This justifies labeling the components of the image $T_j$ in the same way as labeling the components of a vector $\mathbf{r} \in \R^3$. More generally, $\R^3$ can be replaced by any
irrep $U$ of $\SO(3)$.

The second part of Schur's lemma gives the celebrated [Wigner-Eckart theorem](https://en.wikipedia.org/wiki/Wigner%E2%80%93Eckart_theorem).
Does anyone remember what the theorem says in the form usually taught in a quantum mechanics class? Not me. But by recognizing tensor operators as intertwiners, the theorem is simply the second part of Schur's lemma for intertwiners between $U$ and $\Hom(V,W)$; the basis-independence of the "reduced matrix element" $\av{j',m'||T_k||j,m}$ is just the statement that the tensor operator is proportional to the identity $T = c\id$ (because it commutes with every $G$-action because it is $G$-equivariant) in the block isomorphic to the irrep $U$.

For us, a generalization of *spherical tensor operators* will prove convenient to provide a Lie-algebraic *weight*-operator (analogous to a weight vector) basis for the space of linear operators.

## Functors

Given a representation of $G$, we can always restrict it to a representation of a subgroup $H \subset G$. What about the inverse process of constructing a $G$-representation out of an arbitrary $H$-representation? The language of categories and modules will prove useful here. Restriction is a *functor* from the category of $G$-representations to the category of $H$-representations. Given categories $\mathcal C$ and $\mathcal D$, a **(covariant) functor** $\mathcal{F}:\mathcal C\to \mathcal D$ assigns to every object in $\mathcal C$ an object in $\mathcal D$ and to every morphism in $\mathcal C$ a morphism in $\mathcal D$:
$$\begin{align}
  \mathcal{F}:\Hom_{\mathcal C}(A,B) \to \Hom_{\mathcal D}(\mathcal{F}(A),\mathcal{F}(B)),
\end{align}$$
where $A,B\in\mathcal C$,
such that the identity and the composition is preserved:
$$\begin{align}
  \mathcal{F}(1_{\mathcal C}) &= 1_{\mathcal D}, \\
  \mathcal{F}(f\circ g) &= \mathcal{F}(f) \circ \mathcal{F}(g).
\end{align}$$
Restriction belongs to a simple kind of functors, *forgetful functors* that simply forget information, in this case the structure of $G$. Restriction therefore cannot have a strict inverse. An insight from the category viewpoint is that we can construct the induction functor as a kind of "weak inverse" to the restriction functor called an *adjoint*. More precisely, there is a left adjoint
$$\begin{align}
  \Hom_G(\textrm{Ind}\,V,W) \cong \Hom_H(V,\textrm{Res}\,W)
\end{align}$$
and a right adjoint
$$\begin{align}
  \Hom_G(,V,\textrm{Ind}\W) \cong \Hom_H(\textrm{Res}\,V,W)
\end{align}$$
to the restriction functor. [^5] Further, we will see that the distinction between the left and the right adjoint comes precisely from the choice to think of $k[G]$ either as a $(k[G],k[H])$-bi-module or a $(k[H],k[G])$-bi-module.

hese relationships (14,15), which are so important they have a name: [Frobenius reciprocity](https://en.wikipedia.org/wiki/Frobenius_reciprocity), *define* what the induction is. They are the raison d'être of induced representations.

<!-- There are only two universal properties: that of being initial and terminal. This translates to the usual way of presenting universal properties in terms of commutative diagrams when one realizes that commutative diagrams are morphisms in a category of morphisms e.g. "[slice category](https://en.wikipedia.org/wiki/Comma_category#Slice_category)".-->

### The simplest adjoint functor

What does an adjoint functor look like in a category with *only one* morphism? Such a morphism $x\to y$ can be though of as a comparison $x\le y$, a [preorder](https://en.wikipedia.org/wiki/Preorder) if you will [^6]. (I learned this example from John Baez' online [Applied Category Theory Course](https://johncarlosbaez.wordpress.com/2018/04/07/applied-category-theory-course-part-2/).) A functor between two preorders $\mathcal C$ and $\mathcal D$ is a *monotone function* if it is order-preserving:
$$ a \le_{\mathcal C} b \implies f(a) \le_{\mathcal D} f(b). $$
A pair of monotone functions $f$ and $g$ is an *adjoint pair* if there is a one-to-one correspondence, the *Galois connection*
$$ f(a) \le_{\mathcal D} x \iff a \le_{\mathcal C} g(x). $$
Suppose, for instance, that $\mathcal A = \mathcal B = \mathbb{N}$, the natural numbers. The monotone function $x \to 2x$ has no strict inverse because $y/2$ may not be an integer, but it does have right and left adjoints: the ceiling $\lceil x/2 \rceil$ and the floor $\lfloor x/2 \rfloor$ respectively. (Verify.) In this case, we got a one-to-one correspondence between the morphism in $\mathcal C$ and the morphism in $\mathcal D$. The Galois connection generalizes to the adjunction.

### Adjoint to a forgetful functor

Many useful constructions, like those of induced representations, are adjoint functors to a forgetful functor. The **free functor** $\mathcal F:$ **Set** $\to$ **Grp** sending a set to its "[free group](https://en.wikipedia.org/wiki/Free_group)". Given a set $S$, $\mathcal F(S)$ is the set of all expressions that can be composed from elements of $S$: every power and inverse of each and every element and (noncommutative) products of them; it is the least constrained group that can be built from elements of $S$ as generators. The categorical way to say this is that the free functor has the universal property that giving a map $\sigma$ from $S$ to some group $G$ is equivalent to giving a unique group homomorphism $\varphi$ from the free group $F(S)$ to $G$. (The empty set gives the trivial group.)
<center>
<img src="/assets/img/posts/01-2017/free-group.png" style="width: 200px;"/>
</center>
<!-- \begin{align}
	\xymatrix{
      S \ar[r]\ar[dr]_{\sigma} & F(S) \ar[d]^{\varphi} \\
      & G
	}
\end{align} -->

The free functor sends an object in **Set** to an object in **Grp**, and the forgetful functor sends an object in **Grp** to an object in **Set**. But their composition is not the identity map. Nevertheless, they are a kind of generalized inverses in the sense formalized in the notion of an adjoint functor.

Functors $F: \mathcal{C} \to \mathcal{D}$ and $G: \mathcal{D} \to \mathcal{C}$ are **adjoint functors** if for any $X \in \mathcal{C}$ and $Y \in \mathcal{D}$, there is an [isomorphism](https://en.wikipedia.org/wiki/Adjoint_functors#Hom-set_adjunction)
$$ \begin{aligned}
\mathrm{Hom}_{\mathcal{D}} (F(X),Y) \simeq \mathrm{Hom}_{\mathcal{C}} (X,G(Y)).
\end{aligned} $$
<center>
<img src="/assets/img/posts/01-2017/adjoint.png" style="width: 250px;"/>
</center>
<!-- \begin{align*}
	\xymatrix{
      F(X)\ar[r]^{\mathrm{Hom}_{\mathcal{D}}(F(X),Y)} & Y\ar[d] \\
      X\ar[u]\ar[r]_{\mathrm{Hom}_{\mathcal{C}}(X,G(Y))} & G(Y)
	}
\end{align*} -->

$F$ is called a **left adjoint** of $G$ and $G$ is called a **right adjoint** of $F$.

Why should this be true in the case of the forgetful functor $R$ and the free functor $F$ between **Set** and **Grp**? A group homomorphism $\varphi :F(S) \to G$ is completely determined if we know what it does to each generator of $F(S)$ i.e. each element of $S$. In other words, what $\varphi$ really acts on is the underlying set of $G$. That is, giving $\varphi$ is equivalent to giving $\psi : S \to R(G)$.
$$ \begin{aligned}
\mathrm{Hom}_{\bf{Grp}} (F(S),G) \simeq \mathrm{Hom}_{\bf{Set}} (S,R(G))
\end{aligned} $$
<center>
<img src="/assets/img/posts/01-2017/free-functor.png" style="width: 250 px;"/>
</center>
so that the free functor is a left adjoint of the forgetful functor.

Possessing an adjoint on one side does not imply possessing an adjoint on the other side, as this example also demonstrates; the forgetful functor $R:{\bf Grp} \to {\bf Set}$ does not have a right adjoint. The desired isomorphism
$$ \begin{aligned}
\mathrm{Hom}_{\bf{Grp}} (G,F(S)) \simeq \mathrm{Hom}_{\bf{Set}} (R(G),S)
\end{aligned}, $$
<center>
<img src="/assets/img/posts/01-2017/cofree-functor.png" style="width: 250 px;"/>
</center>

where now $F$ is a cofree functor, fails when $S$ is an empty set. Given a group homormophism from $G$ to $F(S)$, there is no corresponding map (with a non-empty image) from $R(G)$ to an empty set.



# Tensor-Hom Adjunction

The tensor product of a right-$R$-module $M$ and a left-$R$-module $N$ is distributive with respective to the abelian group addition:
$$\begin{align}
	(m_1 + m_2) \otimes n &= m_1\otimes n + m_2 \otimes n, \\
	m\otimes (n_1 + n_2) &= m\otimes n_1+ m\otimes n_2,
\end{align}$$
and commutes with $R$:
$$\begin{align}
	mr \otimes n &= m \otimes rn.
\end{align}$$
In essence, $M \otimes_R N$ is the vector space $M \otimes N$ quotient by the relation $mr \otimes n - m \otimes rn$. A tensor product of nonzero modules can turn out to be zero. For example, $\mathbb{Z}/a\mathbb{Z} \otimes_{\mathbb{Z}} \mathbb{Z}/b\mathbb{Z} = 0$ when $a$ and $b$ are coprime.

With an $(A,B)$-module $P$ at the disposal, we can turn an $A$-module into a $B$-module and vice versa. Let $M$ be a left-$A$-module and $N$ be a left-$B$-module,
- $P \otimes_B N$ is a left-$A$-module.
- $\mathrm{Hom}_A (P,M)$ is a left-$B$-module.

$\mathrm{Hom}_A (P,M)$ makes sense because both $P$ and $M$ are left-$A$-modules. The obvious $B$-action
$$	b\varphi(p) = \varphi(pb)$$
turns $\mathrm{Hom}_A (P,M)$ into a left-$B$-module. One can verify that the action satisfies the axioms for modules, for example,
$$\begin{align}
	(b_1 b_2) \varphi(p) = \varphi(p (b_1 b_2)) = b_2 \varphi(p b_1) = b_1 (b_2 \varphi(p)).
\end{align}$$

The **tensor-hom adjunction** is the natural isomorphism between $A$- and $B$-module-homomorphisms
$$\begin{align}
	\mathrm{Hom}_A (P \otimes_B N,M) \simeq  \mathrm{Hom}_B (N,\mathrm{Hom}_A (P,M))\,.
\end{align}$$
In other words, the tensor functor $\odot \otimes_B N$ is the left adjoint of the hom functor $\mathrm{Hom}_A (-,M)$, the dash $-$ denoting a placeholder for an argument.

When all the modules are finite-dimensional vector spaces over the same field (so that $\mathrm{Hom}(M,N) \simeq N^* \otimes M$), the tensor-hom adjunction is the trivial statement that taking the dual of $P$ and $N$ at once is equivalent to taking the dual of $N$ first and then $P$. This is essentially the idea of the proof: breaking up a map that takes multiple inputs into a sequence of single-input maps (so-called *currying* in programming). The only thing complicated about the proof is the bookkeeping.

**Proof.**

$\blacksquare$  In one direction, given an $A$-module homomorphism $\varphi$ from $P \otimes_B N$ to $M$, we want to define a corresponding $B$-module homomorphism from $N$ to $\mathrm{Hom}_A (P,M)$. By linearity, $\varphi$ is determined by its values on all rank-one tensors
  $$\varphi(p \otimes_B n) \in M.$$
So let us define
  $$\psi_n(-) \coloneqq \varphi(- \otimes_B n).$$
The $A$-linearity of $\psi_n$ follows immediately from the $A$-linearity of $\varphi$. The $B$-linearity of $\psi$ is not hard to show either:
  $$\psi_{bn_1 + n_2}(p) = \varphi(p \otimes_B (bn_1 + n_2)) = \psi_{n_1}(pb) + \psi_{n_2}(p) = b\psi_{n_1}(p) + \psi_{n_2}(p).$$
(The last equality is just the left-$B$-action on $\mathrm{Hom}_A (P,M)$ \eqref{B-action}).

Conversely, given a $B$-module homomorphism $\psi$ from $N$ to $\mathrm{Hom}_A (P,M)$, define
  $$\varphi(-_1 \otimes_B -_2) \coloneqq \psi_{-_2} (-_1{}_{})$$
and extend by linearity. One can verify that $\varphi$ is $A$-linear. Finally, since the constructions of $\psi$ from $\varphi$ and vice versa are obviously inverses of each other, the isomorphism \eqref{tensor-hom} is established. $\Box$

# Extension of scalars

Let $B \subset A$ be two rings with identities. An $A$-module $M$ is also a $B$-module by restricting the scalars to $B$. The resulting module is denoted by $\mathrm{Res} M$ or $\res{M}{A}{B}$ when $A$ and $B$ are needed to be specified.

We ought to have an "inverse" process of extending the scalars. Categorically, an extension of scalars should be an adjoint functor to the restriction. In the context of representation theory, the left and the right adjoints are called **induction** and **coinduction** respectively.
- Thinking of $A$ as an $(A,B)$-module, $\mathrm{Res} M = \mathrm{Hom}_A (A,M)$. Then by the tensor-hom adjunction,
	$$\mathrm{Hom}_B (N,\mathrm{Hom}_A (A,M)) \simeq \mathrm{Hom}_A (A \otimes_B N,M),$$
	the left adjoint of Res is $\ind{N}{B}{A} = A \otimes_B N$.
- Thinking of $A$ as a $(B,A)$-module, $\mathrm{Res} M = A \otimes_A M$. Then by the tensor-hom adjunction,\footnote{The roles of $A$ (resp. $M$) and $B$ (resp. $N$) are reversed.}
	$$\mathrm{Hom}_B (A \otimes_A M,N) \simeq  \mathrm{Hom}_A (M,\mathrm{Hom}_B (A,N)),$$
	the right adjoint of Res is $\coind{N}{B}{A} = \mathrm{Hom}_B (A,N)$\,.
\end{itemize}

To obtain a (co)induced representation from a (co)induced module, we just set the two rings to be the group algebras $\mathbb{C}[K]$ and $\mathbb{C}[G]$, where $K$ is a subgroup of $G$. Let $(\rho,V)$ be a $G$-representation and $(\sigma,W)$ be a $K$-representation. Then
$$\begin{align}
	\ind{W}{K}{G} = \mathbb{C}[G] \otimes_{\mathbb{C}[K]} W, &&
	\coind{W}{K}{G} &= \mathrm{Hom}_{\mathbb{C}[K]} (\mathbb{C}[G],W),
\end{align}$$
The tensor-hom adjuntion becomes what is known as **Frobenius reciprocity**

<!--:\footnote{The module homomorphisms are restricted to morphisms of representations i.e. intertwiners} -->
$$\begin{align}
	\mathrm{Hom}_K (W,\res{V}{G}{K}) &\simeq \mathrm{Hom}_G (\ind{W}{K}{G},V), \\
	\mathrm{Hom}_K (\res{V}{G}{K},W) &\simeq \mathrm{Hom}_G (V,\coind{W}{K}{G}).
\end{align}$$

# Tensor product representations

# Fourier analysis

## A little algebraic geometry

## The Borel subgroup

## Geometric multiplicity-free condition

### Borel-Weil

The Borel-Weil theorem states that every irreducible representation of a Lie group $G$ is "holomorphically" induced from the torus.

### Hermitian symmetric spaces

[^1]: The word "class" cannot be replaced by "set". For example, there is no set of all sets ([Russell's paradox]((https://en.wikipedia.org/wiki/Russell%27s_paradox))).

[^2]: The assumption that $k$ is algebraically closed is necessary. Consider a representation of $\Z_4$ on $\R^2$ as discrete rotations with the generator
$\rho(1) = \begin{pmatrix}
0 & -1 \\
1 & 0
\end{pmatrix}$.
It is irreducible because $\rho(1)$ cannot be diagonalized over $\R$. But every $\rho(g)$ commutes with matrices of the form $a\id + b\rho(1)$ for some $a,b \in \R$, a two-dimensional real vector space.

[^3]: We think of $R$ as both a rotation matrix (the defining representation of $\SO(3)$) and an abstract group element. We also assume the [Einstein summation convention](https://en.wikipedia.org/wiki/Einstein_notation).

[^4]: Why can't there be more than one copy of $(R,\R^3)$ in $\Hom(V,W)$? Because every tensor product $V\otimes W$ of irreducible $\SO(3)$-representations decomposes *without multiplicity*. Wigner gave a characterization of some of these so-called *simply reducible groups* which was then [generalized by Mackey](https://projecteuclid.org/euclid.pjm/1103039895).

[^5]: The name "adjoint" comes from the similarity to how the adjoint of a linear operator in an inner product space is defined:
$\av{x,Ay} = \av{A\dgg x,y}$.

[^6]: A [partial order](https://en.wikipedia.org/wiki/Partially_ordered_set) is a preorder that is also "antisymmetric": $a \le b$ and $b \le a$ implies $a=b$. Also for the curious, the product in this category is the infimum and the coproduct is the supremum.

[^7]:
