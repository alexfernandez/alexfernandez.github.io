---
title: 'Reversible Engineering, Part 3: Management'
footer: Posted originally at [Tumblr](http://tech.moveinblue.com/post/23414460113/reversible-engineering-part-3-management) on 2012-05-20.
---

![Photo credit: [Steve Heron.](https://www.flickr.com/photos/sbh/6774004978/in/photostream)](pics/reversible-engineering-part-3.jpg "Canalside")

In the [first part](reversible-engineering-part-1.html) of this series we looked into reversible processes as a way of minimizing engineering complexity; and explored how to approach software development near reversibility. In the [second part](reversible-engineering-part-2.html) we then applied this principle to DevOps, and derived explanations for a lot of modern practices.

In this last installment we will try to tame that fearful beast in the minds of most engineers: management, or how to organize the work of other people. Let us now take a look at how management can benefit from reversibility.

## That Pesky Complexity Again

A manager is expected to keep things organized and in good order. Perhaps the hardest thing to manage is complexity: check your local documentation repositories for easy examples. Where is the internal documentation stored in your company? Is it easy to use? Can you find things quickly when needed, or do you keep a lot of bookmarks which in turn have to be organized?

Organizing documents is not an unsolvable problem: search engines have made it easy to find information on the vast seas of the wild internet. How come a generic search engine can find a page almost anywhere, but a specialized corporate tool can get lost in a few thousand documents? The approaches are vastly different: organization is quite different from discovery. As information is added to a system [its entropy increases](http://www.science20.com/hammock_physicist/what_entropy-89730) and it becomes harder to keep any indexes updated.

Here is where reversibility can help us. If our processes are almost reversible, which means that adding information to our system is as easy as removing it, we are guaranteed by the Second Law that entropy is kept at a minimum. The traditional view of thermodynamics is that a reversible process is most energy-efficient, and that any turbulences cause efficiency losses. The information theory approach tells us that in a reversible process complexity is reduced as much as possible.

A trivial example is the undo function found in many software packages: when any action is easy to undo then it becomes easier to perform any desired changes. Otherwise the user has to keep back up copies of any intermediate steps to avoid losing work; experimentation becomes harder and in the end the results are much less efficient than they could be.

We can strive for reversibility, or alternatively aim at a steady state near the point of equilibrium. Any instabilities in a system will cause entropy to increase faster, and it will require more information to be described than should be necessary. As a consequence new recruits will need to know more things before they are productive, changes will take longer and the system will become harder to evolve. Not what managers usually want of their projects.

Reversibility shines a new light on the common management recipe: “avoid heroic efforts, establish a repeatable process”. The former are by their very nature irreversible: nobody asks heroes to undo their heroic deeds. The latter is close to the steady state, since a process that can be repeated as often as needed cannot end too far from where it started.

Let us now see how we can strive to keep our processes near reversibility from the point of view of pure management.

## Reversible Decisions

Probably the most apparent feature of management is making decisions. The manager is the boss, and as such is expected to decide on future courses of actions. Decisions should of course be firmly maintained once taken. Or should they not?

In his piece [Linux kernel management style](http://lwn.net/Articles/105375/), Linus Torvalds (of Linux fame) states:

> Thus the key to avoiding big decisions becomes to just avoiding to do things that can’t be undone.  Don’t get ushered into a corner from which you cannot escape. A cornered rat may be dangerous - a cornered manager is just pitiful.

Observe how the emphasis is in avoiding irreversible decisions. Of course decisions can never be perfectly reversible: there will always be a cost associated with undoing some work that has been done. But in the presence of several valid alternatives the best course of action is always to leave your options open, and to be able to backtrack later.

Now look at your typical project management tool: what do you see? With all probability it will be dominated by a Gantt diagram full of tasks, some marked as “done” and others marked with a percentage of completeness. If you are lucky you will perhaps just see a set of milestones, each marked as “done” or “undone”. Things can take longer than foreseen, but once a task is done nobody expects it to be reopened; in this view of the world a project is a mass of irreversible tasks. How can the engineers redo something which isn’t well finished? Answer: they cannot dedicate any more time to a closed task without great pains, often in secret. As a result, tasks poorly executed will probably burden the project further on, either in time or in subpar results.

Time-boxed releases are much closer to reversibility: release versions at regular intervals, and add features as time allows. The adoption of regular releases in many software projects is often touted as a success of agile methodologies, but that is hardly an explanation of why time-boxed development works. In fact, agile methodologies advocate for cycles of about one to three weeks, while free software seems to have adopted periods of a few months. Perhaps there is a common factor in both approaches?

We have met cycles before in this series: they are an easy way to reach the steady state. In the typical time-boxed process tasks are not irreversibly closed: subsystems are worked upon as part of the continuous improvement of the global system, and therefore they can be revisited as needed. Similarly the team does not change work radically from one task to the next, but they are assigned changes in a more or less steady flow and they just switch from one to the other. Any change can be reopened at any time, without cost. Another triumph of reversibility!

## Dealing with Irreversibilities

A project moving forward, even with time-boxed releases, is sure to meet irreversible points such as go/no-go criteria, public releases, and changes of staff. Marketing campaigns have to be devised and executed, staff must be engaged and in general money must be spent wisely. How can our poor engineer-turned-manager deal with those irreversible events?

Instead of dealing with a constant cascade of irreversibilities, it is better to group them into specific points, and advertise them as such within the organization. People will be prepared for them; meanwhile they don’t need to waste all their energies into endless irreversible checkpoints. Once each significant milestone is reached an appropriate decision can be taken, and hopefully any other options can be left open.

Staffing a project is an entirely different matter. Instead of grouping irreversible events, the best way to deal with staffing levels is to change them gradually. Losing half the people in a project is a good way to doom it; but so is doubling the team in a short period. Here the usual recipe of reversible processes, give them time to cook slowly, is your best ally.

Another option is to keep a flexible workforce: have people available to work on stuff at short notice. Of course, the specific systems worked upon must already be very simple so that the newcomers get up to speed quickly. This is hard to do in an IT project, but it can be attained using standard interfaces: a Linux sysadmin will probably get up to speed quickly in any new Linux system, provided there are not too many idiosyncrasies.  The advice then becomes: keep standard parts standard, and keep your workforce flexible. If this can be done if only in a few parts of the system, it will be a net gain.

## Management as Code

What, you seriously thought that we were going to keep this at the “pure management” level, without talking about code? Got you! Even when wearing the manager hat we are still engineers: just as DevOps is based in the principle of “infrastructure as code”, ideally we will be able to do the same with management. First and foremost we try to solve our problems, then we embed our solutions into code and run it as often as necessary. The result is management applications, also called management information systems and many other boring names.

The basic elements of any management application are four operations which go by the acronym [http://en.wikipedia.org/wiki/Create,_read,_update_and_delete](CRUD): create, read, update and delete. Note how they behave with respect to reversibility: the read operation does not affect reversibility, create and delete are the opposite of each other, and update is its own opposite (an update is reverted by another update). From our point of view it is important to have always the reverse of any operation, from the lowest level of atomic modifications to high level operations.

To be really reversible, any management system needs to keep a history of all past actions, and be able to undo them at will. Ideally we should be able to bring the system back to its state at any arbitrary point in the past, as we saw with [code repositories](reversible-engineering-part-2.html). At the very least we have to store extra info along with the raw data, so that we can reconstruct the history of modifications and revert them at will. Then we have to organize our modifications and undo them in groups that represent the high level organization of data.

Synchronization is a particular thorny issue. When there are several copies of each piece of data it becomes harder to update any one of them, as there is a high probability that we will forget one of them; there is an added effort to resynchronize any duplicate piece of information. The effort required to backtrack any such change also grows: the system must know that two or more changes always go together, and if any one is reverted the rest must also be undone.

For many years the technical answer has been to avoid duplicate data; normalized databases are the canonical example, where every piece of data is stored once and only once, and they lie at the core of most management systems. Unfortunately this approach carries with it many disadvantages:

* Redundant data is not always duplicate: e.g. the number of user accesses can be found adding together accesses to every page, but sometimes total and partial access counts must be kept separately. The usual trick is to do both changes atomically, as a single step that can be completed or aborted; but no thought is usually given to reverting the change as a whole.
* Performance is penalized when accessing normalized data: sometimes many unrelated tables have to be queried to return a single item. Denormalization allows a database to keep related data together for easy access.
* Following pure normalization rules blindly can lead to databases with many thousands of tables which are hard to follow.
* Reality is stubborn: the double-entry accounting system was invented to avoid making mistakes.

The new breed of NoSQL databases tackle the same set of problems by freeing schemas and allowing denormalized data to live happily in the system. Avoiding irreversible schema changes is good, as we saw in [part two](reversible-engineering-part-2.html), but these newfangled databases don’t go far enough: they don’t give so much thought to keeping the full history of the data as it is manipulated.

An ideal management system should not only keep information about all the changes in the system, but also keep related changes together and do or undo them as a whole. Having several management systems synchronized is left as an exercise for the reader; ample margin should be found at both sides to write a solution should they wish to [write the solution there](http://en.wikipedia.org/wiki/Fermat's_Last_Theorem).

## Informative Complexities

In the previous section we have seen how we need to store more information to reduce the entropy of a system. If you have been paying attention you will now be wondering:

> Now wait a minute, mister! You told us that more information means more complexity! How come now we have to store more things to reduce complexity?

It is actually a very good point, and to answer it we have to delve a bit further into what entropy really means in information theory. In fact we have been playing a bit loosely with entropy here. What [Shannon entropy](http://en.wikipedia.org/wiki/Entropy_(information_theory)) really quantifies is how much information we are missing about a system to fully describe it, not how much we already have. As we add complexity to a system we strive to keep all of it under bounds. Think about the amount of information that a new recruit needs to know about a system before being 100% productive: how many quirks are there lurking in the shadows, waiting to bite them? Is it all stored together and easily accessible, or will our unlucky newbie have to ask lots of people to gather the knowledge?

The Second Law of Thermodynamics tells us that our knowledge of any system will never be perfect, and it will get worse with time; as the system evolves we will lose more and more bits of it. If we are not careful then there will be so many pieces lost that it will be simply impossible to make any further changes. On the other hand, a reversible process ensures that total entropy does not increase, and therefore all new pieces will be fully described and accounted for as they are added.

When all the history is stored in the system the complexity of the total system is decreased, since we may revert any change at will. The system is fully described within itself, and that is complexity we save ourselves. The easier it is to access history information, the closer to reversibility we will be, and the smoother our projects will flow.

