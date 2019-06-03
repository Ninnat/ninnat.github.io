---
layout: post
title: Induction as an Adjoint Functor [Drafted]
subtitle:
date: 2019-05-31
categories:
  - Representation theory
tags:
---

<div id="toc"></div>

Induction (and co-induction) are important and versatile constructions in representation theory that I found mysterious at first. In this post, I want to explain what they are.

Given a representation $\rho: G \to \GL(V)$, we can easily restrict it to a representation $\rho\big|_{H}{}_{}$ of a subgroup $H \subset G$, and we can ask e.g. how $V$ breaks up into irreducible $H$-representations. The inverse process is not so easy to cook up. Given a representation of a subgroup, how can we assign to it a unique representation of $G$? What should the properties of this *induced* representation be?

There are more than one answers which can be given precisely by *adjuntions* of the restriction.

A kind of pseudo-inverse of restriction can be given in the framework of *adjoint functor*. For this, it will be also be very useful to think of a $G$-representation $(\rho,V)$ as a *module*, in particular, a module over the group ring $\C[G]$.

# Modules

*Modules* are generalizations of vector spaces. A vector space is an [abelian group](https://en.wikipedia.org/wiki/Abelian_group) $M$ of vectors with addition, together with the rules on how to scale vectors by numbers from a [field](https://en.wikipedia.org/wiki/Field_(mathematics)) $k$ such as $\R$ or $\C$:
$$\begin{align}
  1m &= m, \\
  (a+b)m &= am + bm, \\
  a(bm) &= (ab)m, \\
  a(m+n) &= am + an,
\end{align}$$
where $a,b \in k$, 1 is the multiplicative identity in $k$, and $m,n \in M$. To obtain a module, one only has to replace the field $k$ in the definition with a [ring with unity](https://en.wikipedia.org/wiki/Ring_(mathematics)#Notes_on_the_definition) $R$. In other words, a **(left) $R$-module** is an abelian group $M$ together with a ring homomorphism from a ring with unity $R$ to the [endomorphism ring](https://en.wikipedia.org/wiki/Endomorphism_ring) of $M$
$$\begin{align}
  R &\overset{\varphi}{\to} \End(M) \\
  \varphi(r)(m) &\eqqcolon rm
\end{align}$$
(this takes care of the first three rules above) that is also a group endomorphism of $M$ (the last rule).
A right $R$-module is defined similarly but with multiplication from the right: $\varphi(r)(m) \eqqcolon mr$.
An important example, and in fact the only example that we will look at, is when $R$ is a ring of matrices. That is, the matrices are now "scalars" but they are not commutative!

--R-linear maps

# Categories and functors

A **category** $\mathcal{C}$ is a class of objects and morphisms between them. If $X$ and $Y$ are **objects** in $\mathcal{C}$, the class of **morphisms** between $X$ and $Y$ is denoted by $\mathrm{Hom}(X,Y)$. They are also represented diagrammatically as arrows $f:X \to Y$ for $f \in \mathrm{Hom}(X,Y)$. For $\mathcal{C}$ to be a category, there must be a identity morphism and the compositions of morphisms must be associative. Here are some categories.

- **Set** of all sets. Since there is no [set of all sets](https://en.wikipedia.org/wiki/Russell%27s_paradox), the word "class" in the definition of a category cannot be replaced by "set". The morphisms are arbitrary maps between sets.
- **Grp** of all groups, **Ring** of all rings, and **Field**$_p$ of all fields with [characteristic](https://en.wikipedia.org/wiki/Category_of_rings#Category_of_fields) $p=0$ or prime with the respective homomorphisms as morphisms. (There is no homomorphism between fields of different characteristics.)
- **k-Vec** of vector spaces over a field $k$ with linear maps as morphisms.
- **R-Mod** of (left) $R$-modules with $R$-linear maps as morphisms.
- **Top** of topological spaces with continuous maps as morphisms. In particular, homeomorphisms are isomorphisms.
- **Man**$^{\infty}$ of smooth manifolds with infinitely differentiable maps as morphisms. In particular, diffeomorphisms are isomorphisms.


## Functors

Suppose that $\mathcal{C}$ and $\mathcal{D}$ are two categories and $X,Y \in \mathcal{C}$. A (covariant) **functor** $F$ is a map (of both objects and morphisms) $F: \mathcal{C} \to \mathcal{D}$ such that $\mathrm{Hom}(X,Y) \to \mathrm{Hom}(F(X) , F(Y))$ preserves identity morphisms and compositions.

There are only two universal properties: that of being initial and terminal. This translates to the usual way of presenting universal properties in terms of commutative diagrams when one realizes that commutative diagrams are morphisms in a category of morphisms e.g. "[slice category](https://en.wikipedia.org/wiki/Comma_category#Slice_category)".

### Preorders

- [Applied Category Theory Course: Ordered Sets](https://johncarlosbaez.wordpress.com/2018/04/07/applied-category-theory-course-part-2/), John Baez, based on [7 Sketches in Compositionality: An Invitation to Applied Category Theory](http://math.mit.edu/~dspivak/teaching/sp18/7Sketches.pdf) by Fong and Spivak

A useful trick (that I learned from Qiaochu Yuan's [answer](https://math.stackexchange.com/a/25515)) to understand anything in category theory is to first consider as a toy model a [preorder](https://en.wikipedia.org/wiki/Preorder) [^1], a category with only one morphism $x\to y$, which can be though of as a comparison $x\le y$. For example, the product in this category is the infimum and the coproduct is the supremum. A functor between two preorders $A$ and $B$ is a *monotone function* if it is an order-preserving map
$$ x \le_A y \implies f(x) \le_B f(b). $$
A pair of monotone functions $f$ and $G$ is an *adjoint pair* if they satisfy the *Galois connection*:
$$ f(a) \le_B b \iff a \le_A g(b). $$
Suppose, for instance, that $A = B = \mathbb{N}$, the natural numbers. The monotone function $x \to 2x$ has no inverse but it does have right and left adjoints: the ceiling $\lceil x/2 \rceil$ and the floor $\lfloor x/2 \rfloor$ respectively. The notion of Galois connection generalizes to that of [adjunction](https://en.wikipedia.org/wiki/Adjoint_functors), an example of which in representation theory is [Frobenius reciprocity](https://en.wikipedia.org/wiki/Frobenius_reciprocity).

### Adjoint functors in general

One of the more trivial kinds of functors are ones that simply throw away information. The **forgetful functor** **Grp** $\to$ **Set** sends a group to its underlying set; it completely forgets the group structure. There are also functors that are partially forgetful such as the functor from **Grp** to **Ab** the category of all abelian groups which set $gh=hg$ for all elements $g,h$ in a group.

More interesting is the **free functor** $F:$ **Set** $\to$ **Grp** sending a set to its "[free group](https://en.wikipedia.org/wiki/Free_group)". For a set $S$, $F(S)$ is the set of all expressions that can be composed from elements of $S$: every power and inverse of each and every element and (noncommutative) products of them; it is the least constrained group that can be built from elements of $S$ as generators. The categorical way to say this is that the free functor has the universal property that giving a map $\sigma$ from $S$ to some group $G$ is equivalent to giving a unique group homomorphism $\varphi$ from the free group $F(S)$ to $G$. (The empty set gives the trivial group.)
<center>
<img src="/assets/img/posts/01-2017/free-group.png" style="width: 150px;"/>
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
<img src="/assets/img/posts/01-2017/adjoint.png" style="width: 180px;"/>
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
<img src="/assets/img/posts/01-2017/free-functor.png" style="width: 180px;"/>
</center>
so that the free functor is a left adjoint of the forgetful functor.

Possessing an adjoint on one side does not imply possessing an adjoint on the other side, as this example also demonstrates; the forgetful functor $R:{\bf Grp} \to {\bf Set}$ does not have a right adjoint. The desired isomorphism
$$ \begin{aligned}
\mathrm{Hom}_{\bf{Grp}} (G,F(S)) \simeq \mathrm{Hom}_{\bf{Set}} (R(G),S)
\end{aligned}, $$
<center>
<img src="/assets/img/posts/01-2017/cofree-functor.png" style="width: 180px;"/>
</center>

where now $F$ is a cofree functor, fails when $S$ is an empty set. Given a group homormophism from $G$ to $F(S)$, there is no corresponding map (with a non-empty image) from $R(G)$ to an empty set. [^2]



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

[^1]: A [partially ordered set](https://en.wikipedia.org/wiki/Partially_ordered_set) is a preorder that is also antisymmetric: $a \le b$ and $b \le a$ implies $a=b$.

[^2]: There is a right adjoint to the forgetful functor [from the category of sets with $G$-actions **Set(G)** to **Set**](https://math.stackexchange.com/questions/1922107/the-right-adjoint-of-forgetful-functor).
