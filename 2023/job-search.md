---
title: '👷 How I Searched for a Job'
subtitle: '☝️ Worked for me, might work for you'
footer: Published on 2023-09-28, last modified on 2023-09-28
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
image: https://pinchito.es/2023/pics/job-search-t3chfest.jpg
---

These are turbulent times when many workers are losing their jobs,
and at the same time many companies are looking for workers.
Some people have asked for advice in their job search;
I will do my best to explain how I faced mine,
the challenges that I met along the way and how to deal with them.
In the hope that it will be useful should you find yourself in the same situation,
or even myself in the (hopefully distant) future!

![Participating in the community. Source: the author.](pics/job-search-t3chfest.jpg "The author is taking a selfie with the audience at T3chFest.")

I will start with some lessons learned,
and then explain them in the text **in bold**.
My focus is on software developer jobs in technical companies,
but most of the lessons should be extensible to any jobs in the tech sector.

# The Job Search

The whole process from first application to accepting an offer took roughly 7 weeks,

## Lessons Learned

The following lessons were useful to me.

1. Referrals work much better than cold applications.
2. Participate in the community for better exposure.
3. Have a clean, to the point CV.
4. Keep a spreadsheet with all job applications including every human interaction.
6. Try to meet your future team.
5. Take-away assignments always take longer than they state.
5. Train like crazy for the jobs you are looking for.
5. Looking for a job is stressful.
6. Learn from your mistakes and move on.

## Yes, but What Job?

It was roughly one year after joining NTRDE full time in September 2022;
we had not got the financing we were looking for.
My now ex-partners and I decided to split,
so I had to find a proper job.

For the last four years I have been working as a CTO,
thinking that I would be able to have more influence this way.
But honestly I missed technical work a lot,
as I had discovered this last year being a fullstack CTO
(which means I did everything from product sketches to configuring servers to speaking with investors).
Therefore I was ready to look for a job as software engineer, individual contributor,
no management responsibilities.
As [Charity Majors likes to say](https://charity.wtf/2017/05/11/the-engineer-manager-pendulum/),
the best managers are those that have engineered, but also the best engineers are those that have managed.
I was ready to go back to sweet development work, baby!

## Some Numbers

All in all I sent out 44 job applications,
although some of these came to me.
All in all I was rejected 15 times;
on my side I canceled 11 processes due to multiple reasons,
and another 17 applications are still pending as far as I know.

Disregarding applications where there was at most an automated email:
I entered 14 selection processes with at least one interview,
I participated in 8 technical challenges and was accepted for three positions,
of which I have accepted only one.
I did 25 various interviews with recruiters, technical people and managers.

## Publication

At one point my job search was not looking good:
26 applications and only two interviews which were both failures.
(I also did a take-home assignment which later resulted in an offer.)

I decided to do a publication on Twitter (I refuse to call it X).
Even in its sunset years the blue bird still had a surprise for me:
my [job search tweet](https://twitter.com/pinchito/status/1692852099002827040)
had 36.4k views as of 2023-09-28. It was the post of mine I remember with more retweets ever: 132 no less.
Also 91 likes and 7 replies; total engagement is 0.6% in case you are wondering,
computed as (likes + retweets + replies)/impressions;
not so shabby for Twitter.

This tweet got me 8 referrals,
in fact for some of the most interesting job offers I would get.
Just from the replies you can see DataDog, RevenueCat and TrustYou,
and a few more were waiting for me in private messages.
Even companies that had rejected me when I cold-applied before would now give me an interview.

**Ask for referrals: they work much better than cold applications.**

A [similar toot on Mastodon](https://mastodon.social/@pinchito/110915846714273313)
got much less exposure, but still 15 retoots and one like.

I was lucky to get so much exposure,
but it is also good to be known.
I have been a Meetup organizer for 10 years,
have organized several conferences
and try to give talks regularly.
When people see you around a lot they tend to infer that you are particularly clever,
which is good (if untrue in this case).
Yes, it is often inconvenient to get out of your house in the evening to go to a meetup,
or to write a conference proposal;
but this effort will give fruit later.

**Participate in the community: it gives you exposure that will be useful when job searching.**

## CV

The _curriculum vitae_, "résumé" or simply "resume" is not something you write and then send 1000 times,
or at least it should not be;
I read about a [guy in NY](https://blog.pragmaticengineer.com/a-senior-engineer-em-job-search-story/)
who updated his resume daily.

One of the companies where I applied required sending them a CV with two pages max,
a single font and no pictures.
I thought it was a really good idea so I crafted it using markdown and pandoc,
and sent it to most US companies.
I used to keep a longer form CV,
but I took the time to unify it with the
[online CV](https://pinchito.es/cv) on this website.
Technical details: it is generated as PDF using [pandoc](https://pandoc.org/MANUAL.html),
using the very nice class `scrartcl` with small margins and blue links.

I have removed all the experience that is less pertinent from both,
more aggressively for the shorter two-pager;
both have a link to [my LinkedIn page](https://www.linkedin.com/in/pinchito/)
if you need to account for every month of my career.

I also wrote many custom variations of the CV as needed;
sometimes sites asked for text-only versions or sometimes just a cover letter highlighting my experience.
The more effort you take for your application, the more likely it is that it will be considered.

**Write a simple lean CV and update it as needed.**

## Selection Processes

Now we come to the most demanding part:
all those selection processes.
If you are like me you will send a lot of applications,
and then not remember which is which.
Not all of them are kind enough to send you an email acknowledgement,
and many will not bother to ever write to you to let you know that the process is closed.
So it will fall on your side to keep track of all of them.

I kept a Google spreadsheet with two tabs.
The first one is a list of all applications with their state,
source found, salary offered (if present), date sent, status and reason.
Under "reason" I listed why I was rejected or why I canceled the processes:
"does not end lines with semicolons", "we should see other people".
Keep track of who referred you to what;
remember that human interactions are your most important asset.

|Company|Title|Source|Salary|Sent|Status|Reason|
|-------|-----|------|------|----|------|------|
|StartupCo|Ninja|himalayas|?|2023-09-29|<span style="background: #ffffcc">Pending</span>||
|BigCorp|Minion|Manfred|$50k|2023-09-29|<span style="background: #ffcccc">Rejected</span>||
|ScaleupCo|Manager|referral PT|$80k|2023-09-29|<span style="background: #ccffcc">In progress</span>||

The second tab is a list of "processes" with every step along the way.
Color-coded for your convenience.
This one you can reorder as you move along the processes,
so you can clearly see the funnel as in the image below.
Remember that human interactions are the most important part,
so write down who interviewed you and when.

![Job search sheet with all processes. Source: the author.](pics/job-search-sheet.png "List of processes: company, position, step1, date1, step2, date2... Steps passed in green, steps failed in red.")

Perhaps you can build some fancy automation so that the first sheet is automatically updated when you write on the second;
for my needs it was enough to keep everything updated by hand.
A simple job that works is always better than a fancy system that can fail.

**Keep a spreadsheet with all job applications,
their state and every human interaction.**

### Interviews

I am not going to tell you anything new about doing interviews,
so I will not even try.
Just keep in mind that there are 
technical interviews,
human resources (or values) interviews,
and team interviews.

**If at all possible, try to meet your future team.**
With big companies sometimes you don't even know what team you will be assigned at when you join,
so it's not always possible.

I like to ask any technical employees I meet two simple questions:
what do you like best about working at the company,
and what do you like the least?
It can give you a quick idea of the things people like and what they don't,
but keep in mind that it can be a sensitive issue and they may not feel at liberty to answer,
especially if a manager or human resources is also present.
That can also be significant in itself.

## Technical Challenges

Selection processes often including technical challenges:
some are take-away assignments while others are online sessions.
I don't have a preference for one or the other,
and it doesn't matter because naturally you don't get to choose;
but they require different preparation.

### Take-away Assignments

In this kind of technical challenge you have to solve a programming problem on your own:
you get the problem statement and perhaps some skeleton code,
and you have to find a solution.
Some are more open: you have to code everything including tests.
Others are more limited in scope: you get a set of tests and have to solve for those.

There are many online places where you can practice:
[LeetCode](https://leetcode.com/),
[Codecademy](https://www.codecademy.com/) and so on.
I am particularly fond of the french site [CodinGame](https://www.codingame.com/home),
makers of [CoderPad](https://coderpad.io/) which is used by some well known companies:
it has a lot of interesting challenges that you can solve for practice.

When you get the assignment they sometimes come with a time estimation, e.g.:

> This exercise should take you no more than 2 hours.

My advice is: don't pay any attention to that estimation, they always take significantly longer.
Perhaps if you are a super-fast coder you will be able to do it in the assigned time,
but a good rule of thumb is twice as long.
Be also sure to write down any limitations in your solution.
Write, write like crazy.

**Take-away assignments always take longer than they state.**

In my case I was rejected in a couple of assignments because of weird reasons:
I did not include unit tests
or did not format my code using `prettier`.
I am torn here:
on one hand I want to pass all technical challenges,
but on the other I'm not sure I want to work for a company
where you are evaluated by how many unit tests you write or if you format your code according to their guidelines.
(In case you are wondering,
I always include plenty of integration tests,
which should be enough for a toy project like this.)

### Online Sessions

In an online technical challenge you will have a conference with an interviewer,
who will ask you to solve some problems.
The format can be used for programming problems,
system design questions, and so on.
For now we will center on programming problems.

It can be really stressful to have someone giving you problems to solve,
which feels like they are examining you.
Some companies will approach the exercise as a "pair programming session",
where you can ask the interviewer for help or perhaps look things online.

A resource which helped me a lot deal with the stress is
[Clash of Code](https://www.codingame.com/multiplayer/clashofcode) by CodinGame,
where you have online challenges that you have to solve with a time limit.
They 

A category of questions that may come up for senior developer positions is "system design":
how would you design an Instagram clone, or a Twitter clone, or a URL shortener?
They are very interesting problems where you have to consider ballpark estimations,
scalability and design decisions.
Again there is a ton of resources for this kind of challenge,
so be sure to watch some videos, read some articles, and practice like crazy!
Just to start you can check
[how to design a TinyURL clone](https://www.designgurus.io/course-play/grokking-the-system-design-interview/doc/638c0b5dac93e7ae59a1af6b).

### Preparation

Many big companies will ask you to brush up your skills on algorithms, data structures
and big O notation.
You may be asking yourself:
why do companies ask about abstract algorithms and not about concrete problems in their product space?
Now put yourself in the role of an examinator:
do you want to select only candidates that know about marketing,
or car sharing, or retail, or whatever your company does?
Or would you prefer to choose a level playing field where anyone can participate?
It is true that many bootcamps and even more traditional schools don't teach you algorithms or data structures,
But there are thousands of resources online that you can use on your own.
As a starting point,
this [HackerRank playlist](https://www.youtube.com/playlist?list=PLX6IKgS15Ue02WDPRCmYKuZicQHit9kFt)
has many interesting videos that will help you with the basics.

If you can do some more specific preparation then go for it!
For some well-known companies there is no shortage of pages that will help you prepare for the interviews;
Some companies are also nice enough to give you resources that will help you.
I will take Datadog as an example since their offer was public.
For instance on [algodaily](https://algodaily.com/companies/datadog)
you get a list of problems specific for them, some unlocked.

Is it worth it to prepare for weeks or months for an interview?
Of course it is!
After all, people study for years for a public examination to get a position as civil servant,
like the dreaded "Oposiciones a funcionario" in Spain.
So, are you going to shy away from a couple of months of study
for a better paid, more rewarding technical position?
My advice is: train all that you can for the jobs that you really want.
The more you train the easier it becomes.

**Train like crazy for the jobs you are looking for.**

## Decision

## Announcement

### LinkedIn Announcement

On LinkedIn I did not post that I was looking for a job since it did so well on Twitter.
When I announced my hiring the
[post](https://www.linkedin.com/feed/update/urn:li:activity:7112739360587866112/)
had 2579 impressions as of 2023-09-28, with 83 reactions and 31 comments.
Engagement was 4.4% in case you are wondering, computed as (reactions + comments) / impressions.

# Conclusion

The process of searching for a job can be really stressful.
Don't despair: you don't need to find seven good jobs, one is enough.

