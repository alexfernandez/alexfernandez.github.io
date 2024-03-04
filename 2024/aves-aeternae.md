---
title: '🪽 Aves Æternae'
subtitle: '🛩️ Building Perpetual Flying Machines'
footer: Published on 2024-03-03, last modified on 2024-03-03.
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
image: https://pinchito.es/2024/pics/aves-aeternae-model.png
---

Last year I published an article about [perpetual flying machines](https://pinchito.es/2023/avis-aeterna):
flying machines that could stay aloft indefinitely.
The initial numbers were intriguing: the concept was viable.
But nobody has done it yet.
Should we accept the challenge?

![Plans for a model airship.](pics/aves-aeternae-model.png "Three views of an airship. Source: the author.")

# 🏗️ Building Models

I set up to build more detailed plans with a given scale in mind.
I expected to find a wall at any point where the required technology just wasn't available,
or it was too exotic to be purchased just yet.
To my surprise there were no showstoppers:
the technology is here,
and everything seems to be feasible, right now.
The engineering challenge is thus amazingly possible.

## 🎚️ Model Scale

What would be an appropriate scale for a model?

### 🏉 Proportions

The classical design for a blimp or a zeppelin is a spheroid.
(Yes, I know that last time I chose a design similar to a boat:
square and flat profile.
I have since come to appreciate a more classic dirigible design.)

![An spheroid or ellipsoid. Source: [Sam Derbyshire, Wikimedia](https://en.wikipedia.org/wiki/File:Ellipsoid_Quadric.png).](pics/aves-ellipsoid.png "3D rendering of an ellipsoid, a stretched sphere or the shape of a rugby ball.")

### 📏 Dimensions

An intriguing option is to size the avis aeterna vaguely like a car:
two meters wide and tall, four meters long.
(For any US readers it's 6.5 feet wide.)
It is big enough to be substantial,
but small enough to be built in a garage.

This mandates all of the proportions of the model:
with the value of two meters and the [spheroid](https://en.wikipedia.org/wiki/Spheroid)
equations we can compute everything else.
First we have a prolate spheroid with axis `A=2m`,
and length `C=4m`.
The volume contained becomes:

`V = πA²C/6 ≈ A²C/2,`

which is a surprisingly accurate formula
(actual factor above should be 0.523).
In our case:

`V ≈ 2m * 2m * 4m / 2 = (2m)³ = 8 m³.`

And the area is very approximately:

`S ≈ 5 * 2m * 2m = 5 * 4m² = 20 m².`

### 🏋️ Weight

How much will our model weight?
Exactly as much as the air displaced by the hydrogen:
we compute the weight of the air inside,
and then subtract the weight of the same volume of hydrogen.
Since the density of air is 1.3 kg/m³,
and of hydrogen is 70 g/m³, lift will be:

`L = (1.3 - 0.070) kg/m³ * 8 m³ ≈ 9.84 kg.

So our budget is around 10 kg.
As you see, at this stage it's not enough to do Fermi estimations:
for a more detailed feasibility study we need more approximate numbers.
It is still OK to round up numbers as we did above with surface and volume.

## Build

### Structure

We want to build a real dirigible, not a blimp:
the difference is that the dirigible or zeppelin has a rigid structure,
while blimps are just inflatable.
We know that Zeppelins worked,
and with ancient materials even,
but is it possible to do it at this scale?

Let's go with the simplest structure:
just a shell.
Adding 

### 🎈 Hydrogen Sack

At this scale we don't want a complicated set of sacks containing the hydrogen;
just one big bag will do.

Helium balloons are usually done with Mylar,
but there are materials that leak even less hydrogen:
PVA is a very strong contender.

In [Lei _et al_](https://rest.neptune-prod.its.unimelb.edu.au/server/api/core/bitstreams/9a2af3f4-a7c8-467a-ba32-ade91ba45822/content)
the team experiment with several coatings,
finding that PVA (polyvinyl alcohol) has the lowest hydrogen permeability.

Luckily it is not hard to get PVA bags,
as they are widely used in industry because they are biodegradable.
One precaution is that PVA dissolves in water,
so the interior of the structure must be kept dry.

### 💨 Hydrogen Leaks

How much hydrogen would leak out of our PVA bag in a day?
This of course depends on how well sealed the bag is,
and the quality of the materials.
We can use a unit of permeability called
[Barrer](https://en.wikipedia.org/wiki/Barrer) to quantify it.
Again in
[Lei _et al_](https://rest.neptune-prod.its.unimelb.edu.au/server/api/core/bitstreams/9a2af3f4-a7c8-467a-ba32-ade91ba45822/content)
the permeability of PVA is given as 0.0084 barrer.
Given the definition of 1 barrer in SI units:

`1 barrer = 3.35 * 10^-16 * mol * m / (m² * s * Pa),`

the computations are a bit messy but can be done as follows.
The leaked gas will be:

`Quantity = Per * Surface * time * Pressure / thickness,`

Remember that our surface is 20 m².
Bags with thickness of 50 microns are quite common in the food industry.
We will compute the leaked quantity for a day or 86400 seconds,
at atmospheric pressure or 101325 Pascal.
Now we have everything:

```
Q = 0.0084 barrer * 20 m² * 86400 s * 101325 Pa / 0.000050 m,
Q = 0.0084 * 3.35 * 10^-16 * 86400 * 101325 / 0.00005 mol,
Q = 0.0005 mol.
```

Converting to grams is easy as 1 mol of Hydrogen is defined as 1 g,
so we are leaking half a milligram per day.
Not bad considering that we have around 0.5 kg of hydrogen!
These nubers do not look very realistic,
and have to be contrasted with real world tests with real bags.
But the safety margin is quite large.

### 🪽 Wings

## ⚡ Energy Sources

https://www.reddit.com/r/IsaacArthur/comments/t44ypy/can_you_have_a_selfmaintaining_hydrogen/

### ☀️ Solar Energy

### 🌬️ Wind Energy

### 🔋 Batteries


## ⚖️ Weights



### 🛩️ Power

## 🔮 Changes

In the [last article](https://pinchito.es/2023/avis-aeterna)
I used a reference design 10 meters long and 10 meters wide.
That is definitely too large for an initial model.
Also, the proportions have changed since then.


# 🤔 Conclusion


## 🙏 Acknowledgements

Thanks to Carlos Santisteban for so many fruitful discussions.

