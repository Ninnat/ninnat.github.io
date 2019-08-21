---
layout: post
title: Ingredients for quantum computational supremacy [Draft]
subtitle:
date: 2019-08-21
categories:
  - Quantum computing
tags:
---

*Epistemic status: Summarizing research literature*



Is there a task in which quantum computers can achieve beyond what any classical algorithm can do, even those yet undiscovered? These days we use the term *quantum supremacy*, [coined by John Preskill](https://arxiv.org/abs/1203.5813), to mean such an achievement. I believe that the search for rigorous, complexity-theoretic proof of quantum supremacy[^1] goes back to the [2002 paper by Terhal and DiVincenzo](https://arxiv.org/abs/quant-ph/0205133) (published in 2004). Then  [BosonSampling](http://arxiv.org/abs/1011.3245) by Aaronson and Arkhipov in 2010 kicked start the experimental race for quantum supremacy that continues to this day. These theoretical proofs of quantum supremacy all rule out classical simulations of certain quantum systems by arguing that if such simulations are possible, then there will be a devastating consequence, "collapse of the polynomial hierarchy", which is deemed unlikely by computer scientists. Such an argument is not known for factoring. In other words, if tomorrow someone figures out a fast way to factor integers on a classical computer [^2], we will have to switch to a different encryption scheme. But other than that, the reality that we know of will still mostly be the same as before.

Now switching from a very general exposition to a technical question that I'm interested in: what are the ingredients for proofs of quantum supremacy, especially in a *random quantum circuit* architecture? In this setting, there is an ensemble $\mathcal{E}$ of quantum circuits $U$
<center>
<img src="/assets/img/2019/qcircuit.png" style="width: 1000px;"/>
</center>

and we want to "simulate" the outcome probabilities $p_x = |\av{x|U|0}|^2$ for some $x \in \{0,1\}^{2^n}$. There are two major "axes" of possible kinds of simulations.

1. By "simulate", we may want to estimate $p_x$ up to a multiplicative precision
  $$ |p_x - q_x| \le \gamma p_x,$$
  *or* we just want to estimate $p_x$ up to an additive precision
  $$ |p_x - q_x| \le \epsilon. $$

2. We may want to simulate all quantum circuits in $\mathcal{E}$ *or* just some fraction of them.

An approximation with multiplicative error is much stronger than with additive error; if $p_x = 0$, then $q_x$ must be exactly $p_x$.

Fun fact: exactly computing $p_x$, even for a subclass of quantum circuits that does only classical probabilistic computation (Toffolis interleaved with Hadamards to simulate coin flips) [is $\cc{\#P}$-complete](https://arxiv.org/abs/0811.0898). (Does this mean that proving quantum supremacy is easier than we thought?) When a problem is $\cc{\#P}$-complete, it can be shown that multiplicative approximations to solutions of these problems are still $\cc{\#P}$-complete. [^3] (I can't confirm this statement, but it seems likely.)

Ideally, we would like a result that says that an additive approximation of $p_x$ by a classical machine is hard on average.

1. PH does not collapse.
2. Worst-to-average case reduction
3. Anti-concentration

# Good multiplicative approximation in $\cc{BPP^{NP}}$

We follow the argument in

- Bremner, Montanaro and Shepherd, [*Average-case complexity versus approximate simulation of commuting quantum computations*](https://arxiv.org/abs/1504.07999) (2016)

also repeated for random quantum circuits in
- Boixo *et al.*, [*Characterizing Quantum Supremacy in Near-Term Devices*](http://arxiv.org/abs/1608.00263) (2018).

Suppose that there exists a classical sampler that gives an additive estimate $q_x$ of $p_x$:
$$\sum_{x\in\{0,1\}^{2^n}} |p_x - q_x| \le \epsilon.$$
By Stockmeyer's counting, there is an $\mathrm{BPP^{NP}}$ machines that turns this into an estimate $\tilde{q}_x$ multiplicatively closed to $q_x$
$$ |q_x - \tilde{q}_x| \le \frac{q_x}{\mathrm{poly}(n)} $$
If $p_x$ anti-concentrates, $\tilde{q}_x$ turns out to be an estimate of $p_x$ with relative multiplicative error
$$ |p_x-\tilde{q}_x| \le p_x \left(\frac{1}{4} + \frac{1}{\mathrm{poly}(n)}\right) $$
for a substantial fraction of the circuits

**Proof.**
$$\begin{align}
    |p_x-\tilde{q}_x| &\le |p_x-q_x| + |q_x - \tilde{q}_x|   &\text{Triangle inequality}\\
        &\le |p_x-q_x| + \frac{q_x}{\mathrm{poly}(n)}     &\text{Stockmeyer's counting}\\
        &\le |p_x-q_x| + \frac{|p_x - q_x| + p_x}{\mathrm{poly}(n)}    &\text{Triangle inequality}\\
        &= \frac{p_x}{\textrm{Poly}(n)} + |p_x-q_x|\left(1 + \frac{1}{\textrm{poly}(n)}\right)
\end{align}$$
Using [Markov's inequality](https://en.wikipedia.org/wiki/Markov%27s_inequality),
$$\begin{align}
    \mathrm{Pr} \left[ |p_x-q_x| \ge \frac{\epsilon}{2^n\delta} \right] &\le \frac{\mathbb{E}(|p_x-q_x|)2^n\delta}{\epsilon} = \delta \\
    \mathrm{Pr} \left[ |p_x-q_x| \le \frac{\epsilon}{2^n\delta} \right] &\ge 1-\delta
\end{align}$$
and an [anti-concentration bound](https://arxiv.org/abs/1706.03786) from approximate unitary 2-designs (or, in the Google paper, a similar property of the Porter-Thomas distribution)
$$\begin{align}
    \mathrm{Pr} \left[ p_x > \frac{\epsilon}{2^n\delta\gamma}  \right] &\ge \eta,
\end{align}$$
Then for a $(1- \delta)\cap\eta$ fraction of quantum circuits,
$$\begin{align}
    |p_x-\tilde{q}_x| &\le p_x\left(\gamma + \frac{1}{\mathrm{poly}(n)}\right),
\end{align}$$
where $0 < \gamma <1$ is some small constant, which we can choose to be 1/4. Note that we need to choose $\delta$ such that $(1- \delta)\cup\eta > 1$ to make the intersection $(1- \delta)\cap\eta$ nonzero.

We therefore obtain a multiplicative error estimate of $p_z$ for some fraction of quantum circuits. If $p_z$ is hard ($\cc{\#P}$) to compute *on average*, then we have shown that $\cc{P^{\#P}}\subset\cc{BPP^{NP}}$ which is contained in the third level of $\cc{PH}$ by the [Sipser–Gács–Lautemann theorem](https://en.wikipedia.org/wiki/Sipser%E2%80%93Lautemann_theorem). But by [Toda's theorem](https://en.wikipedia.org/wiki/Toda%27s_theorem), $\cc{PH}\subset\cc{P^{\#P}}$ so $\cc{PH}$ collapses to the third level.

<center>
<img src="/assets/img/2019/complexity-classes.png" style="width: 750px;"/>
</center>

## Anti-concentration

### By unitary 2-designs

- Hangleiter, Bermejo-Vega, Schwarz and Eisert, [*Anticoncentration theorems for schemes showing a quantum speedup*](http://arxiv.org/abs/1706.03786) (2018)

## Are "anti-concentrate" probabilities really anti-concentrate?

- Hangleiter, Kliescha, Eisert and Gogolin, [*Sample complexity of device-independently certified "quantum supremacy"*](http://arxiv.org/abs/1812.01023) (2019)

# Worst-to-average case reduction

- Bouland, Fefferman, Nirkhe and Vazirani,[*Quantum Supremacy and the Complexity of Random Circuit Sampling*](http://arxiv.org/abs/1803.04402) 1803.04402

<!--
A problem $A$ is as hard as a problem $B$, written as $A \ge B$ in symbols, if the ability to solve $A$ implies the ability to solve $B$ with a polynomial time overhead. In which case, we say that there is a *polynomial-time reduction* from $A$ to $B$.

There is quite a few notions of polynomial-time reduction. We will use the oracular one (*Cook reduction*) since it allows us to reduce decision problems to function problems (especially counting problems in $\textrm{P}^{\#\textrm{P}}$). In this notion, a problem $B$ is Cook-reducible to problem $A$ if $B$ can be solved a polynomial time of calls to an oracle that solves $A$ suffices to solve $B$.

# Stockmeyer's approximate counting

$\textrm{BPP} \subset \Sigma_2 \cap \Pi_2$ ([Sipser–Gács–Lautemann theorem](https://en.wikipedia.org/wiki/Sipser%E2%80%93Lautemann_theorem)) It is not know that $\textrm{BPP}\subset\textrm{NP}$. (The NP-analogue for BPP is [MA](https://en.wikipedia.org/wiki/Arthur%E2%80%93Merlin_protocol). Thus, BQP, being more similar to BPP than to P, has [QMA](https://en.wikipedia.org/wiki/QMA) as the NP-analogue.)-->

[^1]: in a non-black-box setting. Quantum advantage in a black box setting was already established long ago in the noiseless case by the [Deutsch-Jozsa algorithm](https://en.wikipedia.org/wiki/Deutsch%E2%80%93Jozsa_algorithm) and in the noisy case by [Simon's algorithm](https://en.wikipedia.org/wiki/Simon_algorithm).

[^2]: Henry Cohn, "[Factoring may be easier than you think](http://math.mit.edu/~cohn/Thoughts/factoring.html)"

[^3]: More accurately, in the quantum setting [we consider $\cc{GapP}$](https://www.nature.com/articles/s41534-017-0018-2) instead of $\cc{\#P}$ complexity classes.
