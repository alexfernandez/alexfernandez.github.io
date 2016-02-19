---
title: Adventures in the Land of Go
subtitle: 'Or the Ungoogleable Language from Google'
footer: Published on 2016-02-18.
  [Comments, improvements?](mailto:alexfernandeznpm@gmail.com)
---

![Picture credit: [Department of Navy, USA](https://commons.wikimedia.org/wiki/File:Photograph_with_caption_%22View_of_Attendance_at_a_Movie_in_Permanent_Recreation_Building,%22_U.S._Naval_Ammunition..._-_NARA_-_283490.jpg)](pics/attendance.jpg "View of Attendance at a Movie in Permanent Recreation Building")

This week I had the opportunity to play with Go
(or "Golang" as has come to be known)
for a work-related project.
It is not the first occasion that we meet,
but now I am serious about it.
And I have to vent my frustrations with the language.

## The Language

### Adding Elements to an Array

[arrays are different from slices](https://blog.golang.org/slices).

### Error Management

Sick of the `if (error) return callback(error)` bullshit?
Brace yourself.

Functions can return several arguments:

```
func getObject(value Object) (Object, error) {
    return value, nil
}
```

Cool, you can return `nil` instead of the second argument.
So you probably can return `nil` also as the first argument if there is an error?
**Bzzzt!** Wrong.
*Obviously* you cannot [return `nil` as a struct],
for reasons that are very well explained in that link
(but I will not probably understand if I live five consecutive lives).

So when you find an error you have to return an empty object,
which must be initialized first:

```
func getObject(value Object) (Object, error) {
    newObject, err := accessSomeDB(value.Key)
    empty := Object{}
    if err != nil {
        return empty, nil
    }
    return value, nil
}
```

So now be ready to write this bit quite often:

    if err != nil {
        return empty, nil
    }

Of course, with non-optional braces.
At least the `if (error) return callback(error)` was an invariant.

### Variable Declarations

This one looks inoffensive enough
but can be most annoying.
To declare and define (give value) a variable
you use the `:=` operator:

    a := 5

While to just give a value to an existing variable
you use the `=` operator:

    var a string;
    a = 5

So, what happens is that if your code uses the same variable several times
(for instance the ubiquitous `err`) you will find this joy:

    err := callFirst()
    err := callSecond()

results in

    main.go:10: no new variables on left side of :=

Therefore you have to change the second invocation to:

    err := callFirst()
    err = callSecond()

Ending one of the joys of programming, the ease of copy-paste.
Or defining the variable ahead of time with this clumsy wart:

    var err error

Observe that the error message says "no new variables":
it is OK to reuse `err` as long as there is a new variable there.

    first, err := callFirst()
    second, err := callSecond()

This works!
So one new variable and one old variable is fine;
but only one old variable is not.
Even ignoring the return value is _not_ OK:

    _, err := callFirst()
    _, err := callSecond()

This fails, don't ask me why;
just the compiler being helpful I guess.
The end result is that you spend time changing `=` to `:=` and viceversa,
for no good reason.
I'm too old for this crap.

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

It is of course wrong, and in fact many of the proponents then add an empty line.

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
they realized that it lacked some very basic capability
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
`eval()` is widely discredited.

In the end `parseInt()`, `parseFloat()` and the URI things
are the only functions in use,
and they are quite low-level really.

## Tooling

This area is of course ladden with misery and despair,
with a few bright spots.

### Anal Retentive Compiler.

Nothing that has not been [said better before](http://www.evanmiller.org/four-days-of-go.html).
Just one nitpick:
why forbid unused imports and variables, but allow unused functions?
Aren't unused functions equally (or even more) dangerous?
This question has been bothering me for some time.

### Testing

There is a very nice feature of the toolchain:
[integrated testing](https://golang.org/pkg/testing/).
You can write a few tests as functions that start with `Test...`
and run them all using `go test`. Nice!

Of course, it doesn't come without its share of weirdness.
For starters, you may not mix testing code and regular code.
I know it's frowned upon in many circles,
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

With JavaScript finding help is very easy:
the semi-official docs are in 

Now Go had it *much* easier:
there is an official creator, sponsor and source
for everything Go.
Why then is everything spread in a lot of places?

* Some questions are answered on StackOverflow, yes,
but others are only found in arcane Google Groups,
and even others are on Reddit, for crying out loud.

* The official documentation is too terse and lacks examples.
For those, you have to go to [The Go Blog](https://blog.golang.org/),
or just start browsing random blogs.

## The Redis Driver

So you want to do some easy task, say:
access a local Redis database.
Let's find a simple driver.
Redis is one of the
[most popular NoSQL databases](http://stackshare.io/posts/top-50-developer-tools-and-services-of-2015#top-50),
and Golang has [more than 100k packages](http://www.modulecounts.com/),
rivalling Maven or rubygems.
So it shouldn't be hard, right?

![[Module Counts](http://www.modulecounts.com/)](pics/modulecounts.png "Module Counts for many popular package repositories")

Right???

### Redigo

This is one of [the recommended clients for Redis](http://redis.io/clients#go).
The [documentation](https://godoc.org/github.com/garyburd/redigo/redis)
is cryptic to the extreme.

### Go-redis

Complete, and well documented. Nice, huh?
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

### Radix

This recommended [package](https://github.com/mediocregopher/radix.v2)
is broken into several subpackages.
I don't know where to start here.

### Godis

This driver works reasonably well,
but it hasn't been updated since 2012.
An ominous note on [the front page](https://github.com/simonz05/godis)
states:

> 13 Aug 2012
> Currently very busy with work, and I don't have the time to fix some of the pending issues at hand.

And nothing else, looks like the recovered diary from a long lost expedition.

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

Since Go doesn't have generics, you will have to repeat this crappy code
every time you want to read a different hash.

## Assorted Issues

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
so that they ensure that you ar really who you say you are
(and more devoted than the Pope).

## A Might Have Been

So, what drove Google to create a new language?

### The Bleeding Name

People, if you ever create a language,
use a distinctive word that can be googled.
"Golang" would have been fine; "Go" is
[the 35th most common word in English](http://www.wordfrequency.info/free.asp?s=y).
Not cool.

### What Could Have Been

All these annoyances are not only a pain in the ass,
but make Go a huge missed opportunity.

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

