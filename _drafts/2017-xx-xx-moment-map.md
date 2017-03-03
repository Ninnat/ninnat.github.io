---
layout: post
title: Moment Maps
subtitle:
categories:
tags:
---

## Pullback and pushforward

What pushforward and pullback do is turning a smooth map $\phi:M \to N$ to a linear map, going forward or backward, between the fibers at points $p$ and $\phi(p)$ of vector bundles whose base manifolds are $M$ and $N$.
In order to talk about pushforward and pullback, we have to know which direction is "forward". This is fixed by a map $\varphi: M \to N$ between two smooth manifolds.

- A point $p \in M$ is sent forward by to a point $\phi (p) \in N$ by the map. (This is not yet given the name "pushforward".)
- A function $f \in C^{\infty}(N)$ is pulled back to a function on $M$ because the domain of the composite function $f \circ \phi$ is $M$. This action is called the pullback by $\phi$$ and is denoted by $\phi^*$. That is,
$$ \begin{align*}
  \phi^* f = f \circ \phi
\end{align*} $$
- A vector $v \in T_p M$ is pushed forward because it acts on a function which is pulled back by $\phi$.
$$ \begin{align*}
  (\phi_* v) (f) = v(\phi^* f) = v(f \circ \phi)
\end{align*} $$
- Now you see the pattern. A 1-form $\omega \in T^*_q N$ is pulled back because it acts on a vector.
$$ \begin{align*}
  (\phi^* \omega) (v) = \omega (\phi_* v)
\end{align*} $$
Once functions are thought of as 0-forms, the rule is that vectors are pushed forward and covectors or forms are pulled back.
