---
layout: post
title: Non-abelian Fourier transform as inserting the identity
subtitle:
date: 2019-04-16
categories:
  - Representation
tags:
---

In quantum mechanics, there is an easy way to remember how to do the Fourier transform: just insert the identity:
$$\begin{align}
  \tilde{\psi}(p) = \av{p|psi} = \int dx \av{p|x}\av{x|\psi} = \int dx\, e^{-ipx} \psi(x).
\end{align}$$
$e^{-ipx}$ has the correct sign because $\av{p|x}$ is the complex conjugate of the right-moving plane wave $\av{x|p} = e^{ipx}$. In this post, I want to describe how to write *non-abelian* Fourier transforms (on finite groups for convenience) as insertion of the identity *superoperator*.

For a general group $G$, Fourier transform happens on the **group algebra** $k[G]$ over a field $k$. If the characteristic of $k$ does not divide $|G|$,
$$\begin{align}
  \C[G] \cong \bigoplus_{\lambda \in \hat{G}} \End V_{\lambda}
\end{align}$$
$$\begin{align}
  |g) = \frac{1}{\sqrt{|G|}} \rho_L (g) && |\lambda jk) = \sqrt{d_{\lambda}} \ketbra{j}_{\lambda}\bra{k}
\end{align}$$
