---
title: '🧮 Contradiction in Logic and Mathematics'
subtitle: '≢ Guide to Contradiction, Part 2'
footer: Published on 2023-08-10, last modified on 2023-08-10.
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
image: https://pinchito.es/2023/pics/contradiction-broken-sphere.jpg
---

![Even perfection can be broken. Source: [Jez Arnold](https://www.flickr.com/photos/jezarnold/145315134/in/photostream/).](pics/contradiction-broken-sphere.jpg "Broken globe in the building of the United States, New York.")

In the [first part](/2023/contradiction-what-is) we have seen
how contradiction is not as easy to pinpoint as we would like.
So now we ask ourselves:
can we make a rock-solid definition of what a contradiction is in mathematics,
or at least in logic?
We will try here.

## ≢ Logic Contradiction?

We saw before that a contradiction in logic is simply:

> A contradiction means asserting that a statement and its contrary are true.

### Introduction to Logic

Cool, but what is [logic](https://en.wikipedia.org/wiki/Logic)?
It is a branch of philosophy
(or mathematics, depending on who you ask)
that studies the truth of statements,
without entering on what those statements actually mean.

We want to formalize logic to be able to speak about it in symbols:
for instance, if we have a statement `A`
(whatever `A` may mean),
we will speak about whether `A` is true.
`A` can mean "my dog is beautiful" or "Petra speaks about stained glass";
we don't care much.

There is a beautiful symbol `¬` which means "not" in logic.
So to negate `A` we will say `¬A`, which means the opposite of `A`.
So if `A` is "my dog is beautiful", `¬A` means "my dog is **not** beautiful",
which will make me very angry if I like my dog.
But at this level we are pure logicians and we don't care about meaning.

We can combine it with the symbol `∧`, which means "and",
we can write a contradiction as:

```
A ∧ ¬A
```

which just means that both `A` and `¬A` are true.
There we have it!

### 🙉 Meaning of Logic

At this point you may be thinking:

> I can easily think of a sentence that can be true at the same time as its opposite.

Let's see:
what if `A` is simply "It may rain"?
Then we can say very reasonably say:

> "It may rain and it may not rain."

We need to dig a bit deeper on what a logical statement is:
not just a random musing,
but a rigorous statement.
The favorite of logicians are what
[we have called properties](http://alexfernandez.local/2023/contradiction-what-is#ideas-and-properties),
and which are formalized as "sets":
all items belonging to a set have a certain property,
and viceversa.
So we could speak about "the set of all blue things" (things that have the "blue" property),
or "the set of all horses" (things that have the "horseness" property),
and so on.

Now it is harder to posit that something is blue and at the same time it is not blue,
given a sufficiently rigorous definition of "blue".
This will be for now the way to go.

![We will leave for later the discussion that this is clearly a horse, and yet it is clearly not a horse. Source: [Jorge Láscar](https://www.flickr.com/photos/jlascar/8709942456).](pics/contradiction-trojan-horse.jpg "A wooden horse similar to the Trojan horse in the Iliad, in the city of Troy.")

### 🏗️ Rebuilding Maths

Let us take a step back.
Why was formal logic needed?

At the end of the 19th century many exceptional people were thinking about
how to rebuild the mighty structures of mathematics on more solid grounds.
For 2300 years mathematicians had based geometry on the elements of
[Euclid](https://en.wikipedia.org/wiki/Euclid);
algebra had been developed mightily since the times of the original arab inventors
but it had not been systematized.
It was due time to formalize all these branches on some elementary foundations.

First [algebra was systematized in 1870](https://www.unav.es/gep/GrattanGuinness.pdf)
by [Benjamin Peirce](https://en.wikipedia.org/wiki/Benjamin_Peirce).
In 1874 [Georg Cantor](https://en.wikipedia.org/wiki/Georg_Cantor) published an article that started
the field of [set theory](https://en.wikipedia.org/wiki/Set_theory).
Soon afterwards in 1889 number theory was systematized around
[a few axioms](https://en.wikipedia.org/wiki/Peano_axioms)
by [Giuseppe Peano](https://en.wikipedia.org/wiki/Giuseppe_Peano),
based on set theory.

At the turn of the century it was time to seek the logic underpinnings of it all.
A set of wonderful pioneers,
including [Gottlob Frege](https://en.wikipedia.org/wiki/Gottlob_Frege),
[Bertrand Russell](https://en.wikipedia.org/wiki/Bertrand_Russell),
[Alfred Whitehead](https://en.wikipedia.org/wiki/Alfred_North_Whitehead)
and [David Hilbert](https://en.wikipedia.org/wiki/David_Hilbert)
along with Cantor who invented it all,
formalized set theory and mathematical logic.
They introduced [first-order logic](https://en.wikipedia.org/wiki/First-order_logic),
which has symbols like `∀` "for all", `∃` "exists", ∈ "belongs".

### 🙅 Back to Contradiction

Shortly after creating this system,
in 1901 Russell brought out his famous [paradox](https://en.wikipedia.org/wiki/Russell%27s_paradox):
if we have the set of all sets that do not belong to themselves,
does it belong to itself?
Sounds like a stupid question, but it brings up a paradox.
If it belongs to itself, then it doesn't belong to the set (itself);
but if it doesn't belong to itself, then it belongs to itself.

In symbols:

```
R = {x: x ∉ x}, R ∈ R ↔ R ∉ R
```

This paradox brought the whole building down:
according to the principle of [_reductio ad absurdum_](https://en.wikipedia.org/wiki/Reductio_ad_absurdum),
any chain of reasonings that result in a contradiction mean that the initial suppositions are wrong.
Therefore there was something rotten in this logic system,
and it had to be fixed.

### 🩹 Fixing the Mess

Intuitively it doesn't seem very hard:
just avoid specifying sets that speak about themselves in the definition.

The task of rigorously axiomatizing set theory would fall on
[Ernst Zermelo](Ernst Zermelo),
who along a few other mathematicians and with the help of
the [axiom of choice](https://en.wikipedia.org/wiki/Axiom_of_choice),
would create the
[Zermelo-Fraenkel set theory](https://en.wikipedia.org/wiki/Zermelo%E2%80%93Fraenkel_set_theory):
the standard formalization of set theory used today.

In essence, we are dealing with sets which behave like properties of things:
`x ∈ A` means that element `x` has a certain property.
In fact a set `P` can be defined as containing all elements that have a certain property `ψ()`:

```
∀x: x ∈ P → ψ(x)
```

or in words: for any element `x`, `x` belongs to `P` implies that `ψ(x)` is true.
We cannot define a property of belonging to itself,
we cannot define the set of all sets, and so on:
we have avoided the paradox.

The [axiom of choice](https://en.wikipedia.org/wiki/Axiom_of_choice)
had to be added to deal with infinite sets:
it says that it is possible to pick an element from each set of a collection to create a new set.
It seems stupid and it took me many years to even grasp its importance,
but it is necessary for many derivations.

## 🏛️ Rebuilding Maths

Once sound foundations for mathematics were laid out,
it was time to rebuild everything based on set theory.

This was part of [Hilbert's program](https://en.wikipedia.org/wiki/Hilbert%27s_program)
in the 1920s:
setting a rigorous basis for all mathematics based on
[mathematical logic](https://en.wikipedia.org/wiki/Mathematical_logic)
that was complete, consistent and could decide if any statement is true.

### 🏚️ Not So Solid?

The first cracks appeared when
[Kurt Gödel](https://en.wikipedia.org/wiki/Kurt_G%C3%B6del)
proved his famous [incompleteness theorems](https://en.wikipedia.org/wiki/G%C3%B6del%27s_incompleteness_theorems)
in 1931:
it is impossible to find the truth of all statements with any set of axioms in a finite set of steps.
But this was just a minor inconvenience in the big scheme of things.

The problem of having a huge rigorous building built out of a small set of principles
is that it has to be **completely consistent**:
any contradiction that arises in any of its branches means that the building is inconsistent.
So we can look in the darkest corners of mathematics looking for cracks,
and any paradoxes we find will **invalidate the whole of mathematics**.

Let us poke for a bit to see what we find.

### Σ Ramanujan Summation

What do you think the sum of all positive numbers is going to be?

```
1 + 2 + 3 + 4 + 5 + 6 + ⋯ = ?
```

It is a [well known result](https://en.wikipedia.org/wiki/Ramanujan_summation)
from the Indian prodigy [Srinivasa Ramanujan](https://en.wikipedia.org/wiki/Srinivasa_Ramanujan)
that the sum is -1/12:

```
1 + 2 + 3 + 4 + 5 + 6 + ⋯ = -1/12.
```

The trivial proof is quite interesting as it involves a few infinite series;
you can see it in the
[Wikipedia article](https://en.wikipedia.org/wiki/1_%2B_2_%2B_3_%2B_4_%2B_%E2%8B%AF),
or you can watch this [excellent 7 minute Numberphile video](https://www.youtube.com/watch?v=w-I6XTVZXww).

This formula is not just a mathematical trick;
a more rigorous proof can be found by
[regularization of the zeta function](https://en.wikipedia.org/wiki/Zeta_function_regularization).
The result is used in physics to get meaningful values of divergent series.
It is a **glaring contradiction**:
the sum is divergent (tends to infinity),
yet it can be shown to converge (tends to a finite value).

```
1 + 2 + 3 + 4 + ⋯ → ∞ ∧ 1 + 2 + 3 + 4 + ⋯ = -1/12. 
```

### 🌐 Multiplying Spheres

There is more.
A very interesting result is the
[Banach–Tarski paradox](https://en.wikipedia.org/wiki/Banach%E2%80%93Tarski_paradox),
published in 1924:
it is possible to break up a sphere into a finite number of pieces,
then reassemble them into **two identical spheres**,
therefore doubling the volume of the original.
The pieces are not stretched; just moved around and rotated.

![The miracle of the multiplying spheres. Source: [bdesham and Sean Kelly](https://en.wikipedia.org/wiki/File:Banach-Tarski_Paradox.svg).](pics/contradiction-banach-tarski.svg "A solid sphere is broken into a finite number of pieces, then reassembled into two identical spheres.")

Note that the pieces are not finite; each one has an infinite number of points,
so they are not "pieces" in the sense that we usually use:
you cannot just take your axe, chop up a sphere and reassemble the pieces into two identical spheres.

Is this possible only with three-dimensional bodies?
In fact [John von Neumann](https://en.wikipedia.org/wiki/John_von_Neumann)
[discovered in 1929](https://en.wikipedia.org/wiki/Von_Neumann_paradox)
that the same trick can be done with a planar figure:
take a flat circle,
divide it into parts,
move and turn those parts,
and then reassemble them into two flat circles.

Again we have a contradiction:
by taking a solid figure, dividing it up in pieces
and applying only transformations that do not change the area,
we have changed the area.

### ♾️ Pinpointing the Problem

So, is there any principle in mathematics which is particularly problematic,
and that we can leave out to avoid contradictions,
keeping the rest?

In fact there is!
It would seem that dealing with infinites is problematic:
adding infinite series,
chopping up figures in sets with infinite points.
But infinites were introduced, remember,
to help deal with paradoxes like those of Zenon:
Achilles running after the turtle but never reaching it
because he had to run an inifinite number of steps.
In particular,
mathematicians have pinpointed the trouble to the same
[axiom of choice](https://en.wikipedia.org/wiki/Axiom_of_choice)
that was introduced in set theory to help deal with sets with infinite elements.

Can we rebuild mathematics without the axiom of choice?
Apparently it's so useful that mathematicians don't want to give it up!
According to wikipedia there have been some efforts to reconstruct mathematics without it,
like [constructivism](https://en.wikipedia.org/wiki/Constructivism_(philosophy_of_mathematics)),
but they are not very popular.

Therefore, if modern mathematics lead to contradiction,
we should reject all of it in a giant exercise of
[_reductio ad absurdum_](https://en.wikipedia.org/wiki/Reductio_ad_absurdum).
And then rebuild all of it with different foundations.
But not many people seem to be willing to do it because it is boring?

## 🤔 Conclusion

We came to logic and mathematics looking for eternal truth,
and we find contradictions hidden in the corners.
I am sure any professional mathematician can relate many other paradoxes
that result in contradictions.

Do I want to conclude,
as many laypeople say,
that logic and mathematics are useless,
since they incur in contradictions?
Not at all;
I think that,
with all their faults,
logic and mathematics can help us think more efficiently.
Being able to identify contradiction is a very helpful skill,
even if sometimes we have to accept it.

But it is still an interesting fact that even logicians and mathematicians
have to accept a little contradiction in their wonderful thought cathedrals,
as long as they are not too bothersome.

### 🙏 Acknowledgements

I have to thank my brother Fernando for telling me
about simple logic paradoxes as a kid,
and for the many discussions afterwards.

# ⏭️ To Be Continued

This is the second part of the series about contradiction.

* Part 1: [🤨 What Is Contradiction?](/2023/contradiction-what-is),
* Part 2: 🧮 Contradiction in Logic and Mathematics,

Stay tuned!

