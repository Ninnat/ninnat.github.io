---
layout: post
title: Lie groups and Lie algebras
subtitle: Basic definitions
categories:
  - English
  - Geometry
  - Groups
tags:
---
Status: *in progress*

Some of my future posts will contain these ideas with a lot of hand-waving. This post is a future reference for those who can't tolerate hand-waving. Beware that this is much terser than the average blog post.

Lie's three theorems on the relation between Lie groups and Lie algebras is encapsulated in this statement: *the [categories](https://en.wikipedia.org/wiki/Category_(mathematics)) of connected, [simply-connected](https://en.wikipedia.org/wiki/Simply_connected_space) Lie groups and finite-dimensional Lie algebras are the same.* It cannot be the category of all Lie groups because Lie algebras cannot know the global topology of Lie groups. So we often study connected, simply-connected covering groups instead of the groups that are of interest to us.

A **Lie group** $G$ is a [group](https://en.wikipedia.org/wiki/Group_(mathematics)) that is also a smooth manifold (defined in the [previous post](https://ninnat.github.io/2017/01/03/manifolds.html)) and the group multiplication and inverse are smooth. Roughly speaking, a manifold $M$ is a space that is locally Euclidean i.e. the chart $\varphi$ mapping an open set $U$ to a subset of $\mathbb{R}^{n}$ gives a point $p\in M$ coordinates in $\mathbb{R}^{n}$. The dimension of a Lie group is $n$, the dimension of the manifold.

# Lie algebras

A **Lie algebra** is a vector space $\mathfrak{g}$ over a [field](https://en.wikipedia.org/w/index.php?title=Field_(mathematics)&oldid=757991562) $k$, equipped with a bilinear map $\left[,\right]:\mathfrak{g}\times\mathfrak{g}\to\mathfrak{g}$,
the **Lie bracket**, which is skew-symmetric $\left[x,y\right]=-\left[y,x\right]$
(or equivalently, $\left[x,x\right]=0$) and satisfies the Jacobi identity
$$ \begin{aligned}
\left[x,\left[y,z\right]\right]+\left[y,\left[z,x\right]\right]+\left[z,\left[x,y\right]\right] & =0.
\end{aligned} $$
To understand the Jacobi identity, let us look at the **adjoint map** that takes an element $x\in\mathfrak{g}$ and turns it into a Lie algebra endomorphism (a [Lie algebra homomorphism](https://en.wikipedia.org/w/index.php?title=Lie_algebra&oldid=750481376#Subalgebras.2C_ideals_and_homomorphisms) to $\mathfrak{g}$ itself) of $\mathfrak{g}$.
$$\begin{aligned}
\text{ad}:\mathfrak{g} & \to\text{End}\mathfrak{g}\\
\text{ad}x\left(y\right) & =\left[x,y\right].
\end{aligned} $$
One can check that it really is a homomorphism:
$$ \begin{aligned}
\text{ad}\left(\left[x,y\right]\right) & =\left[\text{ad}x,\mbox{ad}y\right].
\end{aligned} $$
So it is a [representation of the Lie algebra](https://en.wikipedia.org/w/index.php?title=Lie_algebra_representation&oldid=729467793#Formal_definition) called an **adjoint
representation** of $\mathfrak{g}$. It plays an important role in the structure theory of semisimple Lie algebras.

Fixing the element $x$, the Jacobi idensity precisely means that $\text{ad}x$ is a **derivation** (obeying Leibniz rule):
$$ \begin{aligned}
\text{ad}x\left(\left[y,z\right]\right) & =\left[\text{ad}x\left(y\right),z\right]+\left[y,\text{ad}x\left(z\right)\right].
\end{aligned} $$
This ties in with another definition of a Lie algebra of a Lie group as the tangent space at the identity $T_{e}G=\left\{ X|e^{tX}\in G,t\in\mathbb{R}\right\} $ of $G$, which is isomorphic to the set of partial differential operators at the identity. Thus, the dimension of the Lie group and that of its Lie algebra are the same. [^1]

Every Lie group has a Lie algebra. The best converse of this statement is **Lie's third theorem**: any abstractly defined Lie algebra has a corresponding connected, simply-connected Lie group.

# The Adjoint maps

The Adjoint map $\text{Ad}_{g}:G\to\text{End}\mathfrak{g}$ is a homomorphism
$$ \begin{aligned}
\text{Ad}_{g}\text{Ad}_{h} & =\text{Ad}_{gh}.
\end{aligned} $$
So it is a [representation of the group](https://en.wikipedia.org/w/index.php?title=Group_representation&oldid=750883446#Definitions) called the **Adjoint representation** of $G$. Its differential is the adjoint map $\text{ad}:\mathfrak{g}\to\text{End}\mathfrak{g}$
from [Lie algebra](#Lie-algebras). They are related by
$$ \begin{aligned}
\text{Ad}_{e^{x}} & =e^{\text{ad}x}.
\end{aligned} $$
More concretely, suppose that $g=e^{tx}\in G$ and $y\in\mathfrak{g}$.
$$ \begin{aligned}
\left.\frac{d}{dt}\text{Ad}_{g}\left(y\right)\right|_{t=0} & =\left.\frac{d}{dt}\left(e^{tx}ye^{-tx}\right)\right|_{t=0}=\left[x,y\right]=\text{ad}x\left(y\right)
\end{aligned} $$
This is a special case of the relation between any Lie group and Lie algebra homomorphism
$$ \begin{aligned}
\Pi\left(e^{x}\right) & =e^{d\Pi\left(x\right)},
\end{aligned} $$
which is the manifestation of **Lie's second theorem**: $\text{Hom}\left(G,G'\right)=\text{Hom}\left(\mathfrak{g},\mathfrak{g}'\right)$
if $G$ is simply connected. The corresponding statement for representations $\Pi$ is that $\Pi\to d\Pi$ gives the equivalence of the categories
of representations of $G$ and representations of $\mathfrak{g}$. Moreover, the vector spaces of intertwining operators (morphisms of representations) are isomorphic: $\text{Hom}_{G}\left(V,W\right)=\text{Hom}_{\mathfrak{g}}\left(V,W\right)$.

# Lie subgroups

A **Lie subalgebra** $\mathfrak{h}$ of $\mathfrak{g}$ is a vector subspace such that $\left[\mathfrak{h},\mathfrak{h}\right]\subset\mathfrak{h}$. A Lie subalgebra of $\mathfrak{g}$ corresponds to a subgroup of $G$ which is also an immersed submanifold, called a **Lie subgroup** of $G$. A map $F:M\to N$ is a **smooth immersion** if its differential $dF$ is injective at every point: $\text{rank}F=\dim M$. (To remember the names, an **im**mersion is **in**jective, whereas a **su**bmersion is **su**rjective.) An **immersed submanifold** $S$ of $M$ is a topological manifold (not necessary having the topology of $M$) together with the inclusion map $S\to M$ which is a smooth immersion. **Lie's first theorem** identifies every Lie subalgebra with a connected Lie subgroup and vice versa.

Just be aware that there is no standard definition of a Lie subgroup. Another notion of a submanifold is that of an **embedded submanifold**, which can be obtained for instance by setting some coordinates to zero. The key difference is that embedding has to be a homeomorphism preserving the global topology. Two classic examples of immersions that do not preserve the global topology are the figure-eight map and the irrational winding of a torus. [^2] The former maps an open interval in $\mathbb{R}$ to a closed figure "8" in $\mathbb{R}^{2}$. The latter takes a line with an irrational slope in $\mathbb{R}^{2}$ and map it to a torus. The line will densely wind around the entire
torus. We will call a subgroup which is an embedded submanifold an **embedded Lie subgroup**. Fulton and Harris [^3], for example, give the opposite definitions; their Lie subgroups are our embedded Lie subgroup, whereas our Lie subgroups are their immerse Lie subgroups.

By the **closed subgroup theorem**, a subgroup is an embedded Lie subgroup if and only if it is a closed set. Given a closed subgroup $H\subset G$, this makes $G/H$ a **homogeneous space**, a smooth manifold with a transitive group action.

-------------------------

# Appendix

To prepare for the proof, think of a group element $g\in G$ as an [automorphism](https://en.wikipedia.org/wiki/Automorphism) of the algebra $C^{\infty}(M)$ of smooth functions on a manifold $M$ that translates functions:
$$ \begin{aligned}
\left(gf\right)\left(p\right) & =f\left(g^{-1}p\right).
\end{aligned} $$
This induces an action on vector fields. Define the **Adjoint map** (with a capital A to distinguish it from the adjoint map of a Lie algebra) as ($X$ is a vector field)
$$ \begin{aligned}
\text{Ad}_{g}X & =gXg^{-1}.
\end{aligned} $$
The value of $\text{Ad}_{g}X$ at point $q=gp$ can be computed at point $p$.
$$ \begin{aligned}
\left(\text{Ad}_{g}X\right)_{q} & =dg_{p}\left(X_{p}\right).
\end{aligned} $$
Let us unpack this little formula. $g:M\to M$ is an automorphism of $M$. $dg_{p}:T_{p}M\to T_{gp}M=T_{q}M$ is the differential of the map $g$ at point $p$. So both the right hand side $dg_{p}\left(X_{p}\right)$ and the left hand side are in the tangent space at $q$.

Now we can understand what left-invariant vector fields mean. Take $M=G$ the Lie group itself. Let $L_{g}$ be the left action on the group itself: $L_{g}\left(h\right)=gh$. A vector field is **left-invariant** if $L_{g}X=XL_{g}$ i.e. $\text{Ad}_{g}X=X$. As promised, the left-invariant vector field at any point $g\in G$ can be seen to be determined by its value at the origin $X_{e}$:
$$ \begin{aligned}
X_{g} & =\left(\text{Ad}_{g}X\right)_{g}=dg_{e}\left(X_{e}\right)
\end{aligned} $$

[^1]:
Another definition of the Lie algebra of a Lie group $G$ is the set of left-invariant vector fields on $G$. The set of all vector fields can be given the structure of a Lie algebra by the Lie bracket, but only left-invariant vector fields are determined by their values at the identity, hence the definition in [Lie algebra](#Lie-algebras). See [Appendix] for the proof.

[^2]: John Lee, [*Introduction to Smooth Manifolds*, 2nd ed. Springer (2012)](https://www.amazon.com/Introduction-Smooth-Manifolds-Graduate-Mathematics/dp/1441999817/), p. 86.

[^3]: William Fulton and Joe Harris, [*Representation Theory: A First Course* Springer (2004)](https://www.amazon.com/Representation-Theory-Course-Graduate-Mathematics/dp/0387974954).
