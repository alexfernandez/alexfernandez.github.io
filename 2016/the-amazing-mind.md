---
title: The Amazing Mind
subtitle: 'Concepts And Relations Are Everything'
footer: Published on 2016-12-11, last modified 2016-12-13.
  [Comments, improvements?](https://twitter.com/pinchito)
---

![Máquina de sueños, by [Fernando Vicente](http://www.fernandovicente.es/pinturas/anatomias)](pics/maquina-suenos.jpg "La máquina de sueños")

## How Does The Mind Work?

Our mind is a strange thing.
For starters, it is able to study itself.
How many things do you know that are able to study themselves?
It can create theories to explain how it works,
or assign some meaning to its existence.
It can even ponder its place in the Universe.

Science has had enormous success explaining how other things work.
From the largest galaxies to the smallest particles,
passing through most objects around us,
we have created satisfying theories even if they still have large gaps;
it would seem as it was just a matter of time before they are filled.
But for all our efforts,
we have remarkably little to show as to the inner workings of the mind itself.

Sure, we know that the brain is made of neurons;
we have accurate maps of when they fire and why;
we know of our many failings and biases in most areas of thought.
But how do firing neurons become ideas?
How are concepts stored in our brains?
This large chasm between the physical world and the realm of psychology
is still largely a mystery.
Even if we can simulate a small network of neurons
and make it recognize a cat from a dog,
there are no insights in artificial intelligence
that can explain how the human mind processes information about the world around us.

It is my view that we need a new effort to explain how the mind works from first principles,
instead of trying to come at it from the low level of neuron constructions
or from behavioral examinations of our many failings.
This article is an attempt to come at such a basic explanation,
see how it explains common phenomena that we can observe every day,
and only then look at how it might be implemented inside our skulls.

## Concepts

Let us start with the most basic element of thought:
a concept.
We will define it as anything that can be thought about.

A concept is connected to other concepts by relations.
These relations can in turn become new concepts.
So, how can a concept be defined?
Only in its relation to other concepts.
And how can a relation be defined?
Only as the way to associate two or more concepts.

Let us for now accept this circular definition,
even if it is not particularly rigorous.
The usual definition for “concept” only includes abstract ideas
that can be applied to many situations.
Our concept however includes concrete things.
I can definitely think about my neighbor's dog,
or about the topmost hair on some person's head;
from the moment that I think about it,
and that it starts having relations to other concepts,
it becomes a concept in itself.

Each person has embedded in their mind a network of concepts,
specific to themselves.
For instance,
if my mother usually wore red clothes
it would only be natural if in my mind the concepts of
“red” and “mother” were associated.
That relation may make no sense to many other people.

### Relations

A relation is what associates two concepts.
But a very peculiar circumstance of how the mind works is that relations can be thought about,
thus becoming concepts.

The following diagram shows how a concept for
“my neighbor's dog” might emerge from simpler concepts, step by step.

![Relations turning into concepts.](pics/relations-into-concepts.svg "A relation turns into a concept: the line between “me” and “neighbor” becomes the concept “my neighbor”, and the line between “my neighbor” and “dog” becomes “my neighbor's dog”.")

First a relation between the two concepts “neighbor” and “me” arises,
which is then fleshed out as the concept “my neighbor”.
Then this concept is associated with “dog” with a new relation,
presumably when I learn about “my neighbor's dog”,
which is then set us as a standalone concept.

This kind of structure is intriguing.
Why are relations bidirectional instead of unidirectional?
And why not associate a meaning on the relation,
as is commonly done in language?
We can assign the meaning “has a” with a directed line between “my neighbor” and “dog”,
so we have the relation spelled out as “my neighbor has a dog”.
Then we can assign “is a” between “my neighbor's dog” and “dog”,
and add “possesses” between “my neighbor” and “my neighbor's dog”.
But these exercises are futile:
they are not clarifying the existing relations,
but adding new relations on top of them.
It is easier to see the problem on the top relation between “me” and “neighbor”:
I don't possess the neighbor,
nor does she possess me.
There is in fact no special meaning in that concept;
in the deepest sense there is just a neighbor that relates to me,
and that is what “my neighbor” conveys.
There is no need to have directed relations.

It is tempting to try and think how this kind of structure can be implemented using neurons.
It would also be premature at this stage.
Each concept might be a group of neurons,
and each relation might be a neuron connecting them,
which might eventually be grouped with more neurons to form a concept.
Or a relation might just be a number of prolongations
emerging from one concept (or group of neurons) to the next.
It does not really matter at this stage,
and any supposition is equally plausible until validated by experiments.

### Visual Thinking

For some people,
thinking can be visual, auditory or tactile.
But it does not necessarily fall out of the concepts we have just defined.
Concepts can be visual:
as long as we can think about something,
it is a concept.
And we can easily think about the color green, for instance.


From its visual origins concepts can take a life of their own
in a more abstract plane where they are no longer associated with their visual origins.
The same happens with sounds or any other sense.

### The Accelerating Mind

It is a common experience that as we age time appears to go faster.
How can we make sense of this phenomenon using our definition?
As we grow older we have more and more concepts in our brain.
Any new concept needs to be related to the existing concepts;
therefore an older person will assimilate new information more slowly.

When processing any situation,
an old person will have to check many different concepts
and see how they relate to the present instance.
The response will be slower, but more thorough.
A younger person may react faster to it,
but not take into account a vital relation.

There is no need to postulate slower firing neurons or any other physical mechanism;
just the accumulation of concepts in the mind.
Our brains work just as fine when we are twenty than when we are six,
but they process less information since creating a new concept is more costly.

### Memory

Armed with this picture it is very easy to see how memory works.
The very existence of relations links concepts together;
it means that retrieving once concept will make it easier to travel to linked concepts
using these relations.
When I think about my neighbor and dogs at the same time,
my mind will immediately drift to my neighbor's dog.

That is how memories are encoded, but not all of them.
There needs to exist a different kind of memory:
a temporal repository which stores sequences of events
and links them together in order.
From there another mechanism extracts concepts
and reinforces those that already existed,
putting them in relation.

Dreams are usually influenced by the events we have experienced.
Maybe they are a by-product of the mechanism that distilles the linear memory into concepts.

### Subconscious Relations

Not all relations are conscious:
sometimes we know that there is a relation between two concepts
but cannot explain why.

The process of thought that creates a relation
is not always remembered, or even known.
Children do not form long-term memories until they have a certain age,
usually two or three years.
Their brains are furiously creating new concepts before that time,
but there will be no reminiscence of how they were created.
Our innermost concepts are deeply influenced by these primordial concepts and relations:
after all, a relation is stronger when just created,
even though it is later molded by a thousand experiences.
It is easier to remember the first kiss than all those that follow them.
But unfortunately no recollection is kept for these first years.

When we find a subconscious relation we tend to justify it using conscious means.
This is just how the mind works:
it creates concepts to refine other concepts.
It can even create stories from patchy recollections.

### Behavior

We know that certain things give us pleasure,
while others cause pain.
Each concept may be associated with either pain or pleasure.
Concepts related to those will in turn inherit some of that association.
It is well known that experiencing something that reminds us of a painful experience becomes painful by association.

We can postulate a “pleasure concept” which associates with other concepts
to make them pleasurable,
and similarly with a “pain concept”.
This would be related to the brain's “pleasure center”.
But in fact there are many different types of pleasure,
and thus many pleasure concepts.
This area certainly needs more work.

Our behavior is controlled to a certain extent by pleasure and pain:
we tend to repeat conducts that result in pleasure and avoid those that cause pain.
Thus we will seek to stimulate pleasurable concepts,
and just by thinking about them will yield pleasure by association.

### Mourning

People in mourning take a long time to accept the loss of someone near.
The closer the deceased was, the longer it takes.
This process can be seen as rewriting one's mind:
all of the concepts that related to this person need to be updated
with the new information that they are no longer alive.
Until the concept of “death” is associated with all concepts related to the deceased person,
the mourning individual will not have completely accepted the death.

The process is very painful as it requires evoking the loss every time a concept is revised.
After a time, fond memories of the departed will take over
and the process of healing will be complete.

## Words

We now turn to another crucial element of how the mind works:
words.
At least the rational mind uses them:
there is little evidence that animals can use words,
except perhaps some parrots,
and then only in a limited capacity.

The definition of a word is not an exact process.
If we asked a thousand people to define the term “dog”,
each person will probably give a different definition.
It is interesting to note that illiterate people, like children,
do not possess the concept of “definition”.
They just explain what a word means by analogy, metaphora or euphemism:

* “A dog is an animal”,
* “A dog has sharp teeth”,
* “A dog is a man's best friend”.

It is very hard to make them attempt a definition which aims to be complete and unambiguous.

So, what is a complete definition of a word?
In the case of “dog” it is a kind of animal,
so to provide a thorough definition a full description might be required:
anatomy, phisiology, evolution, history.
The process becomes more and more ridiculous
as we go down to describe all of the peculiar proteins that conform its genetic code.
It might be reasonable to stop once we reach a certain level.
But this is just for one kind of dog:
how can one be expected to specify aspect or size for an animal
which is bred into such an enormous number of races and varieties?
What about mixes?

We may be tempted to just give enough information
to tell a dog apart from other similar animals,
but even then there are complications.
There are many different meanings for any common word.
A “dog” can be an animal,
but it can also be a colloquial way to call a friend,
a derogatory term for a person,
a tool,
or a Chinese zodiac sign.
For “dog” we may identify the animal as the primary meaning;
for other words such as “beauty” we have no such luck.
“Beauty” can refer to a beautiful person (usually a woman),
to the property that beautiful people have,
or to anything particularly desirable.
Any complete definition would need to include these other meanings.

Then there are regional variations of what the word means,
which can be searched until we find small groups that use it for different purposes.
Temporal shifts in the use of the word can also be relevant.
Then there are uses of the word in popular culture that add connotations,
change its purpose or make it adopt new meanings.

In short, it is impossible to yield a complete definition.
Any word is inextricably linked to many other words,
and those in turn to others,
until to explain any basic idea you need to describe the whole world.
To explain a word is thus to place it in relation to the world.

Each word has infinite notes that define it.
A definition stops arbitrarily at a certain level of detail,
which differs from a dictionary to an encyclopaedia.
For any given speaker,
the definition tapers to personal stories about encounters with what the word represents.

### Words And Concepts

Is a word a concept?
Undoubtedly:
as we have seen words are defined by their relation to other words,
just as concepts.
To be precise,
there is an underlying concept for every word,
which is what we think about when we hear it.
But the reverse is not necessarily true.

There are many concepts in our mind to which we have not yet given a particular word.
Others can only be described by a combination of words,
such as “the feeling I get when I enter an enclosed space that makes me comfortable”.
I can recognize it,
speak about it or try to define it;
but I don't have a word for it.
Yet; I may later learn that there is a word for it.

Concepts that are not words are at the center of non-verbal thought.
It can also be called “pre-verbal thought”:
we can usually trace these thoughts later using words.

It needs to be pointed that some words are not originally concepts:
they are merely grammatical aids to express our ideas.
Words like “the”, “at” or “thus” do not have regular definitions,
just descriptions as parts of the sentence.
But since they can be thought and reasoned about,
they automatically become concepts.

### Words On Words

Language is the only tool that can be extended to be used on itself.
That is, we can use a word to refer to other words.

Philosophy is the art of reasoning,
while Grammar is the study of language.
Both are highly self-referencing:
Philosophy is reasoning about reason,
while Grammar is speaking about words.
It is probably not a coincidence that the first philosophers
appeared in the same cultures as the first grammarians:
they were using language on itself,
first to study concepts and then to study words.

### My Blue And Your Blue

Is the color blue that I see the same as the color blue that you see?
There is a very simple answer to this question using our definition:
no, my color blue is different than your color blue,
and will always be.
Remember, a concept is defined by its relations to all other concepts.
Since those relations cannot be the same for two different people,
the underlying concept is necessarily different.
Same word, different concepts.

My color blue is thus unique.
My concept of “blue” is tinged by all of the experiences that I have had in my life where the color blue has played a part:
all of the blue things that I have seen have left an imprint in the network of concepts that define “blue” for me.
The same happens to any other person,
and so each one will have a different sensation when they see something blue.
If my relation to blue things has been predominantly positive I may like blue things.
Conversely, if I have had a very negative experience involving the color blue
then I may dislike blue things, consciously or not.

But while words can be shared, concepts cannot.
In using a word we are accepting the inputs of other people on it.
Each time we hear a word we are adding notes to it.
When people live together they tend to align their words
because of all the shared notes,
caused by the shared experiences.
This works for families, cultures and civilizations.

People living apart will have their words diverge in time.
When different cultures meet and coexist,
they tend to share words directly
instead of molding existing words to suit the common needs.

## Reality

In this section we will delve into more philosophical grounds.
Reality is supposedly an objective construct that is independent of any person
looking at or thinking about it.
But as we will see,
reality is much simpler and much more complex at the same time.

Reality is formed by all the words that exist.
Each person has a different view of the world
which is formed by all of the concepts they handle.
But as we have seen concepts are not shared.
If we want to build a shared view of the world
it needs to be done with words,
imperfect as they are in capturing concepts.
This common view is thus reality.

Each person that communicates with others exposes their own version of reality
and has to adjust to the reality that the others have to offer;
otherwise there can be no exchange of ideas.
Just as words are molded by every use,
so is reality;
it is elastic and adapts in time to the different uses.

### Reality And Truth

Does saying an idea enough times make it true?
Not necessarily; but it makes the idea part of reality.
In that sense, any idea becomes more real the more it is repeated.
It takes considerable effort to distinguish “real” from “true”,
and for many people there is no difference.

Many people will speak about their favorite characters in a novel or a TV show
as if they were true people.
Since they have entered our collective minds
they have become part of reality,
and therefore they are real.
In a sense they are more real than living people who are unknown to us.
It is this particular sense of “real” in which we are speaking now.

The moment a character is invented and unleashed upon the world
it becomes real since it is part of the new reality.
It can be talked about,
imagined and reasoned about.

There must be an underlying world which is not made of words or concepts,
to which we refer indirectly when speaking.
It is the world that causes our perceptions,
and which we can know only in a mediated capacity.
The old Spanish master García Calvo made the distinction between
“the world where we speak”
and
“the world about which we speak”,
where the first is the unmediated world of true things
and the second is the reality made of words about which we speak.

Albert Einstein once said:

> Insofar as the propositions of mathematics give an account of reality they are not certain; and insofar as they are certain they do not describe reality.

Similarly, words that refer to reality are not true; and words that are true cannot refer to reality.
Words can either refer to the world where we speak, or to the world about which we speak;
but not to both.

## Conclusion

A theoretical framework of how concepts are manipulated is very useful to understand how the mind works.
It is not backed yet by experiments or low-level observations,
just by a bunch of anecdotal observations.
But it should be a promising approach for the study of the mind.

### Acknowledgements

Special thanks to
[Carlos Santisteban](https://twitter.com/zuiko21)
for many stimulating talks a few years ago.

### References

* Agustín García Calvo:
[Del lenguaje](http://www.editoriallucina.es/articulo/del-lenguaje_19.html) (in Spanish), 2015.
This book, together with the
[second](http://www.editoriallucina.es/articulo/de-la-construccion-del-lenguaje-ii_17.html)
and
[third](http://www.editoriallucina.es/articulo/del-aparato-del-lenguaje-iii_18.html)
parts,
explains how language is formed and its relationship with reality.

