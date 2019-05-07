---
layout: post
title: Operator-Function Correspondence
subtitle:
date: 2019-03-05
categories:
  - Representation theory
tags:
---

It's hard to write a long paper without someone else as a sounding board.

The goal is simple
$$ L^2(G/K) = \lim_{N\to\infty} \Sym^N V_{\lambda} \otimes (\Sym^N V_{\lambda})^* $$

A frame

A group covariant frame can be thought of as a mapping from the operator space to

Thus, one would expect that $L^2(\SO(8)/\U(4))$ contains $\End 8_+$, which is indeed the case:
$$\begin{align}
	L^2(\SO(8)/\U(4)) \underset{\SO(8)}{\cong} 1 \oplus 28 \oplus 35_+ \oplus 294_+ \oplus 300 \oplus 567_+ \oplus 1386_+ \oplus \cdots.
\end{align}$$
Moreover, $L^2(\SO(8)/\U(4))$ is \emph{multiplicity-free} as an $SO(8)$-representation; each irrep that appears in the decomposition appears only once. By Frobenius reciprocity, a theorem that translates $G$-multiplicities of irreps in $L^2(G/K)$ to $K$-multiplicities of those same irreps, each irreducible subspace in $\End 8_+$ contains one and only one $K$-invariant, the simplifying technical assumption in section \ref{sec:covariant-frames}.

In fact, for an arbitrary $N$, it is possible to verify that every irrep in $\End(\SYM^N 2^{n-1}_+)$ appears in the function space, the symmetric power $\SYM^N 2^{n-1}_+$ being the space spanned by $N$-fold copies $\ket{\psi}^{\otimes N}$ of pure states in the even spinor irrep. Symbolically,
$$\begin{align}
	L^2(\SO(2n)/\U(n)) \underset{\SO(2n)}{\cong} \lim_{N\to\infty} \End(\SYM^N 2^{n-1}_+).
\end{align}$$
This identity allows us to better approximate positive functions in $L^2(\SO(2n)/\U(n))$ by applying the quasi-probability formalism not to the original Hilbert space but to its symmetric power. It should be emphasized that this strategy does not apply to a general mixture which actually lives in $\End\hilb$. This is because neither $\SYM^N(\End\hilb)$ (copies of mixtures) nor $\End(\SYM^N\hilb)$ (mixtures of copies) contains the other; their intersection is precisely the pure states. We could identify a mixture $\sum_j \ketbra{\psi}{\psi}$ by $\sum_j (\ketbra{\psi}{\psi})^{\otimes N}$ in $\End(\SYM^N\hilb)$, but now different ensemble decompositions of a physically equivalent mixture could be represented by distinguishable mixtures in $\End(\SYM^N \hilb)$. In other words, $\End(\SYM^N \hilb)$ gives a [*preparation non-contextual*](https://arxiv.org/abs/quant-ph/0406166) representation of mixtures in a physical state.

To accommodate mixtures, the formalism should be applied to representations $\hilb$ that are \emph{reducible}  as well as irreducible ones. Despite the shortcoming, we restrict ourselves in this paper to $\hilb$ irreducible $\hilb$ of a semisimple Lie group $G$ and leave the generalization to mixtures for future work.
