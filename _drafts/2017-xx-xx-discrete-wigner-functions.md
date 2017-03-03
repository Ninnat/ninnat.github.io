---
layout: post
title: Discrete Wigner Functions
subtitle:
categories:
  - Quantum
tags:
---
Status: *in progress*

Instead of operators, quantum states (pure and mixed) can be represented by their expansion coefficients in some preferred (possibly overcomplete) basis. A well known fact that perhaps deserves to be known more is that the (possibly overcomplete) basis can be chosen so that the expansion coefficients are always real numbers. Instances of these representations of quantum states are “probability table” representations constructed from informationally complete measurements and quasi-probability representations.

The notion of bases and overcomplete bases are unified in the notion of frames. The only thing we need from a frame is that it spans the vector space of interest. We formalize this requirement in the following definition. A set of vector $\{ \ket{\phi_{j} \}$ in a vector space $V$ is a **frame** for $V$ if and only if it satisfies
\begin{align}
av^2 \le \sum_{j} |\braket{\phi_j | v}|^2 \le bv^2,
\end{align}
for some strictly positive numbers $a,b>0$ and every nonzero $\ket{v} \in V$ with the norm $v = \braket{v|v}$. The condition implies that the frame spans the vector space because if it does not, we can choose a vector outside the span and make the sum vanishes. Thus any vector can be deconstructed into expansion coefficients using a frame.

The reverse process of reconstructing the vector from the expansion coefficients $\braket{\phi_j | v}$ is done using a **dual frame** $\{ \ket{\widetilde{\phi}_j} \}$.
 |v\rangle	=\sum_{j}\langle\phi_{j}|u\rangle|\widetilde{\phi}_{j}\rangle.

A frame is tight if $a=b$
 .
