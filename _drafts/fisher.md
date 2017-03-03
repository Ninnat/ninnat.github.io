---
layout: post
title: Fisher information
subtitle:
categories:
tags:
---

Today Jonathan Gross reminded me how to think about Fisher information. Fisher information is an indistinguishablity metric. A model that we should have in mind is distinguishing two Gaussians. An example is a biased coin.
$$
ds = \frac{dp}{\sigma}
$$
(Also look at my notebook and Baez'a post.)

$$
F(s) = \sum_{x \in X} \frac{1}{p(x|s)} ()\frac{d}{ds} p(x|s) )^2
$$
$$
(X - \langle X \rangle)^2 (\hat{p}) \ge \frac{1}{F(s)}
$$
Saturable by the maximum likelihood estimator because it gives a Gaussian in the limit.
$$
ds = \frac{dp}{\sigma} = \sqrt{F(s)} dp
$$
$$
ds^2 = F_{jk} dp^j dp^k
$$
$$
ds = \sqrt{dp^T F dp}
$$
