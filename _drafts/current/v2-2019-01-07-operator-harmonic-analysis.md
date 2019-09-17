---
layout: post
title: Harmonic analysis of linear operators
subtitle:
date: 2019-01-07
categories:
  - Representation theory
tags:
---

*Epistemic status: the math is correct for specific examples, but the interpretation is speculative.*

Suppose that we have a classical state space $X$ namely a [phase space](https://en.wikipedia.org/wiki/Phase_space). Functions on $X$ (such as the energy) can be thought of as classical observables. Sometimes we need to be rigorous about what we mean by a "function", but for now let us leave that aside and denote the space of functions on $X$ by $F(X)$.

Everybody knows that a quantum (pure) state space is a complex Hilbert space $\C^{d+1}$ (the reason for the +1 will be clear in a moment), Hermitian linear operators on which are quantum observables. But to be precise, the pure states are normalized vectors in $\C^{d+1}$.  Alternatively, we say that the quantum state space is the [complex projective space](https://en.wikipedia.org/wiki/Complex_projective_space) $\C P^d = (\C^{d+1} - \{0\})/\C$, the set of all one-dimensional subspaces of $\C^{d+1}$.

One way to connect the two notions is to declare that $X$ can be any [complex submanifold](https://en.wikipedia.org/wiki/Complex_manifold) of $\C P^d$. This might sound like a wrong thing to do; it makes some vague sense that a classical state space would be *some* strict submanifold of a quantum state space, but an arbitrary submanifold can be very large or even the entire $\C P^d$ itself. I hope to come back to this point in a future post, but let us say for now that $X$, being a complex submanifold of $\C P^d$, is automatically [Kähler](https://en.wikipedia.org/wiki/K%C3%A4hler_manifold) and thus has the [symplectic](https://en.wikipedia.org/wiki/Symplectic_manifold) structure of a phase space (and more).

## 1. Framing the Problem

Now we switch gears a little bit. A [*frame*](https://en.wikipedia.org/wiki/Frame_(linear_algebra)) for a vector space $V$ is just a spanning set of $V$, but they sometimes have physical meaning when $V$ is related to the quantum state space $\C^{d+1}$. A frame for $\C^{d+1}$ itself gives a rank-one quantum measurement. A frame for $\End(\C^{d+1}) = (\C^{d+1})^* \otimes \C^{d+1}$ consists only of [positive operators](https://en.wikipedia.org/wiki/Definiteness_of_a_matrix) gives an informationally-complete measurement. A frame doesn't have to be covariant, but many useful ones are. A frame $X$ is *$G$-covariant* if a group $G$ acts transitively on $X$. That is, for any pair $x,y \in X$, there is $g \in G$ that brings $x$ to $y$: $y=gx$. A $G$-covariant frame, in other words, is nothing but a $G$-orbit that happens to be a frame. <!-- (Note that we are not interested whether there is a group $G$ that acts on $X$ transitively. There is always such a group: the permutation group of $X$).--> The orbit can sometimes be described efficiently and for that reason leads to simplification. For example, the discrete [Weyl-Heisenberg group](https://en.wikipedia.org/wiki/Heisenberg_group) gives rise to explicit constructions of various useful frames in quantum information processing such as [MUBs](https://en.wikipedia.org/wiki/Mutually_unbiased_bases), [SIC-POVMs](https://en.wikipedia.org/wiki/SIC-POVM), and higher [complex projective designs](https://en.wikipedia.org/wiki/Quantum_t-design). You might notice that I have used $X$ for both covariant frames and classical state spaces. That was intentional as a $G$-orbit sometimes possesses a complex structure and thus becomes a classical state space (according to our working definition).

The problem of finding a $G$-covariant frame reduces to constructing a $G$-orbit that is also a frame. This is easy when the vector space $\C^{d+1}$ is a $G$-irrep. For any $G$-orbit $\{\ket{\Omega}\} \subset C^{d+1}$, the integral
$$ \int d\Omega \ketbra{\Omega}{\Omega} $$
being invariant under any conjugation action by $G$, is therefore proportional to the identity by Schur's lemma. This is equivalent to saying that the orbit $\{\ket{\Omega}\}$ is a [tight frame](https://en.wikipedia.org/wiki/Frame_(linear_algebra)#Tight_frames) for $\C^{d+1}$.    

The next natural case is $\End(\C^{d+1})$. Since the identity $\id$ is the trivial irrep, $\End(\C^{d+1})$ is always reducible even if $\C^{d+1}$ is irreducible. From now on let us make a simplifying assumption that $G$ is a [simple Lie group](https://en.wikipedia.org/wiki/Simple_Lie_group) (which is really all I care about for now) and $\End(\C^{d+1})$ is *multiplicity-free* as a $G$-representation. That is, no $G$-irrep occurs more than once in its irreducible decomposition. Physicists might even like to say that the representation is $G$-*non-degenerate*.

What I stumbled on in my work is that the non-degeneracy is implied by a privilege $G$-orbit in $P\C^d$ being a [spherical variety](https://en.wikipedia.org/wiki/Spherical_variety) (actually most of them will be [symmetric spaces](https://en.wikipedia.org/wiki/Symmetric_space)).

Let $V_{\lambda}$ be an irrep (irreducible representation) of $G$ with highest weight $\lambda$.


$$ F(X) = \lim_{N\to\infty} \End (\Sym^N V_{\lambda})$$
By taking the tensor product of identical quantum systems in the same state, making the system more and more classical, we could also recover classical observables from quantum observables.

admittedly based on anecdotes when $X$ are [spherical varieties](https://en.wikipedia.org/wiki/Spherical_variety) based on [simple Lie groups](https://en.wikipedia.org/wiki/Simple_Lie_group). (There is a technical reason to focus on spherical varieties, but a lot of them are [symmetric spaces](https://en.wikipedia.org/wiki/Symmetric_space) and I hope you will see in this blog post the description of $F(X)$ is especially nice when $X$ is a symmetric space. I also realize it is better to think of the complexified version of the symmetric space and the corresponding [Iwasawa decomposition](https://en.wikipedia.org/wiki/Iwasawa_decomposition)) In the past few months, I can't quite put into words what this identity *means*. Let me try in this blog post.


Recently I have come to believe that for my purpose I should think of $\End(\C^{d+1})$ as "[projectivized](https://en.wikipedia.org/wiki/Projectivization)" $\C^{d+1}$ instead.

Instead, Baez proposing, let us start with a [complex projective variety](https://en.wikipedia.org/wiki/Projective_variety#Complex_projective_varieties) $\C P^n \subset \C^{n+1}$, then take a smallest subspace in $V \subset \C^{n+1}$ whose [projectivized](https://en.wikipedia.org/wiki/Projectivization) space $\mathbb{P}V$ contains $M$ to be its quantization
$$ Q(M) = V. $$
Projectivization gives back
$$ P(V) = M $$

In this way, we have the category ``Class`` of classical state spaces and ``Quant`` of quantum state spaces and a pair of adjoint functors between them, (Note that at this point [Part 3](https://johncarlosbaez.wordpress.com/2018/12/27/geometric-quantization-part-3/), these categories only have the structure of [posets](https://en.wikipedia.org/wiki/Partially_ordered_set).)

A unitary representation decomposes into a direct sum of copies of isomorphic irreps, each with multiplicity $n_{\lambda}$.
$$\begin{align}
	V \underset{G}{\cong} \bigoplus_{\lambda} \bigoplus^{n_{\lambda}} V_{\lambda}.
\end{align}$$
Each $\bigoplus^{n_{\lambda}} V_{\lambda}$ is called an *isotypic* component of $V$, and the decomposition is *multiplicity-free* if $n_{\lambda}$ is only 0 or 1. We know exactly the isotypic decomposition of $L^2(G)$ for compact groups. The Peter-Weyl theorem which can be interpreted as a decomposition under the simultaneous left-right $G$-action reads\footnote{For Lie groups, the right hand side is dense in $L^2(G)$ with respect to the supremum norm $||f||_{\inf} = \sup |f(g)|$.
For algebraic groups, the left hand side is usually restricted to \emph{regular functions}, functions that are polynomials in matrix entries of $g$ and $(\det g)^{-1}$ in the defining representation, and the equality is strict.}
$$\begin{align}
	L^2 (G) \underset{G\times G}{\cong} \bigoplus_{\lambda\in\hat{G}} V_{\lambda} \otimes V^*_{\lambda}.
\end{align}$$
Since functions in $L^2(G/K) \subset L^2 (G)$ are right-invariant under $K$, we necessarily have
$$\begin{align}
	L^2 (G/K) \underset{G\times G}{\cong} \bigoplus_{\lambda\in\hat{G}} V_{\lambda} \otimes (V^*_{\lambda})^K.
\end{align}$$
$L^2(G/K)$ contains the tensor product $V_{m\lambda} \otimes V^*_{n\lambda}$ for arbitrary integers $m,n$ \cite{littelman1994}. Thus, $\End(V_{m\lambda}) = V_{m\lambda} \otimes V^*_{m\lambda}$ is multiplicity-free only if $L^2(G/K)$ is multiplicity-free, in which case \eqref{eq:G/K-isotypic} says that every $V_{\lambda}$ that appears in the isotypic decomposition has only one-dimensional $K$-invariant subspace.

%The literature on multiplicity-free spaces is often framed in the language of algebraic groups; \cite{littelman1994} is no exception.

Let $G_0$ be a real semisimple Lie group and $G$ be its complexification, with Lie algebras $\g_0$ and $\g$ respectively. And let $K_0 \subset G_0$ be a (projective) stabilizer subgroup, fixing the highest weight state up to a phase, and $K$ its complexification. $\k_0$ and $\k$ be their Lie algebras.
$$\begin{align}
	\g &= \overbrace{\bigoplus_{\alpha \in \Sigma_+} \g_{-\alpha}}^{\displaystyle\n_-} \oplus \h \oplus \overbrace{\bigoplus_{\alpha \in \Sigma_+} \g_{\alpha}}^{\displaystyle\n_+}
		&\text{Root space decomposition} \\
	G &= U_- HU_+
		&\text{Gauss decomposition}
\end{align}$$
Tautologically, $V$ is multiplicity-free if every highest weight vector appears at most once in $V$. Since a highest weight vector is annihilated by $\n_+$ by definition, it is an eigenvector of the normalizer of $U_+ = e^{\n_+}$
$$\begin{align}
	N_G (U_+) = HU_+ =: B,
\end{align}$$
called a \emph{Borel subgroup}. A common geometric technique to show that $L^2(\Lambda)$ has no multiplicity is to show that $B$ has an open and dense orbit in $\Lambda$ (in the Zariski topology) \cite{goodman2009,howe1992}. The classification of all multiplicity-free tensor products of the form $V_{\lambda} \times V^*_{\lambda}$ (and more) was given in \cite{littelman1994} for simple groups. As it turns out \cite{stembridge2003}, $V_{\lambda} \times V^*_{\lambda}$ can be multiplicity-free only if $\lambda$ is a multiple of a fundamental weight $\omega$. In this case, the stabilizer group in the complexified $G$ of the highest weight vector is not only larger than $B$ but is maximally so. These subgroups associated with the fundamental weights $\omega_j$ are called \emph{maximal parabolic subgroups} $P_j$. Their Lie algebras are almost all of $\g$ except one root space
$$\begin{align}
	\p_j = \mathfrak{b} \oplus \bigoplus_{\substack{\alpha \in \Sigma^+ \\ \alpha \neq \alpha_j}} \g_{-\alpha}.
\end{align}$$
$P_j$ is specified by a single node in the Dynkin diagram. $K_0 = P_j \cap G_0$.

The theorem of Cartan and Helgason characterizes all irreps with a non-degenerate $K$-invariant by their highest weights $\lambda$.

**Theorem.**--An irrep with highest weight $\lambda$ appears in \eqref{eq:G/K-isotypic} if and only if
	$\lambda(\t) = 0$ and $\frac{\av{\lambda,\alpha}}{\av{\alpha,\alpha}}$ is a positive integer for all positive restricted roots $\alpha$.

In other words, $\lambda$ trivially extends linear functionals from $\a$ to $\h$ (by evaluated to 0 on $\t$) and $\lambda/2$ is a dominant integral weight with respect to $\alpha$'s. (Notably this excludes the fundamental spinor irreps.)
