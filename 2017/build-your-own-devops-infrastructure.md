---
title: Build Your Own DevOps Infrastructure
subtitle: 'Talk for FullStack London 2017'
footer: Published on 2017-07-01.
  [Comments, suggestions?](https://twitter.com/pinchito/)
---

![Build your own [Akira motorbike](https://commons.wikimedia.org/wiki/File:FIBD2016Otomo01.jpg)](pics/build-otomo.jpg "Build your own Akira motorbike"))

## DevOps Infrastructure

Your company is using cloud services.
You want to do DevOps because you think it's cool,
so you install Jenkins somewhere and...
What now exactly?

The foundational idea of DevOps is to treat infrastructure as code.

Come with us to 
[FullStack 2017](https://skillsmatter.com/conferences/8264-fullstack-2017-the-conference-on-javascript-node-and-internet-of-things#program),
where you will learn how to
build your own DevOps infrastructure.
This companion post should help you make the most of the talk.

### Requirements

All code uses Node.js,
as befits a JavaScript event.
We are using ES6,
so if you are running version of Node.js 7 or earlier
you will need to start it with the `--harmony` flag.

We use
[Amazon Web Services](https://aws.amazon.com/)
in the examples,
but the same infrastructure can be built for any other cloud provider,
as long as they have a Node.js client.

## Code Talks

In the talk we will do a live demo to build our own simplified infrastructure.
A more complete example resides in the GitHub repo
[infra](https://github.com/alexfernandez/infra).

### Email

We use with a couple of helper libraries,
which will simplify our job.
They are simple adapters for the official libraries,
and will be introduced as they are needed.

The first helper library will simplify the task of sending an email:
[`lib/email.js`](https://github.com/alexfernandez/infra/blob/master/lib/email.js).
It has a very simple interface:

```
email.send(subject, text, callback)
```

We have to indicate the subject and the text to send,
and it will invoke the callback with an error if it fails.
Internally this adapter uses the `emailjs` npm library.

### Log

First we will start with a
[log library](https://github.com/alexfernandez/infra/blob/master/lib/log.js).

### Monitor

Next we will build a very simple
[monitor](https://github.com/alexfernandez/infra/blob/master/lib/monitor.js).
Its only task is to check if our websites are up,
and to notify us otherwise.

#### Possible Refinements

* Warn only once when the website is down.
* Notify us when the website is up again.

### AWS

The second helper library is an adapter for the official
`aws-sdk` library from Amazon,
which has a, let's say, somewhat quirky interface.

[`lib/aws.js`](https://github.com/alexfernandez/infra/blob/master/lib/aws.js)
has functions to find out instance ids for a number of servers,
create and terminate instances, and get the CPU of an instance.
It will become clear in a minute why these are needed.

### Orchestrator

Next we will build our own orchestrator.

#### Why Orchestrate Ourselves?

Load on our web applications is often variable.

Amazon AWS has its own
[Auto Scaling](https://aws.amazon.com/autoscaling/)

#### Possible Refinements

* Add new instance to ELB.
* Remove old instances from the ELB
(not really necessary, AWS does it already).
* Check median instead of average.
* Use a JSON configuration file.

## Where To Go From Here

The next obvious step for our DevOps infrastructure
is to implement a continuous deployment system.
While it may seem daunting,
we are more than half-way there.
All that we need to do is:

* get the list of servers to deploy to,
* SSH into them and make them download the code.

Combined with a tool such as
[Strider CD](http://strider-cd.github.io/),
which takes care of downloading and testing our code,
we have a full continuous deployment environment!

## Acknowledgements

Thanks to
[MallorcaJS](https://www.meetup.com/es-ES/MallorcaJS/events/240203995/)
for inviting me to give an
[early version of this talk](http://slides.com/alexfernandez/build-your-owndevops-infrastructure#/),
where I had a lot of fun.
Thanks in particular to
[hotelinking](http://hotelinking.com/)
and
[Diego Lafuente](https://twitter.com/tufosa)
for making it possible.

Thanks to
[@lizrice](https://twitter.com/lizrice)
for her talk on
[building containers from scratch](http://www.devopspro.ru/2016/liz_rice/),
which was the inspiration for this humble talk.

