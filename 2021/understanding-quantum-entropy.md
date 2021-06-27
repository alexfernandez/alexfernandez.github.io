---
title: 'Understanding Quantum Entropy'
subtitle: 'Understanding Things, Volume 1'
footer: Published on 2021-05-16, modified on 2021-05-16.
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
abstract:
  Entropy is easily the most misunderstood of all physic magnitudes.
  No wonder, for it is also one of the most abstract!
  So Quantum Entropy must be really fearsome!
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
Still, there has always been a current of people just trying to understand the world,
even if their conclusions need to be validated rigorously before they can be taken seriously.

I graduated in Physics many years ago,
and got a glimpse of the delights of modern sciences.
Now I think that understanding Nature
("the pleasure of finding things out", as Feynman used to say)
should not be exclusive to specialists:
even the lay(wo)man can think with certain precision and without too much handwaving.

So I thought, why not start with something simple, such as quantum entropy?
No, really, we are doing it.
It is very interesting to imagine how entropy arises in the quantum world.
The classical version has been thoroughly studied, and is thought to be well understood;
but it leaves much to be desired as an explanation of the physical world,
when seen with quantum eyes.

## The Feared E-word

Let us start at a point which baffles many people:
what exactly is entropy, and how can it be defined?
Forget about thinking of entropy as "disorder";
entropy is easily defined as "information" in the Shannon sense.
In short: information always grows.

As a system evolves we need more and more information to describe it.
If you look at the picture that introduces the article you can get a sense of it:
at the top left corner we have a dot which is very easy to describe,
just by its center and radius.
The increasingly fuzzy stains as we move bottom and right need more info:
first they have a defined irregular shape,
then several strokes, and finally a fudge of varying intensity.

The information content of each spot is not something abstract;
it can be easily measured in kilobytes (KB).

![The first dot saved as PNG "weighs" 2.1 KB.](pics/understanding-quantum-dot.png "Round dot")

![A well-defined stain weighs 2.7 KB.](pics/understanding-quantum-stain.png "Irregular stain")

![A wider blot is at 5.2 KB.](pics/understanding-quantum-blot.png "Wider blot")

![A fuzzy stain is now 18 KB.](pics/understanding-quantum-fuzzy.png "Fuzzy stain")

![Finally, a large splotch (which merges with its surroundings) is 20.9 KB.](pics/understanding-quantum-splotch.png "Merging splotch")

This sequence is an artistic illustration of how entropy works.
And yet physical systems often follow the same pattern.
A classical example of growing entropy is a drop of fluid diffusing in another fluid inside a larger tank.
The drop is smeared until it is diffused into the containing fluid,
which is when the entropy of the combined system drop + fluid is maximized.

So, in short: entropy is just information.
As systems evolve, their entropy always grows,
and the amount of information needed to describe them also grows.

## Quantum Entropy

As you may know already, Newton's classical equations of movement are symmetric in time:
when time is reversed they work perfectly well.
So how come entropy is generated only in one direction,
and is reduced in the opposite?
In a classical system this effect comes down to particles moving from places with high densities
where particles move fast (what we usually call "hot")
to other places with low densities and slow particles ("cold"),
generating a high entropy mix.
This is what physicists usually call "boundary conditions":
how a system is organized when we start looking at it.

The next step is to understand how entropy is generated in a quantum system.
Schrödinger's equation governs how particles move;
and again it is symmetric in time.
But here we have a new effect:
every time we measure something in a system we cause the collapse of the wave equation,
and as a consequence the system gains entropy.
One of the greatest mathematicians of the 20th century, Johnny von Neumann,
had a nice formula to compute quantum entropy,
but for now it doesn't really matter what he came up with.
What we would like to know is:
how does that affect what happens to the Universe as a whole?

Well, information is generated!
Or to be more precise, more information is needed to describe our system,
which is in effect the same.
So there we have it: each time something is measured entropy grows.
Problem solved: quantum entropy grows with measurements!
Right?

Not so fast: it's a promising start,
but we still need to go deeper.
For starters, _who_ is measuring _what_?
Does quantum entropy not grow when nobody is measuring?
It should grow all the time, not only when there are people around!
So the answer must be a bit more complex.

### Entanglement

Let us look at a very interesting concept which is exclusive to quantum mechanics.
Whenever two quantum particles interact, they become _entangled_:
their properties are correlated for a while.

A traditional example is a photon that generates a pair of electron and positron,
which move in opposite directions.
The photon has spin 0, and spin is conserved in the generation process;
therefore one of the particles must have positive spin (+)
and the other negative spin (-).
Which is which?
There is no way to know until we measure them!
But the funny thing is that we don't need to measure both:
once we measure the spin of one of the particles,
we know the spin of the other without having to look at it,
since it must be the opposite.
That is, for people not following closely:
if the first particle has spin (+) the second one has spin (-),
and viceversa.

We say that both particles are entangled because their properties are correlated.
In the classical world we would think that both particles have a _hidden variable_:
some kind of internal mechanism which cannot be measured,
but which determines the spin of each particle before we look at it.
In the quantum world we can verify in an experiment that the spin is completely random
until we measure it.
This experiment is called the EPR inequality, by the way,
and it was proposed by none other than the great Albert Einstein
(with the help from colleagues Podolsky and Rosen).

### Interference

Entanglement is the most popular quantum effect nowadays,
but it is by no means the only one.
In fact single particles can also display quantum effects.
Consider the famous double slit experiment:
an electron is fired into two close slits.
In the classical world it will either bounce back
or go through one of the slits and into the wall beyond.
We would expect a smooth distribution of hits on the wall.

[double slit]

But in the quantum realm the density of impacts will display valleys and peaks,
very similar to the diffraction of waves going through two slits.
It is as if the electron interferes with itself.
And that is exactly what is happening!
To be precise, physicists will say that the wave function is creating interferences,
where the wave function is a value used to determine the probability of findind an electron at some point.
The result is very similar to what you would get with a fluid passing those same slits.

[waves passing slits]

But wait, it gets weirder.
We may try to peek into the process,
and install a detector to see which slit the electron is passing through.
If you do this,
interference is destroyed and you get a classical smooth distribution of hits.
Nature does not like peeking!

[detector and smooth distribution]

There is an extended and much better description of this phenomenon in
[Feynman's Lectures on Physics]().
In short, we do not need entanglement to get quantum effect,
and this has been known since the beginning of quantum mechanics.

### Decoherence

So, how come quantum effects are so easily destroyed?
The phenomenon by which quantum entanglement is destroyed is called _decoherence_:
a previously coherent wave function is collapsed into a classical system by a measurement.
The same phenomenon happens with the detector in the double slit experiment:
in that case decoherence applies to the wave function of the single electron.

This decoherence business is modern stuff.
Most of quantum mechanics was discovered and formalized in the 1920s by a bunch of (mostly German) physicists,
many of which emigrated to the United States in the 1930s.
Between 1940 and 1970 the remaining foundations were discovered,
mostly in the US but some of it in Europe and elsewhere;
after a while it seemed that only boring details needed to be worked out,
but nothing of substance else would be found.
Yes, there is a Higgs boson here and a neutrino with mass there,
but the foundations were laid out.
In fact many of the hardest problems remain unsolved:
Quantum Gravity is still as murky as it was,
and String Theory has brought nothing useful yet.
So, was nothing useful done after 1980?

To my delight,
I recently discovered that a bunch of intrepid physicists
have been working on these most fundamental of questions from the 1980s until now:
How and why does the wave function collapse?
Or what is essentially the same: how and why does a quantum system decohere?

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

The quantum world is weird,
everyone is saying it.
Now you have a little glimpse into what makes it weird.

