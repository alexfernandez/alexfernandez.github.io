---
title: Build Your Own DevOps Infrastructure
subtitle: 'Talk for FullStack London 2017'
footer: Published on 2017-07-01.
  [Comments, suggestions?](https://twitter.com/pinchito/)
---

![](pics/build-otomo.jpg "Build your own Akira motorbike, source: https://commons.wikimedia.org/wiki/File:FIBD2016Otomo01.jpg")

## DevOps Infrastructure

Your company is using cloud services.
You want to do DevOps because you think it's cool,
so you install Jenkins somewhere and...
What now exactly?

The foundational idea of DevOps is to treat infrastructure as code.
You write code to manage servers,
monitor services
and automate all sysadmin-related tasks.
So let us do that!

Come with us to 
[FullStack 2017](https://skillsmatter.com/conferences/8264-fullstack-2017-the-conference-on-javascript-node-and-internet-of-things#program),
where you will learn how to
build your own DevOps infrastructure.
This companion post should help you make the most of the talk.

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

## Code Talks

In the talk we will build our own simplified infrastructure.
A more complete example resides in the GitHub repo
[infra](https://github.com/alexfernandez/infra).
This is what we will analyze here.

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
* `warning`: something went wrong but we might get over it.
* `error`: something went wrong.
* `fatal`: something went really wrong.

#### The Code

Let us start with `log.info()`.
So in our module we export a function that shows a message:

```
exports.info = function(message)
{
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
and `log.error()` will use `console.error()`.

At this point we have a very primitive logging library,
when there are many good solutions out there.
But we want our library to be proactive:
send us by mail all errors in our code.
This way we just have to log all runtime errors,
with the confidence that we will receive them if they really happen.

```
[...]
doSomethingAsync(error => {
	if (error) return log.error('We have encountered an error: ' + error);
}
```

This is one of the core principles of DevOps:
do not wait for someone to look over millions of logs,
be proactive and notify the team that something went wrong.
It is not hard to do:

```
exports.error = function(message)
{
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
All in all we need 75 lines of code.

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
so we get their instance ids and then the load for each one:

```
function getInstanceLoads(callback) {
	aws.getInstanceIds('server', (error, instanceIds) => {
		if (error) return callback(error);
		let tasks = instanceIds.map(instanceId => {
			return next => {
				aws.getCpuUsage(instanceId, minutes, next);
			};
		});
	});
}
```

#### Possible Refinements

* Add new instances to a balancer.
* Remove old instances from the balancer
(not really necessary, AWS removes them from the ELB when terminated).
* Check median instead of average.
* Use a JSON configuration file.

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

