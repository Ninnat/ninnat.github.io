---
layout: post
title: Ingredients for quantum computational supremacy [Draft]
subtitle:
date: 2019-08-21
categories:
  - Quantum computing
tags:
---

*Epistemic status: Summarizing research literature while trying to learn the topic*

<div id="toc"></div>

Is there a task in which quantum computers can achieve beyond what any classical algorithm can do, even those yet undiscovered? These days we use the term *quantum supremacy*, [coined by John Preskill](https://arxiv.org/abs/1203.5813), to mean such an achievement. I believe that the search for rigorous, complexity-theoretic proof of quantum supremacy[^1] goes back to the [2002 paper by Terhal and DiVincenzo](https://arxiv.org/abs/quant-ph/0205133) (published in 2004). Then  [BosonSampling](http://arxiv.org/abs/1011.3245) by Aaronson and Arkhipov in 2010 kick-started the experimental race for quantum supremacy in near-term quantum devices that continues to this day. These theoretical proofs of quantum supremacy all rule out classical simulations of certain quantum systems by arguing that if such simulations are possible, then there will be a devastating consequence, "collapse of the polynomial hierarchy", which is deemed unlikely by computer scientists. Such an argument is not known for factoring; if tomorrow someone figures out a fast way to factor integers on a classical computer [^2], we will have to switch to a different encryption scheme but that's about it. The concept of reality as we know it will still remain unchallenged, while a collapse of the polynomial hierarchy will bring us closer to the world in which $\cc{P=NP}$.

Now switching from a very general exposition to a technical question that I'm interested in: what are the ingredients for proofs of quantum supremacy, particularly in a *random quantum circuit* architecture? In this setting, there is an ensemble $\mathcal{E}$ of quantum circuits $U$
<center>
<img src="/assets/img/2019/qcircuit.png" style="width: 1000px;"/>
</center>

and we want to "simulate" the outcome probabilities $p_x = |\av{x|U|0}|^2$ for some $x \in \{0,1\}^{2^n}$. There are two major "axes" of possible kinds of simulations.

1. By "simulate", we may want to estimate $p_x$ up to a multiplicative precision
  $$ |p_x - q_x| \le \eta p_x,$$
  *or* we just want to estimate $p_x$ up to an additive precision
  $$ |p_x - q_x| \le \epsilon. $$

2. We may want to simulate all quantum circuits in $\mathcal{E}$ *or* just some fraction of them.

Multiplicative approximation is much stronger than additive one; if $p_x = 0$, then a multiplicative estimate $q_x$ must exactly equal $p_x$. When a problem is $\cc{\#P}$-complete, it can be shown that multiplicative approximation to solutions of these problems are still $\cc{\#P}$-complete. [^4]

Fun fact: exactly computing $p_x$, even for a subclass of quantum circuits that does only classical probabilistic computation (a layer of Hadamard's to simulate coin flips, followed by diagonal gates) [is $\cc{\#P}$-complete](https://arxiv.org/abs/0811.0898) [^3]. (Does this mean that proving quantum supremacy is easier than we thought?)

Ideally, we would like a result that says that additive approximation of $p_x$ by a classical machine is hard on average...

1. PH does not collapse.
2. Average-case hardness
3. Anti-concentration

# Good multiplicative approximation in $\cc{BPP^{NP}}$

All existing proofs of quantum supremacy require a $\cc{\#P}$-hard problem that can't be solved efficiently on any classical computer.
It is a fairly common misconception that these hard problems can, in contrast, be solved efficiently on a quantum computer (by simulating BosonSampling for example). So let me state this clearly: **quantum computers are not believed to be able to solve $\cc{NP}$-complete problems efficiently, let alone $\cc{\#P}$-complete problems.** The arguments for quantum supremacy are more subtle and rely on an unphysical process known as *Stockmeyer's counting* that, given a classical machine that outputs a probability $q_x$, there is a $\cc{BPP^{NP}}$ machine that produces a multiplicative estimate $\tilde{q}_x$. Aaronson and Arkhipov's insight was that sometimes this estimate $\tilde{q}_x$ is also a *multiplicative* estimate to the probability $p_x$ to which the output $q_x$ of the classical device is an additive estimate. In other words, Stockmeyer's counting can sometimes improves an additive estimate to a multiplicative one. While additive approximation to $p_x$ doesn't let you solve a $\cc{\#P}$-complete problem in polynomial time, it does if you also have an $\cc{NP}$ oracle.

We follow the argument in

- Bremner, Montanaro and Shepherd, [*Average-case complexity versus approximate simulation of commuting quantum computations*](https://arxiv.org/abs/1504.07999) (2016)

also repeated for random quantum circuits in Appendix G of
- Boixo *et al.*, [*Characterizing Quantum Supremacy in Near-Term Devices*](http://arxiv.org/abs/1608.00263) (2018).

Suppose that there exists a classical sampler that gives an additive estimate $q_x$ of $p_x$:
$$\sum_{x\in\{0,1\}^{2^n}} |p_x - q_x| \le \epsilon.$$
By Stockmeyer's counting, $q_x$ can be approximated with multiplicative precision by a $\mathrm{BPP^{NP}}$ machine
$$ |q_x - \tilde{q}_x| \le \frac{q_x}{\mathrm{poly}(n)}. $$
Let's combine these two facts together.
$$\begin{align}
    |p_x-\tilde{q}_x| &\le |p_x-q_x| + |q_x - \tilde{q}_x|   &\text{Triangle inequality}\\
        &\le |p_x-q_x| + \frac{q_x}{\mathrm{poly}(n)}     &\text{Stockmeyer's counting}\\
        &\le |p_x-q_x| + \frac{|p_x - q_x| + p_x}{\mathrm{poly}(n)}    &\text{Triangle inequality}\\
        &= \frac{p_x}{\textrm{Poly}(n)} + |p_x-q_x|\left(1 + \frac{1}{\textrm{poly}(n)}\right)
\end{align}$$
If $|p_x-q_x|$ can be bounded above by $p_x$, then $\tilde{q}_x$ is a multiplicative approximation to $p_x$ that we want. This is done in two steps:

<!-- If $p_x$ anti-concentrates, $\tilde{q}_x$ turns out to be an estimate of $p_x$ with relative multiplicative error
$$ |p_x-\tilde{q}_x| \le p_x \left(\frac{1}{4} + \frac{1}{\mathrm{poly}(n)}\right) $$
for a substantial fraction of the circuits-->

1. Use [Markov's inequality](https://en.wikipedia.org/wiki/Markov%27s_inequality)
$$\begin{align}
    \mathrm{Pr} \left[ |p_x-q_x| \ge \frac{\epsilon}{2^n\delta} \right] \le \frac{\mathbb{E}(|p_x-q_x|)2^n\delta}{\epsilon} \le \delta \iff
    \mathrm{Pr} \left[ |p_x-q_x| \le \frac{\epsilon}{2^n\delta} \right] \ge 1-\delta
\end{align}$$
to bound $|p_x-q_x|$ by a constant for $1-\delta$ fraction of quantum circuits.

2. Invoke "anti-concentration" of probabilities (conjectured for BosonSampling, proved for random quantum circuits and more)
$$\begin{align}
    \mathrm{Pr} \left[ p_x > \frac{\epsilon}{2^n\delta\eta}  \right] &\ge \gamma,
\end{align}$$
to bound the constant by $p_x$, where $\eta$ is some small constant. Now $(1- \delta)\cap\gamma$ fraction of quantum circuits will satisfy
$$\begin{align}
    |p_x-\tilde{q}_x| &\le p_x\left(\eta + \frac{1}{\mathrm{poly}(n)}\right).
\end{align}$$
For $(1- \delta)\cap\gamma$ to be non-empty, we need to pick $\delta$ such that $(1- \delta)\cup\gamma > 1$.

If $p_z$ is $\cc{\#P}$-hard to compute for this fraction of quantum circuits, then we have shown that $\cc{P^{\#P}}\subset\cc{BPP^{NP}}$ which is contained in the third level of $\cc{PH}$ by the [Sipser–Gács–Lautemann theorem](https://en.wikipedia.org/wiki/Sipser%E2%80%93Lautemann_theorem) on the one hand. On the other hand, $\cc{PH}\subset\cc{P^{\#P}}$ by [Toda's theorem](https://en.wikipedia.org/wiki/Toda%27s_theorem), so $\cc{PH}$ collapses to the third level.

<center>
<img src="/assets/img/2019/complexity-classes.png" style="width: 750px;"/>
</center>

# Anti-concentration

## By unitary 2-designs

- Hangleiter, Bermejo-Vega, Schwarz and Eisert, [*Anticoncentration theorems for schemes showing a quantum speedup*](http://arxiv.org/abs/1706.03786) (2018)

## Do "anti-concentrate" probabilities actually anti-concentrate?

- Hangleiter, Kliescha, Eisert and Gogolin, [*Sample complexity of device-independently certified "quantum supremacy"*](http://arxiv.org/abs/1812.01023) (2019)

# Average-case hardness for random quantum circuits

- Bouland, Fefferman, Nirkhe and Vazirani,[*Quantum Supremacy and the Complexity of Random Circuit Sampling*](http://arxiv.org/abs/1803.04402) 1803.04402

<!--
A problem $A$ is as hard as a problem $B$, written as $A \ge B$ in symbols, if the ability to solve $A$ implies the ability to solve $B$ with a polynomial time overhead. In which case, we say that there is a *polynomial-time reduction* from $A$ to $B$.

There is quite a few notions of polynomial-time reduction. We will use the oracular one (*Cook reduction*) since it allows us to reduce decision problems to function problems (especially counting problems in $\textrm{P}^{\#\textrm{P}}$). In this notion, a problem $B$ is Cook-reducible to problem $A$ if $B$ can be solved a polynomial time of calls to an oracle that solves $A$ suffices to solve $B$.

# Stockmeyer's approximate counting

$\textrm{BPP} \subset \Sigma_2 \cap \Pi_2$ ([Sipser–Gács–Lautemann theorem](https://en.wikipedia.org/wiki/Sipser%E2%80%93Lautemann_theorem)) It is not know that $\textrm{BPP}\subset\textrm{NP}$. (The NP-analogue for BPP is [MA](https://en.wikipedia.org/wiki/Arthur%E2%80%93Merlin_protocol). Thus, BQP, being more similar to BPP than to P, has [QMA](https://en.wikipedia.org/wiki/QMA) as the NP-analogue.)-->

[^1]: in a non-black-box setting. Quantum advantage in a black box setting was already established long ago in the noiseless case by the [Deutsch-Jozsa algorithm](https://en.wikipedia.org/wiki/Deutsch%E2%80%93Jozsa_algorithm) and in the noisy case by [Simon's algorithm](https://en.wikipedia.org/wiki/Simon_algorithm).

[^2]: Henry Cohn, "[Factoring may be easier than you think](http://math.mit.edu/~cohn/Thoughts/factoring.html)"

[^3]: And not arbitrary Hadamards in the circuits, as Toffolis + Hadarmards is [known to be a universal gate set](https://arxiv.org/abs/0908.1467).

[^4]: More accurately, in the quantum setting [we consider $\cc{GapP}$](https://www.nature.com/articles/s41534-017-0018-2) instead of $\cc{\#P}$ complexity classes.
