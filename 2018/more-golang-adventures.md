---
title: 'More Adventures in the Land of Go'
subtitle: 'That Ungoogleable Language from Google, Part 2'
footer: Published on 2018-05-28, last modified on 2018-05-28.
  [Comments, suggestions?](mailto:alexfernandeznpm@gmail.com)
---

![Picture credit: [Renee French](https://commons.wikimedia.org/wiki/File:Gophercolor.jpg).](pics/adventures-gophercolor.jpg "Golang mascot")

A couple of years I had the chance to play with Go
(or "Golang" as exasperated people searching on the web often use)
and wrote [part 1](../2016/golang-adventures.html) of this article.
In the last few weeks I have delved deeper into the gopher hole
and have been discouraged from using it on large projects.
This longish rant explains why.

I will center on largish projects while trying to avoid well-trodden ground
such as the
[lack of generics](https://golang.org/doc/faq#generics).
I still think Go is a good option for small trivial projects
when Node.js does not deliver the required performance,
such as intensive computations or simple load tests.

## More Language Fun

Criticizing those aspects of a programming language that we don't like
is an endless source of amusement.

### Pointless Pointers

After using C for any length of time pointers become a constant annoyance.
One of the cool innovations in Java was to pass all objects by reference
so there was no need to use pointers explicitly any longer.

But alas, Go was masterminded by [a member of the original Unix team](https://en.wikipedia.org/wiki/Rob_Pike).

![Yes, baby, [they are back!](https://diply.com/shining-movie-facts?publisher=what-the-facts&config=22)](pics/adventures-johnny.gif "Here's Johnny!")

So suppose that you are writing a `struct` with a setter function:

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
Expert Gophers are probably cringing in their chairs.
The rest of us probably guessed "10" which is of course wrong.
Box width is still 5!
You can [check it for yourself](https://play.golang.org/p/rHShwwYcDu8).

What kind of evil witchcraft is this?
To get the desired behaviour you need to use our new improved cool box:

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

This time we get [10 as expected](https://play.golang.org/p/bRpxq4gZQxX).

Can you tell the difference?
[Methods in Go](https://golang.org/doc/effective_go.html#methods)
can be declared on a struct, thus:

    func (box Box) SetWidth([...])

in which case they operate on _a copy_ of the original struct.
Every invocation results in a new `Box`.
Why this is ever needed on this world, I don't really know.

![[Source](https://giphy.com/gifs/eye-roll-PyPO7ZR8KXbxe).](pics/adventures-rolleyes.gif "Stop and roll your eyes")

Methods can also be declared on a *pointer to the struct*:

    func (box *Box) SetWidth([...])

That small asterisk makes all the difference.
Now the method operates on the original struct and can thus modify it.
Adding to the confusion, access to an attribute is done using the dot '`.`'
for both structs and struct pointers.

The problem is just as confusing for regular functions.
At a certain point you realize that passing variables around by value
is probably not what you want:
whenever you are tempted to modify a value you will get a surprise:

```
func enlargeBox(box Box) {
        box.Width += 5
}

func main() {
        box := Box{5}
        enlargeBox(box)
        log.Printf("Box width is now %v", box.Width)
}
```

Width is of course still 5, since `enlargeBox()` has operated on a copy of the original `box`
([play](https://play.golang.org/p/PDZ7IPN2LoB)).
When this is done five function calls in for a variety of parameter objects
it is not easy to see the problem.

Regular struct access is also slower since you are making copies of structs all the time
and can clog the garbage collector in high performance applications.
So you start using pointers for everything.
Any parameter you see without the dreaded `*` becomes a pending optimization.
But this can be a trap!
Pointers to `interface`s are no good as parameters and
for some reason you need to pass the interface without `*`.
Unless you know by heart which of your objects are interfaces and which are structs
you have to add `*` everywhere and wait for the compiler to complain.

Once you are using pointers consistently, you start getting these fun errors:

    panic: runtime error: invalid memory address or nil pointer dereference

which are equivalent to the infamous Null Pointer Exception in Java,
or the `ReferenceError` in JavaScript.
And that is how pointer safety is compromised.

Granted, Go at least has no [pointer arithmetic](http://www.eskimo.com/~scs/cclass/notes/sx10b.html),
but that is a meager consolation when you have to add `*` and `&` everywhere.
And don't even get me started on passing slices around,
or you may end up with abominations such as
`*[]*[]*Box`: a pointer to a slice of pointers to slices of pointers to `Box`es.

This for me was the dealbreaker. But there's more.

### Minor Nitpicks

Even the most unimportant things can add up.
Right now it's all coming through in waves.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/x-xTttimcNk?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

As has been [said before](https://www.teamten.com/lawrence/writings/why-i-dont-like-go.html),
[implicit interfaces](https://tour.golang.org/methods/10)
are a mess.
Not every class that implements the method `Start()` and `Stop()`
is a `Server`: it can be a `VideoPlayer` or a `Car` in a game.
Declaring interface pertenence explicitly communicates an intent:
this class does this and behaves like that.
But in Go you can never trust that the class that acts like a `Server`
didn't start its life as a `VideoPlayer` or a `Car`.

Go uses capitals Every *Darned* Where.
Public attributes and methods in a struct are written using uppercase
while private stuff uses lowercase.
This looks like a nice convention,
but it can force you to write capitals more often than you might like.

It is much easier to write private resources with an underscore `_` prefix as in JavaScript.
Making the default behaviour public is more comfy.


The `copy()` built-in also makes a weird choice.
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
Never mind the obnoxious abbreviations `dst` and `src`.

![Actually, I do mind the [obnoxious abbreviations](https://imgur.com/gallery/1nEIbxb).](pics/adventures-abbrevs.gif "Stop abbreviating words")

Go authors [encourage](https://github.com/golang/go/wiki/CodeReviewComments#receiver-names)
the use of single name variables whenever possible.
I believe this encourages newbies to use the language, 
specifically two-finger typers.

![Two-finger typers like [John Watson](http://slusheeduck.tumblr.com/post/22087492446/john-watson-typing-challenge).](pics/adventures-typing.gif "John Watson types using two fingers")

For everyone else, single-letter variables can quickly become a mess.
Good code is written once and read many times.
In the case of errors you don't even have the option of using `error` instead of `err`,
since `error` is a [pre-declared type](https://golang.org/ref/spec#Predeclared_identifiers).

Apparently we have learned nothing from the whole fiasco of cryptic Unix commands,
which at least were justified by the scarcity of bytes at the time.

## Packaging Your Code

Another source of frustration is the poor support for packaging.
The gold standard for me is Node.js and its [`npm`](https://www.npmjs.com/)
which not surprisingly boasts more modules than any other package manager.

### Package Layout

There seems to be no official layout for a package.
The [documentation](https://golang.org/doc/code.html#Organization)
shows a somehow messy layout.
There is support for subpackages but no standard paths:
in most packages code just lies around in the root directory of the package.

Big projects usually have many folders; apparently
sub-sub-subpackages are the only way to go.
This contrasts with Node.js where a single export point can easily be specified,
while maintaining a complex internal structure.

### Package Manager, or Lack Thereof

9 years after its creation and 6 years after its 1.0 release
Go still has no official package manager.
[dep](https://github.com/golang/dep)
is labeled as an "_official_ experiment".
Contrast this with [Node.js](https://en.wikipedia.org/wiki/Node.js):
released around the same time as Go
it got [npm](https://en.wikipedia.org/wiki/Npm_(software))
a few months later.

There are other Go package managers;
the most popular seems to be
[gopm](https://gopm.io/)
which counts more than 20k packages.
Unsurprisingly not many people use it:
[golang.org/x/net](https://gopm.io/golang.org/x/net)
is the package most downloaded ever, with about 13k downloads.
These 20k packages are dwarved by the 200k in Java's Maven
and the 600k for JavaScript's npm.

![Source: [Module Counts](http://www.modulecounts.com/).](pics/adventures-modulecounts.png "npm has 600k+ packages, Gopm around 20k")

All kinds of poor excuses can be given,
from the bad average quality in npm to the nature of Go as a "systems language".
In reality Go is often used as a web development language,
it just lacks the libraries.

### Accessing Other Packages

The official way of downloading other packages is therefore to
`go get` them:

```bash
go get github.org/golang/lint
```

This downloads the package `lint` from the `golang` account on GitHub,
and stores it in the `$GOPATH`.
There is no way that I have found to specify a certain version:
the latest version is always used.
Not a good perspective for stability with multiple dependencies
on third party packages;
this may not seem like a good practice anyway,
but is routinely achieved routinely with npm or Java's Maven.

### Single Workspace

While we are at it, where should we keep our code locally?
Again, the [docs](https://golang.org/doc/code.html#Organization)
have this to say:

> Go programmers typically keep all their Go code in a single workspace.
> [...]
> Note that this differs from other programming environments in which every project has a separate workspace and workspaces are closely tied to version control repositories.

Keeping all code together is a poor practice.
Maybe you work for different companies and want to keep their code separate?
Maybe you just like organizing your stuff in a different way?
In fact, most other languages do not mandate where to keep your code:
you can compile from anywhere on your hard drive.
But the `go` tool will only look at the `$GOPATH` for things like dependencies and tests.

![Otherwise it might become distracted and look around your hard drive? [Source](TODO).](pics/adventures-blinkers.png "Horse with eye blinkers strays not")

## Tooling

Since we are already speaking about tooling,
let's complain about it at length.

### `gofmt`

It should be great when the creators of a language
also give you a [nice formatting tool](https://golang.org/cmd/gofmt/).
But remember, kids: `gofmt` is brought to you by the same people who
[mandate inlined brace style](2016/golang-adventures.html#mandatory-brace-style).
So they saw it fit to remove spaces as an option and now mandate tabs everywhere.

![Richard Hendricks would [love it](http://popkey.co/m/K9yRZ-tabs-spaces-silicon-valley-funny).](pics/adventures-spaces.gif "Winnie types spaces")

Another nitpick is automatic reformatting.
Suppose you have this variable declaration at the top:

```go
var (
  i int
)
```

Then you decide to add a new variable `value` and run `gofmt` afterwards.

```go
var (
  i     int
  value int
)
```

Voilà! The first line has been reformatted adding several spaces.
Looks nice with both variables lined up at the `int`, right?
Now your diff tool says that two lines have changed.
Each long variable you add will increase the number of lines changed
making it impossible to trace a particular change.

You can always not use `gofmt` at your peril, of course.
But remember that the rest of the world will probably do.

## Momentum

The ability to maintain a project long-term
depends on how attractive it is to its potential developers:
it is hard to look for candidates to work on an unpopular language or framework.
And the hype around Go seems to have largely subdued.
Data from Google Trends shows that Go has peaked:

![Source: [Google Trends](https://trends.google.com/trends/explore?date=2009-01-01%202018-05-26&geo=US&q=%2Fm%2F09gbxjr,%2Fm%2F0bbxf89).](pics/adventures-google-trends.png "Max height for Go on April 2014")

This dataset is however largely suspect:
Go is always above Node.js and starts at around 25% before it was even announced.
I fear that not even Google is able to filter correctly such a common word.
Let us see data from Stack Overflow Trends:

![Source: [Stack Overflow Trends](https://insights.stackoverflow.com/trends?tags=go%2Cnode.js).](pics/adventures-stackoverflow-trends.png "Go growth stalling around 2016")

This looks more like it.

Go has a weird situation with regards to community:
it is controlled directly by Google limiting the ability of others to influence its design.
This poor starting point leads to a paucity of collaborations in libraries,
and to a weak community around it.
But Go people are apparently happy so they are not likely to do anything about it.

Apparently the opportunity for Go to be the new C has come and passed.
A large part of Go's early appeal was based on being as fast as the proverbial speed king.
In practice it is
[about as fast as Java](https://benchmarksgame-team.pages.debian.net/benchmarksgame/faster/go.html).
Add to this that relying on Go channels can slow your program down a bit,
which happen to be the [main concurrency primitive in Go](https://tour.golang.org/concurrency/2).

![Channels in go, [source](https://tenor.com/search/snail-gifs).](pics/adventures-slow.gif "A snail on a turtle")

The momentum has gone largely to Rust, which performs
[about the same as C](https://benchmarksgame-team.pages.debian.net/benchmarksgame/faster/rust.html)
and much faster than [Go](https://benchmarksgame-team.pages.debian.net/benchmarksgame/faster/rust-go.html).
Rust is at the same time
[very well liked by the community](https://insights.stackoverflow.com/survey/2018/#most-loved-dreaded-and-wanted).
In short, Rust appears to have stolen Go's performance thunder.

At the same time Node.js has not lost an iota of popularity,
even with the [high](https://auth0.com/blog/whats-tjs-stack-these-days/)
[profile](https://thenewstack.io/another-respected-developer-says-farewell-to-node-js-and-hello-to-go/)
defections.
Its robust appeal comes from using JavaScript
which is still evolving rapidly.
Even if it is
[not as fast as Go](https://benchmarksgame-team.pages.debian.net/benchmarksgame/faster/go-node.html)
it happens to be fast enough for most applications.

## Conclusion

A successful organization needs to carefully evaluate a language or platform
before using it for any significant projects.
A largish project comes with a long-term commitment to maintain it.
Adopting a new language also brings the implicit compromise to hire knowledgeable people.
Go does not look like a solid bet for large projects at this point.

Apart from the corporate babble there is a glaring conclusion:
Go quickly stops being fun when more ambitious projects are tackled.
The language is cumbersome and has suffered from a lot of weird choices;
it does not seem like they are going to be revised any time soon.
The toolset is not as good as it believes it is.
I think that Go can still be a good fit for small utilities that require better computing performance than Node.js
but do not need the power of C.


### Acknowledgements

Thanks to
[Hynek Schlawack](https://twitter.com/hynek),
and to everyone else that has helped me on Twitter
with #golang.

