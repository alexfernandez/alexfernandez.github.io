% Walk Through my Code

![Picture credit: [j_cadmus](https://commons.wikimedia.org/wiki/File:Wroclaw_University_Library_digitizing_rare_archival_texts.jpg)](pics/modo-cluster.jpg "Wroclaw University Library digitizing rare archival texts")

So you are a good, studious dev who uses GitHub to create pull requests, review and merge your changes.
As part of a distributed team you don't often get to discuss your code with others;
that's why you need the approval (+1) of at least two other devs to put anything into production,
and no disapprovals (-1) from anyone in the team. It works great!

But then one of the devs comes with a pull request that has 1000+ lines.
Or perhaps it is made of a ton of small changes.
Or maybe it refactors one of the grittiest parts of the code,
where only the brave dare enter (and only after drinking copious amounts of caffeinated beverages).
In any case, nobody understands the darned thing except for the (obviously intoxicated) author.
What can you do about it?

This recent Twitter joke sums it up beautifully:

![[Typical several-thousand-line patch](https://twitter.com/Obdurodon/status/651740765522161664).](pics/typical-patch.jpg "Three people look at us from a mountain of trash")

## The Perfect Walkthrough

The basic idea is similar to what people have been doing for hundreds of thousands of years,
perhaps even for millions of years:
gather around the fire, get cozy and start telling your story.
But instead of explaining how the bovine hunt went,
we want to tell others how we did the changes.

In this section I will narrate as if you (the reader) were the author of the code.
Later on we will see the walkthrough from the point of view of the reviewers.

Just like good code comments, you don't want to tell your peers what the code does;
they will usually figure out that by themselves.
But what they need to know is _why_ you did things that way.

At the beginning you should give a short introduction,
including any relevant details about why the code was (or is) as it was (or is),
and what the changes are trying to accomplish.
Perhaps there are alternative designs that you have discarded;
now might be a good moment to explain those.

Then start going through the changes and explaining the relevant parts.
Take notes as you go for any bugs and improvements that arise as you go along;
after all, that is the point of the walkthrough.
There may also be questions and doubts from the team that can be hard to answer on the go;
just note them and answer them later.

In a typical walkthrough, the author of the code should find a few issues just by explaining the changes to someone else.
If you have not found a single issue with your code, then the walkthrough has probably not been thorough enough;
or maybe the changes were not so complex after all. My money is on the first option though.

After the walkthrough the fun has just started:
now is the time to solve all of the issues that arose during the session,
and perhaps write an email with the delayed answers.
As to the reviewers, now is the time to do the actual review!

## The Perfect Companion

The tone for a code walkthrough is the same as for any code review comment.

As a reviewer, all comments should be impartial and objective.
Offending the author will only make the process harder for everyone and less effective.
Always remember that you probably make as many errors as the author.
If you don't make mistakes _ever_ then you are a demigod –
so what are you doing around us regular people?
You should have learned to cope with us by now!

Again as a reviewer, always be polite and professional with your colleagues.
Leave the friendly banter for the coffe breaks.

As the author, don't get defensive about the changes or why you did them that way.
If a new way of tackling a problem is presented, try to think about it before rejecting it;
after all that's why we do the walkthrough in the first place.
If it's too much work or the patch is urgent, just explain it and perhaps make notes to evaluate an improved solution later.

## The Boring Stuff

There are some questions that may arise if you are inexperienced in code walkthroughs.

### Who Should Come?

In [formal code walkthroughs](https://en.wikipedia.org/wiki/Software_walkthrough#Objectives_and_participants) there's the author,
the walkthrough leader and a recorder who takes note of everything.
That's fine for big companies, but remember!
We are cool people who work for cool startups
(or at least cool departments in otherwise boring companies).
Otherwise, how would we get away with using GitHub and doing pull requests in the first place?

In informal code walkthroughs the author of the patch will usually take on the two other roles,
since they will be the ones repairing any defects found anyway.
If you are the author, just remember that you have to do the three roles:

* as the walkthrough leader, guide people around the changes;
* as the author, explain any obscure points in the code;
* and as the recorder, take notes of any tasks that may arise.

At least a couple of reviewers should attend, and also any members of the team with a particular interest in the code being reviewed.
Junior members of the team should be encouraged to attend, if they don't say so on their own.

It is not advisable to invite non-technical members of the team, since they will spend all of their time
trying to understand the code and probably hinder progress.
Likewise, if you are blessed with a manager, try to keep them out of this process:
they will usually derail the review by focusing into their own interests
(or even worse, make people show how good they are).

### How to Do It?

In formal code reviews in the 70s, groups of devs took a printout of the code to a room and reviewed every single page.
In essence it was a walkthrough, since the author was there to explain what the code did.

Nowadays just gathering around a laptop can be a good technique for small teams;
larger teams may require a projector and a conference room.
But in-person walthroughs are not always feasible or convenient, since there may be members of the team
not present in the same room (or even in the same timezone).
For those cases any conferencing tool with screen-sharing capabilities will do: Skype, Hangouts or similar.

There are good review tools nowadays that are available to almost anyone.
[GitHub](https://github.com/) has an excellent interface to review a pull request.
Reportedly, so does [BitBucket](https://bitbucket.org/) (although I have not personally it).
Any [tool for code review](https://en.wikipedia.org/wiki/List_of_tools_for_code_review) will be useful for a walkthrough, really.
Coupled with a screen share they are very useful guides.
But mailing a diff and going through it using audio-only is also perfectly valid.

### Why Do It?

A walkthrough is not always necessary: small or repetitive changes are easy to follow.
Many types of changes can also be explained very well with a simple description.
But sometimes requirements are really complex; the code can be really hairy;
or you just want to explain the wonderful things that you have done to your colleages.

If you feel that you have left a lot out of the pull request description, maybe it is a good time for a code walkthrough.
Sometimes it can also be very didactic for devs that are not familiar with a particular section of code,
especially if we are redoing it for any reason.

## Introducing Our Code

Another very good reason to do code walkthroughs is when new members join the team, or take on new roles.
Just look at it as the opposite of the usual reason: instead of introducing new code to the team,
you introduce a new team to the existing code.

When Sergio and myself joined MediaSmart, the original dev and CTO spent with us new recruits the first few days,
explaining how the code worked for the best part of eight hours a day.
After a week we had fleshed out how most things worked.
In the process we found lots of weird things that we would later correct,
essentially laying out our work there for the next six months.
Sometimes he would even find bugs in the code, which by that point was almost completely cryptic to us.

At that point (early 2013) we didn't have good conferencing tools; those that we had worked poorly
with our domestic DSL lines, since we were doing everything remotely.
Therefore we used most of the time a land line phone; Guillermo would call out each file name
and then a series of line numbers. It was primitive, but effective: after a few hours we got the hang of it.

After a couple of years we hired Yarilo and Fran and we did the same to them;
this time we had better tools.

## What You Should Expect

In a typical walkthrough, the author of the code should find a few issues just by explaining the changes to someone else.
If you have not found a single issue with your code, then the walkthrough has probably not been thorough enough.

### The Aftermath

After the code walkthrough, the code review should continue as usual: comments.

## TL;DR

When a code review is not enough, just take a couple of members of the team and explain your code going through the changes.

`---8<---8<---8<---8<---8<---`

Published on 2015-10-08.

Back to the [index](../index.html).

