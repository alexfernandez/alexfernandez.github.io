% Walk Through my Code

![Picture credit: [j_cadmus](https://commons.wikimedia.org/wiki/File:Wroclaw_University_Library_digitizing_rare_archival_texts.jpg)](pics/modo-cluster.jpg "Wroclaw University Library digitizing rare archival texts")

Code reviews are fine: you post your changes somewhere visible (e.g. on a GitHub pull request) so other devs in the team can review it and make comments.
But, what happens when there is an unsurmountable mountain of changes?

Witness this recent Twitter joke:

![[Typical several-thousand-line patch](https://twitter.com/Obdurodon/status/651740765522161664).](pics/typical-patch.jpg "Three people look at us from a mountain of trash")

## Why Do It?

The motivation for a walkthrough is of course to explain what the code does.
It is not always necessary: small or repetitive changes are easy to follow.
Many types of changes can also be explained very well with a simple description.
But sometimes requirements are really complex; the code can be really hairy;
or you just want to explain the wonderful things that you have done to your colleages.

If you feel that you have left a lot out of the pull request description, maybe it is a good time for a code walkthrough.
Sometimes it can also be very didactic for devs that are not familiar with a particular section of code,
especially if we are redoing it for any reason.

### Introducing Our Code

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

## The Perfect Walkthrough

The basic idea is similar to what people have been doing for hundreds of thousands of years,
if not millions: gather around the fire, get cozy and start telling your story.
Only this time we are not explaining how to hunt bovines, but what our code does.

### The Technical Requirements

In formal code reviews in the 70s, groups of devs took a printout of the code to a room and reviewed every single page.
In essence it was a walkthrough, since the author was there to explain what the code did.

Nowadays just gathering around a laptop can be a good technique for small teams;
larger teams may require a projector and a conference room.
But in-person walthroughs are not always feasible or convenient, since there may be members of the team
not present in the same room (or even in the same timezone).
For those cases any conferencing tool with screen-sharing capabilities will do: Skype, Hangouts or similar.

As we have seen it is actually possible to do an audio-only walkthrough, calling out file name and line;
it is not comfortable but it works.

As to the tools used to look at the code, [GitHub](https://github.com/) has an excellent interface to review a pull request, as does [BitBucket](https://bitbucket.org/).
Any [tool for code review](https://en.wikipedia.org/wiki/List_of_tools_for_code_review) will be useful for a walkthrough.

### Who Should Come

In [formal code walkthroughs](https://en.wikipedia.org/wiki/Software_walkthrough#Objectives_and_participants) there's the author, the walkthrough leader and a recorder who takes note of everything.
Informally, usually the author may take on the two other roles since they will be the ones repairing any defects found.
A couple of code reviewers should attend, and also any members of the team interested in the code being reviewed.
It is not advisable to invite non-technical members of the team, since they will spend all of their time
trying to understand the code and probably hinder progress.

### Impersonal Evaluation

As with any code review, all comments should be impartial and objective.
Offending the author will only make the process harder for everyone and less effective.
Always remember that you probably make as many errors as the author, and if you don't then you are a demigod –
so what are you doing working with us regular people?

## What You Should Expect

In a typical walkthrough, the author of the code should find a few issues just by explaining the changes to someone else.
If you have not found a single issue with your code, then the walkthrough has probably not been thorough enough.

### The Aftermath

After the code walkthrough, the code review should continue as usual: comments.

## TL;DR

When a code review is not enough, just take a couple of members of the team and explain your code going through the changes.

`---8<---8<---8<---8<---8<---`

Publicado el 2015-10-08.

De vuelta al [índice](../index.html).

