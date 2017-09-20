---
layout: post
title: Adjoint functors
subtitle: Generalized inverses in category theory
date: 2017-09-20
categories:
  - category theory
tags:
---
First published: *26 Jan 2017*; Status: *In progress*

<!-- Lately I've been thinking about induced representations and the Frobenius reciprocity which have a natural interpretation in terms of adjoint functor in category theory. This post is an introduction to the categorical point of view that I need at the level I'm comfortable with. (You can find better general introductions out there by mathematicians such as [this 3-parter](https://topologicalmusings.wordpress.com/category/math-topics/category-theory/category-theory-for-beginners/) by Todd Trimble.)
-->

**I.**

one of the most powerful lessons from category theory is that knowing the relations between an object with other objects is as good as knowing the object itself, as the object can be defined by these relations. A lot of time there is a unique (up to a natural isomorphism which doesn't entail making any arbitrary choice) object that has a "universal" property that can simulate the relations to all other objects of the same kind and so can be thought of as the "best" object of its kind. All of these can be represented graphically by objects and arrows. I will give some examples of these on the way but let us first define what categories are.

## Categories

A **category** $\mathcal{C}$ is a class of objects and morphisms between them. If $X$ and $Y$ are **objects** in $\mathcal{C}$, the class of **morphisms** between $X$ and $Y$ is denoted by $\text{Hom}(X,Y)$. They are also represented diagrammatically as arrows $f:X \to Y$ for $f \in \text{Hom}(X,Y)$. For $\mathcal{C}$ to be a category, there must be a identity morphism and the compositions of morphisms must be associative. Here are some categories.

- **Set** of all sets. Since there is no [set of all sets](https://en.wikipedia.org/wiki/Russell%27s_paradox), the word "class" in the definition of a category cannot be replaced by "set". The morphisms are arbitrary maps between sets.
- **Grp** of all groups, **Ring** of all rings, and **Field**$_p$ of all fields with [characteristic](https://en.wikipedia.org/wiki/Category_of_rings#Category_of_fields) $p=0$ or a prime number with the respective homomorphisms as morphisms. (There is no homomorphism between fields of different characteristics.)
- **Top** of topological spaces with continuous maps as morphisms. In particular, homeomorphisms are isomorphisms.
- **Man**$^{\infty}$ of smooth manifolds with infinitely differentiable maps as morphisms. In particular, diffeomorphisms are isomorphisms.
- **Vec**$_k$ of vector spaces over a field $k$ with linear maps as morphisms.

My favorite elementary example of uniquely defining an object by morphisms is the construction of a product and a coproduct. A **product** of $A$ and $B$ is an object $C$ together with a morphism from $C$ to $A$ and $B$ such that, if $D$ is another object also equipped with some morphisms to $A$ and $B$, then there is a unique morphism from $D$ to $C$ such that the following diagram "commutes" (so we call this kind of diagrams commutative diagrams), meaning that every way to compose such morphisms to go from $D$ to $A$ or $B$ gives the same result.
<center>
<img src="/assets/img/posts/01-2018/product.png" style="width: 200px;"/>
</center>
<!-- \begin{align*}
	\xymatrix{
      & D \ar[dl]_{\alpha'}\ar[d]^{\gamma}\ar[dr]^{\beta'} & \\
      A & C\ar[l]^{\alpha}\ar[r]_{\beta} & B
	}
\end{align*} -->
The rational behind this definition is that $C$ together with the mappings $\alpha$ and $\beta$ is the [best](https://en.wikipedia.org/wiki/Universal_property) object that acts as a product of $A$ and $B$ since giving any morphism from any object $D$ to $A$ or $B$ is equivalent to giving $\alpha$ and $\beta$ from $C$, so we can just forget about $D$ altogether and regard $C$ as a universal simulator of such relations.

The same diagram with all arrows reversed defines a **coproduct** $C$.
<center>
<img src="/assets/img/posts/01-2018/coproduct.png" style="width: 200px;"/>
</center>
<!-- \begin{align*}
	\xymatrix{
      & D & \\
      A\ar[ur]^{\alpha'}\ar[r]_{\alpha} & C\ar[u]_{\gamma} & B\ar[l]^{\beta}\ar[ul]_{\beta'}
	}
\end{align*} -->
In **Set**, the product is the direct product $A \times B$ and the coproduct is the disjoint union $A \amalg B$. We will just verify the first statement to familiarize ourselves with the meaning of the diagrams. For the direct product $C=A \times B$, a natural choice for the mappings $\alpha$ and $\beta$ is the projection
$$ \begin{aligned}
\alpha(a,b) = a, && \beta(a,b) = b.
\end{aligned} $$
We have to show that, for any $\alpha'$ and $\beta'$ from a set $D$, there is a morphism $\gamma$ from $D$ to $C$ that makes the diagram commutes and uniquely so. Obviously, for $d\in D$, this map is
$$ \begin{aligned}
\gamma(d) = (\alpha'(d),\beta'(d)),
\end{aligned} $$
If there is another map $\gamma'$ from $D$ to $C$ that makes the diagram commutes, it must sends $d$ to an element of $A \times B$ that projects to $\alpha'(d)$ on $A$ and $\beta'(d)$ on $B$. But that element is none other than $(\alpha'(d),\beta'(d))$. Thus, the uniqueness is established. For the disjoint union $C = A \amalg B$, a natural choice for the mappings $\alpha$ and $\beta$ is the embedding of $A$ and $B$ into the union. Then the proof proceeds in the same manner by making obvious choices and following the arrows around ("diagram chasing").

We can ask if the direct product and the direct sum of sets are the only product and coproduct objects in **Set**. The nice answer is that they are. And this is not only true in **Set** but also in a general category as well. Let us show this for the categorical product in **Set**. Suppose that we have two product objects $C$ and $C'$. Then there are unique morphisms in both directions, $\gamma: C' \to C$ and $\gamma':C \to C'$, that make the diagram commutes.
<center>
<img src="/assets/img/posts/01-2018/product-uniqueness.png" style="width: 200px;"/>
</center>
<!--
\begin{align*}
	\xymatrix{
      & C' \ar[dl]_{\alpha'}\ar[d]^{\gamma}\ar[dr]^{\beta'} & \\
      A & C\ar[l]^{\alpha}\ar[u]^{\gamma'}\ar[r]_{\beta} & B
	}
\end{align*}
-->
Surely $\alpha \circ \gamma \circ \gamma' = \alpha' \circ \gamma' = \alpha$. and $\beta \circ \gamma \circ \gamma' = \beta' \circ \gamma' = \beta$. But these mean that if we replace $C'$ in the diagram by $C$, then $\gamma \circ \gamma'$ is a unique morphism from $C$ to itself that makes the new diagram commutes. But we know that the identity morphism also makes the diagram commutes, so $\gamma \circ \gamma'$ has to be the identity morphism.

Maybe you don't enjoy this abstract notion of product as I do. Why going so far to define something that should reduce to the notion of a product in any category? Well, it is not always clear what the notion of a product should be. [Todd Trimble](https://topologicalmusings.wordpress.com/2008/06/22/basic-category-theory-i/) gives an example in the case of the category **Top** of all topological spaces.

## Functors

Suppose that $\mathcal{C}$ and $\mathcal{D}$ are two categories and $X,Y \in \mathcal{C}$. A (covariant) **functor** $F$ is a map (of both objects and morphisms) $F: \mathcal{C} \to \mathcal{D}$ such that $\text{Hom}(X,Y) \to \text{Hom}(F(X) , F(Y))$ preserves identity morphisms and compositions.

One of the more trivial kinds of functors are ones that simply throw away information. The **forgetful functor** **Grp** $\to$ **Set** sends a group to its underlying set; it completely forgets the group structure. There are also functors that are partially forgetful such as the functor from **Grp** to **Ab** the category of all abelian groups which set $gh=hg$ for all elements $g,h$ in a group.

More interesting is the **free functor** $F:$ **Set** $\to$ **Grp** sending a set to its "[free group](https://en.wikipedia.org/wiki/Free_group)". For a set $S$, $F(S)$ is the set of all expressions that can be composed from elements of $S$: every power and inverse of each and every element and (noncommutative) products of them; it is the least constrained group that can be built from elements of $S$ as generators. The categorical way to say this is that the free functor has the universal property that giving a map $\sigma$ from $S$ to some group $G$ is equivalent to giving a unique group homomorphism $\varphi$ from the free group $F(S)$ to $G$. (The empty set gives the trivial group.)
<center>
<img src="/assets/img/posts/01-2018/free-group.png" style="width: 150px;"/>
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
\text{Hom}_{\mathcal{D}} (F(X),Y) \simeq \text{Hom}_{\mathcal{C}} (X,G(Y)).
\end{aligned} $$
<center>
<img src="/assets/img/posts/01-2018/adjoint.png" style="width: 180px;"/>
</center>
<!-- \begin{align*}
	\xymatrix{
      F(X)\ar[r]^{\text{Hom}_{\mathcal{D}}(F(X),Y)} & Y\ar[d] \\
      X\ar[u]\ar[r]_{\text{Hom}_{\mathcal{C}}(X,G(Y))} & G(Y)
	}
\end{align*} -->
$F$ is called a **left adjoint** of $G$ and $G$ is called a **right adjoint** of $F$.

Why should this be true in the case of the forgetful functor $R$ and the free functor $F$ between **Set** and **Grp**? A group homomorphism $\varphi :F(S) \to G$ is completely determined if we know what it does to each generator of $F(S)$ i.e. each element of $S$. In other words, what $\varphi$ really acts on is the underlying set of $G$. That is, giving $\varphi$ is equivalent to giving $\psi : S \to R(G)$.
$$ \begin{aligned}
\text{Hom}_{\bf{Grp}} (F(S),G) \simeq \text{Hom}_{\bf{Set}} (S,R(G))
\end{aligned} $$
<center>
<img src="/assets/img/posts/01-2018/free-functor.png" style="width: 180px;"/>
</center>
so that the free functor is a left adjoint of the forgetful functor.

Possessing an adjoint on one side does not imply possessing an adjoint on the other side, as this example also demonstrates; the forgetful functor $R:{\bf Grp} \to {\bf Set}$ does not have a right adjoint. The desired isomorphism
$$ \begin{aligned}
\text{Hom}_{\bf{Grp}} (G,F(S)) \simeq \text{Hom}_{\bf{Set}} (R(G),S)
\end{aligned}, $$
<center>
<img src="/assets/img/posts/01-2018/cofree-functor.png" style="width: 180px;"/>
</center>
where now $F$ is a cofree functor, fails when $S$ is an empty set. Given a group homormophism from $G$ to $F(S)$, there is no corresponding map from $R(G)$ to an empty set because a map is required to be a total function and there is no total function into an empty set. [^right-adjoint]

<!-- A deep understanding of adjoint functors seem to require knowing about representability of functors and Yoneda's lemma, neither of which I can competently explain. But they all have analogues in linear algebra by pretending that an inner product $\braket{v,u}$ is a morphism $\text{Hom}(v,u)$ in a category with one object $V$ (with linear maps between vector spaces as functors). [^1]. A functor $F:\mathcal{C} \to $**Set** is **representable** by $X \in \mathcal{C}$ if the functor can be concretely realized as the morphism Hom$_{\mathcal{C}}(X,\cdot)$. The **Yoneda's lemma** guarantees that this $X$ is unique. In this analogy, the representability of $F$ combined with the Yoneda's lemma has the same content as the [Riesz representation theorem](https://en.wikipedia.org/wiki/Riesz_representation_theorem) in linear algebra. It says that a continuous linear functional $f:V \to k$, where $k$ is now the analog of **Set**, can be identified as a unique vector in $v \in V$ itself via the inner product
$$ \begin{aligned}
f (u) = \braket{v,u}.
\end{aligned} $$
Now consider the linear functional $v \mapsto \braket{L(v),u}$. By the representation theorem, there is $w \in V$ that realizes this map as $\braket{v,w}$. This is an image of the adjoint operator $w = L^*(u)$. By a similar argument, if $F$ and $G$ are adjoint functors
$$ \begin{aligned}
\text{Hom}_{\mathcal{D}} (F(X),Y) \simeq \text{Hom}_{\mathcal{C}} (X,G(Y)),
\end{aligned} $$
and the classes of morphisms are sets (which they usually are), the functor $Y \mapsto \text{Hom}_{\mathcal{C}} (X,G(Y))$ is represented by $F(X)$ and the functor $X \mapsto \text{Hom}_{\mathcal{D}} (F(X),Y)$ is represented by $F(Y)$, so they are unique by the Yoneda's lemma. A further analogy is that an adjoint functor may not exist, but if it exists, it is unique. -->

**II.**

In representation theory, a restriction of a representation of a group $G$ to a subgroup $H$ is a functor whose left adjoint is the induction of a representation of $H$ to a "free" representation of $G$. There, the [Frobenius reciprocity theorem](https://en.wikipedia.org/wiki/Induced_representation) is nothing but the property of adjoint functors. I will talk about how this can be used to deduce the well known fact that each irreducible representation of SO(3) appears only once in the decomposition of functions on a sphere.

<!-- [^1]: Page 102 of Etingof *et al.*, [*Introduction to Representation Theory*](http://math.mit.edu/~etingof/replect.pdf).-->

[^ right-adjoint]: There is a right adjoint to the forgetful functor [from the category of sets with $G$-actions **Set(G)** to **Set**](https://math.stackexchange.com/questions/1922107/the-right-adjoint-of-forgetful-functor).
