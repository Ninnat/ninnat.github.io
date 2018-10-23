---
layout: post
title: Lie-Group Transitive Frames
subtitle:
date: 2018-09-05
categories:
  - representation theory
tags:
---

I'm not exactly sure how to title this post, but it might be of independent interest.

For $d$ finite, a frame is just a spanning set of a $d$-dimensional inner product space. Most of the time in quantum theory you are either interested in a frame for the pure state space $\mathbb{C}^d$ or for the space of linear operators $text{End}(\mathbb{C}^d) = \mathbb{C}^d \otimes \mathbb{C}^{d*}$. Frames for the former are synonym with generalized measurements, POVMs, that consist solely of rank-one measurement operators. Frames for the latter are interesting because they formalize aspects of [complementarity](https://arxiv.org/abs/1004.3348), [quantum error correcting codes](http://faculty.cs.tamu.edu/klappi/ueb/ueb.html), and [quasi-probabilities and quantum foundations](https://arxiv.org/abs/1010.2701). Some, such as [SIC-POVMs](https://en.wikipedia.org/wiki/SIC-POVM) and [coherent states](https://en.wikipedia.org/wiki/Coherent_states), are frames for both.

A lot of time, the frame is transitive under some group $G$. This means that every frame element can be reached from a fixed, fiducial frame element by some $g \in G$. Such a frame is called a *$G$-covariant frame*. An irrep $(\rep,V)$ of $G$ automatically gives rise to such a frame; take an orbit of $G$ and define
$$\begin{align}
  \ket{\Omega} = \rep(g)\ket{0}.
\end{aligned}$$
Then
$$\begin{align}
  \int d\Omega \ketbra{\Omega}{\Omega} = \frac{\hat{1}}{d},
\end{align}$$
by Schur's lemma, where $d$ is the dimension of $V$. So every vector in $V$ can be expanded using $\{\ket{\Omega}\}$.

Given an irrep

# Trying to establish a bijection
