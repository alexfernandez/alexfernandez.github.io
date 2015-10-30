---
title: Automating the Automation
footer: Posted originally at [Tumblr](http://tech.moveinblue.com/post/20991980613/automating-the-automation) on 2012-04-12.
---

![Photo credit: [annemarie.michel@mpsa.com.](https://fr.wikipedia.org/wiki/Fichier:Engrenages_-_85.488_-.jpg)](pics/automating-the-automation.jpg "Engrenages - 85.488")

Automatic mechanisms have changed our lives for good, but they bring their own set of problems. In this era of turning automation upon itself endlessly, we have to identify these drawbacks and alleviate them if at all possible. This post is dedicated to exploring how we automate our processes in MoveinBlue.

## Automated Testing

First, a little secret about development that most managers never seem to understand (or remember): the most onerous task of development is not developing code. Neither is it testing. No, the big time sucker is investigating problems, with all its dirty subdisciplines: debugging, tracing and plain wondering about where does this error come from (or why isn’t this particular solution working as it should). Now, in the 90s everyone was talking about automating development; their idea of automating the automation was to write code that writes some more code. Wrong! People were not thinking clearly back then; if all development was automated, nobody would be able to help once things went wrong and code starting throwing errors around.

In fact, there is little we can do to automate debugging a particular problem once we have it, but we can at least make sure that most problems are detected quickly and in a confined set of changes. So our goal should be to write code, and then test it immediately. This is called “unit testing”: we test each function one at a time.

The message from above when bugs are found is usually: “test your code!” But we are developers, not testers: it is not funny to spend hours trying all possible combinations when we should be writing more code. But wait a minute: what we can do is write some code that tests our code! And, since we know how to run code together, we can launch all tests one after the other and get combined results.

Now for the inevitable drawbacks: writing tests for your code is probably going to add to the size, and testing code will probably represent from about 15% to 50% of the total. The ideal percentage depends on your actual stability needs – there seems to be a sweet spot somewhere around 33% for web applications such as ours, so one in every three lines will be for testing. And this code is not free either: test suites must be maintained and updated, sometimes without any real user benefit.

However, automated testing is well worth the effort. The business-oriented from among the audience now might expect that I pull out some number such as “100% gain in productivity” so they can do the quick math and establish that automated testing is, on the average, 25% more efficient than other brands. (Or, if they stop to make their numbers right, 33%.) But it is hard to quantize the gains like this; the correct way is to say that development with automated tests proceeds linearly with time, while development without proceeds ever more slowly and efforts (and headcount) have to be increased to keep the same productivity. Or that big teams with automated testing are almost as productive as small teams, not getting into the swamp that is a big classic project.

Now, how should we write our testing code? We are still developers, not testers: we will probably not think about the whole set of input parameters that can go wrong with a particular function. But practice makes good masters; apparently once you have spent [10k hours doing something](http://en.wikipedia.org/wiki/Outliers_(book)) you may call yourself an expert. As you will probably spend about 1/3 of your time writing tests, with 40-hour weeks it will only take you 15 years to become a testing expert!

## Automated Integration

Once you remove debugging code that someone else wrote one year ago, the most painful task in centralized development teams is code integration: take the work of several people and join it in one coherent tree where each leaf is one file of code. We are supposing that we have all the possible help from our tools, such as… the free and libre software [git](http://git-scm.com/). Or at least another modern distributed version control such as Mercurial.

Again, the trick is to do this integration in small steps. Do not wait until all code is perfect and pulished; integrate everything all the time. Keep branches at a minimum, although they are not always possible to avoid. Use configuration options to hide incomplete features from the view of the public. And, if you are developing a web application, do not support several versions; just maintain the tip of the tree (HEAD, CURRENT or whatever it is called in your tool of choice) and make all of your changes there.

Some of the heaviest jobs in integration are debugging problems in the merged code. Having all tests in an automated corps helps a lot here: you may find problems much more quickly if your tests reveal them right after the integration. Combine this with small integration steps and life is fun again.

But wait, there is a missing element here: It is not enough to run your unit tests, we should have some integration tests too! Now we are not testing separate pieces such as your database code or your formatting functions, but the combined work; we should exercise a functionality end-to-end, from user interaction to response, and probably getting something written on some permanent media. And, aren’t we going to automate these integration tests? Now we are getting into murky waters, since we will probably have to simulate a user doing things in a graphical interface; or for a web application, we have to simulate a complete flow of e.g. user logging in, user putting one of our great products in the cart, user entering credit card data and receiving their wares while sitting comfortably at home. Well, we will probably just check that an order has been created, but you get the point.

There are tools that help with these tests; find the ones that suit your particular needs, and use them! Just make sure that code for integration tests is easy to write and debug.

## Automated Verification

The next thing we can do is to automate the whole field of verification. We have already dealt with testing, but there are some subtasks here which we must deal with: regression testing, certification and validation. Let us examine each one briefly.

Regression testing is the easiest: regressions are errors that appear repeatedly. If we write a test for every error that we find before solving it, then we will catch any regressions before they are exposed to the world. Of course we have to test everything before we integrate it, but we should already be doing this!

In certification you want to somehow prove that your software works, or at least that it does everything in its cold, robotic hand to help. An automated certification process is possible and it has been done before; even better, it is very efficient! Your automated integration suite is a good place to start; just add what you want to certify and run with it.

Validation is the hardest, and it is hard to do it automatically: before a public release someone must check that the software does indeed what it was asked for. The manual process includes picking up the written specification or manual (because you have a written spec, right?), firing up the software and checking that it does what was written there. But wait, is it possible to write code that checks the new shiny features? It should be! So, why are we complaining? Just go out and write some code!

There is still a need for manual validation: someone should check that the validation code works well and that the advertised feature is indeed shown in the front page. But it should be done once or twice; any more repetitions are a waste of time for everyone involved.

## Automated Deployment

Now it’s time to put it all to work: take that code (already tested, integrated and verified) and place it where people can use it. In our case this place is a website running on a remote computer.

The deployment process becomes the most crucial part of our infrastructure. The main deployment script (about 500 lines of Python code at the moment) effectively codifies our deployment practices: it pulls, it tests, it runs configuration files, it slices and dices every which way.

There is still a manual deployment, and we can still deploy code in production without using the script at all. But they should only be used in emergencies, and then all measures to avoid doing it in the future should be put in place.

Now, do not expect to have a perfect automated deployment process all the time. If you do everything right there are still a million reasons that your deployments may fail, and it is probably not worth it to cover everything in a deployment script. Furthermore, your infrastructure should be kept as simple as possible always. Just be sure to automate what can be automated and proceed with patience, improving your scripts with time.

## What Else?

There are more things that can be automated, including monitoring for deployment errors and rolling back releases to known good ones. But you get the idea: if it is manual it should be automated, and if it is already automated it can always be improved. Just find your pain points (where you spend most of your time) and try to remove them. It is easy: they are usually the tasks that you most hate.

