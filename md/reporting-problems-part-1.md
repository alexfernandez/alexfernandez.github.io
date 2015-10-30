---
title: Reporting Software Problems, Part 1: Process
footer: Posted originally at [Tumblr](http://tech.moveinblue.com/post/30032508379/reporting-software-problems-part-1-process) on 2012-08-23.
---

![Photo credit: [Popular science monthly.](https://commons.wikimedia.org/wiki/File:PSM_V86_D566_House_undermined_by_waves.jpg)](pics/reporting-problems-part-1.jpg "House undermined by waves")

Software has bugs; this is a widely known secret about software development. How do we deal with this? The first step is to open communication channels between users and developers. In this first part I will look into how problems should be reported; in a second part I will discuss the principles for a good problem reporting tool.

## Managing Bugs

A malfunction in a software system is found; what we usually call a bug. The developers should know about it and probably correct it; what do we do with it? Our first idea is to report it to the team in person, but they may reply: “Not so fast! There are procedures for that.” Why [so much arrogance](http://dilbert.com/fast/2008-01-17/)? Simple: in a medium-to-large project there are probably tens or hundreds of malfunctions, people tend to report the same issue multiple times, and the development team has to manage all that information. Not all bugs can be corrected immediately: some are more important than others, and some can even be postponed as they cause only minor visual problems.

That is why [bug trackers](http://www.joelonsoftware.com/articles/fog0000000029.html) were invented: they allowed developers to keep track of every individual malfunction, including: who reported it, what developer is responsible for it and in what state it is at the moment. They are the perfect tool for a group of specialized testers and the development team to communicate; and they help management evaluate the situation.

Mozilla developers, knowing the problem of releasing software to the public, created a tool called [Bugzilla](http://www.bugzilla.org/). Proprietary software developers had long had ticketing systems, change request managers and other tracking tools, but this was the first major bug tracking system released as Free software.

But before we even reach the state of bug tracking, there is an issue to solve: what is a bug? To the software developer a “bug” is a mistake introduced in the code of a software system. There are other terms in use: error, defect, crash. But we are not going to fight about words, are we?

## Issues, Problems and Bugs

It is not easy to make bug reporters communicate with people responsible of fixing bugs. First there is a language barrier: one is supposedly a domain expert (meaning that they know what to do with the software), while the other is a software developer, and they do not necessarily share a common language to describe problems. What looks like wrong output to one might be a problem with the requirements to the other; what one identifies as a plain bug, the other may discard as simply a misconfiguration.

A common obstacle when reporting problems in software is miscommunication between the reporter and the software developer. The obstacle often arises because non-technical people know our little secret: that software has bugs. So they tend to attribute all of their problems in life to software bugs, when to the developer they may be caused by many other things.

Note that a bug is only considered as such if the software doesn’t do what it is supposed to do; but different people may have different ideas about it. Communication is not always perfect; any mistake in the specification (if someone took the trouble to write it down) will look like a software bug to the user, but will just be a wrong requirement to the developer. At other times features are not even implemented, so they won’t work; but the engineer will refuse to acknowledge a bug in code that hasn’t been written.

But you know what? The customer is always right, and the user is our customer. If any user takes the trouble to report a problem, then there probably is a problem, at least for that particular user. It might be ignorance by the user on how the software works; an error in the specification, or a missing feature; misconfiguration of the system or requirements not met; or perhaps a good old software bug. But whatever the cause, any reported problem should be taken seriously and solved if possible.

## Solving Problems

How to solve the problem depends a lot of what the problem is, obviously. But we can outline a process to manage the report: to process it until it is solved.

First, someone needs to take responsibility for the report; we will call this figure the "report manager", although it doesn’t need to be a figure of authority. The problem may be diverted to user support to be identified, and hopefully solved by teaching the reporter how to use the software. Otherwise the report passes to the next stage.

As we have seen the problem may be caused by many different things: requirements, configuration, user documentation, etcetera. The manager must decide if the problem can be solved by systems admins, requirements engineers or any other team, and refer the report to them. All the possibilities must be discarded first; some companies have elaborate escalation procedures, others just let the report manager decide. Several layers of support are common once an organization grows above a certain level. Whatever workflow is most appropriate in your situation is fine; just be sure to think about it and improve it if needed.

Finally, if nobody else has found the cause the development team has to take care of the report. If the problem really is caused by a development product (a software bug, or an error in the manuals perhaps) then it should eventually be assigned to someone who can solve it.

## Types of Problems

When we have more than a handful of reports we will probably want to divide them in groups. One obvious way is to identify and remove duplicates. Apart from leaving just one report for each problem, the most significant categories all refer to the underlying problem.

Keep in mind that “problems” should refer to repeatable conditions, not one-time faults. Specifying that “I could not access the system from 2:00 to 4:00 last night” is no good, since there is no way to reproduce the problem and find the root cause.

So, how can we categorize reported problems? The most productive types divide problems into groups according to their origin as we saw above: software bug, documentation issue, configuration error, and so on. Within software bugs it can be useful to distinguish between a malfunction and a visual problem, for instance if you are dealing with a web application where the HTML layout can be botched up but be completely functional.

There are a couple of special types often thrown into the mix: a “missing feature” is something which has not been implemented and should, while “wish list” identifies a desirable feature which has not been planned yet for inclusion.

There are many other ways to categorize bugs: severity, priority, number of users affected, subsystem where the problem arises, etcetera. Users should be able to enter those values that make sense to them; the rest should be entered by the report manager. As we saw before users may be challenged to find the correct category for a problem, e.g. mistaking missing features as bugs; the report manager should review the problem type assigned by users, if any.

## More on Problem Reporting

There is a lot of literature on bug management, but problem reporting has not received the attention it deserves as a separate task; let us hope that this post serves to make the issue more prominent. Use the comments section for any aspects I may have left behind.

In the [second part](reporting-problems-part-2.html) we will discuss the elements of a good problem reporting tool; be sure to tune in!

