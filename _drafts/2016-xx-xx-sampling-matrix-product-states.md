---
layout: post
title: Matrix Product States
subtitle:
---

<!--- Introduction -->

> The underlying physical laws necessary for the mathematical theory of a large part of physics and the whole of chemistry are thus completely known, and the difficulty is only that the exact application of these laws leads to equations much too complicated to be soluble.

Paul Dirac

The curse of dimensionality.

[Hilbert space is a big place](http://info.phys.unm.edu/~caves/research.html), far too big. [the convenient illusion of Hilbert space](http://arxiv.org/abs/1102.1360)

<!--- Tensor -->

What are tensors? Perhaps the easiest way to think about tensors is that they are multidimensional arrays like vectors or matrices. A $d$-dimensional vector $v$ is an array with one index. An $m$-by-$n$ matrix $M$ is an array with two indices, and so on. More abstractly, they map values of the indices to the components. (We work with complex numbers $\mathbb{C}$ here.)
For a vector,
$$
 	\begin{aligned}
		v: \{ 1,\dots ,d\} &\to \mathbb{C}, \\
		j &\mapsto v_j.
	\end{aligned}
$$
If it is a (row) vector in a vector space $V$, the mapping is realized by a multiplication with a basis covector (column vector) $f_j$ from the dual space $v^*$. (That's just the definition of the dual space. Its element pairs with an element of $V$ to give a number.) More generally we have a natural pairing: $v \in V$ is a map from $V^*$ while $w \in V^*$ is a map from $V$:
$$
		v: V^* &\to \mathbb{C}, &
		w: V &\to \mathbb{C}.
$$
Tensor is a generalization of this idea. An order $(r,s)$ *tensor* $T(r,s)$ is a multilinear map (meaning that fixing all but one index makes it a linear map)
$$
	T(r,s): \underbrace{V^* \times \cdots \times V^*}_{r \text{times}} \times \underbrace{V \times \cdots \times V}_{s \text{times}} \to \mathbb{C}
$$
As an example, a matrix is a $(1,1)$ tensor because a multiplication by a vector on the right gives back a vector and a multiplication by a covector on the left gives back a covector.
**
<!--- A graphical representation of tensors -->

I could introduce tensor multiplications and all kinds of tensor identities here, but it will be easier to see how they work once we introduce a graphical notation for writing tensors. So that'll be our next goal. If you want to know more about the rigorous definition of tensors and the tensor product space, [How to conquer tenserphobia](https://jeremykun.com/2014/01/17/how-to-conquer-tensorphobia/) by Jeremy Kun is a good place to start.  

Sticking to the tradition, we write components of a vector with a lower index v_j and components of a covector with an upper index w^k.

The *outer product* of two tensors of orders $(p,q)$ and $(r,s)$ gives a tensor of order $(p+r,q+s)$.
The *inner product* or *contraction* is the evaluation $v(w)=w(v)$ from a natural pairing by summing over repeated lower and upper indices $$\sum_j v_j w^j$$ or simply $$v_j w^j$$ in the Einstein summation convention.

<!--- diagrammatic methods -->

## The Choi-Jamiolkowski isomorphism

[^1]: Actually the Choi and the Jamiolkowski isomorphisms are [not the same](http://mattleifer.info/2011/08/01/the-choi-jamiolkowski-isomorphism-youre-doing-it-wrong/) but we will ignore that.
$$|j \rangle \langle k| \equiv |j \rangle \otimes |k \rangle $$

The is the fact that an operator $A$ is represented faithfully by its action on the maximally entangled state $\sum_j |j\rangle \otimes |j\rangle $.

## The trick with a maximally entangled state
