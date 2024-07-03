---
title: '🪽 Avis Minima'
subtitle: '🛩️ Building A Prototype Airship Drone'
footer: Published on 2024-07-03, last modified on 2024-07-03.
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
image: https://pinchito.es/2024/pics/aves-aeternae-model.png
---

The worlds of airships and of drones are really interesting on their own,
but have a suspiciously lean intersection.
I am currently in the process of designing and building an airship drone
(or drone airship):
a flying machine that can stay aloft for a long time, perhaps indefinitely.

![Plans for a model airship.](pics/aves-aeternae-model.png "Three views of an airship. Source: the author.")

# The Project

This is a very interesting project because it touches many different areas:
from papiroflexia to avionics software.

## MVP: Minimum Volant Prototype

Building a 100 meter long dirigible is not a project for an amateur.
But as sizes get smaller they become more attainable.
So, how small can we get and still have a working drone?

With airships weight is always the primary concern:
if they are to float in the air,
the weight of the ship must be exactly balanced with the equivalent volume of air.
Density of air is approximately 1.2 kg/m3;
once we choose a shape we can scale it up and down by simply following the
[law of squares and cubes](https://en.wikipedia.org/wiki/Square%E2%80%93cube_law).

![A spheroid or ellipsoid. Source: [Sam Derbyshire, Wikimedia](https://en.wikipedia.org/wiki/File:Ellipsoid_Quadric.png).](pics/aves-ellipsoid.png "3D rendering of an ellipsoid, a stretched sphere or the shape of a rugby ball.")

We will reuse the shape from the [Aves Æternæ article](https://pinchito.es/2024/aves-aeternae):
an ellipsoid with a major axis twice the minor axis.
The size of the major axis will determine the weight of the structure:

|major axis|weight|
|---|---|
| 10 m | 150 kg |
| 4 m | 9.6 kg |
| 2 m | 1.2 kg |
| 1 m | 150 g |
| 50 cm | 19 g |


Last year I published an article about [perpetual flying machines](https://pinchito.es/2023/avis-aeterna):


# 🤔 Conclusion

It should be possible to create a car-sized model of an avis aeterna,
to stay aloft for several days,
demonstrating its major features.

## 🙏 Acknowledgements

Thanks to Carlos Santisteban and Fran Barea for so many fruitful discussions.

