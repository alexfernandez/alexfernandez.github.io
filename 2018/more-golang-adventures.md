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

I will avoid well-treaded ground such as the
[lack of generics]()
or TODO.
I will also center on largish project management.
I still like Go for small trivial projects.

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
Adding to the confusion, access to an attribute is done using `.`
for both structs and struct pointers.

Then at a certain point you realize that passing variables around by value
is slow and uncomfortable:
So you start using pointers for everything.
Anything you see without the dreaded `*` is a pending optimization.
But careful! Because pointers to `interface`s are no good;
for them you need to pass the original interface!
For some reason.

Granted, Go at least has no [pointer arithmetic](http://www.eskimo.com/~scs/cclass/notes/sx10b.html),
but that is a meager consolation.
Adding `*` and `&` everywhere is so backwards.
And don't even get me started on passing slices around,
or you may end up with abominations such as
`*[]*Box`: a pointer to a slice of pointers to `Box`es.

This for me was the dealbreaker. But there's more.
Oh so much more.

### Interfaces

As xxx said,
implicit interfaces are a mess.
Not every class that implements the method `Start()` and `Stop()`
is a `Server`,
and not everything with a `TODO` is a TODO.

Declaring interface pertenence explicitly communicates an intent.

### Minor Nitpicks

Even the most unimportant things can add up.
Right now it's all coming through in waves.

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/x-xTttimcNk?rel=0" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

#### Capitals Every *Darned* Where

Public attributes and methods in a struct are written using uppercase
while private stuff uses lowercase.
This looks like a nice convention,
but it can force you to write capitals more often than you might like.

It is much easier to write private resources with an underscore `_` prefix as in JavaScript.
Making the default behaviour public is more comfy.

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
Never mind the obnoxious abbreviations `dst` and `src`.

#### Obnoxious Abbreviations

Actually, I do mind the obnoxious abbreviations.
Go authors [encourage](https://github.com/golang/go/wiki/CodeReviewComments#receiver-names)
the use of single name variables whenever possible.
I believe this encourages newbies to use the language, 
specifically two-finger typers.

![Two-finger typers like [John Watson](http://slusheeduck.tumblr.com/post/22087492446/john-watson-typing-challenge)](pics/adventures-typing.gif "John Watson types using two fingers")

For everyone else, single-letter variables can quickly become a mess.
Good code is written once and read many times.
In the case of errors you don't even have the option of using `error` instead of `err`,
since `error` is a [pre-declared type](https://golang.org/ref/spec#Predeclared_identifiers).

Apparently we have learned nothing from the whole fiasco of cryptic Unix commands,
which at least were justified by the scarcity of bytes at the time.

## Packaging Your Code

Another source of frustration is the poor support for packaging.
The gold standard for me is Node.js and its [`npm`](https://www.npmjs.com/),
which not surprisingly boasts more modules than any other package manager.

![Source: [Module Counts](http://www.modulecounts.com/)](pics/adventures-modulecounts.png "npm has 600k+ packages, Gopm around 20k")

### Package Layout

There seems to be no official layout for a package.
The [documentation](https://golang.org/doc/code.html#Organization)
shows a somehow messy layout.
There is support for subpackages,
but no standard routes:
code just lies around in the root directory of the package.

Big projects usually have many folders; apparently
sub-sub-subpackages are the only way to go.
This contrasts with Node.js where a single export point can easily be specified,
while maintaining a complex internal structure.

### Package Manager, or Lack Thereof

Go has no official package manager.
[dep](https://github.com/golang/dep)
is labeled as an "_official_ experiment".
It is quite telling that, 9 years after its creation and 6 years after its 1.0 release,
there is still no official package manager.
Contrast this with [Node.js](https://en.wikipedia.org/wiki/Node.js),
released around the same time as the first Go,
which counted with [npm](https://en.wikipedia.org/wiki/Npm_(software)
a few months later.

There are other Go package managers;
the most popular seems to be
[gopm](https://gopm.io/)
which counts more than 20k packages.
Unsurprisingly not many people use it:
the most popular package [golang.org/x/net](https://gopm.io/golang.org/x/net)
only counts around 13k downloads, total.

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

Perhaps there is a reason for preferring a different organization?
In fact, most other languages do not mandate where to keep your code:
you can compile from anywhere on your hard drive.
But the `go` tool will only look at the `$GOPATH` for things like dependencies
and tests.

## Tooling

Since we are already speaking about tooling,
let's complain about it at length.

### `gofmt`

It should be great when the creators of a language
also give you a [nice formatting tool](https://golang.org/cmd/gofmt/).
But remember, `gofmt` is brought to you by the same people who
[mandate inlined brace style](2016/golang-adventures.html#mandatory-brace-style).
So they saw it fit to remove spaces as an option,
and now mandate tabs everywhere.

![Richard Hendricks would [love it](http://popkey.co/m/K9yRZ-tabs-spaces-silicon-valley-funny)](pics/adventures-spaces.gif "Winnie types spaces")

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

Voilà! Looks nice, right?
Now your diff tool says that two lines have changed.
Each long variable you add will increase the number of lines changed,
making it impossible to trace a particular change.

## Momentum

The ability to maintain a project long-term
depends on how attractive it is to its potential developers.
An unpopular language or framework can severely limit its evolution.

### Hard Data

The hype around Go seems to have largely subdued.
Data from Google Trends shows that Go has peaked:

![Source: [Google Trends](https://trends.google.com/trends/explore?date=2009-01-01%202018-05-26&geo=US&q=%2Fm%2F09gbxjr,%2Fm%2F0bbxf89)](pics/adventures-google-trends.png "Max height on April 2014")

Data from Google is however largely suspect:
Go is always above Node.js,
and it starts at around 25% even before it was announced.
I suspect some filtering artifact inflating Go.
Let us see data from Stack Overflow Trends:

![Source: [Stack Overflow Trends](https://insights.stackoverflow.com/trends?tags=go%2Cnode.js)](pics/adventures-stackoverflow-trends.png "Growth stalling around 2016")

Apparently, the opportunity for Go to be the Java killer has passed.

### Performance

A large part of Go's appeal was based on its good performance.
But now it seems that it does not perform so well.
It is around the same ballpark as Java
[source: Debian].
This momentum has gone largely to Rust, which performs about the same as C
[source: Debian]
while being very well liked by the community
[source: SO survey].
It seems as if Rust has stolen Go's thunder.

### Community

Go has a weird situation with regards to community:
it is controlled directly by Google,
which limits the ability of the community to influence its design.
But that is not the worst peril:

## Conclusion

A 

### Acknowledgements

Thanks to
[Hynek Schlawack](https://twitter.com/hynek),
and to everyone else that has helped me on Twitter
with #golang.

