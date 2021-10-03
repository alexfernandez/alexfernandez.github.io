---
title: 'Understanding Quantum Mechanics'
subtitle: 'On the Road to Quantum Entropy, Part 2'
footer: Published on 2021-07-31, modified on 2021-07-31.
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
abstract:
  Quantum Mechanics is by far the most misunderstood of all physical theories.
  It has many formulations and interpretations,
  and it is misused regularly by both scientists and the general public.
  Fear no more; in this article we will try to understand what it is and why it matters.
image: https://pinchito.es/2021/pics/understanding-quantum-mechanics-waves.png
---

![The double-slit experiment with waves.](pics/understanding-quantum-mechanics-waves.png "A wave travels first past a wall with one slit and then past a second wall with two slits, causing interference. Source: the author.")

After visiting
[entropy](understanding-entropy)
and a detour through
[simulated worlds](understanding-simulation),
we continue our journey of understanding Physics with a puzzling theory:
**quantum mechanics**.
What is it, and why does it matter?

We will now see a gentle introduction without excessive maths,
and also without sacrificing rigorous thinking.
In the process we will explore some very fundamental questions in Physics
like "what is light?" or "can we predict how things behave?".

## The Basic Question

Since antiquity philosophers have been trying to answer the question that had been poised by
[Democritos of Abdera](https://en.wikipedia.org/wiki/Democritus)
some 2400 years ago:
what are the smallest constituents of reality?
The goal posts have moved a lot since then:
early attempts were just educated guesses and broad descriptions.

By the early 1900s scientists had very precise measurements of how particles behaved,
and it was really different than everything we knew until then.
In the coming years some brave pioneers would formalize what is now known as
quantum mechanics.

## The Double Slit Experient

We don't want to study the formalism,
but to get an idea of what's so different about subatomic particles.
We will explore the following situation
[proposed by Richard Feynman](https://www.youtube.com/watch?v=Ja0HSFj8Imc):
a stream of particles coming out of a hole in a somewhat random direction
propagate towards two slits in a wall.
After the two slits there is a solid wall with detectors,
so each particle will be detected once it reaches the wall at the end.

![The double-slit experiment setup.](pics/understanding-quantum-mechanics-setup.svg "A source of particles point downwards towards two slits, with some going through each; at the bottom a wall of detectors is waiting to catch them, with a click! Source: the author.")

Then we make a graph of how many particles reach each detector.
What do you expect we should see?

### Particles

First we will consider that we are dealing with particles as we usually imagine them:
little balls that bounce off walls.
Each particle can only go through one slit at a time,
and will be detected only once at the end.
Keep in mind that particles can also bounce off the separations,
which by the way are not perfectly smooth so the particles can take unexpected directions.
Below you can find a gross simulation of how the experiment might go.

<script src="/physics-simulation/double-slit/controller.js"></script>
<script src="/physics-simulation/double-slit/particle.js"></script>
<canvas id="particle-canvas" width="200" height="532" style="border: solid black 1px; max-width: 100%; max-height: 100%;"></canvas>
<div>
<form>
<input id="particle-speed" style="display: none;" type="number" value="1">
<button id="particle-run" type="button">run</button>
<button id="particle-pause" type="button">pause</button>
<button id="particle-reset" type="button">reset</button>
</form>
</div>

If you click on "run" you will see that particles are detected along the whole wall.
They tend to follow a smooth pattern:
first you will see spikes where you would expect them for particles that go straight through both holes.
Then there are a smaller number of particles that have bounced off the slits
and go in different directions.
By the way, you can play with the simulation
[here](https://pinchito.es/double-slit/).

### Waves

Just for fun, what would happen if instead of particles we had waves?
Imagine we have a pool of water with a few partitions reproducing our experiemental setup,
and the source is now a perturbation in the water causing waves at the top of our diagram.
We will see the water oscillating with a different amplitude at each point.
Again, what would you expect to see?

We can use a simple model of wave propagation to simulate
the [wave equation](https://en.wikipedia.org/wiki/Wave_equation)
in two dimensions.
We cannot count particles at the bottom graph now,
but we can accumulate instead the square of the wave amplitude,
which by the way represents the energy of the oscillation at that point.

<script src="/physics-simulation/double-slit/wave.js"></script>
<canvas id="wave-canvas" width="200" height="532" style="border: solid black 1px; max-width: 100%; max-height: 100%;"></canvas>
<div>
<form>
<input id="wave-speed" style="display: none;" type="number" value="2">
<button id="wave-run" type="button">run</button>
<button id="wave-pause" type="button">pause</button>
<button id="wave-reset" type="button">reset</button>
</form>
</div>

This simulation is also available to play with
[here](https://pinchito.es/double-slit/).
It is interesting to note that now there are some places in the wall
where we get no waves at all.
Correspondingly, the graph shows no energy accumulating there.
What is happening?

What we see here is
[interference](https://en.wikipedia.org/wiki/Wave_interference).
Each of the slits acts as a new source of waves,
so what reaches the bottom is the sum of both oscillations.
In some places the ridges of one wave matches exactly with the valleys of the other,
so the net effect is perfectly calm water.
At other places both waves are perfectly synchronized so the net effect is a bigger oscillation.

### Particles or Waves

Now we have seen both versions.
How would you expect a beam of electrons to behave,
like particles or like waves?

At this point you are probably thinking:

> But pinchito,
> what kind of nonsense is this?
> Electrons are particles,
> and they will behave like such!
> They can only pass through one hole,
> so there can be no interference between both slits at the bottom!

Well, you'd be surprised.
A debate between waves and particles has already happened before with light,
where scientists have discussed for centuries whether it was made of particles
or it was some kind of wave or oscillation.
We will see it in detail below,
in case you are interested.

## The Double Slit in Practice

Going back to our double slit:
what does really happen if you do this experiment with electrons?
Well, guess what:
you get peaks and valleys,
the true sign of interference.

## The Light Debate

The field of optics has been studied since antiquity.
Epicurus already established that the speed of light ("images")
is the fastest possible in the universe in
[this wonderful paragraph](http://www.attalus.org/old/diogenes10b.html):

> It is useful, also, to retain this principle, and to know that the images have an incomparable thinness;
> which fact indeed is in no respect contradicted by sensible appearances.
> From which it follows that **their rapidity also is incomparable**;
> for they find everywhere an easy passage, and besides,
> their minuteness causes them to experience no shock,
> or at all events to experience but a very slight one,
> while a multitude of elements very soon encounter some resistance.

Around 1650 many giants were
[studying the field](https://en.wikipedia.org/wiki/Wave%E2%80%93particle_duality#Classical_particle_and_wave_theories_of_light)
with a more mathematically-oriented approach:
Huygens and Hooke formulated a wave theory,
while Newton argued for particles.
Given the tremendous weight of Newton in early Physics,
his opinion could counteract the multitude of phenomena well explained by waves.
One interesting effect in waves is
[diffraction](https://en.wikipedia.org/wiki/Diffraction):
as we saw in our little simulator, waves can change direction when passing through a narrow opening,
and so does light, although its wavelength is so small that the effect is only appreciable at short distances.

The debate was not settled until 1801, when Young came up with a similar
[double-slit experiment](https://en.wikipedia.org/wiki/Young%27s_interference_experiment)
that clearly showed interference,
convincing physicists that light was indeed a wave.
But this situation would not last much.

## Cracks in the Foundation

The magnificent building of Classical Physics
founded by Galileo Galilei, raised by Isaac Newton
and perfected by other giants in the following two centuries
started showing cracks in the very foundations at the end of the 19th century,
first with the
[Michelson–Morley experiment](https://en.wikipedia.org/wiki/Michelson%E2%80%93Morley_experiment)
and then by
[black body radiation](https://en.wikipedia.org/wiki/Black-body_radiation).
Both are very relevant to our debate.

### In Search of Ether

In 1887 Michelson and Morley were trying to find signs of the existence of
[ether](https://en.wikipedia.org/wiki/Luminiferous_aether),
which was supposed to be the intangible medium where waves of light propagated.
Their reasoning was that, since light was a wave,
something had to be oscillating;
this transparent substance had to permeate the whole of space so that light could propagate in the vacuum.
And since our Earth was moving through space around the sun,
they should be able to measure a different speed of light in different directions.
The experiment had to be repeated multiple times,
if by any chance our planet was moving exactly along the ether at the moment of the first measurement.

Of course their very precise measurements found none of that nonsense:
light seemed to travel at _exactly_ the same speed at all times and in all directions.
There was no ether to be found anywhere.

### Light as Particles

There was more:

In 1900 Max Planck proposed his
[quantisation of radiation](https://en.wikipedia.org/wiki/Max_Planck#Black-body_radiation)
to solve the enigma poised by radiation of hot chambers,
and in 1905 Albert Einstein used quantisation again to explain the
[photoelectric effect](https://en.wikipedia.org/wiki/Photoelectric_effect).
Apparently they were onto something.

## Conclusion

Quantum mechanics explains reality using particles that are described by a wave,
but which can still be found in just one place at a time.

We will soon continue our journey exploring quantum entropy.

### References


### Acknowledgements

Your name could be here!
Just send a comment or suggestion to the address below.

