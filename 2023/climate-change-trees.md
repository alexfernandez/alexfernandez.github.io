---
title: '🌲 Climate Change: Planting Trees'
subtitle: '🥵 Some Solutions to Climate Change, Part 2'
footer: Published on 2023-06-17, last modified on 2023-06-17.
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
image: https://pinchito.es/2023/pics/contradiction-escher-cuboid.jpg
---

Climate change is upon us,
and we want to do something about it.
Why not plant a few trees?

# 🌲 Lots of Trees

Some people are proposing a solution to climate change which can be a bit disappointing:
just planting trees.
I am sure you prefer to think of clever carbon-capture devices
that could turn the tide and suck all that carbon out of the skies,
using modern technology.
Problem is, none of it works properly yet,
and possibly will never work.

Meanwhile Mother Nature has created these wonderful machines
that have evolved during millions of years to become better at basically one thing:
convert CO₂ to carbon in their trunks.
In the process they also generate sugars, create seeds and deter hungry animals,
plus give shade and provide for excellent furniture.
But these are secondary interests.

Just how many trees can we realistically plant in the world?
Many areas are already covered in forests; others are deserts.
Of the remaining areas, many are used for growing food;
there are also cities and roads.
We can of course plant trees in many of these places:
as hedges of fields,
in our streets,
even on top of buildings.

Some studies say that a trillion (10^12) trees are feasible,
like 
[this one by Crowther _et al_](https://web.archive.org/web/20190502122937id_/https://www.biorxiv.org/content/biorxiv/early/2017/11/07/210062.full.pdf))
or
[this one by Bastin _et al_](https://www.science.org/doi/10.1126/science.aax0848).
Note: throughout the article I'm using US billions (10^9, or a thousand millions)
and US trillions (10^12, or a million millions).

![Spoiler alert: what a trillion trees look like. Source: the author.](pics/climate-change-cube.png "A cube with sides of 9 km, made of wood. But we are getting ahead of ourselves.")

As it happens,
some people took it seriously,
including
[Trillion Trees](https://trilliontrees.org/),
another [Trillion Trees](https://www.plant-for-the-planet.org/trillion-trees/),
and the
[World Economic Forum](https://www.weforum.org/agenda/2020/01/one-trillion-trees-world-economic-forum-launches-plan-to-help-nature-and-the-climate/).
It's such a catchy name!

Another very interesting possibility is using algae,
which are more efficient because they already have all the water necessary in their surroundings.
These techniques are very likely more difficult to implement than just planting trees,
and can have other side effects.
So we will focus on trees.

## ⚡ Efficiency

Let us approach the matter from a different perspective:
just how many trees do we need?

We will divide the problem into three simpler steps:
find out total excess carbon in the atmosphere `T(C)`,
how much carbon each tree can absorb `m(C)`,
and the number of trees `N(trees)`.
Our problem will be solved when we plant enough trees to absorb all of the excess carbon in our atmosphere,
in equations:

    T(C) = m(C) × N(trees),

or solving for number of trees:

    N(trees) = T(C) / m(C).

That's it!
Problem solved, Earth saved.

### 🛢️ Total Excess Carbon

First let's estimate the total amount of excess carbon in the atmosphere.
If we look at the [data from Statista](https://www.statista.com/statistics/276629/global-co2-emissions/),
there is a more or less steady linear increase from about 1943 to 2021.
(Yes, emissions are still increasing.)
Latest numbers are 37 billion metric tons of CO₂.
Say we have a completely linear graph from 1940 to 2020 (80 years),
the total of carbon emissions would be something like the number of years multiplied by the midpoint:

    T ≈ 80 × 40 / 2 GtCO₂ ≈ 1600 GtCO₂.

Remember, for now we don't have to get an exact number,
just a rough estimation,
so we can round our numbers to make them easier to deal with.
Let's convert to the international system,
remembering that the prefix _giga_ means 10^9 and a ton is just a million grams:

    T(CO₂) ≈ 1.6 × 1000 × 10^9 × 10^6 g ≈ 1.6 × 10^18 g.

How much carbon is that exactly?
A molecule of CO₂ has one atom of carbon (C) with atomic weight 12 and two O's each with atomic 16;
the total portion of carbon is thus 12/(12+16+16) ≈ 27%:

    T(C) ≈ 0.27 × 1.6 × 10^18 g ≈ 0.4 × 10^18 g.

So a little bit under half a million million million grams.
The official name is "half an exagram",
although we can call it more familiarly "half a teraton",
which has more punch.
Some part of that has by now been absorbed by the oceans and other natural processes,
but most of it remains floating around.
Good! We are getting there.

### 🪵 Carbon per Tree

Now let's estimate how much carbon can we store in a tree.
Let's assume an average 4 meter tall tree, with a trunk radius of 25 cm;
this gives us a volume of:

    V ≈ π × 0.25 × 0.25 × 4 m³ ≈ 0.75 m³.

![A simplified tree. Source: the author](pics/climate-change-tree.png "A cylindrical trunk with a cross-section given by its radius, below a canopy of branches and leaves, and in the ground some roots.")

How much does each tree weigh?
Wood has a density similar to water (some woods float, others don't),
which is 1 kg per liter (a cube with sides of 10 cm), so our average tree trunk will weigh:

    m(tree) = d × V ≈ 1 kg / 0.001 m³ × 0.75 m³ ≈ 750 kg.

But the tree also has branches and leaves and roots;
we can estimate that the trunk is just half the total weight,
which is probably
[not that far off](https://www.researchgate.net/figure/Proportion-of-the-tree-biomass-from-the-trunk-the-branch-the-leaf-and-the-root-in_fig12_299376027).

Therefore we will have twice as much mass in the whole tree as in the trunk:
around 1.5 metric tons.
But only around
[half of the tree](https://web.extension.illinois.edu/askextension/thisQuestion.cfm?ThreadID=19549&catID=192&AskSiteID=87)
will be carbon,
so we will stick to 750 kg of carbon per tree,
close to a metric ton,
or a bit under a million grams:

    m(C) ≈ 0.75 × 10^6 g.

How close are we to official estimations?
Well, taking Spain as an example:
there are [seven billion trees](https://www.uab.cat/web/newsroom/news-detail/spain-has-close-to-seven-billion-trees-1345668003610.html?noticiaid=1345689513075),
which together store [422 million metric tons of carbon](https://rainforests.mongabay.com/deforestation/2000/Spain.htm);
each tree will hold

    m(C)' = 422 × 10^6 mt / 7 × 10^9 = 0.060.

Around 60 kg per tree, below an order of magnitude.
Keep in mind that every tree above 75 mm of diameter is counted in the above inventory,
while we are considering mature 4 meter tall trees.

### 🌳 Number of Trees

Finally, can we plant enough trees?

As we saw at the beginning,
to remove all excess carbon from the atmosphere we need a grand total of:

    N(trees) = T(C) / m(C) ≈ 0.4 × 10^18 g / 0.75 × 10^6 g ≈ 0.5 × 10^12.

Or around half a trillion trees.
Is this possible at all?

Many studies have looked at this question.
We will just do our own Fermi estimation.

Let's take first Spain as an example.
With a [total area](https://en.wikipedia.org/wiki/Spain)
of roughly half a million square kilometers
it has a good forest cover of
[over 30%](https://rainforests.mongabay.com/deforestation/2000/Spain.htm);
another ~30% is [arable lands](https://prepsoil.eu/soil-threats-in-eu/agricultural-land-in-spain);
the rest is pastures, mountains, cities, roads and arid lands.

Let us suppose we can cover this 30% with trees every 10 meters.
(A bit [dense but not uncommon](https://hort.ifas.ufl.edu/woody/spacing.shtml).)
After all, according to legend [Strabo wrote](https://earth.org/deforestation-in-spain/)
that a squirrel could cross Spain from Gibraltar to the Pyrennes without touching the ground.
A grid of trees spaced 10 meters would yield 100 × 100 = 10000 trees per square kilometer.

![Urban trees: trunk is actually ~40 cm wide, quite taller than 4 meters, spaced 7 meters apart. Source: the author.](pics/climate-change-urban.jpg "Some large platanus (plane-tree) trees lining a street in Madrid.")

The total for Spain would be:

    N(Spain) = 30% × A(Spain) × n(km²) ≈ 30% × 500000 × 10000 ≈ 1.5 × 10^9.

We could plant a little over a billion trees.
How much carbon is that?

    T(Spain) = N(Spain) × m(Spain) ≈ 1.5 × 10^9 × 0.75 mt,

equivalent to around 1 gigaton of carbon.
Again, let us check with official sources if our estimations are off the mark.
Spain's forests contain [422 million metric tons of carbon](422 million metric tons of carbon)
in 36% of the surface;
it seems ambitious to store 1 gigaton in the remaining 30%.
But not all is lost!
According to the [Copernicus project](https://land.copernicus.eu/global/sites/cgls.vito.be/files/use-cases/CGLOPS_UC_AgrestaSCoop_I1.00.pdf),
Spanish forests store overall around 2.5 gigatons of carbon;
four times more below the ground than in the trees themselves.

Now let us replicate our reforestation project to the whole world.
Total land area is around
[150 million km²](https://www.cia.gov/the-world-factbook/static/6c4d9b9a41b27707b6720720df7161d6/Physical_World.pdf);
using the same proportion we would get:

    N(world) = 30% × A(land) × n(km²) ≈ 30% × 150 × 10^6 × 10^4 ≈ 0.45 × 10^12.

Almost exactly our half a trillion trees!
Very roughly our project should be feasible.

As we saw above, each tree trunks would have a volume of around 1.5 m³.
All these trees would make up a cube with sides of approximately 9 km:

    V(world) = N(world) × V(tree) ≈ 0.5 × 10^12 × 1.5 m³ = 0.75 × 10^12 m³ ≈ (9 km)³.

## 🎚️ Some Checks

The climate scientist Thomas Crowther,
cited above,
estimates that there are [around 300 gigatons](https://crowtherlab.com/whats-the-potential-of-a-trillion-trees/)
of excess carbon in the atmosphere.
We estimated 400 gigatons above, so not bad!

In 2019 there were some publications about the
[trillion](https://edition.cnn.com/2019/04/17/world/trillion-trees-climate-change-intl-scn/index.html).
[trees](https://www.independent.co.uk/climate-change/news/forests-climate-change-co2-greenhouse-gases-trillion-trees-global-warming-a8782071.html),
saying that such a project would suck the equivalent carbon of a decade of emissions,
when according to our estimation it could wipe out all the excess carbon.
[Bastin et al](https://www.science.org/doi/10.1126/science.abc8905)
later corrected that it might wipe out up to two thirds of all carbon,
closer to our estimate.
I suspect that the difference stems from the basic confusion between
tons of CO₂ and tons of carbon.

### 🌐 Massive Scale

Is it even possible to physically plant one million million trees?
[Crowther says](https://crowtherlab.com/whats-the-potential-of-a-trillion-trees/):

> if you started planting 2000 years ago and planted a million trees every day, [...], after more than 2000 years of daily planting at that massive scale, you’d still be under three quarters of the way to one trillion trees!

Very nice Fermi estimation there, mate!
Although let me point out that there are 7 billion people interested in stopping climate change;
it makes no sense to do some centralized project with one agency doing all the work.
If we pay a million people to plant one tree per minute,
or a thousand per day,
the job would be done in about three years.

What about the possibility of planting so many trees?
[Project Drawdown](https://drawdown.org/solutions/table-of-solutions)
is a project to categorize and quantify possible solutions to climate change.
They have a number of projects related to forests,
among them
[tree plantations](https://drawdown.org/solutions/tree-plantations-on-degraded-land)
accounting for 22 gigatons of CO₂,
All of them combined are 217 gigatons of CO₂,
or less than 55 gigatons of carbon;
quite disappointing when compared to the excess ~1200 gigatons we have to deal with.
I am not sure they are ambitious enough.

## 💊 Side Effects

The side effects of planting a lot of trees are generally very nice:
having a lot of trees.
They cool the surroundings,
help fixate the ground and provide a living environment for other creatures.
In cities they lower the temperature of a street by at least five degrees in summer.

Not everyone is happy though.
There were
[quite a lot of objections](https://www.theguardian.com/environment/2021/sep/01/ive-never-said-we-should-plant-a-trillion-trees-what-ecopreneur-thomas-crowther-did-next-aoe)
to these "trillion trees" projects,
from ecosystem degradation to questions about the amount of carbon sucked in.

There's the matter of albedo (or proportion of sunlight reflected):
trees are generally darker than rock,
and therefore can negate some of the benefits of carbon capture by absorbing heat.
But this is a complicated matter far beyond what we can explore here.

### 🐟 Extra Carbon Sleeps with the Fish

Also, what do we do with all that carbon once it is stored in trees?
If we just leave it there then there is a limit to the carbon taken from the atmosphere;
and it might burn at some point getting us back to the starting point.
What can we do with a cube of side 9 km?
One possible extension of the program might be to mow down trees from time to time and dispose of them,
for example by burying them or throwing them into the sea.
It might be a challenge to find trenches deep enough to bury so much wood though.

The [Mariana Trench](https://en.wikipedia.org/wiki/Mariana_Trench)
is 11 km deep,
so maybe we can dump a teraton of wood down there?
To be fair it would not be nice to the existing ecosystems;
there are bacteria and even fascinating
[giant amoeba](https://www.latimes.com/archives/blogs/nation-now/story/2011-10-26/giant-amoeba-found-in-mariana-trench-6-6-miles-beneath-the-sea)
10 cm big.
But we are trying to prevent a giant ecological catastrophe here,
so all things considered it may be worth it.
The trench is about 2550 km long so not everything needs to go into the deepest point.

### 🤑 Cheap Wood

Maybe we can even convert them into furniture and store them in our homes!
With [2 billion households in the world](https://en.wikipedia.org/wiki/List_of_countries_by_number_of_households),
storing half a metric ton of carbon per house would clear around one gigaton of carbon.
Not much, but every bit helps.

There are many things that we can do with cheap wood.
Perhaps the world would start using more for construction,
[like in the US](https://www.thehousedesigners.com/articles/how-many-trees-does-it-take-to-build-a-house.asp).
I'm sure I'm not alone in wanting to have more things built of this noble material.

# Conclusion

I hope that every time you pass by a mountain or a hill without trees
you will think "that sucker could sequester millions of tons of carbon",
like I do now.
We are in the midst of a global emergency that will need to be addressed by many different means;
and trees can be our number one ally as they have been for millions of years.

## ⏭️ To Be Continued

This is the second part of the series about climate change,
which started with
[🥵 Some Solutions to Climate Change](/2023/climate-change-solutions).
To be continued!
