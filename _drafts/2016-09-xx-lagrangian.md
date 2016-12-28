---
layout: post
title: Lagrangian
subtitle:
---
Much of the progress in 20th century physics culminating in the standard model of fundamental forces relies on the principle of stationary action and the Lagrangian formulation of physics. But Lagrangian is often taught as a crank to turn to solve problems.

Take a mechanical example with a conservative force, the Lagrangian is postulated to be the kinetic energy $T$ minus the potential energy $V$:
$$
  L(q,\dot{q}) = T(\dot{q}) - V(q) = \frac{1}{2}m\dot{q}^2 - V(q)
$$
Then by asserting that the action
$$
  S = \int_{t_0}^{t} dt L(q,\dot{q})
$$
is extremized, one obtain the equation of motion
<!-- something about varying q and q dot independently -->
$$
  \frac{d}{dt}\left( \frac{\partial L}{\partial \dot{q}} \right) = \frac{\partial L}{\partial q}
$$
Here is the point that you have to correctly interpret the derivatives. $L$ is an explicit function only of $q$ and $\dot{q}$, not $t$. (The partial derivative $\frac{\partial L}{\partial t}$ vanishes.)

In the dedication page of the book *Applied Differential Geometry* by William L. Burke,

> To all those who, like me, have wondered how in hell you can change $\dot{q}$ without changing $q$.

Cases in point:
