---
title: 'API First'
subtitle: 'Or Why We Should Design Our Applications Around An API'
footer: Published on 2021-08-15, modified on 2021-08-15.
  Translated from the Spanish [Bonilista 2021-07-18](https://mailchi.mp/bonillaware/api-first?e=e8078d2541).
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
abstract:
  It's still hard to get into our heads that Internet use is mostly mobile,
  and that our web applications should therefore be mobile first.
image: https://pinchito.es/2021/pics/api-first-lead.jpg
---

> It's still hard to get into our heads that
> [Internet use is mostly mobile](https://www.oberlo.com/statistics/mobile-internet-traffic),
> and that our web applications should therefore be _mobile first_.

Lovers of king-sized monitors may argue that most of that mobile traffic is personal or recreational,
so that this _mobile first_ should be centered on consumer (or B2C) websites.
What nobody debates is that, whatever our software does,
**we will have a competitive advantage if we design our applications to be _API first_**.

Any professional that has been in our line of business more than five minutes knows what an API is,
although not many would be able to explain it to a 'muggle' without programming superpowers.
An API is **a formal specification that defines how to interact with a software application**,
and abstracts away the details of how it is implemented.

I suppose that the best way for the keenest reader of the Bonilista (David's mother)
to understand the concept is by way of demonstration.
Matt Chilling has published an
[API to obtain Chuck Norris jokes](https://api.chucknorris.io/).
Combining it with Telegram's API, for instance,
I could develop in less than an hour a little program to publish every day at 7 AM
a Chuck Norris joke on my school mates group...
or even [six job offers](https://www.getmanfred.com/manfred-daily-html/).
All this without having the slightest idea about what database Matt used,
or which programming language is used for Telegram.

Now that even David's mother knows what an API is,
what we need to know is
**what will be our benefits and advantages be if our applications offer an API**.

![© Original illustration by [Hugo Tobio](https://twitter.com/HugoTobio), _tarugo_ and professional illustrator from Bilbao, Spain.](pics/api-first-lead.jpg "Several people with their heads replaced by giant electrical plugs walk around on a red background.")

The main reason to not implement an API is to believe that nobody will use it:
who would want to connect to our software, and why?
But we can also counter-argue that
**to make people think about connecting to our software,
they need to know first that they can**.

During a dinner a few weeks ago,
my friend Claudia suggested the possibility to republish
all Manfred job offers related to project management and agile methodologies
in her portal CertificaciónPM.com,
something that would report benefits to us both:
she would offer relevant job offers to her pupils,
and I would have my offers reach a broadest audience.
 
I asked Claudia if she had an open API,
because we had not het partitioned and opened ours,
but sadly she did not have it;
so this particular integration will need to wait.
How many similar opportunities are we missing?
 
After all, a public API can have an immense influence in the strategy of a company
and even its work philosophy,
making them be more open to integrate and cooperate with third parties.
Something that seems essential for companies that base their business models on the creation and management of a Community,
such as any marketplace.

And even if you don't want to open your software to the world,
implementing an API is still a good idea.
We work with personal data of our users that need to be especially protected,
and that is why it makes sense that **nobody** should be able to directly access these data,
not even us;
onlhy through a private API, carefully secured and with restricted access,
recording who, when and how has accessed or modified anything.

For the rest,
you can create a second API
— much more accessible,
but also with restricted access,
for instance for job offer reads —
that limits the damage caused by a potential security breach.
Today we may be the only consumers from our own web,
but tomorrow we might be using it for a mobile application,
a new product,
or finally allow a third party such as CertificaciónPM to use it
without having to modify our code.

All this is evidently not free.
An API is just a contract where we commit to maintaining certain software services
that will be consumed by third parties to construct their own.
If these services are interrupted,
or modified without warning,
this will affect the whole ecosystem that has grown around them;
the same risk you run with the APIs you consume.
That is why Naval Ravikant,
well-known entrepreneur and technology investor,
[has said](https://twitter.com/naval/status/1404325039076384773):

> Beggars build on APIs, sovereigns build on open source.

What Naval says may well be true,
but it's also true that the age of absolute monarchies is luckily behind us.
30 years ago there were very few software companies,
and it was usual for them to develop internally every line of code for their products.
Our industry has matured during this time and
it has generated
— as any other mature industry —
its own supply chain as API providers that have lowered the barrier of entry,
allowing us to develop our applications without having to start from zero or reinvent the wheel.

This supply chain can evidently fail:
any provider can go broke or leave us up and dry,
just as in any other industry.
This fear should not paralize us,
just like Citroën doesn't start manufacturing safety belts or the electronic in their cars
just in case any of their providers fails or disappears;
but have alternatives ready in case the unexpected happens.
For those who are not lucky enough to count with infinite means,
it's well worth the risk.

At this point I have to confess that, for me,
implementation of an API is not just a technical or business factor,
but also ideological.
Opening our application
(however modest it may be) for others to use it,
we contribute to democratize software development,
but also to the ideal of egalitarian, interconnected and collaborative Network
that was once featured prominently in the dreams of the parents of the Internet.
 
> We should be able not only to interact with other people,
> but to **create** with other people.

— Tim Berners-Lee (1999)

### Acknowledgements

Thanks to David Bonilla
and Hugo Tobio
for their kind permission to translate the article.
