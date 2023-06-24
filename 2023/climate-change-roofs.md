---
title: '🪞 Mirror Roofs'
subtitle: '🥵 Some Solutions to Climate Change, Part 3'
footer: Published on 2023-06-24, last modified on 2023-06-24.
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
image: https://pinchito.es/2023/pics/climate-change-temperatures.png
---

Climate change is upon us,
and we want to [do something about it](/2023/climate-change-solutions).
We already saw that we could
[plant some trees](/2023/climate-change-trees),
but maybe we can do something closer to home.
Why not put a mirror on your roof?

# 🪞 Mirror Roofs

Our second solution involves a little bit of creativity.
Since the Earth is heated mainly by the Sun,
why not divert some of that heat back to space?

Instead of installing dark roofs,
like roofing tars,
we may use a reflective cover.
Apart from cooling the building itself,
it will send those pesky infrared radiations back to space where they belong.
It doesn't even need to be a proper mirror,
just some kind of surface that reflects most light in the infrared spectrum,
which is what heats the Earth the most.
We don't need an expensive [gold foil](https://webb.nasa.gov/content/observatory/ote/mirrors/index.html);
just [aluminium foil](https://osb.westfraser.com/wp-content/uploads/2017/05/The-Physics-of-Foil.pdf)
is a good mirror for infrared light.

![Our cities are about to get shiny, baby. [Source: PxHere.](https://pxhere.com/en/photo/917349).](pics/climate-change-mirrors.jpg "A building made with lots of shiny mirror surfaces on the outside.")

# ⚡ Efficiency

The first step for a mental exercise like this should always be to do a
[Fermi estimation](/2023/climate-change-solutions#fermi-estimation),
to get an idea about its feasibility.

Let us estimate how much would roof mirrors affect the Earth's temperature.
Again, we divide the problem into simpler estimations:
how much area of mirrors we can place on buildings `A(mirror)`,
what percentage of the Earth surface we can cover `p(mirror)`,
and how much would they affect the temperature of the planet
`ΔT(mirror)`,
where the capital delta `Δ` represents the difference.

## 🧮 How Many Mirrors

We beging by estimating the area covered by buildings on the planet.
How much space does each person occupy?

Let us say that each person on Earth lives in a room which is typically some 10 square meters.
Add to that living quarters (kitchen, living room, bathroom)
and it might be twice or three times the space;
we will go add twice the space, getting to 30 m² per person.
In cities it will probably be less on average, since we live in buildings;
in villages it is likely bigger.
A useful data point is that
[around half of the world population live in cities](https://www.worldbank.org/en/topic/urbandevelopment/overview),
so we can go with our average.

How much roofing is that?
Again, people in cities live in several heights,
while villages tend to be flatter.
We can estimate an average of two storeys,
which gives us 15 m² of roof on top of every house.

Now we need to add all those buildings where we do our daily activities:
factories and shops, offices and malls,
community buildings and stadiums,
museums and palaces.
Let us add again about the same amount of roofing for work,
for shopping and for leisure;
getting to a total of 60 m² of various roofs per person, `A(person)`:

Now let's compute the total of roofs.
Since we recently crossed the mark of
[8 billion people](https://www.worldometers.info/world-population/):

    A(buildings) = N(people) × A(person) ≈ 8 * 10^9 * 60 m² ≈ 5 * 10^11.

This gives us a total area of around 500 billion square meters.
Converting to square kilometers:

    1 km² = 1000000 m²,
    A(buildings) ≈ 500 × 10^9 m² × 1 km² / 10^6 m² = 500 000 km².

Close to half a million square kilometers.

## 🌐 Percentage of the Planet

What really interests us is the % of the total surface of the planet
that we can cover in mirrors.

Given that the Earth has
[500 million km²](https://www.cia.gov/the-world-factbook/static/6c4d9b9a41b27707b6720720df7161d6/Physical_World.pdf)
including the oceans,
we have at our disposal well below 1% of the total surface of the planet.

    p(buildings) ≈  500 000 km² / 500 000 000 km² ≈ 0.1%.

One per thousand!
This doesn't seem enough.
We have to turn to other sources:
perhaps consider all human-made structures.
Add roads and other pavimented surfaces and we can perhaps push it a bit further;
let us estimate twice as much.

    p(mirror) ≈ 0.2%.

Is this enough?
Let us see.

## 🥶 Expected Cooling

How much would 0.2% of mirror surfaces affect our temperature?
A very rough first estimate is based on this idea:
apart from a little internal geothermal energy,
the Earth gets most of its heat from the Sun,
and most of it from infrared light.
To begin with let us say that we can reflect half the heat out to space.
Our little project would reflect 0.1% of the heat.

To ease our task we will work in degrees Kelvin (or kelvins),
which are degrees above absolute zero.
This [answer from StackExchange](https://earthscience.stackexchange.com/questions/9210/what-is-the-current-equilibrium-surface-temperature-of-earth-i-e-without-the-s)
calculates that the Earth's temperature would drop to 35 K (around -240 C) without our Sun.
Chilly!

Right now it is very roughly close to 300 K,
so we can assume that the Earth gets around 250 K from the Sun,
and it is linear:
reducing sun heat by 1% would cool the Earth by 2.5 K (or 2.5 C).
So knowing our proportion of mirrors from before:

    ΔT(mirror) = T(Earth) × p(mirror) ≈ 300 K × 0.2% = 0.6 K.

If we reflect 0.2% of the heat we might decrease the temperature by around half a degree.
Not a lot.
So this little project is perhaps not worth the hassle,
at least globally.

# 🎚️  Some Checks

How well did we do with our Fermi estimates?

Let us check this estimate with independent data.
According to NASA urban regions cover
[0.2% of the Earth's land surface](https://www.nasa.gov/vision/earth/environment/urban_effects.html).
According to the
[Food and Agriculture Organization of the UN](https://www.fao.org/uploads/media/glc-share-doc.pdf),
artificial surfaces cover 0.6% of the land surface.
For the total surface we have to multiply by the proportion of land surface,
or 150 / 500 million square km:

    p(artificial) ≈ 0.6% × A(land) / A(Earth) ≈ 0.6% × 150 / 500 ≈ 0.18%.

Our prediction of 0.2% was not bad at all!

# 💊 Side Effects

Getting an international agreement for roof mirrors would probably not be easy.

The nice part of this project is that infrared mirrors on roofs
would help [cool our buildings](https://www.architecturaldigest.com/story/mirror-on-roof-renovation),
reducing the need for air conditioning.
The same is true for [windows](https://www.sciencedaily.com/releases/2016/08/160825152054.htm)
by the way.
Whole cities might also be cooler this way.
Even for cold countries this effect would be welcome in summer.

Can we do better?
How about lining the Sahara with mirrors?
What about other deserts?
Maintenance would be horrible!
But what we can do is install reflective roofs on crops that are sensitive to heat.

There have been recent trials of combining
[solar panels with agriculture farms](https://www.fastcompany.com/90861486/agrivoltaics-crops-under-solar-panels-good-for-panels),
with excellent results.
[Crop yields are improved](https://www.wired.com/story/growing-crops-under-solar-panels-now-theres-a-bright-idea/)
by the combination.
We can also combine
[solar panels with mirrors](https://theconversation.com/can-mirrors-boost-solar-panel-output-and-help-overcome-trumps-tariffs-90663)
which increase their efficiency,
plus also reflect unused sunlight back to space.
Combined with large agricultural areas they might cover vast expanses of land,
not just the puny 0.18% of the surface of the planet that we could muster only with buildings.
Imagine 5% of the land surface devoted to crops + solar power,
reflecting any excess heat back to space.

Even if only 1/3 of the heat was radiated back for our `crops+solar` project:

```
p(crops+solar) = 1/3 × 5% × A(land) / A(Earth) ≈ 1/3 × 5% × 150/500 ≈ 0.5%,
```
```
ΔT(crops+solar) = 1/3 × T(Earth) × p(crops+solar) ≈ 300 K × 0.5% = 1.5 K.
```

Now 1.5 degrees are significant cooling.
Our little mirror project could become a real game changer!

# ⏭️ To Be Continued

This is the third part of the series about climate change:

* Part 1: [🥵 Some Solutions to Climate Change](/2023/climate-change-solutions),
* Part 2: [🌲 Climate Change: Planting Trees](/2023/climate-change-trees).

To be continued!


