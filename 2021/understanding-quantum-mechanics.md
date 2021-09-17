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

![An image with increasing entropy, from top left to bottom right.](pics/understanding-quantum-mechanics-waves.png "A wave travels first past a wall with one slit and then past a second wall with two slits, causing interference. Source: the author.")

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
a source of particles coming out of hole propagate towards two slits in a wall,
with a mostly random direction.
After the two slits there is a solid wall.
Each particle can only go through one slit at a time,
and will be detected once it reaches the wall at the end.

### Particles

First we will consider that 

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

By the way, you can play with the simulation
[here](https://pinchito.es/double-slit/).

### Waves

Let us first 

We are now going to use a simple model of wave propagation:
a simulation of the [wave equation](https://en.wikipedia.org/wiki/Wave_equation)
in two dimensions.

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

By the way, you can play with the simulation
[here](https://pinchito.es/double-slit/).

## Some Background

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

