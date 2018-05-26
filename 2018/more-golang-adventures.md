---
title: 'More Adventures in the Land of Go'
subtitle: 'That Ungoogleable Language from Google, Part 2'
footer: Published on 2018-05-26, last modified on 2018-05-26.
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
---

![Picture credit: [Renee French](https://commons.wikimedia.org/wiki/File:Gophercolor.jpg)](pics/adventures-gophercolor.jpg "Golang mascot")

A couple of years I had the chance to play with Go
(or "Golang" as exasperated people searching on the web often use)
and wrote [part 1](../2016/golang-adventures.html) of this article.
In the last few weeks I have delved deeper into the gopher hole,
and have been discouraged from using it on large projects.
This longish rant explains why.

## More Language Fun

Criticizing those aspects of a programming language that we don't like
is an endless source of amusement.
So there you go.

### Pointless Pointers

After using C for any length of time pointer arithmetic becomes a constant annoyance.
One of the cool innovations in Java was to pass all objects by reference,
so there was no need to use pointers explicitly any longer.

But alas, Go was masterminded by [a member of the Unix team](https://en.wikipedia.org/wiki/Rob_Pike).

![Yes, baby, [they are back!](https://diply.com/shining-movie-facts?publisher=what-the-facts&config=22)](pics/adventures-johnny.gif "Here's Johnny!")

So, suppose that you are writing a `struct` with a setter function:

```go
type Box struct {
        Width int
}

func (box Box) SetWidth(width int) {
        box.Width = width
}

func main() {
        box := Box{5}
        box.SetWidth(10)
        log.Printf("Box width is now %v", coolBox.Width)
}
```

We create a box with width 5, and then set its width to 10.
What do you think will be the result?
If you guessed "10" then you are wrong, it is still 5!
You can [check it for yourself](https://play.golang.org/p/rHShwwYcDu8).

To get the desired behaviour you need to use our
[cool box](https://play.golang.org/p/bRpxq4gZQxX), which uses pointers:

```go
type CoolBox struct {
        Width int
}

func (box *CoolBox) SetWidth(width int) {
        box.Width = width
}

func main() {
        coolBox := CoolBox{5}
        coolBox.SetWidth(10)
        log.Printf("Cool box width is now %v", coolBox.Width)
}
```

This time we get 10 as expected. You can
[play with it](https://play.golang.org/p/bRpxq4gZQxX).

The reason is that functions declared as methods of a regular struct
operate on _a copy_ of the original struct.
Why this is ever needed on this world, I don't really know.
Adding to the confusion, access to a 

This for me was the dealbreaker. But there's more.
Oh so much more.

### Minor Nitpicks

Even the most unimportant things can add up.
Right now it's all coming through in waves.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/x-xTttimcNk?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

#### Capitals Every *Darned* Where

Public attributes and methods in a struct are written using uppercase
while private stuff uses lowercase.
This looks like a nice convention,
but it can force you 

#### Copy _to_ Destination _from_ Source?

While the world slowly converges to a single, logical version of copy
that goes in my mind as "copy _from_ source to _destination_":

```
copy(source, destination)
```

Go programmers have stuck with the older
[C-like](https://twitter.com/hynek/status/991915878051729414)
version:

```go
copy(dst, src)
```

This breaks my mind in surprisingly aberrant ways.
Never mind the obnoxious abbreviations.

#### Obnoxious Abbreviations

Actually, I do mind the obnoxious abbreviations.
Go authors [encourage](https://github.com/golang/go/wiki/CodeReviewComments#receiver-names)
the use of single name variables whenever possible.
I believe this encourages newbies to use the language, 
specifically two-finger typers.

![Two-finger typers like [John Watson](http://slusheeduck.tumblr.com/post/22087492446/john-watson-typing-challenge)](pics/adventures-typing.gif "John Watson types using two fingers")

For everyone else, single-letter variables can quickly become a mess.

## Packages

## Tooling

### `gofmt`

It should be great when the creators of a language
also give you a [nice formatting tool](https://golang.org/cmd/gofmt/).
But remember, `gofmt` is brought to you by the same people who
[mandate inlined brace style](2016/golang-adventures.html#mandatory-brace-style).
So they saw it fit to remove spaces as an option,
and now mandate tabs everywhere.

![Richard Hendricks would [love it](http://popkey.co/m/K9yRZ-tabs-spaces-silicon-valley-funny)](pics/adventures-spaces.gif "Winnie types spaces")

## Momentum

### Performance

## Conclusion

A 

### Acknowledgements

Thanks to
[Hynek Schlawack](https://twitter.com/hynek),
and to everyone else that has helped me on Twitter
with #golang.

