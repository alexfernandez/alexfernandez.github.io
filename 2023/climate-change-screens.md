---
title: '🛰️  Space Screens'
subtitle: '🥵 Some Solutions to Climate Change, Part 4'
footer: Published on 2023-07-23, last modified on 2023-07-23.
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
image: https://pinchito.es/2023/pics/climate-change-screens.png
---

Climate change is upon us,
and we want to [do something about it](/2023/climate-change-solutions).
We already saw that we could
[plant some trees](/2023/climate-change-trees)
or install [mirrors on your roof](/2023/climate-change-roofs).
Are we only going to present boring low-tech ideas?

# 🛰️ Send Screens to Space

Let's now go for the most egregious of the ideas presented here,
and also the most entertaining.
How about sending a giant shade to the sky between the Earth and the Sun?
This might seem like a little kid's idea of how to cool the Earth.
But real astronomers and physicists have entertained the idea.

![Screens between the Sun and the Earth to keep us cool. Source: the author.](pics/climate-change-screens.png "A number of small screens would sit between the Sun and the Earth, giving us shade. They would block a proportion of the sunlight coming to us.")

Roger Angel published a [fascinating paper back in 2006](https://www.pnas.org/doi/full/10.1073/pnas.0608163103),
complete with cost analysis of the project.
You can read about this "giant space umbrella"
on the [BBC](https://www.bbc.com/future/article/20160425-how-a-giant-space-umbrella-could-stop-global-warming),
although I encourage you to go the original article
because the scale of it is really mindblowing.
Total cost would be a few trillion dollars:
considerable, but worth it if we are saving the planet from the catastrophe.

Angel gives a new twist to the giant space umbrella.
Instead of sending one big structure,
Angel proposes sending trillions of small screens to the
[L1 Langrange point](https://en.wikipedia.org/wiki/Lagrange_point),
which is at equilibrium between the Sun and the Earth.
They would need complex mechanisms to stay in place,
and to be able to direct them as needed to increase or decrease the effect.
They would not be seen from Earth since they would sit at a large area roughly comparable to the section of the Earth;
we would just feel less heat than usual.
How much less heat?
Let's estimate it!

## ⚡ Efficiency

We will try to replicate the computations on the paper with our own Fermi estimation,
and then check out how we did.

As before, we will divide the problem into simpler parts:
the number of screens `n(screens)` and
the area of each screen `A(screen)`
will combine to the total area of sunlight blocked `A(screens)`:

    A(screens) = n(screens) × A(screen).

If we consider that sun rays are basically parallel at the L1 point,
the proportion of sunlight blocked `p(screens)` will be a constant factor `p(screen)`
multiplied by the proportion of sunlight covered by the screens.
This proportion is just the area of the screens divided by the disc of the Earth,
A(disc):

    p(screens) = p(screen) × A(screens) / A(disc).

Finally we estimate the temperature difference caused by the screens.
Luckily, we already did the estimation above!
We can expect approximately a 3 degree (Celsius or Kelvin)
reduction in temperature for every 1% of sunlight we block.
In equations:

    ΔT(screens) ≈ T(Earth) × p(screens).

We take a different approach than before:
we start with the desired temperature change,
and work out how many screens of a given area we need.

### 🥶 Expected Cooling

Angel cites a target reduction of 1.88 K in temperature.
We will start with 2 degrees (again, C or K) and work back from there:

    ΔT(screens) = 2 K.

Then:

    p(screens) ≈ ΔT(screens) / T(Earth) ≈ 2 K / 300 K ≈ 0.7%.

So we need to block around half a percent of the radiation coming from the Sun.
This amount will probably not be noticeable without sophisticated apparatus.

### 🕶️ Number of Screens

Now let us see how many flying screens we need.
First let's find out the area covered by the screens.
As before:

    p(screens) = p(screen) × A(screens) / A(disc),

therefore:

    A(screens) = p(screens) * A(disc) / p(screen).

Note that we need to estimate first the efficiency of each screen `p(screen)`.
The proportion of sunlight blocked will depend on where the screens are installed.
We can consider that the L1 point is much closer to Earth than to the Sun,
so that the rays of light are almost parallel.
Still, some shade will be lost since it will not be a perfect block,
and some light will be diffused back to Earth.
Let's say each screen will stop half the heat coming to Earth:

    p(screen) = 1/2.

We also need to know the area of the disc of the Earth,
just our old friend π (_pi_) multiplied by the square of the radius:

    A(disc) = π × R(Earth)^2 ≈ π × (6300 km)^2 ≈ 100 × 10^6 km².

Approximately 100 million square kilometers.
(Why is it different from the 500 million square kilometers we had before?
Note that in the last chapter we were measuring the surface of the globe;
now we want the area of the **section** of the globe, substantially smaller.)

We are ready now to compute the total area covered by the screens:

    A(screens) ≈ 0.7% * 100 * 10^6 km² / ½ ≈ 1.5 * 10^6 km².

Total area is approximately 1.5 million square kilometers.
If every flying screen has an area `A(screen)` of 1 square meter:

    n(screens) = A(screens) / A(screen) ≈ 1.5 * 10^6 km² / (1 m²) ≈ 1.5 * 10^12.

So we need 1.5 trillion flying space robots.
Not bad!

## 😎 The Screens

We come to another interesting point:
the design of the screens themselves.
Angel sets a target weight of one gram for them,
increased a bit for navigation and communication.

### ☄️ Sending Stuff Up There

Speaking of which, we come to the most interesting part:
how can we send 16 trillion sun screens up in the sky?
The answer is: space cannon.

![A space cannon excavated into a mountain. Source: the author.](pics/climate-change-cannon.png "Inside a big mountain there is a tunnel that goes along one of the slopes. A projectile emerges at 9 km/h, with a sabot that is discarded.")

Luckily we have already explored [how to build a space launcher](/2018/building-space-launcher)
a few years ago,
so we only need to go over the basics.

Angel wants to build a huge space launcher,
also called space cannon or Gauss gun in the literature;
when using it to launch projectiles also called
[mass driver](https://en.wikipedia.org/wiki/Mass_driver).
In essence it is just a big tunnel with many magnetic coils so that a projectile is accelerated using electromagnetic forces.

His design is 2 kilometer long.
I think this is too ambitious, and my own design calls for a 28 km long tunnel.
But he probably knows better;
if we can accelerate above 150g,
and if the material of the armature can withstand the magnetic pressure,
then a shorter design will of course be cheaper and more feasible.
A longer tunnel built on a mountain also reduces drag on the exiting projectile.

There are other design parameters which are surprising:
a projectile of just three tons and with an exit velocity of more than 12 km/s.
It might heat quite faster,
plus the heat of travelling through the atmosphere at such a velocity might melt it down.
Especially if it exits the tunnel at low altitude
I contend that a 10-ton projectile can use some of that extra mass
to hold a rocket that can take the payload to low Earth orbit (LEO).
My proposed exit velocity of 9 km/s does not require a lot of further acceleration.

The concept is cool anyway:
a big gun launching satellites to space!
Many simulations and scale models will have to be built to validate any proposed designs,
and to fine-tune the working parameters.

### 🏭 Building the Screens

There is also the small issue of manufacturing the small sun screens themselves,
or "flyers" as Angel calls them.
He concedes that there are big engineering challenges in the building of a 1 gram,
1 square meter space flyer that is an autonomous spacecraft and can be controlled from a bigger space station.

![Like this, but weighing one gram and being an autonomous spacecraft. [Source: HighTechDad.](https://www.flickr.com/photos/hightechdad/28763156911).](pics/climate-change-car.jpg "A small sun shade installed on the window of a car. It has lots of small holes and diverts a high proportion of incoming sunlight.")

But if the health of our planet is at stake,
we should definitely face them!
Also, this is how engineering moves ahead:
by tackling big challenges.
After all, who would have thought 20 years ago that by 2023
we would have a huge 6 meter wide space telescope orbiting the L2 Lagrange point
that can view infrared light from the earliest galaxies?a

## 🧮 How Did We Do?

The article specifies 16 trillion flying space robots,
each with an area of 1 square meter.
We were supposed to be within one order of magnitude,
but our result is more than 10 times smaller!

### ☀️ Radiation Pressure

What went wrong?
We overlooked one important effect:
if our screens were mirrors,
like in the previous section,
the reflected light would make them fly away quite fast from the L1 point due to radiation pressure.
The push from all those photons being reflected becomes quite significant when we are in space
and directly exposed to sunlight.
Even if the screens were opaque and reflected light only as heat,
they would need to be further away from the L1 point to be more or less stable.

![When radiation pressure is taken into account, the equilibrium point moves closer to the sun. Source: the author.](pics/climate-change-equilibrium.png "The L1 Lagrange point is where the gravity from the Sun and from the Earth cancel each other. When the push from sunlight is considered, the equilibrium point has to move closer to the Sun to compensate.")

How far away? Perhaps twice or three times further away from the Earth.

Another solution is to make the screens thicker,
which increases the weight over the practical limit.
Our friend Roger Angel takes this effect into account,
and proposes transparent screens that just deflect light only so slightly.
This increases the area required to around 5 million square kilometers,
approximately three times as much as we estimated.

### 🌡️ Reduction of Temperature

But he also cites a
[study by Govindasamy and Caldeira](https://agupubs.onlinelibrary.wiley.com/doi/pdfdirect/10.1029/1999GL006086)
which estimates that a 1.8 K decrease in temperature would require a reduction in solar flux of 1.8%,
not 0.6% as we estimated.
I'm not sure which is the correct reduction here;
some of the projects mentioned in Wikipedia as
[space sunshades](https://en.wikipedia.org/wiki/Space_sunshade)
seem to be closer to our estimate.
I have not found a clear answer in the literature either after a quick look.
I'm under the impression that this point requires complex modelling to get a clear answer.
The correct amount of reduction needed is probably between our 0.6% and Angel's 1.8%,
so perhaps our Fermi estimate was not so far off.

In fact, an updated version of the scheme
[by Borgue and Hein](https://www.sciencedirect.com/science/article/abs/pii/S0094576522006762)
seems to be OK with sending much less stuff up there,
but the article is paywalled so I cannot say exactly how much area they are covering.

## 💊 Side Effects

https://phys.org/news/2022-12-climate-block-sun-lightweight-solar.html

https://www.sciencedirect.com/science/article/abs/pii/S0094576522006762

# 🤔 Conclusion

# ⏭️ To Be Continued

