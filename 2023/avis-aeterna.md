---
title: '🪽 Avis Æterna'
subtitle: '🛩️ A never-ending flying machine'
footer: Published on 2023-12-16, last modified on 2023-12-16
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
image: https://pinchito.es/2023/pics/avis-aeterna-artist.jpg
---

These are turbulent times when many workers are losing their jobs;
I was recently in this situation myself.
Some people have asked for advice in their job search;
I am writing this article to explain the lessons I learned.
My focus is on software developer jobs in technical companies,
but most of the lessons should be extensible to any jobs in the tech sector.

![Artist's rendition of an avis æterna.](pics/avis-aeterna-artist.jpg ".")

# 💡 The Idea

So, why not build a drone that can stay aloft indefinitely?
The time is ripe!

## 📝 Previous Designs

Facebook did an experimental plane once with the idea of bringing Internet connectivity to the unwashed masses.
[video](https://www.youtube.com/watch?v=D8Tm6tQdZ2I).

Airbus is the current record holder.

# The Design

The idea

## 📏 Some Numbers

Let's do some Fermi estimations to see if the idea is feasible:
estimate the order of magnitude of each value and see if they match.

The total holding volume would be length by width by height,
multiplied by some factor _f_ that depends on the actual shape:

```
V = f × l × w × h.
```

If the shape was a simple box the factor would be 1;
let us suppose that it is somehow shaped like a drop of water.
For a sphere the factor is around .523, or really close to one half,
so we can go with `f=½`.
Furthermore we can suppose that the width is similar to the length,
and that the height is around half the length. So we get:

```
V = l³/4.
```

How much weight can it lift?
A cubic meter of air weighs around [1.3 kg](https://www.earthdata.nasa.gov/topics/atmosphere/atmospheric-pressure/air-mass-density),
while if filled with hydrogen it drops to [70 grams](https://genh2hydrogen.com/blog/defining-hydrogen-from-a-to-z-3/).
Therefore every cubic meter will provide a lift of about 1.2 kg.

## Challenges

### Extracting Hydrogen from Air

The core of our design is storing hydrogen molecules.

How can we lay our hands on those sweet H₂ molecules?

### Manipulating Hydrogen

### Propulsion

# 🤔 Conclusion


## 🙏 Acknowledgements

Thanks to Carlos Santisteban for so many fruitful discussions.

