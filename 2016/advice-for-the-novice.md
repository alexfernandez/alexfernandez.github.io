---
title: 'Advice For The Novice'
subtitle: '[Becoming A Better Developer](becoming-a-better-developer.html), Part 2'
footer: Published on 2016-10-09, last edited on 2016-10-09.
  [Comments, improvements?](https://twitter.com/pinchito)
---

![Yoshimori Utagawa: "[Junior dev gets aggressive after his first code review by senior peers](https://twitter.com/pinchito/status/760593307365941248)", Woodblock print, 1862](pics/junior-developer-aggresive.jpg "Code reviews can get nasty")

So you want to become a better developer?
This [guide](becoming-a-better-developer.html) is divided into four parts.
The previous installment was about
[starting a career](start-me-up.html),
while the second (the one in your hands right now)
is devoted to juniors wanted to improve in their careers.

Tips to help you improve are shown **in bold**.

<p style="color:#636; border:thin solid #c9c">
Personal experiences will appear in colored boxes like this one.
</p>

## Life As A Junior

So you are starting in our noble and worthy profession.
What do you need to know to survive?

When you are a junior developer at a company,
you want to be sure that there are really good people you can learn from.
Most importantly, you want to actually learn from them.
Do not be afraid to ask.

**Ask to work with someone you respect.**

You will probably have to do menial tasks,
and will be tempted to think that they are below your level.
But just think: who else is going to do them if you don't?
Boring, repetitive tasks are great candidates for optimization.
Why not trying to automate them so that nobody has to do them?

**Try to optimize your workflow.**

## Choosing A Tool Set

Like in any profession, what tools you use makes a huge difference in your daily work.
Quite often you will have no say on the tools to use in a project:
text editor, IDE, compiler, and so on.
But sometimes you do.

Mandating an official dev environment is one of the first things done at many companies:
big, medium and even startups.
It is also one of the most futile, if not actively harmful.
Code is text;
you should be able to manipulate it using whatever tools are best suited for each task.

<p style="color:#636; border:thin solid #c9c">
At [mediasmart](https://mediasmart.io/)
we don't mandate an official text editor.
Some of us use vim, others emacs,
some prefer graphical editors such as
[GitHub's Atom](https://atom.io/).
I have been using vim exclusively for five years now.
Even though I am by no means an expert user,
it gives me a huge advantage:
I have the same editor locally and on servers,
it is light and efficient,
and can be used anywhere.
Even the bloated and inferior emacs can be used in this fashion.
Just joking; any console editor is fine.
But [vim is the best](http://stackoverflow.com/research/developer-survey-2016#developer-environment-per-occupation).
</p>

No matter who chooses them,
take the time to learn how to use your tools.
It will pay off.

**Learn how to use different tools,
and choose the best for your daily work.**

One of the most overlooked skills is typing.
Do you peck with two fingers, or touch-type using ten?
Some people contend that typing is just a tiny portion of the time of a developer,
so it doesn't matter how fast you type.
I strongly disagree.
Adding up the time spent writing code
and communicating with others (mail, chat, docs)
would probably make it worth it.
But consider that everything else you do on the computer
goes through the keyboard or the mouse.
There is not much learning in the mouse,
but using the keyboard 50% faster makes a huge difference in the long run.

**Your keyboard is your basic tool.
Learn how to use it well.**

## Reviews And Criticism

The best way to improve is having other people review your code.
As [Eric Elliott says](https://twitter.com/_ericelliott/status/784914896274063360):

> In a mentorship culture with lots of pairing and code reviews, even novice developers quickly become great assets.

Be prepared to receive criticism.
It is not always easy to have someone rip through your code
and be cool about it.
Most people get emotional.
Keep in mind that knowing what you are doing wrong
is the best way to improve.

<p style="color:#636; border:thin solid #c9c">
One of my colleagues at
[mediasmart](https://mediasmart.io/)
started at the same time I did;
he had no professional experience.
When I started commenting on his pull requests
he probably felt that I hated him
(and that I was a cold bastard);
he got disheartened by all the negative feedback.
Nowadays he takes criticism of his code as a pro!
</p>

I have never worked with anyone that was a great developer and did everything right from the start.
But I have never worked with a senior that did _everything_ right, either.
I don't do everything right myself,
and I don't expect others to.
That is why we have
[code reviews and walkthroughs](/2015/walk-through-my-code.html).

**You are not supposed to do everything perfectly.
Nobody is.
We are all supposed to learn and get better.**

## Learn Strategies

While observing junior developers in the workplace,
I realized that there was a crucial difference with their more senior peers.
Faced with a hard problem,
they tend to reach a point where they say:

> I have tried everything but it doesn't work.
> I don't know what is happening.

And they give up.
While more senior people *never* give up.

It helps a lot to know that *the problem has a solution*.
All bugs can be detected and eventually corrected.
It may lie in the place that you least expect,
it may require lots of changes,
but in the end you will solve it.
Or someone else if you give up!

**Every bug has a fix, and it is within your grasp.**

As you learn to use more tools,
you will have more arrows in your quiver,
and this will help you try different approaches for problem solving.
For instance, if you want to find and fix a bug,
you can:

* follow the code,
* add traces to the code,
* google any error messages,
* use a debugger,
* comment out parts of the code,
* write an example that fails in a similar way,
* google for people with the same problem,

If it's a performance bug the strategies vary:

* add traces with time measurements,
* profile the code,
* isolate the slow part and benchmark it,
* find a micro-benchmark with the same problem,

and so on.
If you can't figure out a new strategy ask someone else.

**There is always another strategy to try out.
Don't be discouraged.**

## Ask For Help

A junior asking continuously for help is not the worst that can happen.
Oh no.
Far worse is a junior *never asking for help*.

<p style="color:#636; border:thin solid #c9c">
At [my current company](https://mediasmart.io/) we are all busy people,
so we tend to let juniors on their own,
and "let them float".
This strategy does not always work.
A big, strategic development was assigned to
[Fran Barea](https://twitter.com/MandisBack),
one of the junior engineers,
to complement his work in tech support.
The project did not progress as expected;
in fact it missed all of its milestones.
I offered help with it,
and did a few joint design sessions.
But still the junior engineer was overwhelmed,
mostly by his tech support workload.
After less than a year he was offered an attractive position at University and left.
Since then, we try to keep a closer eye on juniors,
and encourage them to ask for help.
</p>

**Always ask for help if you feel lost.**

When asking for help,
quite often you don't need someone to handhold you,
or find the problem for you.
Just asking what other strategy can be tried can be enough.
And of course, do your homework before asking for help:
try out the strategies that you know.

**Asking for help must go after you have exhausted your own resources.**

## Find A Mentor

You probably know someone who is a senior developer,
and you may learn something from them.
So, why not ask them to mentor you?

<p style="color:#636; border:thin solid #c9c">
I have had a few people ask me to mentor them over the last few years.
I usually say yes, of course!
However they seldom ask for anything.
That is not how mentoring is supposed to work!
</p>

A mentor is someone to ask questions to.
Or at least to tell them your plans,
and ask for their opinion.

**Look for a good mentor, and then use them!**

By the way, you can contact me at [alexfernandeznpm@gmail.com](alexfernandeznpm@gmail.com),
if you need anything from me.
I don't know if I'm senior, but at least I'm old.

## Conclusion

Life as a junior can be hard,
but if you work hard it can also be very rewarding.

## Part Three

The next installment will be published soon.
[Stay tuned!](https://twitter.com/pinchito)

