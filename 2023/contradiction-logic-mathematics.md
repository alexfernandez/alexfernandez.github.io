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
by [Peirce](https://en.wikipedia.org/wiki/Benjamin_Peirce).
In 1874 [Cantor](https://en.wikipedia.org/wiki/Georg_Cantor) published an article that started
the field of [set theory](https://en.wikipedia.org/wiki/Set_theory).
Soon afterwards in 1889 number theory was systematized around
[a few axioms](https://en.wikipedia.org/wiki/Peano_axioms)
by [Peano](https://en.wikipedia.org/wiki/Giuseppe_Peano),
based on set theory.

At the turn of the century it was time to seek the logic underpinnings of it all.
A set of wonderful pioneers,
including [Frege](https://en.wikipedia.org/wiki/Gottlob_Frege)
[Russell](https://en.wikipedia.org/wiki/Bertrand_Russell),
[Whitehead](https://en.wikipedia.org/wiki/Alfred_North_Whitehead)
and [Hilbert](https://en.wikipedia.org/wiki/David_Hilbert)
formalized set theory and mathematical logic.
They introduced [first-order logic](https://en.wikipedia.org/wiki/First-order_logic),
which has symbols like `∀` "for all", `∃` "exists", ∈ "belongs".

Russell brought out his famous [paradox](https://en.wikipedia.org/wiki/Russell%27s_paradox):
if we have the set of all sets that do not belong to themselves,
does it belong to itself?
Sounds like a stupid question, but 

### 🙅 Back to Contradiction

## 🏛️ Rebuilding Maths

Once the foundations for mathematics were laid out,
it was time to rebuild them based on logic.

### 🙅 Back to Contradiction

The problem of having a huge rigorous building built out of a small set of principles
is that it has to be **completely consistent**:
any contradiction that arises in any of its branches means that the building is inconsistent.
So we can look in the darkest corners of mathematics looking for cracks,
and any paradoxes we find will **invalidate the whole of mathematics**.

Let us poke for a bit to see what we find.

### ♾️ Ramanujan Summation

What do you think the sum of all positive numbers is going to be?

```
1 + 2 + 3 + 4 + 5 + 6 + ⋯ = ?
```

It is a [well known result](https://en.wikipedia.org/wiki/Ramanujan_summation)
from the Indian prodigy [Ramanujan](https://en.wikipedia.org/wiki/Srinivasa_Ramanujan)
that the sum is -1/12:

```
1 + 2 + 3 + 4 + 5 + 6 + ⋯ = -1/12.
```

The proof is quite interesting as it involves a few infinite series;
you can see it in the
[Wikipedia article](https://en.wikipedia.org/wiki/1_%2B_2_%2B_3_%2B_4_%2B_%E2%8B%AF),
or you can watch this [excellent 7 minute Numberphile video](https://www.youtube.com/watch?v=w-I6XTVZXww).

This formula is not just a mathematical trick;
a more rigorous proof can be found by
[regularization of the zeta function](https://en.wikipedia.org/wiki/Zeta_function_regularization).
The result is used in physics to get meaningful values of divergent series.
It is still a contradiction:
the sum is divergent (tends to infinity),
yet it can be shown to converge (tends to a finite value).

```
1 + 2 + 3 + 4 + ⋯ → ∞ ∧ 1 + 2 + 3 + 4 + ⋯ = -1/12. 
```

### 🌐 Multiplying Spheres

A very interesting result is the
[Banach–Tarski paradox](https://en.wikipedia.org/wiki/Banach%E2%80%93Tarski_paradox),
published in 1924:
it is possible to break up a sphere into a finite number of pieces,
then reassemble them into **two identical spheres**,
therefore doubling the volume.

![The miracle of the multiplying spheres. Source: [bdesham and Sean Kelly](https://en.wikipedia.org/wiki/File:Banach-Tarski_Paradox.svg).](pics/contradiction-banach-tarski.svg "A solid sphere is broken into a finite number of pieces, then reassembled into two identical spheres.")

Is this possible only with three-dimensional bodies?
In fact [von Neumann](https://en.wikipedia.org/wiki/John_von_Neumann)
[discovered in 1929](https://en.wikipedia.org/wiki/Von_Neumann_paradox)
that the same trick can be done with a planar figure:
take a flat circle,
divide it into parts,
move and turn those parts,
and then reassemble them into two flat circles.

## 🤔 Conclusion

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

### 🙏 Acknowledgements

I have to thank my brother Fernando for teaching me about simple logic paradoxes
as a kid.

