---
title: 'Continuous Deployment on the Cheap'
subtitle: 'Or, Build Your Own Adventure in CD'
footer: Published on 2019-12-26, last modified on 2019-12-26.
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
---

![](pics/high-speeds-sr71-blackbird.jpg "SR-71 Blackbird, source: https://commons.wikimedia.org/wiki/File:An_air-to-air_overhead_front_view_of_an_SR-71A_strategic_reconnaissance_aircraft._The_SR-71_is_unofficially_known_as_the_%22Blackbird.%22_DF-ST-89-06288.jpg")

This is the tale of how I built my nth system for continuous integration.

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
Or at least continuous integration!

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
More bells and whistles could be added later.

I have used Node.js for DevOps work for many years now.
I have to say I am quite happy with it:
it runs reliably,
code can be written very quickly and there are libraries for everything.

So with the help of my colleagues at Influencity
(who were bravely placating the business side delivering improvements to the product)
I started building a prototype.

### Development Phases

The right approach to automation is always to start with a well-understood manual task,
and then automate every bit.
Afterwards you can keep on improving until your automatic process is better than the manual task ever was.

#### Phase 0

Phase zero was therefore to create a reliable manual integration phase.
The integration environment had to be streamlined and cleaned up,
and my colleagues helped me set up a robust automated test suite for the backend.
We also created a script to deploy to this environment.

#### Phase 1

The first phase proceeded in parallel:
we created a new control server where we could run a reliable build of the backend code.
Then we created an HTTP server that was listening on a given port on this server,
and which when instructed would download the latest code,
run the build and our test suite,
and send us mail if it was broken.
Then we had to connect GitHub to our environment using a webhook:
with every commit the code would be built and tested,
and we would get mail with the result of the tests.
This would allow the dev team to realize that the latest code needed fixing.

This server could also be accessed using a web browser,
to simplify debugging of any issues.

#### Phase 2

This little HTTP server was listening just for a single repo.
In a second phase we created a multirepo server
which was capable of building and testing any repo.
It was still a very simplistic HTTP server
using the [system library](https://nodejs.org/api/http.html);
nothing fancy like restify or fastify was really needed.
It read the name of the server from the [info sent with the webhook](https://developer.github.com/v3/activity/events/types/#pushevent).

Builds were also sent to AWS CloudWatch so we could set alarms when a build to a particular branch (usually `master`) was broken,
and so we could compute metrics of deployments.

A further refinment (say, phase 2.5) was to make successful pushes to master
deploy the code to our integration server.
This was in fact super easy:
all we needed was to run a command locally that SSH'd to the integration server.

#### Phase 3

The third phase was then to connect our server with GitHub in the opposite direction:
use the [GitHub API](https://developer.github.com/v3/) to 

![](pics/devops-github-pr.png "GitHub builds")

In the figure above you can see how builds are seen with Travis-CI integration:
for each commit Travis is informed and it runs the automated test suite,
letting us know if the build failed (❌) or it worked (✅).
This is done calling the GitHub API to let GitHub know if the build worked for every commit.

It is in fact easier than it seems,
thanks to the official npm package [@octokit/rest](https://www.npmjs.com/package/@octokit/rest).
Essentially you just need to [create a status](https://octokit.github.io/rest.js/#octokit-routes-repos-create-status).
You can add detailed information about the build and it will be shown in a box,
as seen above.
At this point our little deployment script was close to 200 lines.

#### Phase 4

When creating a status you can even add a
[target URL](https://developer.github.com/v3/repos/statuses/#create-a-status)
which will be shown as a link to "Details".
This would be our fourth phase:
each deployment was now stored in a MongoDB instance,
with a unique key for the build containing among other things the repo, branch and date of the build.

A new endpoint was created to access any particular build.
The target URL would then be:

    http://[server]/read/[key],

and it would read the deployment info for that `key`.

We also had a similar setup for frontend code,
but unfortunately the test suite was not robust or complete enough to give us any guarantees.
For other repos tests were simply a sytax check with `eslint .`,
or just import the library and see that nothing broke.

#### Future Improvements

The system might be easily expanded to deploy directly to production.

## Assessment

Our little system had close to 600 lines of code,
and four dependencies:
* `@octokit/rest`: to access the GitHub API.
* `aws-sdk`: to store deployment success or failure in AWs CloudWatch.
* `mongodb`: to store deployment info in MongoDB.
* `stdio`: to read the directory to run into from the command line.

It could do everything that we needed for continuous integration.

Time spent creating it was more or less equivalent to installing and configuring something like Jenkins or StriderCD.
The system worked much more reliably than Jenkins ever did for me,
and knowing its inner workings made it quite simpler to repair.

Unfortunately at this point I stopped working at the company and could not keep improving it.
But the point remains.

It remains to be seen if my colleagues will be able to work with (and improve) our little script;
I have confidence that they will since it is all Node.js code.

## Acknowledgements

Thanks to my colleagues
[Alfonso](https://twitter.com/alfonh),
[Bea](https://twitter.com/BeatrizDGL),
[Charlie](https://twitter.com/jimeno0),
[JC](https://twitter.com/abbitxuelo) and
[Will](https://twitter.com/WilderOlmos)
for their coopoeration in this awesome project.

