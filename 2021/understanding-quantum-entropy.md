---
title: 'Understanding Quantum Entropy'
subtitle: 'Understanding Things, Volume 1'
footer: Published on 2021-05-16, modified on 2021-05-16.
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
abstract:
  Entropy is easily the most feared and misunderstood of all physic magnitudes.
  No wonder, for it is also one of the most abstract!
  Fear no more; in this article we will try to understand what it is and why it matters.
image: https://pinchito.es/2021/pics/understanding-quantum-drawing.jpg
---

![An image with increasing entropy, from top left to bottom right.](pics/understanding-quantum-drawing.jpg "A round dot at the top left is followed by a matrix of increasingly blurry dots, with more structure and levels of depth. Source: the author.")

Come with me for this wondeful journey,
where we will reason together about the deepest problems known to mankind in easy to follow terms.
In the process we will try to guess the (possible) future of computing,
look into the nature of time itself,
and then we will check if rigorous, modern Physics agrees with our conclusions.

Let's go!

## Introduction

In Philosophy there has always been a tradition of people just trying to understand the things we see around us.
The study of the physical world, then called Natural Philosophy, was no exception.
But a few centuries ago Physics became the realm of specialists,
with increasingly complex Maths that needed to be understood in depth before reaching any conclusions.

I graduated in Physics many years ago,
and got a glimpse of the delights of modern sciences.
Now I think that understanding Nature
(the pleasure of finding things out, as Feynman used to say)
should not be exclusive to specialists:
even the lay(wo)man can think rigorously and without too much handwaving.

So I thought, why not start with something simple, such as quantum entropy?
No, really.
It is very interesting to imagine how entropy arises in the quantum world.
It has been thoroughly studied, and is thought to be well understood;
but the classical view leaves however much to be desired as an explanation of the physical world.

## The Feared E-word

Let us start at the point which baffles many people:
what exactly is entropy, and how can it be defined?
Forget about thinking of entropy as "disorder";
entropy is easily defined as "information" in the Shannon sense.

As a system evolves we need more and more information to describe it.
If you look at the picture that introduces the article you can get a sense of it:
at the top left corner we have a dot which is very easy to describe,
just by its center and radius.
The increasingly fuzzy stains as we move bottom and right need more info:
first they have a defined irregular shape,
then several strokes, and finally a fudge of varying intensity.

The information content of each spot is not something abstract;
it can be easily measured.

![The first dot saved as PNG "weighs" 2.1 KB.](pics/understanding-quantum-dot.png "Round dot")

![A well-defined stain weighs 2.7 KB.](pics/understanding-quantum-stain.png "Irregular stain")

![A wider blot is at 5.2 KB.](pics/understanding-quantum-blot.png "Wider blot")

![A fuzzy stain is now 18 KB.](pics/understanding-quantum-fuzzy.png "Fuzzy stain")

![Finally, a large splotch (which merges with its surroundings) is 20.9 KB.](pics/understanding-quantum-splotch.png "Merging splotch")

This sequence is an artistic illustration of how entropy works.
And yet physical systems often follow the same pattern:
a classical example of growing entropy is a drop of fluid diffusing in another fluid inside a larger tank.
The drop is smeared until it is diffused into the containing fluid,
which is when entropy is maximized.

So, in short: entropy is just information.
As systems evolve, their entropy always grows,
and the amount of information needed to describe them also grows.

As you may know already, Newton's classical equations of movement are symmetric in time:
when time is reversed they work perfectly well.
So how come entropy is generated only in one direction,
and is reduced in the opposite?
In a classical system this effect comes down to particles moving from places with high densities
where particles move fast (what we usually call "hot")
to other places with low densities and slow particles ("cold"),
generating a high entropy mix.

## Quantum Entropy

The next step is to understand how entropy is generated in a quantum system.
Schrödinger's equation governs how particles move;
and again it is symmetric in time.
But here we have a new effect:
every time we measure something in a system we cause the collapse of the wave equation,
and as a consequence the system gains entropy.
Johnny von Neumann (one of the 20th century greatest mathematicians) had a nice formula to compute it,
but it doesn't really matter how, for now.
What we would like to know is,
how does that affect what happens to the Universe as a whole?

Well, information is generated!
Or to be more precise, more information is needed to describe our system;
the effect is the same.

### Entanglement

Whenever two quantum particles interact, they become _entangled_:
their properties are correlated for a while.

A traditional example is a photon that generates a pair of electron and positron,
which move in opposite directions.
The photon has spin 0, and spin is conserved in the generation process;
therefore one of the particles must have positive spin (+)
and the other negative spin (-).
Which is which?

There is no way to know!
However, once we measure the spin of one of the particles,
we know the spin of the other without having to look at it.
We say that both particles are entangled because their properties are correlated.

In the classical world we would think that both particles have a _hidden variable_
which determines the spin of each particle before we look at it.
In the quantum world we can verify in an experiment that the spin is completely random
until we measure it.

### Interference

Entanglement is the most popular quantum effect nowadays,
but it is by no means the only one.
In fact single particles can also display quantum effects.
Consider the traditional double-slit experiment:
an electron is fired into two close slits.
In the classical world it will either bounce back,
or go through one of the slits and into the wall beyond.
We would expect a smooth distribution of hits on the wall.

But in the quantum realm the density of impacts will display valleys and peaks,
very similar to the diffraction of waves going through two slits.
It is as if the electron interferes with itself!

### Decoherence

The phenomenon by which 

### The Measurement Problem

Now we start to touch on the Great Problems with Quantum Mechanics.
Physicists have often been happy with stating that the system changes when they measure any magnitude.
Among other effects, the system gains entropy with every measurement.
But what happens if we don't measure it?
What if nobody is there to make measurements?
Does entropy also increase?

As the old proverb goes:
"If a leaf falls in a forest and there is nobody there to hear it,
does it even make a sound?"
Some philosophers have even stated that the Universe is only there when there is a conscience to watch it.
We have to wonder how it evolved all these thousands of millions of years when there were no humans in it.
If we don't want to go down that dangerous and anthropocentric path we have to agree that the Universe was there all along.

We are forced to accept that quantum decoherence must happen all the time.

## Schrodinger's Cat

This most famous of scientific cats is a mental experiment designed to test how large systems work.

Large molecules can also become entangled,
[as long as they are isolated](https://www.nature.com/articles/ncomms1263).

It is encouraging to notice that Feynman and other great physicists
were thinking [much the same things during the 50s](https://arxiv.org/pdf/0804.3348.pdf).

## Conclusions

The quantum world 

### Acknowledgements

Thanks to my team mates at these companies:
[mediasmart.io](https://mediasmart.io/),
[Devo](https://www.devo.com/),
[Influencity](https://influencity.com/)
and lately [LeanMind](https://leanmind.es/)
for helping me test different ways of deploying code.
Thanks to my students of the
[scalability course](/2020/curso-escalabilidad)
for helping me formalize the methodology.

