---
layout: post
title: Quantum state space I: Mutual exclusion vs independence
subtitle:
categories:
  - Quantum theory
tags:
---

> Quantum phenomena do no occur in a Hilbert space. They occur in a laboratory.
--- Asher Peres, *Quantum Theory: Concepts and Methods* p. 373.

Your questions 1-3 and 5 share a common theme of “What defines the Hilbert space that I’m working on?”.

We (QM practitioners) usually think of the Hilbert space for a quantum system as having a fixed dimensionality. Physics textbooks sometimes treat this dimensionality as a God-given quantity, depending on the physical variables that we consider.

- The energy of a harmonic oscillator is discrete but unbounded so it defines a basis for an infinite-dimensional Hilbert space.
- The position and momentum are continuous variables and so define “bases” for an infinite-dimensional Hilbert space. (At least that’s the sloppy way that we physicists use them. An unphysical state that corresponds to a particle with a definite position or momentum would be represented by a Dirac delta function which are actually too pathological to be in Hilbert spaces. They are in so-called rigged Hilbert spaces if you want to find out more about them.)
- The Hilbert space for a spin j system has 2j+1 dimensions.

Finite-dimensional quantum mechanics is just a good old linear algebra, and the infinite-dimensional case is the generalization of that which results in what you call wave mechanics. (But I think that the historical context where Heisenberg’s matrix mechanics originated from is also in an infinite-dimensional case. You just have an “infinite-dimensional matrix”.)

I find it more clear to think of the dimension operationally as the maximum number of mutually exclusive (i.e. orthogonal) measurement outcomes that we care to consider. For example, we can’t make an infinitely precise measurement of a continuous variables, so we could instead coarse-grain the infinite-dimensional Hilbert space into discrete but infinite-dimensional Hilbert space. Or as you said, we can just take a subspace by ignoring the rest of the Hilbert space even though they are physically there. This is done routinely in quantum computing, for example, when we consider the ground state and the first excited state of a harmonic oscillator to be a “qubit”, a two-dimensional subspace that we control to do information processing tasks.

So a Hilbert space of dimension d is a model for something that upon a measurement can give at most d mutually exclusive outcomes.

Now how does the tensor product come into play? It describes a joint system in a way consistent with the Born rule for quantum probabilities. If P1 and P2 are transition probabilities for independent systems, the joint transition probability P is the product
P = P1 P2 = | 〈A1|B1 〉|^2 | 〈A2|B2 〉|^2 = |〈A1|⊗〈A2|  |B1〉⊗|B2 〉|^2
(This would not be true if we take the Cartesian product of vector spaces.) In fact, classical joint probabilities of independent events can be written using the tensor product as well. (Please see page 7 of Dave Bacon’s lecture note.) This is because tensor product embodies the idea that we have subsystems (or degrees of freedom) that can be independently addressed. If the total Hilbert space is V1⊗V2 but the state |A2 〉in V2 never changes, we might as well consider only V1 which is the same as V1⊗|A2 〉, where |A2 〉here means the 1-dimensional subspace of V2. This is why we sometimes only talk about the spatial part or the spin part of a wave function even though they are both physically there.

If the eigenstates of an operator O1 defines a Hilbert space V2 and same with O2 and V2, then the tensor product of eigenstates of O1 and O2 defines V1⊗V2. Note that this doesn’t uniquely specify the composite observable. We could use, for example, O1⊗O2 or O1⊗I2+ I1⊗O2 where I1 and I2 are the identity operators on the respective subsystem. The only difference is the eigenvalues. I think that this is a point worth emphasizing: measurement eigenstates are more fundamental than observables because the latter is just a collection of the eigenstates and arbitrary labels of the outcomes (eigenvalues).

To make a comparison, increasing the dimension means adding mutually exclusive outcomes while tensoring vector spaces means combining independent degrees of freedom. (The combined number of mutually exclusive outcomes is multiplicative.) The cases a) and b) in your 3rd question amount to the same situation of combining independent degrees of freedom.

That’s for question 1, 3 and 5.

For question 2, to answer point-by-point
- Yes, the spatial part of the total wave function is in general of the form psi(x1,y1,z1,x2,y2,z2,t) Yes, independent particles are described by the product wave functions. Further separation are possible if we look only at specific classes of wave functions with more symmetry. For example, energy eigenstates of a 3-dimensional isotropic harmonic oscillator separates into a product of x,y and z wave functions.
- Yes, whenever we write down psi(x), we already have chosen the position basis.
- We can put in as many variables as we want as long as they are eigenvalues of commuting observables. (Operators on independent subsystems such as the spatial part and the spin part always commute.) It doesn’t make sense to put e.g. x and p together because they don’t commute and thus can’t be measured simultaneously.
- But separation of variables is a different issue. The energy depends on position/momentum or spin or both. So we can’t separate the wave function into a product of a wave function that depends only on the energy and other parts.
- As for why a spin wave function doesn’t depend on the position, A finite dimensional Hilbert space can’t have orthogonal subspaces labeled by an infinite number of continuous variables.
- There is some confusion going on in the last point. Two electrons can’t occupy the same quantum state because the wave function has to be anti-symmetrized (https://en.wikipedia.org/wiki/Identical_particles#Symmetrical_and_antisymmetrical_states). You also mention a superposition of two single-electron wave function but in this case you don’t have a single-electron wave function. There is only one wave function for every particles
