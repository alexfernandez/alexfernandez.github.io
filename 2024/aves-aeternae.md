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

So let's build a scale model!
In what follows we will look at a 2×2×4 meter model, more or less the size of a car:
big enough to be substantial,
but small enough to be built with limited means.

### 🏉 Proportions

The classical design for a blimp or a zeppelin is a spheroid.
(Yes, I know that last time I chose a design similar to a boat:
square and flat profile.
I have since come to appreciate a more classic design.)

![An spheroid or ellipsoid. Source: [Sam Derbyshire, Wikimedia](https://en.wikipedia.org/wiki/File:Ellipsoid_Quadric.png).](pics/aves-ellipsoid.png "3D rendering of an ellipsoid, a stretched sphere or the shape of a rugby ball.")

It is quite aerodynamic, or should be:
drag of a spheroid is between 0.02 and 0.04,
according to [GE Dorrington in "Drag of Spheroid-Cone Shaped Airship"](https://doi.org/10.2514/1.14796).
Also it is simple to model and build.
So let's go with a spheroid!

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

`V ≈ 2m × 2m × 4m / 2 = (2m)³ = 8 m³.`

And the area is very approximately:

`S ≈ 5 × 2m × 2m = 5 × 4m² = 20 m².`

These are the basic parameters of our model.

### ⚖️ Weight

You may remember that the plan was to fill the airship with hydrogen:
even lighter than helium, and quite cheaper.
For an uncrewed vehicle the risks are negligible.
Also, for a continuously flying machine hydrogen can be replenished in flight,
as we will see later.

How much will our model weight?
Exactly as much as the air displaced by the hydrogen:
we compute the weight of the air inside,
and then subtract the weight of the same volume of hydrogen.
Since the density of air is 1.3 kg/m³,
and of hydrogen is 70 g/m³, lift will be:

`L = (1.3 - 0.070) kg/m³ × 8 m³ ≈ 9.84 kg.

So our budget is around 10 kg.
As you see, at this stage it's not enough to do Fermi estimations
(i.e. order of magnitude):
for a detailed feasibility study we need more precise numbers.
It is still OK to round up numbers as we did above with surface and volume.

## 🛠️ Build

How can we build a real life airship,
even if it's a small one?

### 🪚 Structure

We want to build a dirigible:
an aircraft which is sustented by the lift of a light gas.

real dirigible, not a blimp:
the difference is that the dirigible or zeppelin has a rigid structure,
while blimps are just inflatable.
We know that dirigibles worked beautifully,
and with ancient 1900s materials even,
but is it possible to do it at this scale?

Let's go with the simplest structure:
just a shell.
We can set up a rigid hull that contains a sack,
which in turn holds our lifting gas.
What is the weight per square meter that we can afford?

First we have to set up a budget:
how much of our 10 kg we want to spend in the shell.
It seems obvious that this is going to be our biggest source of weight,
and that we should reserve for it as much as we can afford:
a stronger structure is going to hold up better against strong winds or impacts.
Let us say half our weight is for the structure.

We have to reserve some weight for the wings and other parts.
Let us say 4 kg for the hull.
Since we have 20 m² of surface,
the areal density will be:

```
D(A) = 4 kg / 20 m²
= 200 g/m².
```

What kind of material can be strong enough at 0.2 kg per square meter?
Only [carbon fiber](https://en.wikipedia.org/wiki/Carbon-fiber-reinforced_polymers) fits the bill.
It is a very interesting material made of carbon fibers embedded in an epoxy resin,
which when cured results in super strong panels.

### 🪽 Wings and Reinforcements

We set aside a budget of one kg for the rest of the hull.

The wings need also be built using carbon fiber.
They need to be even stronger than the outer shell.
Two wings and a tail on top are of the same approximate dimensions:
60 x 80 cm, for a total area of approx. one third of a m².
The three share an area of 1 m².
The areal density needs to be at least twice of the shell,
probably 500 g/m², for a total weight of 0.5 kg.

Also some reinforcements are required where the parts are joined.
It is impossible to build the hull in one go;
different pieces have to built and assembled.
In our case we can build eight identical panels,
which is quite convenient from the manufacture point of view.
Then they can be assembled together using reinforcements,
built using carbon fiber and glass fiber for elasticity.

![Eight pieces of the hull: four on top, four below.](pics/aves-aeternae-hull.png "A spheroid cut in eight: seen from the top an ellipse cut in four pieces. Source: the author.")

Finally we need a small cone to place at the front.
Together the budget of 1 kg seems doable.

### 🎈 Hydrogen Sack

Inside the hull a large bag will hold the gas.
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

Bags with thickness of 40 microns are quite common in the industry.
Given the density of PVA of 1.19 g/cm³,
for our total surface of 20 m² we get:

```
W(bag) = 0.040 mm * 1.19 g/cm³ * 20 m²
= 950 g ~ 1 kg
```

So another kg for our weight budget.

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

`1 barrer = 3.35 × 10^-16 × mol × m / (m² × s × Pa),`

the computations are a bit messy but can be done as follows.
The leaked gas will be:

`Quantity = Per × Surface × time × Pressure / thickness,`

Remember that our surface is 20 m².
We will compute the leaked quantity for a day or 86400 seconds,
at atmospheric pressure or 101325 Pascal with a 40 micron bag.
Pressure inside the bag will not be much higher than 1 atm;
even [balloons](https://www.mwmresearchgroup.org/the-science-of-balloons-part-2.html)
are only a few percent tighter than atmospheric pressure.

Now we have everything:

```
Q = 0.0084 barrer × 20 m² × 86400 s × 101325 Pa / 0.000040 m,
= 0.0084 × 3.35 × 10^-16 × 86400 × 101325 / 0.00004 mol,
= 0.0006 mol.
```

Converting to grams is easy as 1 mol of Hydrogen is defined as 1 g,
so we are leaking a bit more than half a milligram per day.
Not bad considering that we have around 0.5 kg of hydrogen!
We might stay aloft for a million days at this rate.
These nubers do not look very realistic,
and have to be contrasted with real world tests with real bags.
But the safety margin is quite large.

## ⚡ Energy Sources

The airship needs to be able to direct its flight.
It needs a power source that gives enough energy for our purposes.
Being a demonstration model it doesn't need to withstand any kind of weather,
but it needs to manouver at a certain speed.

### 🛩️ Power

How much power do we need?
Let's recall the drag equation:

`F(D) = ½ ρ × v² × C(D) × S,`

using the density of air of 1.3 kg/m³,
the surface of 20 m²
and the drag coefficient we saw above for a spheroid with a cone of `0.03`.
Spoiler alert, power is just force multiplied by velocity,
so we just add another velocity:

`P = ½ ρ × v³ × C(D) × S.`

So the power we need to move at a given velocity will be:

```
P = ½ 1.3 kg/m³ × 0.03 × 20 m² × v³
= 0.39 kg/m × v³
```

Now let's set as target speed a leisurely pace of 5 m/s,
or 18 km/h (11 mph).
Our avis aeterna is not going to be a speed demon,
but it will move about.
The required power will be:

```
P = 0.39 × 5³ kg×m²/s³ = 48.75 W
```

Approximately 50 watt of power will be required.
Is this possible to achieve?

### ⚙️ Motor and Propeller

From this power budget we have to discount the efficiency of motor and propeller.
Luckily thanks to the RC industry there are a lot of very efficient motors
(brushless and sensored are apparently the way to go)
and propellers which are powerful and light enough.

There is at least a 20% reduction in efficiency due to the combination of motor and propeller to be taken into account.
So our 50 W of impulse become at least 60 W at generation.
Also, the weight of two motors and two propellers
(each at the side of the airship to help keep the balance)
should be well below 500 g.

### ☀️ Solar Energy

There are not many renewable sources of energy up in the air.
The most obvious is the Sun:
embed some solar panels on top of our hull and we are good to go!

Ultralight panels are not easy to find.
But there are companies commercializing powerful panels today.
One such example is the [Solbian SP 24](https://www.solbian.eu/en/sp-series/26-sp-24.html),
which provides a nominal 82 W with a weight of 1.1 kg.

Keep in mind that solar panels always provide less power than advertised,
even in full sun.
So it is possible that at midday in optimal weather in a temperate country
this panel might get to give us the 60 W we need.
We might use a couple of these panels to reach more power,
but then the airship may become top-heavy and destabilize.

It is not unusual to see promises of much more powerful solar cells.
[MIT researchers](https://news.mit.edu/2022/ultrathin-solar-cells-1209)
were promising 370 W/kg in 2022,
which would be closer to what we need.
And the Airbus Zephyr uses Microlink solar sheets
[exceeding 1500 W/kg](https://www.prnewswire.com/news-releases/microlink-devices-powers-successful-stratospheric-flight-of-airbus-defence-and-space-zephyr-s-haps-solar-aircraft-300732214.html),
and 350 W/m2.

We might even get to 10 m/s with this kind of power.
But keep in mind that the cubed equation we got above for power is quite treacherous:
to get to 10 m/s we would need 8 times more power than for our 5 m/s,
or 480 W.
For now we will probably have to keep to our target speed.

### 🌬️ Wind Energy

An intriguing possibility,
and one which does not require any technological leaps of faith,
is to use wind energy.

But wait,
how can you use wind energy to propel yourself if you are moving in the wind?
It's the same principle as regenerative braking in electric cars:
you let the motor spin freely,
and instead of spending energy to move the wheels,
the movement of the wheels charges the battery.
Same principle: 
Yokota and Fujimoto investigated the principle in planes in
[Pitch Angle Control by Regenerative Air Brake for Electric Aircraft](https://www.jstage.jst.go.jp/article/ieejjia/11/2/11_21005706/_pdf),
and it is perfectly possible if the wings are oriented correctly.
It even decelerates the aircraft,
which is logical since the energy is taken from the flowing air.

So the idea would be:
orient the airship so the propellers move maximally,
stop the motor and let it charge the batteries.
The craft would slow down at the same time
so it would not be carried away by the wind so fast.
Then, once the batteries are charged start the propellers
and move back to the desired position.
This process can be repeated as often as desired;
of course it will not be very efficient but might help not drift away too much e.g. at night.

### 🔋 Batteries

Speaking of which,
is there any of that weight budget left at this point for the batteries?
They are intended to store some of the solar and wind energy during the day,
and use it at night to avoid drifting away.

We will have to set aside at least 1 kg for a good battery.
We can get [180 Wh commercially](https://www.jinbei-deutschland.de/en/products/v-mount-battery-180-wh-28309) today.
This means driving our propellers at 60 W for three hours,
which is not bad.

## 💅 Finishing Touches

We still have tomake sure this thing is light enough to get in the air,
and then fly it.

### 💻 Control

Let's start by how to fly it.
The idea is to build an autonomous drone,
so it needs to have enough sensors to know where it is and what it is doing.
Also an onboard computer,
and servos to move the control surfaces:
ailerons on wings and tail.

Today there is no wonder in getting a GPS, accelerometers,
world-wide communications, camera, microphone,
plus a powerful computer
into a compact package weighing less than 0.25 kg.
We call it "mobile phone".
But we may need something like a Raspberry Pi with electric controls to drive the servos.
Ideally we should get something that does both functions,
something like a Raspberry Pi
which might do both functions since it has a 4G module.

We can spare 0.5 kg for the onboard computer while servos might take 0.2 kg at most.

### 🧮 Weight Budget

Let's add up a few other weights:
a carbon fiber gondola is required to hold battery and onboard computer
below the hull,
and help compensate the weight of the solar panels.
It might weigh 0.5 kg.
We also need some cabling for 0.2 kg.

These are our total weights:

| part              | material     | weight (kg) |
|-------------------|--------------|--------|
| outer shell       | carbon fiber | 4      |
| wings and tail    | carbon fiber | 0.5    |
| reinforcements    | carbon fiber | 0.5    |
| envelope          | PVA          | 1      |
| gondola           | carbon fiber | 0.4    |
| battery           | LiPo         | 1      |
| motors            |              | 0.1    |
| propellers        |              | 0.2    |
| solar panel       |              | 1.1    |
| cables and servos |              | 0.2    |
| computer |              | 0.5    |
| lift              | hydrogen     | -9.84  |
| total             |              | -0.34  |

The budget seems feasible,
and we even have 0.3 kg to spare.
If needed it can be filled with ballast.

## History

https://www.reddit.com/r/IsaacArthur/comments/t44ypy/can_you_have_a_selfmaintaining_hydrogen/

## 🔮 Changes

In the [last article](https://pinchito.es/2023/avis-aeterna)
I used a reference design 10 meters long and 10 meters wide.
That is definitely too large for an initial model.
Also, the proportions have changed since then.

### Left out

This scale model does not have any kind of hydrogen regeneration:
it simply does not fit.
According to our calculations it doesn't need it either:
surely something else will fail before gas runs out after a million days.

A bigger model should have some kind of atmospheric water gathering,
from which it can generate hydrogen by electrolisis to replenish any leaks.

# 🤔 Conclusion


## 🙏 Acknowledgements

Thanks to Carlos Santisteban for so many fruitful discussions.
