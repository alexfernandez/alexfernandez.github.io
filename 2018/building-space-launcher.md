---
title: 'Building a Space Launcher'
subtitle: 'The Next Stage in Space Exploration'
footer: Published on 2018-02-06, last modified on 2018-02-06.
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
---

![Artistic rendition of a spaceship after launch.](pics/building-spaceship.jpg "Space ship, source: https://pixabay.com/en/spaceship-raumgleiter-3d-model-2098519/")

Space guns, and more specifically mass drivers,
are a long-standing alternative means of reaching space.
In this article we will explore how to build one today.

## Going to Mars… and Back

Rockets have dominated interplanetary exploration since the beginning of the space age.
They have served us well for reaching the Moon,
first with probes and then by a few select astronauts.
Mars however is a different story.

### NASA

NASA has sent a few very successful robotic probes to Mars.
But a manned (or should we say, "peopled") rocket is a different story:
they always seem to be a decade from sending the first human expedition.

### SpaceX

Elon Musk often speaks about reaching Mars.
His plan is quite complex,
depending on several launches and in-orbit refuelling.
It is also quite expensive:
[around 10 billion dollars](https://www.nytimes.com/2016/09/28/science/elon-musk-spacex-mars-exploration.html).

A practical means of sending cargo up to Earth orbit
would help lowering costs.

## The Space Gun

We present a plan is to build a space gun with existing technologies.
It is easy to envision futuristic means of transportation,
as we will see in the next section;
but a space gun is well within the state of the art,
and can be realistically built in the next decade.

In essence it is just a long
[coilgun](https://en.wikipedia.org/wiki/Coilgun)
in a vacuum.
We can take as reference a speed of 9 km/s
at the moment of leaving the coilgun.
We will also use a reference vehicle weight of 10 tonnes.

### Location

The ideal place for launch is a very high mountain:
like the one in the Himalayas or in the Andes.
This reduces air density and therefore drag on the projectile.
But construction at very high altitudes is complex.
Also, remote locations are hard to reach.

A compromise location is a relatively high mountain near Europe.
I propose to use
[Pico del Teide](https://en.wikipedia.org/wiki/Teide),
a 3718 m peak in Spain.
It has the ideal curvature: it raises 3.7 km in 28 km,
with a steeper slope near the peak.

![Curvature of Teide is almost ideal.](pics/building-elevation.jpg "Teide elevation profile, source: https://www.mapdevelopers.com/elevation_calculator.php")

Pico del Teide is part of Teide National Park,
which means that it is protected:
in particular, exploitation of natural resources is forbidden.
An exemption should be made in this case,
since a mass driver would preserve the environment.
There is precedent: it has been used
(appropriately enough)
as a Mars testbed due to its
[similar conditions](http://news.bbc.co.uk/2/hi/science/nature/4767403.stm).

It is also an active volcano,
so maybe it is not the best idea to use it.
Apart from volcanic eruptions,
[tectonic movements](https://www.express.co.uk/news/science/717563/Canary-Islands-earthquake-tremors-Tenerife-Mount-Teide-volcano)
are common in the area,
and may damage the tunnel.
But it is a feasible location,
even if a more suitable mountain is eventually found.

To prevent accidents the precise location should be chosen carefully:
there need to be no villages on the slope opposite the tunnel entrance.
Any failed launches will probably fall in the sea,
but if post-lauch speed is below 500 m/s it would fall on the island.

### Big Tunnel

The space gun is based on a long tunnel
in which a near vacuum has been created.
How long is the tunnel?
It depends on a couple of operational parameters:
maximum acceleration and launch velocity
(measured at the end of the tunnel).

Such a large tunnel with a near vacuum may not seem easy.
But in fact it is not outside the realm of possibility.
Think of
[CERN LHP](https://en.wikipedia.org/wiki/Large_Hadron_Collider):
a 27 km long circular tunnel with a perfect vacuum.
It was originally built in 1988 for the LEP.

### Construction

Construction should proceed in stages.
Entries every kilometer or so should allow easy access to the tunnel,
for eventual repairs.

A regular
[Tunnel boring machine](https://en.wikipedia.org/wiki/Tunnel_boring_machine)
or TBM should do the job,
and keep costs low.

The coilgun consists of several loops of wire,
each with a current passing through it
at the exact moment that the vehicle reaches it.
The tunnel must have a near vacuum to avoid friction with the vehicle,
so it needs high performance pumps and seals.

Superconducting wires would be able to store current without loss.
They have been successfully used in several maglev projects;
the low temperatures required can be reached relatively easily in a sealed tunnel.

### Launch

Before each launch all coils must be charged.

At the precise moment of launch the vehicle lies at rest
at the foot of the tunnel.
The tunnel passage would be very swift:
it will take around 6 seconds to reach our target speed of 9 km/s.

After firing all coils the projectile should reach our reference speed of 9 km/s.
With a mass of 10 tonnes the kinetic energy would be 400 Gigajoules,
or 110 Megawatt·hour.
At a standard price of €0.10 per Kw·h,
and assuming an efficiency of 80%,
the total cost per launch would be €11k.

This power needs to be released in 6 seconds,
and so result in an insane power release of 67 Gigawatt.
But electrical power can be generated slowly and stored in the coils themselves
if they are superconducting,
or in batteries otherwise.

The top of the tunnel should open automatically.
A [plasma window](https://en.wikipedia.org/wiki/Plasma_window)
has been proposed,
but it is not necessary:
a regular diaphragm is enough to keep air out of the tunnel
and open in a few seconds.

### Atmospheric Passage

When reaching the atmosphere the vehicle will be moving at a very high speed.
Since the vehicle is launched from a relatively low altitude,
aerodynamics must be considered.
To reach low earth orbit (LEO)
it should fly at at least 7.8 km/s;
and considerably more if we take drag into account.

We can take as reference a post-launch speed of 9 km/s;
this is almost Mach 30,
and the vehicle would instantly be hypersonic.
Impact with air would result in a tremendous deceleration.

[This simulation](http://pinchito.es/mass-driver/drag.html)
allows you to change several parameters
and simulate the flight.

### Vehicle

Having a heavy vehicle is important to withstand drag forces
upon entering the atmosphere:
a light vehicle would lose too much speed as to reach LEO.
A 10-tonne vehicle would be similar in weight to an
[Eurofighter Typhoon](https://en.wikipedia.org/wiki/Eurofighter_Typhoon).

A [waverider design](http://www.aerospaceweb.org/design/waverider/main.shtml)
should allow the vehicle to reduce drag,
and therefore reach LEO with our design speed.
Note that several hypersonic vehicles have been designed and operated to date.

The vehicle can be made to reenter the atmosphere and be reused multiple times.
An ablation shield must then be used to absorb the heat of reentry.
Another option is to build cheap disposable vehicles.
After all, what we have is basically a glider with no motors,
so it should be much cheaper to build than hypersonic planes.

### Cargo

Certifying the cargo for an acceleration of 150 g should not be hard.

Loads would be limited to what the vehicle can carry aboard.
The cargo bay would not be large,
but it might carry a lot of things:
of the 10 tonnes for the complete vehicle around half might be cargo.
But even one ton would be a great help to space exploration.
Obviously the space launcher would not be able to send large payloads to LEO,
so it would not be a substitute to rockets, for now.
But it is very useful to send supplies to orbiting spaceships,
such as the International Space Station (ISS).

The space launcher vehicle itself can be used for exploration.
For a trip to Mars it is probably be a bit small.

### Human Tripulated Ship

The problem of transporting humans is entirely different.
We are squishy and do not tolerate well accelerations beyond 4 g.
On a 28 km tunnel the exit speed would be of at most 1500 m/s.
The vehicle should carry enough fuel to reach LEO after that.

This launch speed would be no small feat.

That is, unless we visit more exotic options.
Fighter pilots regularly withstand
[more than 10g](https://ntrs.nasa.gov/archive/nasa/casi.ntrs.nasa.gov/19980223621.pdf),
which would give us 2366 m/s.
This is almost as much as the first stage of the
[Saturn V](https://en.wikipedia.org/wiki/Saturn_V).
This acceleration would be sustained for only 12 seconds.

A human in a liquid tank should resist higher accelerations.

## Other Options

Mass drivers are not the only alternative to rockets.
Wikipedia has a
[few ideas](https://en.wikipedia.org/wiki/Non-rocket_spacelaunch),
some of which we will consider here.

### Star Tram

The
[Star Tram](https://en.wikipedia.org/wiki/StarTram)
concept is very similar to the space launcher considered here.
Gen-1 is cargo-only;
acceleration is slower (30 g).
Gen-2 relies on 20 km high launch and is not feasible yet.

### Space Elevator

Dramatically illustrated by Arthur C. Clarke in The Fountains of Paradise,
a space elevator consists of a very long rope reaching from LEO to Earth surface.
It is not yet a practical concept.

### Launch Loop

Another great idea that is well outside the realm of possibility right now.

## Computations

We have to accelerate a 10-tonne vehicle to 9 km/s in 28 km.
Assume constant acceleration a.
The motion is described by these two equations:

v = a · t,
Dx = 1/2 · a · t^2

With our initial data:

v = 9 km/s
Dx = 28 km

passage time can be computed as:

t = 2 · Dx / v = 2 · 28 · 10^3 m / (9 · 10^3 m/s) ~ 6.2 s.

Acceleration is thus:

a = v / t = 9 · 10^3 m/s / 6.2 s ~ 1.45 · 10^3 m/s^2.

Or 145 g, where g is the acceleration of gravity on Earth.

Kinetic energy can computed as:

E = m · v^2 / 2.

At 9 km/s a 10-tonne vehicle will have:

E = 1/2 · 10^4 kg · (9 · 10^3 m/s)^2 ~ 400 · 10^9 J = 400 Gigajoule.

Or [111 Megawatts-hour](http://online.unitconverterpro.com/conversion-tables/convert-group/factors.php?cat=energy&unit=0&val=400).

## Conclusion

A space launcher can be a great help for space exploration,
enabling the supply of larger ships at a very low cost.

### Acknowledgements

Thanks to Carlos Santisteban for his encouragement.

