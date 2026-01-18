---
title: '🌐 Around the World in under 80 Days'
subtitle: 'Avis LXXX'
footer: Published on 2026-01-03, last modified on 2026-01-03.
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
abstract:
  'A project to circumnavigate the globe using an autonomous airship.
  Craft, routes and timings for maximum air endurance.'
image: https://pinchito.es/2026/pics/avis-lxxx.jpg
---

Is it possible to complete a trip around the world with an autonomous drone?
And under 80 days?
This is a crazy project that would make [Jules Verne proud](https://en.wikipedia.org/wiki/Around_the_World_in_Eighty_Days).
But the real fun is to figure out if it can be done with a relatively modest budget of one million euros.

![An autonomous airship. Source: the author.](pics/avis-lxxx-airship.jpg "An airship")

# The Project

Before we go into the details, let's review how crazy the idea is
by answering a few questions that may be popping into your head.

**How fast does it need to go?**
First, we want to build a flying device that can autonomously circumnavigate the world in less than 80 days.
If it went on a straight line around the equator the trip would take 40,000 km, or 25,000 miles;
average speed comes out as a little bit over 20 km/h (13 miles/hour).
We will use meters per second here, so will take 5 m/s as the initial speed target.

**Can we make flight more efficient?**
The biggest energy expense for a drone is usually not moving about,
but staying up in the air.
One solution I'm particularly fond of is making the aircraft buoyant on its own.
An airship can remain afloat as long as it holds its lighter-than-air gas inside.
For our little project it needs to keep running for many weeks.
The obvious solution is to propel the drone using electric batteries,
and replenish the power during the day using high efficiency solar panels.

**What is the best option for the gas inside the airship?**
Helium is the usual choice, but for a drone where no human lives are endangered it may not be optimal.
Hydrogen is cheaper, lighter and more readily available.
Any risk of conflagration can be mitigated by careful construction.

**What kind of enclosure is needed to hold the gas inside for 11 weeks?**
This was solved more than a century ago with clever construction,
and modern materials have wonderful properties.
There are clever materials with low hydrogen permeability such as PVA or EVOH,
and can be layered with other polymers that prevent ultraviolet damage and weather corrosion.
Furthermore, construction can be made strong and resilient while keeping it light.

**How big does the airship need to be?**
Ship size is a critical parameter.
A small ship is easier and cheaper to build,
while bigger ships tends to have higher top speeds.
Having enough instrumentation onboard also requires to carry a minimum payload.
We will set a target length of 4 meters and check if it works.

Finally, **what is the best route to take?**
An airship can also helped by trade winds:
air currents caused by the rotation of the Earth,
that move on average from East to West.
The trajectory should therefore follow this orientation rather than West-East.
A modestly sized airship cannot go against strong air currents,
so the path should be carefully planned in advance and adjusted while in flight,
to take advantage of the wind at every point.

Most of the trajectory can pass over the oceans,
but skipping land completely would take too much of a detour,
and likely be incompatible with prevailing winds.
Although the political climate may be hostile,
it is still legal to fly civil craft over other countries.
The challenge here is to find some convenient low-hostility routes for safe passage.

## 💡 Concept

The inspiration for safe, hydrogen airships is quite old.
More than a century ago the Spanish engineer Leonardo Torres Quevedo came up with the
[Astra Torres designs](https://www.researchgate.net/publication/348018483_Leonardo_Torres_Quevedo_1902-1908_The_Foundations_for_100_years_of_Airship_designs),
autorigid dirigibles which were used successfully in the Great War.
Unlike the competition from the German Zeppelins and others,
these hydrogen crafts had no flammability issues at all during their long career,
due to careful design and construction.

![The “Torres Quevedo no 2” in 1908. Source: [Leonardo Torres Quevedo, 1902-1908](https://www.researchgate.net/publication/348018483_Leonardo_Torres_Quevedo_1902-1908_The_Foundations_for_100_years_of_Airship_designs).](pics/avis-lxxx-torres.jpg "A side view of a huge airship being hailed by many people in the ground, with the text: '1908 - Le Torres-Quevedo dirigeuble militaire espagnol, dans le Parc de Guadalajara. J.H.'. Article source is: González Redondo, Francisco, 2008: Leonardo Torres Quevedo, 1902-1908. The Foundations for 100 years of Airship designs.")

Solar panel advances are very well exemplified by the Airbus Zephyr,
now run by its own company AALTO.
In 2025 it endured [67 days of autonomous powered flight](https://en.wikipedia.org/wiki/List_of_flight_endurance_records#Airplane,_uncrewed),
recharging during the day and hovering during the night.
The efficiency obtained by their batteries and solar panels is awesome,
and it has trickled down to consumer products.

![Airbus Zephyr. Source: [AALTO Zephyr](https://www.aaltohaps.com/).](pics/avis-lxxx-zephyr.jpg "A very thin uncrewed plane with a 40-meter wing, flying in the air.")

# 🛩️ The Craft

Let's now review the details concerning airship design and construction.

## Size

Thanks to the latest advances in miniaturization a drone can be quite small,
while still being fully functioning.

## Hydrogen Gas

How much gas do we need for this mission?
A spheroid of 4x2x2 m3 will use around 560 grams of hydrogen,
which occupies 8 m3 of gas, or 8000 liters.
This is a lot.

## Skin

The airship cover needs to keep its hydrogen inside,
endure the elements and keep its shape;
and do all this being light enough.

My original intention of building a carbon fiber skin was a bit misguided:
it's too rigid, too opaque and not resistant enough to the elements.

Nowadays ultrasonic plastic sealing is much more effective than traditional sewing techniques.

## Power

Our target speed of 10 m/s requires some serious power.
With the drag coefficient of 0.03 computed in
[Aves Æternæ](/2024/aves-aeternae)
we get:

P ≈ 0.06 kg/m × v³,
P ≈ 60 W.

Let's set aside a power target of 165W,
so we can drive our motors while charging the batteries at the same time.
Using commercially available solar panels
224W/m2 is currently achievable,
with a weight of 384 g/m2 (panels only).
Building a solar cell requires giving them some support, protection from the elements
and electric connections;
let's suppose a total weight of 1 kg/m2.
We can reach our target of 165W with an area of 0,73 m2,
which means building a flexible panel of 730 grams.
This panel should fit comfortably on top of the drone.

Power requirements grow with the 3rd power of the speed,
which is a lot.
What happens if we use the whole power to run the motors?
164W with an efficiency of 90% would allow us to reach peak speeds of only 13.5 m/s (49 km/h or 30 mi/h):

```
P ≈ 0.06 × 13.5³ ≈ 148 W.
```

## Payload

Navigation computer, communications equipment and 

## Previous Work


https://www.aaltohaps.com/

# 🗺️ Navigation

## Route

or 30,000 km on the 40°N parallel.
The wonderful [nullschool earth project](https://earth.nullschool.net/)

Head winds should not surpass 13 m/s if we want to be able to counteract them.
49 km/h (30 mi/h) is not a lot, especially over sea.

## Height

The problem of height is one of the most interesting aspects of the project.
Go too high and the payload is reduced greatly;
go too low and any sudden change of temperature will drop the drone to the ground.

## 📡 Communications

How can we get news from our trusty friend as it flies around the globe?
There are several intriguing possibilities which I have learned about.

The first is LoRa,
a wide area protocol.

The second is SigFox,
which has [decent worldwide coverage](https://sigfox.com/coverage/).

## Politics

It is [legal to fly civilian aircraft](https://www.ejiltalk.org/skies-spies-and-scientific-surveys-the-legal-aspects-of-chinese-unmanned-balloon-flight-over-american-territory/).
In the EU you have to register drones over 8 kg,
as is the case with the Avis Lxxx.
It is however illegal to fly drones over visual line-of-sight (VLOS):
not keeping them in sight;
or to fly at a height above 120 m.

# Trials

A series of trials should establish if the Avis Lxxx is airworthy.

## Atlantic Trips

A convenient destination from Spain, where I'm located,
is the Canary Islands.

Another convenient destination is Canada.
Canada has more lax legislation than the EU:
it is now legal to fly [beyond visual line-of-sight](https://tc.canada.ca/en/aviation/drone-safety/2025-summary-changes-canada-drone-regulations).

# Budget

Can we put a number on the necessary budget for the Avis Lxxx?
Let's start with a million dollars.

## Material Cost

Most of the materials required should be pretty cheap:
PVA and other plastic coatings,

Some equipment is not cheap:
for instance ultrasonic sealing machines.

Industrial hydrogen generators are another expensive bit.
Keep in mind that we need 8000 l of hydrogen;
[this €10k hydrogen generator](https://www.sigmaaldrich.com/ES/en/product/supelco/27773u?utm_source=google&utm_medium=cpc&utm_campaign=20849931024&utm_content=171133062889&gad_source=1&gad_campaignid=20849931024&gbraid=0AAAAAD8kLQSooOxhaQNNTw7C1mk9pG1qo&gclid=CjwKCAiA3-3KBhBiEiwA2x7FdIdq83GrfkYWAHQMJX2Vec1M8LdAbA6zCFy8CjAScFXqzHvZeR3gUhoCDmMQAvD_BwE)
would take 5+ days hours to fill our enclosure.

On the other hand a commercial cylinder with 50 l (200 bar)
costs [around €130](https://shop.airproducts.com/emea/es/es-ES/products/62242/),
for a total of more than 8 m3,
enough to fill one airship.
So we may rethink the need to generate our own hydrogen.

## Research

Most of our funds are needed to investigate possible alternatives for fabrication,
and to ensure mission success.

## Amateur Project

We often find on social media like YouTube really bright people that create really complex projects on their own in a few months.
So it is possible that one of these geniuses will replicate this project on their own with a budget of a few thousand euros.
Why not?
After all there are no great obstacles to any clever maker who is sufficiently determined,
and enough of a fool to embark in such a crazy enterprise.

# 🤔 Conclusion

## 🥺 Motivation

Why pursue this project, at all?
First, a kid can dream: thought experiments have moved forward what is considered possible.
After all, the original story for "Around the World in 80 Days" is after all just that,
a thought experiment.
Jules Verne did not do thetripp but just imagined how it could be done.

Then there are the famed world records:
Airbus Zephyr, the work of a giant corporation, holds the current world record of air endurance with 67 days.
Wouldn't it be great to snatch it from their cold corporate hands with an amateur project?

Plus, airships are super cool.
Dreamers from Torres Quevedo to Hayao Miyazaki to
Google Founder [Sergei Brin](https://www.bbc.com/future/article/20250214-pathfinder-1-the-airship-that-could-usher-in-a-new-age)
have been seduced by them.

## 💡 Previous Ideas

The original [Avis Æterna](/2023/avis-aeterna) project called for an autonomous semi-buoyant flying wing plane,
which was later refined to the
[Aves Æternæ](/2024/aves-aeternae)
airship drone.
Later, the [Avis Minima](/2024/avis-minima) project
studied how to build a 1-meter long airship.

## 🙏 Acknowledgements

Thanks to my friends at [MakeSpace Madrid](https://makespacemadrid.org/)
for the interesting discussions:
in particular David, Pablo, José David and Javi who have had to indulge my crazy ideas.

