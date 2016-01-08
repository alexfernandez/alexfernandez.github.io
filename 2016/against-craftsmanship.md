---
title: The Case Against Software Craftsmanship
subtitle: 'or Why Mistrust Engineers that Present Themselves as Craftsmen'
footer: Published on 2016-01-04.
  [Comments, improvements?](mailto:alexfernandeznpm@gmail.com)
---

![Picture credit: [Lewis Hine](https://commons.wikimedia.org/wiki/File:%22Shop_of_the_Woodcrafters_and_Carvers,_Gatlinburg,_Tennessee._Besides_making_fine_furniture,_these_two_craftsmen_turn..._-_NARA_-_532771.jpg)](pics/craftsmen.jpg "Shop of the Woodcrafters and Carvers, Gatlinburg, Tennessee. Besides making fine furniture, these two craftsmen turn out interesting souvenirs, etc.")

## Software Craftsmanship

Among software developers there is a rather large movement termed
[Software Craftsmanship](https://en.wikipedia.org/wiki/Software_craftsmanship),
that reclaims the artisanship of the profession.
In Madrid for instance there are is a
[Meetup with over 700 members](http://www.meetup.com/es/madswcraft/).

The [manifesto](http://manifesto.softwarecraftsmanship.org/)
is simple:
it calls for "well-crafted software", "productive partnerships"
and speaks about "a community of professionals"
that are "steadily adding value".
Despite it being 6+ years old it
[continues to seduce](http://manifesto.softwarecraftsmanship.org/metrics)
people.

In the old days I would have been proud to be called a craftsman.
Today, not so much.
For me it's more of a bad habit that I try to keep hidden.

## Craft, Engineering, Industry

The most striking proposal to come out of the manifesto is to consider software development
more a craft than an engineering discipline.
The developer puts together each project like an artisan,
devoting attention to every aspect from the first line of code
to the last deployment.

I contend that software development is not just an engineering discipline;
it is an industry.
We have our tools, toolchains, assembly lines, integration of parts;
we have at our disposal [large numbers of modules](http://modulecounts.com/)
that can be put together for the quick job and for the large project.

Just like the old machinists,
we go to our imaginary shelves,
collect a number of parts,
put them together;
from that point on we just keep the engines running.
But we are in fact luckier than the average engineer,
since our shelves are vast and our ability to string libraries together is limitless.
In contrast, engineers must painstalkingly put together each project.
(Incidentally, the most useful tools for all engineers nowadays are software programs,
but I digress.)

But just like industry workers,
we are able to replicate our work endlessly,
and make it work day and night without tiring.

So, what kind of artisan would grab an off-the-shelf component
instead of creating their own?

## Craftsmanship and Craftsmen

"But, pinchito", I hear you saying,
"being a craftsman is surely a good thing.
It's good to be able to create like an artisan,
even if you don't do it all the time.
How can you criticise such a crafty craft?"

The trouble with taking too much pride in being a good craftsman
is that you will take every opportunity to show your crafts;
even when there are perfectly good solutions out there
that will fit the problem well.

Do you need to craft something once in a while?
Sure.
Do you need to make that aspect the _core_ of your profession?
I doubt it.

## Industry Standards

There is value in using industry-standard products.
I am sure that many of you would be perfectly able to create a new operating system,
and a few have indeed done so.
It's fun, it's harmless and you learn a lot.

Now, do you need to create a new operating system for every new project,
reuse your existing pet system,
create a vanity Linux distribution,
or is it just better to use a common Linux variant?
Suppose that the new project is successful and someone else has to maintain it,
or just that you need to get some help.
It Will not be easy to find engineers that know how to fix your beast,
or even worse that _want_ to learn their way around it.

Sticking to industry standards is not only safe;
it is also the recommended way to go,
unless there is some strong reason not to.

## When to Use your Craft

I am indeed too fond of creating my own solutions to everyday problems:
in [npm](https://www.npmjs.com/~alexfernandez)
I have created my own libraries for
[load testing](https://www.npmjs.com/package/loadtest),
[deployment](https://www.npmjs.com/package/deployment),
[testing](https://www.npmjs.com/package/testing),
and even supplemented the default JavaScript
[prototypes](https://www.npmjs.com/package/prototypes).
So in a sense I am not the best dev to warn against _too much_ craftsmanship.
But at least _I am aware_ that I have a problem,
and that I have to fight against my urges to create even more software.

For small projects you sometimes have the luxury of creating a custom package,
when the complexities of integrating a commercial solution do not pay themselves.
Also, sometimes you are a true pioneer in some area,
like with an [initialization system](https://www.npmjs.com/package/inits)
for Node.js.
But that should be the exception, not the rule.
In your day-to-day practice,
take your craft and apply it to new and exciting problems,
even if you have to go to the bleeding edge to find them.

There are other reasons to create custom software:
it is an excellent learning opportunity.
It's also going to be very well maintained for your particular project
when the team is the same.
Finally, it is a lot of fun!
Just be sure to let whoever is paying for the software
know what they are getting into.

So, when faced with a new problem,
always err on the side of using existing software.
Unless you want to have fun,
just that one time…

