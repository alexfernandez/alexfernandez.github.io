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

## The Double Slit Experient

To study the properties of quantum particles we will explore the following situation,
proposed by Richard Feynman:
some particles coming out of hole propagate towards two slits in a wall,
with a mostly random direction.
After the two slits there is a solid wall with detectors,
so each particle will be detected once it reaches the wall at the end.

![The double-slit experiment setup.](pics/understanding-quantum-mechanics-setup.svg "A source of particles point downwards towards two slits, with some going through each; at the bottom a wall of detectors is waiting to catch them, with a click! Source: the author.")

Then we make a graph of how many particles reach each detector.
What do you expect we should see?

### Particles

First we will consider that we are dealing with particles as we usually know them.
A good way of creating a particle source is to set a wall with a single slit after a source with random directions.
Each particle can only go through one slit at a time,
and will be detected only once at the end.
Keep in mind that particles can bounce off the separations,
which by the way are not perfectly smooth so they can take unexpected directions.
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

If you click on "run" you will see that particles tend to follow a smooth pattern:
they are detected along the whole wall.
First you will see spikes where you would expect them for particles that go straight through both holes.
Then there are a smaller number of particles that have bounced off the slits
and go in different directions.
By the way, you can play with the simulation
[here](https://pinchito.es/double-slit/).

### Waves

What would happen if instead of particles we had waves?
Imagine we have a pool of water with a few partitions reproducing our experiemental setup,
and the source is now a perturbation in the water causing waves at the top.
We will see the water oscillating at every point with a different amplitude.
Again, what would you expect to see?

We can use a simple model of wave propagation to simulate
the [wave equation](https://en.wikipedia.org/wiki/Wave_equation)
in two dimensions.
What we accumulate at the bottom is not particle counts,
but the square of the amplitude which represents the energy of the oscillation at that point.

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

This simulation is also available
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

## Particles or Waves

Now we have seen both versions.
How would you expect a beam of electrons to behave,
like particles or like waves?

At this point you are probably thinking:

> But pinchito,
> what kind of nonsense is this?
> Electrons are particles,
> and they will behave like such!
> They can only pass through one hole,
> so there can be no double sources to interfere at the bottom!

Well, you'd be surprised.
This debate had already happened before with light,
where people had discussed for centuries whether it was made of particles
or it was a kind of wave,
an oscillation in some unknown media.

### The Light Debate

It was first Newton who studied the field of 

### Some Background

The magnificent building of Classical Physics
was founded by Galileo Galilei, raised by Isaac Newton
and perfected by other giants in the following two centuries.
It is now the stuff of legends how at the end of the 19th century it
started showing cracks in the very foundations,
first with the
[Michelson–Morley experiment](https://en.wikipedia.org/wiki/Michelson%E2%80%93Morley_experiment)
and then by
[black body radiation](https://en.wikipedia.org/wiki/Black-body_radiation).

In 1900 Max Planck proposed his
[quantisation of radiation](https://en.wikipedia.org/wiki/Max_Planck#Black-body_radiation)
to solve the enigma poised by radiation of hot chambers,
and in 1905 Albert Einstein used quantisation again to explain the
[photoelectric effect](https://en.wikipedia.org/wiki/Photoelectric_effect).
Apparently they were onto something.

In the coming years some brave pioneers would formalize what is now known as
quantum mechanics.
In essence they were just answering the same question that had been poised by
[Democritos of Abdera](https://en.wikipedia.org/wiki/Democritus)
some 2300 years earlier:
what are the smallest constituents of reality?
But now they had very precise measurements of how all these particles behaved,
and it was really different than everything we knew until then.

## Conclusion

Quantum mechanics explains reality using particles that are described by a wave,
but which can still be found in just one place at a time.

We will soon continue our journey exploring quantum entropy.

### References


### Acknowledgements

Your name could be here!
Just send a comment or suggestion to the address below.

