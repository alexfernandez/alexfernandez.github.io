---
title: Build Your Own DevOps Infrastructure
subtitle: 'Talk for FullStack London 2017'
footer: Published on 2017-07-01.
  [Comments, suggestions?](https://twitter.com/pinchito/)
---

![](pics/build-otomo.jpg "Build your own Akira motorbike, source: https://commons.wikimedia.org/wiki/File:FIBD2016Otomo01.jpg")

Your company is using cloud services.
You want to do DevOps because you think it's cool,
so you install Jenkins somewhere and...
What now exactly?

Come with us to 
[FullStack 2017](https://skillsmatter.com/conferences/8264-fullstack-2017-the-conference-on-javascript-node-and-internet-of-things#program),
where you will learn how to
build your own DevOps infrastructure.
In the talk we will build our own simplified infrastructure.
A more complete example resides in the GitHub repo
[infra](https://github.com/alexfernandez/infra).
In my day job at
[mediasmart.io](http://mediasmart.io/),
a Spanish adTech company,
we use an even more sophisticated version of this code,
based on the same principles.
In fact we started with something similar to what we are going to see,
and built from there.

If you are attending FullStack London
this companion post should whet your appetite,
and help you make the most of the talk.
And if you could not attend you will get an overview of the main ideas.

### Requirements

The live demo uses Node.js,
as befits a JavaScript event.
We are using ES6,
so if you are running Node.js version 7 or earlier
you will need to start it with the `--harmony` flag.

We use
[Amazon Web Services](https://aws.amazon.com/)
in the examples,
but the same infrastructure can be built for any other cloud provider,
as long as they have a working Node.js driver.

## DevOps Infrastructure

A basic principle of DevOps is:

> Treat infrastructure as code.

You write code to manage servers,
monitor services
and automate all sysadmin-related tasks.
So let us do that!
Live on stage from London, UK!

### Email

We use with a couple of helper libraries to simplify our job.
They are simple adapters for the official libraries,
and will be introduced as they are needed.

The first helper library will simplify the task of sending an email:
[`lib/email.js`](https://github.com/alexfernandez/infra/blob/master/lib/email.js).
It has a very straightforward interface:

```
email.send(subject, body, callback)
```

We have to indicate the subject and the body to send,
and it will invoke the callback with an error if it fails.
Internally this adapter uses the `emailjs` npm library.

### Log

First we will start with a
[log library](https://github.com/alexfernandez/infra/blob/master/lib/log.js).
It prints messages at several levels of severity:

* `debug`: internal message, not printed unless we are debugging.
* `info`: a message that is usually shown.
* `notice`: an important message that must always be shown.
* `warning`: something dangerous happened, but it might be nothing.
* `error`: something went wrong.
* `fatal`: something went really wrong, cannot continue.

#### The Code

Let us start with `log.info()`.
So in our module we export a function that shows a message:

```
exports.info = function(message) {
	console.log(message);
}
```

It will be used as follows:

```
const log = require('./log.js');
log.info('Hello world');
  \=> Hello world
```

The last line marked with `\=>` is the output of the program.
Easy, right?
We just need to add the remaining priorities,
which will be similar except that `log.warning()`
and `log.error()` will use `console.error()`,
and `log.debug()` which will show nothing by default.

```
exports.debug = function() {
}
exports.notice = function(message) {
	console.log(message);
}
exports.warning = function(message) {
	console.error(message);
}
exports.error = function(message) {
	console.error(message);
}
exports.fatal = function(message) {
	console.error(message);
}
```

At this point we have a very primitive logging library
in about 17 lines of code.
But there are already many good solutions out there.
What is the advantage of writing another one?
Well, we want our library to be proactive:
send us by mail all errors in our code.
This way we just have to log all runtime errors,
with the confidence that we will receive them if they happen in production.

```
[...]
doSomethingAsync(error => {
	if (error) return log.error('We have encountered an error: ' + error);
}
```

We do not want to wait for someone to crunch through thousands or even millions of lines of logs.
This is another core principles of DevOps:

> Be proactive and notify the team when something goes wrong.

It is not hard to do:

```
exports.error = function(message) {
	console.error(message);
	const subject = 'ERROR: ' + message;
	const body = 'ERROR ERROR ERROR\n\n' + message + '\n\nPlease take a look';
	email.send(subject, body, error => {
		if (error) console.error('Could not send email ' + subject + ': ' + error);
	});
}
```

#### Possible Refinements

We can improve the logging library substantially:

* We will probably want to show the date and priority along with the message.
* Allowing parameters with `%s` would also be nice.
* We could also use a test or two.

See the
[complete code](https://github.com/alexfernandez/infra/blob/master/lib/log.js)
for details.
All in 75 lines of code.

### Monitor

Next we will build a very simple
[website monitor](https://github.com/alexfernandez/infra/blob/master/lib/monitor.js).
Its only task is to check if our website is up,
and to notify us otherwise.

#### The Code

The library function in Node.js `http.get()` is a bit cumbersome:
we have to check the return code,
and also the status of the response to see if the website is up.
We use the library
[`basic-request`](https://www.npmjs.com/package/basic-request),
which simplifies the task of accessing a URL:
just pass it the address and a callback that receives an error if the call failed,
and a result with the website content.

```
const request = require('basic-request')
const log = require('./log.js')
const website = 'http://pinchito.es/'
exports.check = function() {
	request.get(website, error => {
		if (error) log.error('Website is down: ' + error);
	})
}
```

Since we are using our log library,
we just need to log an error if the website is down.
Now we need to run the function every minute:

```
exports.check();
setInterval(exports.check, 60000);
```

And we are done!
10 lines of code that will warn us
if our website goes down for any reason.

#### Possible Refinements

This monitor is admittedly very crude.
We will probably want something that can:

* Check multiple websites.
* Warn only once when the website is down.
* Notify us when the website is up again.
* Has some tests.

The
[final code](https://github.com/alexfernandez/infra/blob/master/lib/monitor.js)
contains all improvements,
in 74 lines of code.

### AWS

The second helper library is an adapter for the official
`aws-sdk` library from Amazon,
which has a, let's say, somewhat quirky interface.
Also, writing an adapter library
will allow us to replace it with a different cloud provider
just by building another library with the same interface,
and modifying the `require()` in a one-line change.

Our adapter library
[`lib/aws.js`](https://github.com/alexfernandez/infra/blob/master/lib/aws.js)
has functions to:

* find out instance ids for a number of servers,
* create and terminate instances,
* and get the CPU load of an instance.

It will become clear in a minute why these are needed.

### Orchestrator

Next we will build our own orchestrator.

#### Why Orchestrate Ourselves?

Load on our web applications is often variable.
We may want to create servers during the day to handle the increased load,
and destroy them at night when it goes down.
Amazon AWS has its own
[Auto Scaling](https://aws.amazon.com/autoscaling/),
but it has several issues:

* It orchestrates based on the CPU load
of existing servers,
not on the CPU load that will result if we remove one.
* It uses average CPU load,
not median which is more robust.
* It only works with Amazon's own balancers (ELB or ALB),
not with custom solutions.
* It only takes CPU load into account,
not memory use or latency.

They are explained in detail
[here](../2016/nginx-balancer.html#orchestration).
Our custom orchestrator can be fine-tuned as we see fit.
No longer do we have to set the low CPU load at 40%;
we can set a narrower range such as 80-90% so we make better use of our servers,
or use other parameters.

#### The Code

First we need to get the load of our instances.
They all have names that start with the prefix `server`,
so we get their instance ids.
Then we read the CPU load for each one
and return the result in an array
using `async`:

```
const aws = require('./aws.js');
function getInstanceLoads(callback) {
	aws.getInstanceIds('server', (error, instanceIds) => {
		if (error) return callback(error);
		let tasks = instanceIds.map(instanceId => {
			return next => {
				aws.getCpuUsage(instanceId, minutes, next);
			};
		});
		async.parallel(tasks, callback);
	});
}
```

Computing the average load is easy,
and computing the median is even easier using the `median` npm library.
It is also more robust:
a misbehaving server or two will not radically change the result.
For now we just display the result.

```
const median = require('median');
getInstanceLoads((error, loads) => {
	if (error) return callback(error);
	const medianLoad = median(loads);
	log.info('Median load is ' + medianLoad);
	[...]
});
```

Now with `medianLoad` we can determine if we need to create or destroy servers:
create above 90%, destroy below 80%.

```js
	[...]
	if (medianLoad > 90) {
		createInstance();
	} else if (medianLoad < 80) {
		terminateInstance();
	}
```

The function to create an instance is very simple:

```
function createInstance() {
	const name = 'server' + (loads.length + 1)
	aws.createInstance(name, error => {
		if (error) log.error('Could not create server: ' + error);
	});
}
```

Terminating the last instance in the array is not hard either,
although we need to fetch the array of instance ids again:

```
function terminateInstance() {
	aws.getInstanceIds('server', (error, instanceIds) => {
		if (error) return log.error('Could not get instance ids: ' + error);
		aws.terminateInstance(instanceIds[instanceIds.length], error => {
			if (error) return log.error('Could not terminate: ' + error);
		});
	});
}
```

#### Remaining CPU Load

Removing instances when median load is below 80%
might get us to a situation where the remaining instances cannot handle the load.

Imagine we have two instances at 75%;
assuming that server load is linear,
removing one will leave one server at 150% of CPU capacity.
This creates an unstable system that ping-pongs between one and two servers,
with degraded performance.
We have to choose a minimum load of 40%,
so that two loads concentrated into one server still get us to 80%.

This is the point where we can trivially do better than Amazon's Auto Scaling Groups.
We just need to predict the remaining load,
by sharing the median load among the remaining instances.

```
const predictedLoad = medianLoad * loads.length / (loads.length - 1)
if (predictedLoad < 80%) {
	[...]
}
```

This simple change has allowed my company to increase the minimum load from 40% to 80%,
which results in savings of tens of thousands of dollars.
All this with under 40 lines of code!

#### Possible Refinements

* Add new instances to a balancer.
* Add a simulation mode to show messages instead of creating or destroying instances.
* Set a minimum number of servers below which they are not destroyed.
* Add some tests.

What about removing old instances from the balancer?
It is not really necessary, AWS removes them from the ELB when terminated.

The
[final code](https://github.com/alexfernandez/infra/blob/master/lib/orchestrator.js)
has all of these except adding instances to the ELB,
in 148 lines of code.

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
[Liz Rice](https://twitter.com/lizrice)
for her talk on
[building containers from scratch](http://www.devopspro.ru/2016/liz_rice/),
which was the inspiration for this humble talk.

