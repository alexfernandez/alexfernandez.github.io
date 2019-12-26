---
title: 'Continuous Deployment on the Cheap'
subtitle: 'Or, Build Your Own Adventure in CD'
footer: Published on 2019-12-26, last modified on 2019-12-26.
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
---

![](pics/high-speeds-sr71-blackbird.jpg "SR-71 Blackbird, source: https://commons.wikimedia.org/wiki/File:An_air-to-air_overhead_front_view_of_an_SR-71A_strategic_reconnaissance_aircraft._The_SR-71_is_unofficially_known_as_the_%22Blackbird.%22_DF-ST-89-06288.jpg")

This is the tale of how I built my nth system for continuous deployment,
and got derailed before I could juice it up.

## What Is Continuous Deployment

For many years I have advocated for continuous deployment (CD),
in fact since I learned about the technique in 2011
on the wonderful [Web Operations](http://shop.oreilly.com/product/0636920000136.do) by Allspaw & Robins.

Essentially it means deploying each change the moment it is ready,
instead of waiting until many changes are piled up and tested.
Tests run automatically and certify that the code is fit for production.

### Benefits

For me CD is the most relevant practice in the hot pot known as "DevOps".
It encompasses many important disciplines: deployment, testing, and integration,
with a layer of automation to make it as agile as possible.

Everyone that has tried this practice has found that the number of errors is indeed reduced
as the number of daily deployments increases,
perhaps paradoxically.
One reason is that changes are deployed individually,
which reduces the possibility of compound errors.
Also automatic test suites become quite important and they are cared for on a daily basis,
which creates a virtuous cycle of improvement and stability.

When an error does actually appear in production
it is usually easy to confine to the latest deployment,
instead of having to browse endless lists of changes to find out what went wrong.

### Its Lesser Relatives

It is unfortunate that the acronym CD has been co-opted by a much less powerful version.
With continuous delivery changes are tested but not deployed until there is a manual intervention step.
In essence we are back to piling up changes, which makes our job much harder.

Continuous delivery is well suited for environments where a manual step is hard to avoid,
such as regulatory audits or manual frontend tests.
In my experience it is usually worth the effort to try to automate even these hard situations,
but it is indeed harder to do.

There is also continuous integration (CI), where code is tested after each commit
and possibly deployed to an integration server.

## The Adventure

In March 2019 I joined [Influencity](https://influencity.com/),
an influencer marketing company,
as CTO.
I had the chance to set technology priorities,
and of course my first priority was to set up continuous deployment.

### Package Selection

Nowadays there are well-established services to do it like [Travis-CI](https://travis-ci.org/). or [CircleCI](https://circleci.com/),
and of course there is [Jenkins](https://jenkins.io/)
and its more modern cousin [Jenkins X](https://jenkins-x.io/).
There are also other smaller contenders such as [Strider CD](https://github.com/Strider-CD/strider),
which I have [used in the past](../2016/stridercd.html).
So it should be an easy decision to just evaluate the most promising options
and install them on a server.

I did just that and came back a bit disappointed.
None of the services or products were really a good fit:

* Travis-CI needs access to your repos and your infrastructure,
which is a further point of failure.
It can be set up with webhooks.
Also the price for companies is not exactly cheap,
at [$63/month](https://travis-ci.com/plans).

* CircleCI is cheaper
at [$0/month](https://circleci.com/pricing/)
for one concurrent build,
which is a great option.
There is again the issue of giving access to repos and infrastructure.
Also it seems to require some kind of Docker image (or other VMs),
and it is not trivial to configure if your infrastructure is not geared towards Docker.

* Jenkins is a monster.
With [more than 1500 plugins](https://plugins.jenkins.io/)
I am sure that it covers all necessities that anyone may have,
but it is a bit overwhelming.
I have used it at my previous job, Devo, and configuration was a mess.
If at all possible I would like to avoid it for the rest of my professional career.

* Jenkins X is an unknown, and also seems to require Docker.
Not that I have anything against Docker as a technology,
but at Influencity it would have meant another roadblock towards adoption of CD.
That is exactly what I wanted to avoid.

* Finally, I have a lot of love for Strider.
First it has "CD" in the title instead of the more common "CI".
I have used it for a couple of projects during the last few years and it worked great!
At mediasmart we even contributed a little bit to it.
But support seemed spotty:
[commits](https://github.com/Strider-CD/strider/commits/master) are erratic,
and at that point there had been few in the last months.

### The Eternal DIY Option

I thought to myself that the task could not be that hard.
In essence what I wanted was simple enough:
something that run a build each time a commit was pushed.

So with the help of my colleagues at Influencity
(who were bravely placating the beast delivering product)
I started building a prototype.

## Assessment

Time spent was more or less equivalent to installing and configuring something like Jenkins or StriderCD.

## Acknowledgements



