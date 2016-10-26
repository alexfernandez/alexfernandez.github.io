---
title: 'Top Of The Cream Of The Crop'
subtitle: '[Becoming A Better Developer](becoming-a-better-developer.html), Part 4'
footer: Published on 2016-09-18, last edited on 2016-09-18.
  [Comments, improvements?](https://twitter.com/pinchito)
---

![Pieter de Hooch: "[SRE tempted to ignore the on-call alert on a Saturday afternoon](http://classicprogrammerpaintings.com/)", Oil on canvas, 1670](pics/sre-tempted.jpg "Chilling at home")

So you want to become a better developer?
This [guide](becoming-a-better-developer.html) is divided into four parts.
The previous installment was about
[getting ahead of the curve](get-ahead-of-the-curve.html),
while the one in your hands right now (the fourth and last)
is for people that want to become experts.

Tips to help you improve are shown **in bold**.

<p style="color:#636; border:thin solid #c9c">
Personal experiences will appear in colored boxes like this one.
</p>

Now we come to the most delicate part.
So you are finally what we may call
"an expert developer".
How can you really shine?

## The Myth Of The 10x Engineer

The idea of 10x engineers is alive and well,
as shown in
[this informal Twitter poll](https://twitter.com/pinchito/status/779374657984159744).

![In a sample of 59 developers, 44% think that 10x engineers exist.](pics/poll-10x-engineer.png "29% say 'More or less', 15% 'It's a myth', 12% 'TGIF, GTFO'.")

However, there is a [huge controversy](http://www.ybrikman.com/writing/2013/09/29/the-10x-developer-is-not-myth/)
surrounding the concept.
The problem is not with the studies themselves.
The first study quoted by Fred Brooks had serious problems,
a very small sample to start with.
But those initial studies quoted above have been complemented by
[a few more](http://www.construx.com/10x_Software_Development/Origins_of_10X_%E2%80%93_How_Valid_is_the_Underlying_Research_/),
and they all point to the same direction:
there are 10x differences between the best and the worst developers.

No, the trouble lies in the new implicit interpretation:
that some engineers are *10 times more productive than the average*.
This is not upheld by any studies.
Perhaps two or three times as productive?
That is fine, and would be expected on any field.
But from there to ten times is a long stretch.

In the words of Betsy Haibel in
[Hacker Mythologies and Mismanagement](https://modelviewculture.com/pieces/hacker-mythologies-and-mismanagement):

> [The myth of the 10x engineer] plays to the hacker ego.
> Real True Hackers —
> the kind of Real True Hackers who think of themselves as some day inventing radically new tech
> — naturally identify themselves as 10x engineers amidst a sea of unimaginative clock-punching proles.

It is a great article and I cannot recommend it more.

The most interesting point in Peopleware is not that some developers perform better than others.
There is a deep conclusion in there that eludes most commentarists.
Their war games were done with couples of developers from the same company.
The performance of both devs in each team was highly correlated.

![Correlation between teammates. Source: DeMarco and Lister: Peopleware (2nd edition), 1999, via [Best Webfoot Forward](http://blog.webfoot.com/2007/02/16/demarco-and-lister/).](pics/demarcolisterteammates.gif "Teammates are highly correlated.")

But *couples in a team were not working together; they were rather competing one against the other*.
The conclusions in [the study that contains these scans](http://blog.webfoot.com/2007/02/16/demarco-and-lister/)
are interesting:

> Over and over, I keep seeing that the median time to complete a single task is on the order of 2x to 4x times the fastest, not 100x.
> This study seems to imply that a great deal of that difference is due not to the individual’s inherent capabilities,
> but rather the environment where they work.

The advice comes naturally from this refined argument about the "3x engineer":

**Look for a company where your skills can really shine.**

This includes: comfortable working space,
probably telecommuting at least part of the time,
a comfortable environment where you can take risks,
and great colleagues.

## Bring Me Problems, Not Solutions

Quite often engineers are characterized as problem-solvers:
bring me a problem and I will give you a solution.
But that is not how a real-world engineer usually operates.
Once you find the problem it usually easy to solve it.
The real challenge is in finding the problem.

Oh, somebody may come with a high-level business target.
For old-school engineers the business target might be:
let the people of this town cross this river,
or accomodate the incoming traffic for the next 20 years.
For a software engineer it can be:
keep costs below a certain mark,
or connect to a server within a latency number.

**Do not wait for other people to give you problems;
go after them for yourself.**

## Look For Help

Another great point by Betsy Haibel in
[the article quoted above](https://modelviewculture.com/pieces/hacker-mythologies-and-mismanagement):

> Myths about 10x engineers are used to make employees feel guilty or incompetent when they ask co-workers for help;
> truly qualified engineers don’t need help.

Needless to say, this is not true.
Even if you are the world's best engineer,
there comes a time when you need to talk a problem over with someone.
Not necessarily another senior developer:
juniors and people with less experience have a lot to offer in the way of fresh perspectives.

**When faced with a big challenge, share it.
Help may come from where you least expect it.**

Brainstorming sessions are great tools when used properly.

<p style="color:#636; border:thin solid #c9c">
At [mediasmart](https://mediasmart.io/)
sometimes we have a serious problem that merits attention from the whole dev team.
For an hour we meet (virtually of course) and discuss the problem,
and propose possible solutions.
It is important to let everyone speak their minds.
Very often the best ideas will come from junior members of the team,
perhaps because they are not really 
</p>

## Be Ready to Resharpen Your Skills

Even if you are at the top of the game,
in our industry there are no guarantees.

<p style="color:#636; border:thin solid #c9c">
After leaving ING Direct Spain,
I [co-founded a startup](http://alexfernandez.github.io/2016/mib-five-years-later.html)
that ultimately went nowhere,
but allowed me to recycle myself starting to program again.
</p>

Just look at what the tech landscape looked like five years ago.
In 2011 containers were the realm of VMWare:
Docker did not exist,
and Linux developers were busy merging container-related patches into the kernel.
Internet Explorer was the
[most used browser globally](http://gs.statcounter.com/#browser-ww-monthly-201101-201112),
and Chrome was just overtaking Firefox in the second place.
Mobile OSs were far below desktop operating systems:
both iOS and Android were below Mac OS in
[browser stats](http://gs.statcounter.com/#all-os-ww-monthly-201101-201112).
HTML5 was [being finalized](https://en.wikipedia.org/wiki/HTML5#2011.C2.A0.E2.80.93_Last_Call)
and was not yet a recommended standard.
jQuery was without a doubt the JavaScript framework of choice.
Node.js was at
[version 0.6.0](https://blog.risingstack.com/history-of-node-js/).
Meanwhile [Java 7 was just released](https://en.wikipedia.org/wiki/Java_%28programming_language%29#Versions)
but not widely adopted
(and [Oracle had just bought Sun](https://en.wikipedia.org/wiki/Sun_acquisition_by_Oracle) a year ago).
Golang was in [alpha state](https://golang.org/doc/devel/release.html),
and	[Elixir](https://vimeo.com/53221562)
was a glint in its creator's eye

If you want to have a long and prosperous career you can either look for some obscure niche
where there is no competition
(think COBOL programmers today),
or update your skills constantly.

One of my favorite stories is about a mainframe programmer
that appeared in a 70s picture along an old computer.
A magazine published a story about mainframes a few years ago,
and did a picture where he appeared by the old photo with a sad face,
in a cute reference to how mainframe programming was going the way of the dodo.
(I lost the reference to the story;
if you ever find it please
[let me know](https://twitter.com/pinchito).)

The interesting part was that the guy, now in his late 50s,
had successfully recycled and was now a freeancer telecommuting from his home,
and he was experimenting with Node.js, which was at an early stage at that time.

## Let The World Know

You want to get the word out about the awesome things you have done?
Just open a blog and try to write there regularly.
You may not get a lot of visits at first,
but you will feel more comfortable writing about technical stuff.

Taking the effort to articulate your thoughts is always good.
A developer has to write a lot of documents:
code and API documentation, technical specs,
user help, postmortems, grant applications,
to name a few.
Writing a blog will help you make these documents easier to read.

**Blogs are great to hone your writing skills.**

Another great option is a technical talk,
not only at local groups.
Conferences all around the world are eager to hear from people of all backgrounds.
Want to get the word out about that amazing project?
Just send proposals to a few CfPs (calls for proposals).
It is a great way to attend amazing events for free!

There are a few places that track such calls,
such as [Lanyrd.com](http://lanyrd.com/calls/).
Just be sure to speak at a [local community first](#get-involved-in-the-community),
then work your way up to national and then international conferences
when you feel comfortable.
Speaking at conferences is a great way to attend for free!
Well, there's the unpaid time for preparing the talk,
so your ticket does not really come for "free".
But you get the point.

The benefits go beyond attending conferences and meeting interesting people in the speakers dinner.

<p style="color:#636; border:thin solid #c9c">
After my first talk at MadridJS I sent a few proposals.
Less than a year after that,
I gave an
[international talk](https://vimeo.com/121892726),
and [kept at it](http://lanyrd.com/profile/pinchito/sessions/).
Gradually I became better at it.
Right now I feel much more confident when presenting to prospective investors,
or selling a project to the CEO.
</p>

When you can speak in public with confidence,
it becomes much easier to do a presentation in front of a small group.

**Speaking at conferences is a great way to learn how to speak in public.**

Soft skills (writing, speaking)
are as important for a developer as writing good code.
Getting the word out will help you develop these.

## Sell Your Work

Maybe you dislike speaking about "selling"
as related to your work.
Good projects should sell themselves, right?
Wrong.
Honestly, you cannot expect others to buy your ideas if you don't sell them.

Perhaps you remember the famous sentence from Glengarry Glen Ross:
["Coffee is for closers only"](https://www.youtube.com/watch?v=QMFwFgG9NE8).
It is interesting that a movie that tried to show the inhumanity of salespeople
has become famed among their profession.
But we are not trying to sell real estate here,
and we don't want to use hardball tactics.

It is no good to make a fast sale and lose a customer.
We are in for the long run.
When making a deal,
keep in mind that in good deals both parties benefit.

**Always sell your work ethically and truthfully.
But do sell it.**

## Teach Others

There is a reason why a very accomplished professional is called a
["master"](https://en.wiktionary.org/wiki/master#Etymology_1),
which also happens to mean "teacher".
This goes beyond an Occidental tradition.
In martial arts movies great experts always have their own schools.

Teaching is the best way to learn.
And also can be an opportunity to do something different.
As [Freeman Dyson says](http://www.businessinsider.com/freeman-dyson-interview-2016-9):

## Conclusion

> The key to having an interesting life is to always say "yes" to anything crazy.

<p style="color:#636; border:thin solid #c9c">
In 2013 the good people at
[IronHack](https://www.ironhack.com/es)
invited me to give a seminar about Node.js
for their web development bootcamp.
A year later they proposed me to be a full-time teacher
for a couple of weeks,
so I took holidays at my regular job and did it.
The experience was good so I did another bootcamp.
I have made a good deal of friends,
and hired some ex-alumni.
</p>

**Be open to new things.**

## Thanks For Getting This Far

Back to the [index](becoming-a-better-developer.html).

