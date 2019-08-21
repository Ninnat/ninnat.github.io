---
layout: post
title: Ingredients for quantum computational supremacy arguments [Draft]
subtitle:
date: 2019-08-21
categories:
  - Quantum computing
tags:
---

*Epistemic status: Summarizing research literature*



Is there a task in which quantum computers can achieve beyond what any classical algorithm can do, even those yet undiscovered? These days we use the term *quantum supremacy*, [coined by John Preskill](https://arxiv.org/abs/1203.5813), to mean such an achievement. I believe that the search for rigorous, complexity-theoretic proof of quantum supremacy[^1] goes back to the [2002 paper by Terhal and DiVincenzo](https://arxiv.org/abs/quant-ph/0205133) (published in 2004). Then  [BosonSampling](http://arxiv.org/abs/1011.3245) by Aaronson and Arkhipov in 2010 kicked start the experimental race for quantum supremacy that continues to today. These theoretical proofs of quantum supremacy all rule out classical simulations of certain quantum systems by arguing that if such simulations are possible, then there will be a devastating consequence, "collapse of the polynomial hierarchy", which is deemed unlikely by computer scientists. Such an argument is not known for factoring. In other words, if tomorrow someone figures out a fast way to factor integers on a classical computer, we will have to switch to a different encryption scheme. But other than that, the reality that we know of will still mostly be the same as before.

Now switching from a very general exposition to a technical question that I'm interested in: what are the ingredients for proofs of quantum supremacy, especially in a *random quantum circuit* architecture? In this setting, there is an ensemble $\mathcal{E}$ of quantum circuits $U$
<center>
<img src="/assets/img/2019/qcircuit.png" style="width: 1000px;"/>
</center>

and we want to "simulate" the outcome probabilities $p_x = |\av{x|U|0}|^2$ for some $x \in \{0,1\}^{2^n}$. There are two major "axes" of possible kinds of simulations.

1. By "simulate", we may want to estimate $p_x$ up to a multiplicative precision
  $$ |p_x - q_x| \le \gamma p_x,$$
  *or* we just want to estimate $p_x$ up to an additive precision
  $$ |p_x - q_x| \le \epsilon. $$

2. We may want to simulate all quantum circuits in $\epsilon$ *or* just some fraction of quantum circuits.

An approximation with multiplicative error is much stronger than with additive error; if $p_x = 0$, then $q_x$ must be exactly $p_x$.

Fun fact: exactly computing $p_x$, even for a subclass of quantum circuits that does only classical probabilistic computation (Toffolis interleaved with Hadamards to simulate coin flips) [is $\#\cc P$ hard](https://arxiv.org/abs/0811.0898). (Just encode a counting problem in an outcome probability.)

Ideally, we would like a result that says that an additive-error approximation of $p_x$ by a classical machine is hard on average.

<!--
A problem $A$ is as hard as a problem $B$, written as $A \ge B$ in symbols, if the ability to solve $A$ implies the ability to solve $B$ with a polynomial time overhead. In which case, we say that there is a *polynomial-time reduction* from $A$ to $B$.

There is quite a few notions of polynomial-time reduction. We will use the oracular one (*Cook reduction*) since it allows us to reduce decision problems to function problems (especially counting problems in $\textrm{P}^{\#\textrm{P}}$). In this notion, a problem $B$ is Cook-reducible to problem $A$ if $B$ can be solved a polynomial time of calls to an oracle that solves $A$ suffices to solve $B$.

# Stockmeyer's approximate counting

$\textrm{BPP} \subset \Sigma_2 \cap \Pi_2$ ([Sipser–Gács–Lautemann theorem](https://en.wikipedia.org/wiki/Sipser%E2%80%93Lautemann_theorem)) It is not know that $\textrm{BPP}\subset\textrm{NP}$. (The NP-analogue for BPP is [MA](https://en.wikipedia.org/wiki/Arthur%E2%80%93Merlin_protocol). Thus, BQP, being more similar to BPP than to P, has [QMA](https://en.wikipedia.org/wiki/QMA) as the NP-analogue.)-->

[^1]: in a non-black-box setting. Quantum advantage in a black box setting was already established long ago in the noiseless case by the [Deutsch-Jozsa algorithm](https://en.wikipedia.org/wiki/Deutsch%E2%80%93Jozsa_algorithm) and in the noisy case by [Simon's algorithm](https://en.wikipedia.org/wiki/Simon_algorithm).
