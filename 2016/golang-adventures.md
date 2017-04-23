---
title: Adventures in the Land of Go
subtitle: 'That Ungoogleable Language from Google'
footer: Published on 2016-02-22.
  [Comments, improvements?](https://twitter.com/pinchito)
---

![Picture credit: [Ian Silvernail, Institute for Applied Ecology](https://commons.wikimedia.org/wiki/File:Camas_pocket_gopher_(2)_crop.jpg)](pics/gopher.jpg "Camas pocket gopher")

This week I had the opportunity to play with Go
(or "Golang" as has come to be known)
for a work-related project.
It is not the first occasion that we meet,
but now I am serious about it.
And after the first few days I have to vent my frustrations with the language.

I don't want to sound bitter needlessly,
although to be honest I don't care much as long as it's for comedic effect.
So sit down and relax while I pound on the web's new favorite language.

## The Language

Oh what fun it is to criticise a computing language.
Let's start there.

### Adding Elements to an Array

Say you have an array and you want to add an element.
You start with this innocent Google search:
[golang array append](https://www.google.es/search?q=golang+array+append).

The first link, as it happens, is a
[long, long wormhole](https://blog.golang.org/slices)
that carefully explains how arrays and slices are different,
that what you thought until now were arrays were instead slices,
and that arrays contain a fixed number of elements.
Armed with that knowledge,
you will promptly ignore all of that crap
and just use slices throughout lest your head explode in denial.

So, why bother with arrays at all, you say?
Probably it's a clever low-level mechanism
that is even more cleverly hidden by slices.
It remains to be seen if with a little bit more cleverness
they could have been hidden from sight completely.

Just one lesson remains through all that noise:
arrays in Go are _not_ resizeable,
so you will have to write:

    array = append(array, newElement)

to your eternal annoyance.

### Error Management

Sick of the `if (error) return callback(error)` bullshit in Node.js?
Brace yourself.

Functions can return several arguments:

```
func getObject(value Object) (Object, error) {
    return value, nil
}
```

Cool, you can return `nil` instead of the second argument.
So you probably can return `nil` also as the first argument if there is an error.
**Bzzzt!** Wrong.
*Obviously* you cannot
[return `nil` as a struct](https://www.reddit.com/r/golang/comments/2xmnvs/returning_nil_for_a_struct/),
for reasons that are very well explained in that link
(and that I will probably fail to understand if I live five consecutive lives).

So when you find an error you have to return an `empty` object,
which has to be initialized first:

```
func getObject(value Object) (Object, error) {
    empty := Object{}
    conn := connectToDatabase()
    if err != nil {
        return empty, err
    }
    newObject, err := accessDatabase(conn, value.Key)
    if err != nil {
        return newObject, err
    }
    return value, nil
}
```

So now be ready to write this bit quite often:

    if err != nil {
        return empty, nil
    }

Of course, with non-optional braces.
At least the bit `if (error) return callback(error)` was an invariant;
now you have to write three lines tailored to your particular return values.
Ugh.

### Variable Declarations

This one looks inoffensive enough
but it can be most annoying.
To declare and define (give value) a variable
you use the `:=` operator:

    a := 5

While to just give a value to an existing variable
you use the `=` operator:

    var a string;
    a = 5

Now what happens is that if your code uses the same variable several times
(for instance the ubiquitous `err`) you will find this joy:

    err := callFirst()
    err := callSecond()

results in

    main.go:10: no new variables on left side of :=

Therefore you have to change the second invocation to:

    err := callFirst()
    err = callSecond()

Ending one of the joys of programming, the ease of copy-paste.
Or you can define the variable ahead of time with this clumsy wart:

    var err error

Observe that the error message says "no new variables":
it is OK to reuse `err` as long as there is a new variable there.

    first, err := callFirst()
    second, err := callSecond()

This works!
So one new variable and one old variable is fine;
but only old variables is not.
Even ignoring the return value is _not_ OK:

    _, err := callFirst()
    _, err := callSecond()

This fails, don't ask me why;
just the compiler being helpful I guess.
The end result is that you spend time changing `=` to `:=` and viceversa,
for no good reason.

Every time I have to waste time doing absurd changes I think:
"I'm too old for this crap".

### Implicit Conversions

Did you know that in Go you cannot simply divide
`6 / 4` and expect the answer to be `1.5`?
It does not [perform implicit conversions](https://groups.google.com/forum/#!topic/golang-nuts/LXL4L0jzWXU)
as you might expect from a language designed this century.
So you first have to do an explicit conversion,
leading to such fun errors as:

> cannot use n / d (type int) as type float32 in return argument

But as it happens, Go isn't even able to compare an integer with a float:

```
    var myFloat = float64(5)
    var myInt = 5
    if myFloat > myInt {
        return true
    }   
...

invalid operation: myFloat > myInt (mismatched types float64 and int)
```

This is clearly going too far with one's beliefs
against automatic conversions.
This is why you will occasionally see unholy messes like this:

```
    var myFloat = float64(5)
    var myInt = 5
    if myFloat > float64(myInt) {
        return true
    }   
```

But this same line with constants works, just to annoy you personally:

```
    if 1 > 2.0 {
        return true
    }   
```

### Mandatory Brace Style

Some people like the correct style for braces: nice and symmetrical.
I'm talking of course of the "brace on the next line" school of thought:

```
if something
{
    something else
}
```

Other people like the more compact notation with "brace on the same line":

```
if something {
    something else
}
```

It is of course wrong, and in fact many of the proponents then add an empty line
to make the code less compact.

```
if something {

    something else
}
```

It is not important, but as you probably have noticed
it is unimportant things that often raise the worst passions.

Here Go takes sides, and chooses the worst possible solution:
mandating one true style.
From the [FAQ](https://golang.org/doc/faq#semicolons):

> the advantages of a single, programmatically mandated format for all Go programs greatly outweigh any perceived disadvantages of the particular style.

That is not cool, people.
You may shut up Googlers from having the sempiternal brace debate,
but you cannot
[shut](https://groups.google.com/forum/#!topic/golang-nuts/rzLzp_Z74ik%5B1-25%5D)
[us](https://www.reddit.com/r/golang/comments/2jpzpd/brace_yourself_a_small_script_for_converting/)
[people](http://zerospace.org/goallman.php)
[up](http://comments.gmane.org/gmane.comp.lang.go.general/19965)!

### Just Making Shit Up

Sometimes you get the impression that,
as the creators of Go went along,
they realized they had forgotten some very basic capability
and added it as a ["built-in function"](https://golang.org/pkg/builtin/).
There are 15 of these abominations.

A good example is [maps](https://blog.golang.org/go-maps-in-action).
So you declare an array of campaigns:

    var campaigns map[string]Campaign

But then have to populate it, how?
Easy, with a built-in function:

    campaigns = make(map[string]Campaign)

There you have to specify the kind of map you want to make, again.
Why? You already know the type, Obnoxious Gopher!

The fun doesn't end with `make()` though.
Just look at what they have to say about `println()`:

> Println is useful for bootstrapping and debugging; it is not guaranteed to stay in the language.

Therefore declaring that bootstrapping and debugging is not guaranteed for these frolicking gophers.

Granted, there are also built-in functions in JavaScript,
[about 12](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects).
Of these, `escape()` and `unescape()` are holdouts from a different era;
`eval()` is widely discredited, and so on.

In the end `parseInt()`, `parseFloat()` and the URI things
are the only functions in use,
and they are quite low-level really.

## The Redis Driver

So you want to do some easy task, say:
access a local Redis database.
Let's find a simple driver.
Redis is one of the
[most popular NoSQL databases](http://stackshare.io/posts/top-50-developer-tools-and-services-of-2015#top-50),
and Golang has [more than 100k packages](http://www.modulecounts.com/),
rivalling Maven or rubygems.

![[Module Counts](http://www.modulecounts.com/)](pics/modulecounts.png "Module Counts for many popular package repositories")

So it shouldn't be hard to find a nice and robust package
to access Redis from Go, right?

Right???

### Redigo

This is one of [the recommended clients for Redis](http://redis.io/clients#go).
In [the documentation](https://godoc.org/github.com/garyburd/redigo/redis)
it claims:

> The Conn interface is the primary interface for working with Redis.
> Applications create connections by calling the Dial, DialWithTimeout or NewConn functions.
> In the future, functions will be added for creating sharded and other types of connections.

To what I say: WAT.
No introduction, no "hello world", no nothing, just this?
You can do better, Redigo.

Also, it does not present a nice API.
You end up writing something that looks like this gem,
from the docs:

    n, err := conn.Do("APPEND", "key", "value")

I won't be using it soon.

### Go-redis

Apparently [this package](https://github.com/go-redis/redis)
is complete and well documented. Nice, huh?
So you want to install onto your Debian testing machine,
and this happens:

```
$ go get gopkg.in/redis.v3
# gopkg.in/redis.v3
../../.gocode/src/gopkg.in/redis.v3/pool.go:144: undefined: atomic.Value
```

What is this evil?
Googling `go-redis "undefined: atomic.Value"` will not yield an answer,
but Google helpfully removes the quotes and returns this
[related page](https://github.com/ethereum/go-ethereum/issues/1584)
for a different project:

> You need Go 1.4 or a later version to build go-ethereum.

Alas, Debian packs Go 1.3, and the latest Ubuntu with long term support
(14.04) is even worse: Go 1.2.

So at this point backwards compatibility is not one of the selling points for Go.

In the end I had to use Go 1.6 to get acceptable performance,
so this issue was solved.
But I was already using a different package and stuck with it.

### Radix

Then I was lucky enough to find
[Radix](https://github.com/mediocregopher/radix.v2).
It is also a "minimalistic" (i.e. dumb) package that doesn't even attempt to construct
the Redis command for you,
so you end up writing things like this gem from the
[docs](https://godoc.org/github.com/mediocregopher/radix.v2/redis):

    err = client.Cmd("SET", "foo", "bar", "EX", 3600).Err

Apparently Salvatore Sanfilippo likes this kind of hardcore stuff,
since Radix is also a [recommended client](http://redis.io/clients#go).
I don't like this stuff, so moving on.

### Godis

This driver works reasonably well,
but it hasn't been updated since 2012.
An ominous note on [the front page](https://github.com/simonz05/godis)
states:

> 13 Aug 2012
> Currently very busy with work, and I don't have the time to fix some of the pending issues at hand.

And nothing else;
frankly it looks like the recovered diary from a long lost expedition.

So now let's read a hash of organizations from Redis:

    elem, err := driver.Hgetall(key)
    if err != nil {
        return err
    }
    log.Printf("orgs ", len(elem.Elems))
    if len(elem.Elems) == 0 {
        return errors.New("Organizations not found")
    }
    for index, subelem := range elem.Elems {
        log.Printf("read ", subelem.Elem.String())
        if index % 2 == 0 {
            continue
        }
        organization := Organization{}
        err = json.Unmarshal(subelem.Elem.Bytes(), &organization)
        if err != nil {
            return err
        }
        err = readCampaigns(organization.Id)
        if err != nil {
            return err
        }
    }
    log.Printf("Read %v campaigns", len(campaigns))
    return nil


This is like a kaleidoscope of weird issues.
Godis returns everything in `Hgetall()`:
keys and values mixed in an array,
just as the raw output of Redis.
So you have to skip every other element to get at the values.

Since Go doesn't have generics, you will have to repeat this crappy code
every time you want to read a different hash.

I don't really know why I'm sticking to this package, to be honest,
but it works and it's fast, so please leave me alone.
I'll cry when I need to change to something else.

## Tooling

This area is of course ladden with misery and despair,
with a few bright spots.

### Anal Retentive Compiler.

The behavior of the compiler with unused variables and imports
is unmeasurably annoying:
not a warning but an error that prevents code to be run.
This means that,
when you are experimenting with some new feature,
you have to craft utterly perfect code before running it
just for the compiler to be happy.

This is nothing that has not been
[said better before](http://www.evanmiller.org/four-days-of-go.html),
so I'll leave it here.
Just one nitpick:
why forbid unused imports and variables, but allow unused functions?
Aren't unused functions equally (or even more) dangerous?
This question has been bothering me for some time,
so if you have an answer please let me know.

### Testing

There is a very nice feature of the toolchain:
[integrated testing](https://golang.org/pkg/testing/).
You can write a few tests as functions that start with `Test...`
and run them all using `go test`. Nice!

Of course, it doesn't come without its share of weirdness.
For starters, you may not mix testing code and regular code.
I know this filthy habit of mine is frowned upon in many circles,
but it is often quite handy:
change your code, then scroll down and change the tests.
At least I would like to have the option.

Then, files that contains tests _need_ to be called `..._test.go`.
This seems like a sensible addition,
until you try to autocomplete from the console to access your regular file
`campaigns.go` instead of your testing file
`campaigns_test.go`:

```
$ campaigns[tab]
campaigns.go campaigns_test.go
```

One extra key per file! Outrageous.
As long as you avoid the urge to name your testing file
just as your regular file,
and name your tests `integration_test.go`
or `convoluted_test.go`, all is fine.

## The Help

You are programming in Go, so you are probably going to need some help.
How do you go about it?

### The Name

First, let me get this off my chest:
why on Earth would someone create a language with a name
that cannot be searched?
Especially someone working for Google,
which (in case you have not noticed)
runs the world's biggest _search engine_!

People, if you ever create a language,
use a distinctive word that can be googled.
"Golang" would have been fine; "Go" is
[the 35th most common word in English](http://www.wordfrequency.info/free.asp?s=y).
Not cool.

Usually it is fine to search for "golang...",
but once in a while you forget and are greeted
by innumerable pages helping you play Go (the Eastern board game),
or some other weird stuff
(did you know there's a game called "Go Repo", now I do).

### Documentation

With JavaScript finding help is very easy:
the semi-official docs are in the
[MDN](https://developer.mozilla.org/),
and help is usually found on the well known
[Stack Overflow](http://stackoverflow.com/).

Now Go had it *much* easier:
there is an official creator, sponsor and source
for everything Go.
Why then is everything spread in a lot of places?

* Some questions are answered on StackOverflow, yes,
but others are only found in arcane Google Groups,
and even others are on Reddit, for crying out loud.

* The official documentation is too terse and lacks examples.
For those, you have to go to [The Go Blog](https://blog.golang.org/),
or just start browsing random blogs
which are usually the best option.

## Assorted Issues

I have a few more random complaints that
I'm too lazy to fit neatly into categories.

### Open Source

The good thing about Go is that it is open source.
Everyone can look at the source code,
even send a pull request...

What is that in the
[README.md](https://github.com/golang/go),
you say?

> Note that we do not accept pull requests and that we use the issue tracker for bug reports and proposals only. Please ask questions on https://forum.golangbridge.org or https://groups.google.com/forum/#!forum/golang-nuts.

Oopsie.

Yes, there is a
[most convoluted process](https://golang.org/doc/contribute.html)
to contribute your code.
Say you find a simple bug in the code,
easy to fix but which is hindering your work.
You have to register in five different places
and then fax them your birth certificate or something,
so that they can ensure that you are really who you say you are
(and also that you are more devoted to your task than the Pope of Rome to go through all the hoops).

### Installing from Source

So the version of Go in your distribution is a bit out of date
(meaning that nothing works any more, or is unavoidably slow).
Just grab the sources and
[compile your own](https://golang.org/doc/install/source), then.
You just need to have a modern version of Go installed, and...
Wait, what?

Sorry, the Go toolchain is written in Go,
and therefore requires Go to be compiled.
So you need to download the Go binaries,
and _only then_ can you compile from source.

Remember when I said that Debian packs Go 1.3
(and Ubuntu LTS Go 1.2)?
The latest version of Go is 1.6 and was released a couple of days ago,
so it's still quite shiny.
But it requires Go 1.4 to compile,
so there is one extra step of downloading an intermediate version,
building, installing _and then_ going for 1.6.
Isn't life great?

In the end I just installed the binary version
and moved on with my (now a bit more miserable) life.

### Performance

We can put up with all little annoyances,
since after all you get such great performance.
Except when you use Go 1.3 where HTTP requests to the server
are slow and not concurrent (for some reason).
Or when you upgrade to Go 1.6 and get a 10x speed improvement,
but then your program explodes in flames
after spouting this most modest of messages:

    fatal error: concurrent map read and map write

Then you have to visit
[an arcane blog post](https://blog.golang.org/go-maps-in-action)
for a mysterious incantation
which turns your code into a minion of Cthulhu
that uses [mutexes](https://golang.org/pkg/sync/#RWMutex):

```
var counter = struct{
    sync.RWMutex
    m map[string]int
}{m: make(map[string]int)}
```

Well, that's the price you pay for concurrency.
And thankfully it performs just as well,
which makes you think:
why didn't the high priests of the language implement it by default?
The FAQ [helpfully explains](https://golang.org/doc/faq#atomic_maps)
(and allow me to glose):

> Therefore requiring that all map operations grab a mutex would slow down most programs and add safety to few.

You mean it would slow down _trivial_ programs and add safety to _those that matter_?

> This was not an easy decision, however, since it means uncontrolled map access can crash the program.

It's nice to know that you have lost sleep over this matter,
but hey, my programs are still crashing...

## A Might Have Been

All these annoyances are not only a pain in the ass,
but make Go a huge missed opportunity.

Full disclosure: I am, or have been at some point,
proficient in a few languages:
Basic, Pascal, C (but not C++), Java,
PHP, Perl, Python, JavaScript.
I have tried to learn quite a few more,
like Erlang or Lua,
but have not written any significant amount of code with those.

### What Could Have Been

Let's ask ourselves, what drove Google to create a new language?
The need for a successor for C, and to an extent for C++;
perhaps even for Java, which runs on a virtual machine
and is notoriously memory hungry.
It was not probably meant as a replacement for Python or Ruby,
even if it is annoyingly sold as both.

It is a pity because I liked the idea very much:
a compiled language that is very performant
and which solves concurrency with elegance.
A noble successor to C indeed.
But if there is something that C is not,
is opinionated:
it adapts to your style and is flexible enough
to accomodate everyone.
Alas, that is something that the creators of Go
deemed [unworthy of their time](https://golang.org/doc/faq#semicolons).

With a bit more effort Go might have been
a decent language in a few more areas:
functional programming, generics, and so on.
But again, the creators of Go did not think generics was
[worth their time](https://golang.org/doc/faq#generics),
and we may assume the same about functional programming.
So we will have to keep on looking for a good language for the web,
or wait until JavaScript engulfs all features of all other languages
and is finally usable for all purposes.

### The Right Frame of Mind

The [five stages of grief](https://en.wikipedia.org/wiki/K%C3%BCbler-Ross_model)
start with denial, then anger.
This article was a meager attempt of bargaining (third stage),
knowing full well that after a hopefully short depression
I'll accept and embrace Go for what it is worth.

The only way to enjoy developing in Go is to let go of your preconceptions.
No, Go is not a replacement for all your daily needs.
It is not even a great language.
It is however a good low-level language
which is performant and robust,
with several concurrency primitives.
If used wisely, it can probably be a good addition
to your repertory of languages.
It will _not_ be your one-stop shop for development.

So go out there and write yourself some Go!
At least for the most performance hungry parts of your application;
and write the rest in a more productive language.
That's my impression after a few days;
I'll update this article if I change my mind.

