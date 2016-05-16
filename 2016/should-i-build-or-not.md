---
title: Should I Build or Should I Not
subtitle: 'Or Pondering the Merits of Custom DevOps Tools'
footer: Published on 2016-05-12.
  [Comments, improvements?](mailto:alexfernandeznpm@gmail.com)
---

![The first electric submarine, built by Isaac Peral [(Image source)](https://delamarylosbarcos.wordpress.com/tag/isaac-peral/)](pics/build-or-not.jpg "Isaac Peral's first submarine")

## A Story for Builders

Before we start, let us clear the air.
This is a story for builders,
not for decisions makers.
Therefore it may only be of interest to people in organizations
where there is not a large divide between the two,
or where the divide can at least be breached somehow.
If that is not your case,
I am not sure I can help you.

For decision makers,
I should probably show you some cold and rational bullet points
to help you decide if you want to build a custom solution or not.
The problem here is that things are not as cold and rational
as you would probably like.

Just run a detailed Total Cost of Ownership comparison.
And then throw it away,
because you will probably have left out some of the most important factors
in the equation.
In this article I will go over some of these
so you can go back to ignoring them if you want.

Instead, I will start with a few case studies of my own,
then try to debunk what many people take as "rational" arguments,
and finally offer some emotional points
which are really the best that I can offer you.

## Some Case Studies

I will now present a few examples that have happened
in our daily practice at MediaSmart Mobile,
the mobile adtech company I work at.

### Continuous Deployment

Continuous deployment is perhaps the most important practice in DevOps:
there are even voices saying that
[Agile is Dead, Long Live Continuous Delivery](http://gradle.org/blog/agile-is-dead/).

Do not be fooled by the promises of
[continuous delivery](http://martinfowler.com/bliki/ContinuousDelivery.html)
though;
it is just an imperfect form of continuous deployment,
where software just reaches some sort of integration environment,
and thus is nothing but continuous integration in more elegant clothing.
Always request continuous deployment at your favorite shops,
since the full advantages are not realized until all changes
_do_ reach production right after merging them.

During the last few years I have helped build a few continuous deployment systems.
I drew my first inspiration from Allspaw and Robbins in their excellent
[Web Operations](http://shop.oreilly.com/product/0636920000136.do),
and built a custom system for my own startup.
The technology was very successful but the company flopped.
Since then my first priority after starting work on a new project
has been to set up continuous deployment.
Some of them were as simple as a PHP script that invoked `rsync`,
others have involved doing distributed deployments to a variable number of servers.
All of them have strived for simplicity and efficiency.

At MediaSmart I convinced our CTO Guillermo Fernández
to implement continuous deployment after about 6 months in the company,
and we have lived happily ever since.
Well, almost.
We have been using my own npm package,
[deployment](https://www.npmjs.com/package/deployment),
which has a simple command that creates a server and listens to requests;
when the correct URL is invoked, it deploys code to the server.
Then we did distributed deployments with a custom Node.js file,
that reads the list of servers from an Amazon ELB,
and then invokes the deployment server on each of the instances.

It had all of the rough edges of a custom tool:
it was command-line only,
had to be set up (with webhooks to GitHub) manually each time,
had to be started up using Upstart tasks for Ubuntu.
After three years I got tired of setting up deployment servers,
and the whole infrastructure was becoming unwieldy.
So we started looking for alternatives.

Luckily I had tried StriderCD for a freelancing gig
I had done the previous month:
it is a very nice Node.js solution which has a graphical interface,
similar to Travis-CI. It automatically sets up webhooks,
and even allows testing all PRs.
Best of all,
it has "continuous deployment" right in the title,
which automatically won my heart.

Lead by our latest recruit Alfredo López,
in a few weeks we had migrated almost all of our infrastructure to StriderCD,
and it was a [most interesting project](http://alexfernandez.github.io/2016/stridercd.html).
At this point we are still refining our continuous deployment,
and are missing a few things,
like the ability to send a diff of the deployed changes by email
after each deployment.
But mostly it has been a success.

### ELB Balancer

A month ago I published an
[article about this migration](http://alexfernandez.github.io/2016/nginx-balancer.html).

### Monitoring

We have several monitoring tools in place.

### Partners

Our company, MediaSmart Mobile, has been in talks with many other companies
to create partnerships.
Some of them do not like it too much
when they learn that so much of our infrastructure is custom-made,
instead of marvelling at our inventive.

## Rational Arguments

I am a firm believer in rational thought:
thinking things over objectively is our best tool at our disposition.
The problem is that rational thought does not come naturally to people;
our minds need to be trained very thoroughly if we are to remove subjectivity
from our reasonings.

In this section we will see some arguments that are often used in this discussion,
and that are supposed to be objective and rational.
We will then deconstruct them to see that they are not as rational as they were supposed to be.

### Robustness of Commercial Solutions

Bosses tend to trust commercial products all too much.
After all, their thinking goes, if a prestigious company is offering a product
it must be good indeed.
But alas, shoddy products are the hallmark of our industry.

### Maintainability

Maintaining a third-party product must surely be easier
than a bunch of custom code hacked together by your predecessor.

Except for that time when your vendor stops supporting your product
and forces you to upgrade,
just because they want to make more money off you.

### Technical Debt

Once you start a software project, you start accruing
[technical debt](http://martinfowler.com/bliki/TechnicalDebt.html).
It is almost inevitable.
Infrastructure projects are usually the worst,
so by the time that your DevOps infrastructure is functional
it is an iceberg of debt waiting to fall on you.

Here we are gleefully ignoring the technical debt that actually exists
in third party projects,
just because we cannot see it.
If your dev team is worse than the vendor this argument may carry some weight,
so the moral should not be "do not build anything";
rather, "get a good dev team".

## Emotional Arguments

There is only so much that can be explained rationally.
Many of our best impulses are led more by intuition
than by an explicit mental process,
and are only rationalized after the fact.

A discussion of emotional arguments should allow us
to recognize our unconscious biases,
and hopefully to offset them.

### The Joy of Building Things

In his excellent book
[The Existential Pleasures of Engineering](https://books.google.es/books/about/The_Existential_Pleasures_of_Engineering.html?id=V9u7GUIS0X8C&redir_esc=y),
Florman argues that people build things just because they love to.
He goes back to the wonderful Iliad searching for proofs:

> Homer insists on telling us how each object is made. [...]
> In more than 130 lines of poetry the fabrication and decoration
> of the fabulous shield is described.
> At other points in the story we are told in detail
> about the manufacture of Pandora's bow, Hera's chariot,
> Odysseus' bed, and Achylles' shelter.

This pleasure can still be felt in our veins
each time we start a green field project:
open a new blank document,
initialize a git repo
or just start sketching on a napkin in a coffee shop.

Over at the YouTube channel [Primitive Technology](https://www.youtube.com/channel/UCAL3JXZSzSm8AlZyD3nQdBA),
with almost 1.5 million subscribers,
a mysterious [Australian guy](https://primitivetechnology.wordpress.com/about/)
builds all kinds of things just using natural elements:
[baskets and stone hatchet](https://www.youtube.com/watch?v=kiHojsMTBeA),
[bow and arrow](https://www.youtube.com/watch?v=SLoukoBs8TE),
or [a complete hut](https://www.youtube.com/watch?v=P73REgj-3UE).
This last video has over 8 million visualizations;
we can only presume that most of them do not come from survivalists intent on imitating him,
but just people that watch his handicrafts out of pure pleasure.

But is our joy a valid argument to make a business decision?
You tell me; in this day of difficult engineer retention,
a worthy project can make the difference to keep the good people.
On the other hand, if you want to start an online shop,
building your own compiler may be hard to justify.
So we must keep on looking for other reasons.

### NIH Syndrome

The [Not-Invented-Here Syndrome](http://www.developer.com/java/other/article.php/3338791)
is the vilification of a tendency to distrust products offered by third parties.

There is a lively discussion at
[the c2.com wiki](http://c2.com/cgi/wiki?NotInventedHere)
with pros and cons.
Joel Spolsky, cofounder of Trello and Stack Overflow,
[summarizes it thus](http://www.joelonsoftware.com/articles/fog0000000007.html):

> If it is a core business function -- do it yourself, no matter what.

I worked for 6 years in the banking sector.
Most banks in Spain insist on trying to outsource their IT competencies,
since they are not technology companies.
But are they not?
I contend that, in this day and age,
banks are just purveyors of information:
handling physical money is anecdotal and incidental to their business.
Bank accounts and most financial products are just bits that move around.
So, why should not banks embrace information technology?

As [FinTech](https://en.wikipedia.org/wiki/Financial_technology)
becomes both a hot sector and a buzzword,
it is becoming apparent that traditional banks can and should do more with technology,
or they risk going the way of CD stores and Symbian phones.
Time to market is starting to be critical even for mastodontic banks.

So, what is a core business function?
Is providing Internet connectivity
[a core function for Facebook](https://www.theguardian.com/technology/2016/may/12/facebook-free-basics-india-zuckerberg)?
Are [self-driving cars core for Google](https://www.google.com/selfdrivingcar/)?
What would you think if these companies outsourced those efforts?

### Reinventing the Wheel

You are probably thinking that this way of reasoning
leads straight to constant reinvention of basic tools.

Wheels come in many shapes and colors.
Tesla gives the option of upgrading the model S with
[four 21'' Arachnid Wheels](http://shop.teslamotors.com/collections/model-s-wheels-tires-and-tire-covers/products/21-arachnid-wheel-and-tire-package)
priced at $7,600;
for that money you can buy a small car.
I cannot imagine that when their engineers set to build an outstanding set of wheels,
their manager told them not to "reinvent the wheel".

So reinventing the wheel is not a valid rational argument,
although it may reach the pit of your stomach
since it is a highly emotional subject.

Another popular formulation is:
"does the world really need another testing tool?".
The correct answer is of course:
I do not know what the world needs,
but if I ever need a new testing tool I will surely build it.

### Learning the Easy Way

There is a reason why people that start programming
write their very own implementation of "Hello, world":
to learn how things work.
My favorite didactic tool is by far
"learn by building".

I have too often seen purported "DevOps engineers"
which are just recycled sysadmins:
they know how to install Jenkins or set up a Maven repository,
they can hack up a few Bash scripts or even venture with some Python,
but mostly they are unable to develop good, solid code.
So I ask myself: where do they think that the "Dev" in "DevOps" comes from?
For me, DevOps is about making your sysadmin infrastructure a first-class citizen,
and treating it as one of your products.

If our infrastructure is itself going to be coded,
and live in repositories,
then we need a little bit more dedication.
That is what I understand as "DevOps".
And as it happens,
the best way to learn to do this
is to create the tools from scratch.
Perhaps you do not need to recreate everything for every project,
but at least you should have done it once.
Otherwise, how can you know that a PHP script invoking `rsync`
can be as effective as a sophisticated Jenkins pipeline?

## A Most Welcome Third Way

Are we stuck in an endless loop of emotional arguments,
with no rational way out?
Maybe we can find a compromise between building a custom solution
and deploying a third party product,
and maybe we can even make it work.

### Customizable Solutions

There is a middle ground between building a new product and just installing a third party tool.

SAP offers a complete solution for enterprise software,
which is highly customizable --
and in fact usually requires lots of adaptations
before it is at all usable.

### Open Source Software

Usually you can only extend commercial software in ways specified by the vendor.
But with open source software you have access to the source code;
you can extend it to do what you need.

Due to a long membership to the FSFE,
and out of respect for the great Richard Stallman,
I have long resisted using the term
["open source"](https://opensource.org/).
But ["free software"](http://www.gnu.org/philosophy/free-sw.en.html)
is still not accepted industry wide,
and the English language still has this unfortunate conflation of "gratis" and "libre".
Furthermore, "open source" is more often associated with a community of developers
improving the software.

Anyway, the idea is that once you modify the software
you can send back your contributions.
It even adds a certain kind of karma to your reputation,
so everyone benefits.

I have received a number of contributions for my DevOps packages,
particularly for [`loadtest`](https://www.npmjs.com/package/loadtest)
which has already got [40 pull requests](https://github.com/alexfernandez/loadtest/pulls?q=is%3Apr+is%3Aclosed).

Remember our shiny new continuous deployment system built with StriderCD?
We are planning on extending it for including a diff of the changes it has deployed
in the notification email,
and to send the contribution upstream so that everyone can use this new feature.

### Joining the Pieces

Another very interesting use of customizable software
is when several packages are combined to make a larger entity.
This is particularly true for open source software,
and most useful with DevOps,
which regularly requires the collaboration of many moving parts.

Consider what continuous deployment requires:

* code repositories,
* a test environment + test suite,
* possibly some load tests as well,
* notification tools,
* and finally a deployment mechanism.

We mostly take all these pieces for granted, until they fail.
A monolithic environment can provide for all of them,
but you would be very lucky if all bits are ideally suited for your environment.
Alternatively, each of these can be provided by different packages,
which integrate together with some glue to provide the final platform.

In essence, sysadmins have long known how to make lots of pieces work together,
particularly in Unix environments:
having well-defined universal interfaces.

### Rise of the APIs

## Conclusion

There is not a universal path that leads to all destinations.
There is not even an optimal means of transportation for any distance.

### Acknowledgements

### References

* Cyril Field:
[The story of the submarine from the earliest ages to the present
day](https://archive.org/stream/storyofsubmarine00fielrich#page/144/mode/2up/search/peral), 1908.
A very interesting book about the history of submarines,
although it thrashes Peral needlessly (and quite unfairly too).

* John Allspaw, Jesse Robbins: 
[Web Operations](http://shop.oreilly.com/product/0636920000136.do), 2010.
An excellent introduction to some of the topics of what is now called DevOps.

* [S C Florman: "The Existential Pleasures of Engineering" 2nd Edition](https://books.google.es/books/about/The_Existential_Pleasures_of_Engineering.html?id=V9u7GUIS0X8C&redir_esc=y), 1996.


