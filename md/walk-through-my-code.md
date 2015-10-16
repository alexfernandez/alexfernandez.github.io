% Walk Through My Code

# Or: How to Do a Proper Code Walkthrough

![Picture credit: [j_cadmus](https://commons.wikimedia.org/wiki/File:Wroclaw_University_Library_digitizing_rare_archival_texts.jpg)](pics/walk-through-my-code.jpg "Wroclaw University Library digitizing rare archival texts")

So you are a good, studious dev who uses GitHub to create pull requests, review and merge your changes.
As part of a distributed team you don not often get to discuss your code with others;
that is why you need the approval (+1) of at least two other devs to put anything into production,
and no disapprovals (-1) from anyone in the team. It works great!

But then one of the devs comes with a pull request that has 1000+ lines.
Or perhaps one that is made of a ton of small changes.
Or maybe it refactors one of the grittiest parts of the code,
where only the brave dare enter (and only after drinking copious amounts of caffeinated beverages).
In any case, nobody understands the darned thing except for the (obviously intoxicated) author.

This recent Twitter joke sums it up beautifully:

![[Typical several-thousand-line patch](https://twitter.com/Obdurodon/status/651740765522161664).](pics/typical-patch.jpg "Three people look at us from a mountain of trash")

What can you do about it? Why, this particular pull request is ripe for a walkthrough!

## The Perfect Walkthrough

The basic idea is similar to what people have been doing for hundreds of thousands of years,
perhaps even for millions of years:
gather around the fire, get cozy and start telling your story.
But instead of explaining how the bovine hunt went,
we want to tell others why and how we did the changes.

In this section I will narrate as if you (the reader) were the author of the code.
Later on we will see the walkthrough from the point of view of the reviewers.

Just like good code comments, you do not want to tell your peers what the code does;
they will usually figure out that by themselves.
But what they need to know is _why_ you did things that way,
and sometimes how you came to that solution.

At the beginning you should give a short introduction,
including any relevant details about why the code was as it was,
and what the changes are trying to accomplish.
Perhaps there are alternative designs that you have discarded;
now might be a good moment to explain those.
Why not explain what you set out to do,
and then what solution you settled on?
You get the idea?

Then start going through the changes and explaining the relevant parts.
Take notes as you go for any bugs and improvements that arise as you go along;
after all, that is the most important point of the walkthrough,
as we will see, even if the excuse was to explain the code.
There may also be questions and doubts from the team that can be hard to answer on the go;
just note them and answer them later.

One note of caution: try not to put your ego on the line.
Do not get defensive about the changes or why you did them that way.
If a new way of tackling a problem is presented,
try to think about it before rejecting it;
improving the code is always good,
and is one of the most desirable outcomes of the walkthrough.
If it is too much work or the patch is urgent,
just explain it and perhaps make notes to evaluate an improved solution later.

After the walkthrough the fun has just started:
now is the time to solve all of the issues that arose during the session,
and perhaps write an email with any pending answers.

## The Perfect Companion

Now suppose you are invited to a code walkthrough.
What is the best way to make it worth your while?

First, always be polite and professional with your colleagues.
Leave the friendly banter for the coffe breaks.
The best tone for a code walkthrough is the same as for any code review comment:
all comments should strive to be impartial and objective.

Suggestions always work better than impositions.
Offending the author will only make the process harder for everyone and less effective.
Always remember that you probably make as many errors as the author.

After the walkthrough has finished,
now is the time to do the actual code review!
Once you have understood the changes you can verify them
and note any obscure sections or possible improvements that may remain.

## The Exciting Details

There are some questions that may arise if you are inexperienced in code walkthroughs.

### Who Should Come?

In [formal code walkthroughs](https://en.wikipedia.org/wiki/Software_walkthrough#Objectives_and_participants)
there are three official roles: the author,
the walkthrough leader and a recorder who takes note of everything.
That is fine for big companies, but remember!
We are cool people who work for cool startups
(or at least for cool departments in otherwise boring companies).
Otherwise, how would we get away with using GitHub and doing pull requests in the first place?

In informal code walkthroughs the author of the patch will usually take on the two other roles,
since the author will be the one repairing any defects found anyway.
If you are the author, just remember that you have to do the three roles:

* as the walkthrough leader, guide people around the changes;
* as the author, explain any obscure points in the code;
* and as the recorder, take notes of any tasks that may arise.

At least a couple of reviewers should attend,
and also any members of the team with a particular interest in the code being reviewed.
Junior members of the team should be encouraged to attend, if they do not say so on their own.

It is not advisable to invite non-technical members of the team, since they will spend all of their time
trying to understand the code and probably hinder progress.
Likewise, if you are blessed with a manager, try to keep them out of this process:
they will usually derail the review by focusing into their own interests
(or even worse, make people show off instead of trying to improve the code at hand).

### How to Do It?

In formal code reviews in the 70s,
groups of devs took a printout of the code to a room and reviewed every single page.
In essence it was a walkthrough,
since the author was there to explain what the code did.

Nowadays just gathering around a laptop can be a good technique for small teams;
larger teams may require a projector and a conference room.
But in-person walthroughs are not always feasible or convenient,
since there may be members of the team not present in the same room (or even in the same timezone).
For those cases any conferencing tool with screen-sharing capabilities will do:
Skype, Hangouts or similar.

There are good review tools nowadays that are available to almost anyone.
[GitHub](https://github.com/) has an excellent interface to review a pull request.
Reportedly, so does [BitBucket](https://bitbucket.org/)
(although I have not personally used it).
Any [tool for code review](https://en.wikipedia.org/wiki/List_of_tools_for_code_review)
will be useful for a walkthrough, really, coupled with a screen sharing program.
But mailing a diff and going through it using audio-only is also perfectly valid.

### Why Do It?

A walkthrough is not always necessary: small or repetitive changes are easy to follow.
Many types of changes can also be explained very well with a simple description.
But sometimes requirements are really complex; the code can be really hairy;
or you just want to explain the wonderful things that you have done to your colleages.

If you feel that you have left a lot out of the pull request description,
maybe it is a good time for a code walkthrough.
Sometimes it can also be very didactic for devs that are not familiar with a particular section of code,
especially if we are redoing it for any reason.

Another very good reason to do code walkthroughs is when new members join the team, or take on new roles.
Just look at it as the opposite of the usual reason:
instead of introducing new code to the team,
you introduce a new team to the existing code.

When Sergio and myself joined MediaSmart,
the original dev and CTO spent the first few days with us new recruits,
explaining how the code worked for the best part of eight hours a day.
After a week we had fleshed out how most things worked.
In the process we found lots of weird things that we would later correct,
essentially laying out our work there for the next six months.
Sometimes he would even find bugs in the code,
which by that point was almost completely cryptic to us.

At that point (early 2013) we did not have good conferencing tools;
those that we had worked poorly with our domestic DSL lines,
since we were doing everything remotely.
Therefore we used most of the time a land line phone:
Guillermo would call out each file name, and then a series of line numbers,
followed by an explanation for each section of the code.
It was primitive, but effective:
after a few hours we got the hang of it,
and after a week we were ready to take on the world!

After a couple of years we hired Yarilo and Fran and did the same to them;
this time we had better tools (Skype and Hangouts),
but still we spent their first week explaining everything
while they took notes.
And we hope to continue doing extensive walkthroughs
to any new recruits as the team grows.

### What to Expect

In a typical walkthrough,
the author of the code should find a few issues just by explaining the changes to someone else.
If nobody has found a single issue with the code under review,
then the walkthrough has probably not been thorough enough;
or maybe the author is a perfect human being who never makes any mistakes.
My money is on the first option though.

After a walkthrough the reviewers should have enough understanding
to pass judgement on the new code,
and make an effective review.

Finally, the sense of code ownership in a team
can only improve after relevant sections have been discussed collectively,
even if it is done with the excuse of a pull request.

Try it once with your team:
when done properly a code walkthrough is a very rewarding experience
both for authors and reviewers.

## TL;DR

When a code review is not enough,
just take a couple of members of the team and explain your code going through the changes.

`---8<---8<---8<---8<---8<---`

Published on 2015-10-17.

Back to the [index](../index.html).

