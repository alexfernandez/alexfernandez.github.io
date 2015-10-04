# From Ground to Cloud in Two Hours

![Photo credit: Alex Fernández](from-ground-to-cloud.jpg)

It was one of those Friday afternoons which promised to draw away sweetly and slowly. Then I received a call from one of our good friends at [mamamandame.com](http://mamamandame.com/): they were being featured on [elmundo.es](http://www.elmundo.es/elmundo/2012/06/01/madrid/1338504494.html) and their website was not handling the load well. So, could it be moved to the cloud in a few hours? Ah, how I missed those unexpected adrenalin rushes on Friday afternoons.

What follows is a story of how we dealt with the migration. Many of you have probably gone through a similar experience, perhaps several times. In this case there are no big revelations and no exciting story turns; this post may only be useful for those like me who had never been through a fast migration to the cloud.

## The Migration

In order to display our enormous ignorance in large bold letters, the story will be sprinkled with known IT principles in bold, and how we completely ignored them.

### Negotiate with Several Providers

Their first instinct after the first traffic spike was of course to stick with their current provider (which shall go unnamed) and ask for more capacity. Their answer: “no problem, you can have as many CPUs as you want… in a week’s time”.

So instead of losing any more time we went with Amazon EC2. Most people have probably got an account with their merchant site; my friend did so they just signed up for EC2 and off we went. Are they now [locked to the cloud](http://tech.moveinblue.com/post/21318014173/locked-to-the-cloud)? Hardly; they only have a VPS there which should not be hard to replicate on any other provider, just as EC2 just replicated their original server. But I doubt that they will want to migrate.

### Consolidate Providers

The email service provided by the original hosting company was doing fine; why change it? Email is particularly easy to have on a different server since it is kept in a separate entry in the DNS register. So we just kept on using the old email service.

In fact it is just as easy to set up [Google Apps for Business](http://www.google.com/enterprise/apps/business/index.html) and manage your corporate emails with an interface similar to Gmail, and that is probably what they will be doing soon. But Amazon EC2 is just not a convenient place to keep your inboxes, or even forward your emails from.

### Look for a Friendly Interface

The previous provider had a nice control panel that allows part-time administrators to manage their platform graphically. A big time-saver, right? We should install some admin module on the EC2 server.

Instead we went with EC2 with their basic a Linux console. If you don’t know how to use terminal commands, learn it! Now is a good time; you will be doing yourself a favor. I just wrote all important commands down on a sticky note as we used them, so the owners can issue them if needed.

### Pick a Linux Distro You Know

I have been a Debian user and part-time admin for more than a decade now; somehow I have managed to avoid dealing with Red Hat except as a very basic user. So, when confronted with the selection of AMIs I just went with [Amazon Linux](http://aws.amazon.com/amazon-linux-ami/), 64 bits — Red Hat-based, as it happens.

Why all the insane choices? A fast migration is not the best moment for experimentation, but there is usually much to gain going with the defaults. For example when looking for advice on the web, as we will see later.

### Always Go with Robust Products

The website used PHP, WordPress and several plugins, and MySQL. Now I have never used nor installed WordPress nor MySQL, but together with PHP they are quite flaky and have thousands of known vulnerabilities; so I should have recommended to migrate everything off PHP and MySQL and use, don’t know, Java and PostgreSQL. Or Ruby and MongoDB. Or Scala and Hadoop.

Hardly a two-hour job, though. Who cares; let us just download everything and let us see how it goes.

### Don’t Follow Random Advice on the Internets

We followed this excellent blog post: [Setting Up WordPress on Amazon EC2 in 5 minutes](http://coenraets.org/blog/2012/01/setting-up-wordpress-on-amazon-ec2-in-5-minutes/). It took a bit more than five minutes, but only because we strayed from the very clear instructions a couple of times. Half an hour later we had a running instance. So we copied over all the PHP application and it run beautifully except for a few modules, which were quickly identified and installed. Of course thanks to some other blog posts from helpful people.

Frankly, I cannot imagine how people coped with problems when they didn’t have the web. Now, I could live without StackOverflow or its brethren, or I think I could, but I guess that real engineers just needed to memorize five linear meters of documentation to use any piece of software. Those were the days.

### Keep Backups

We only lacked the database now. Luckily it was a simple matter to back up the original MySQL instance and restore it again on the EC2 machine. Setting up MySQL databases and permissions was a bit tricky since it had to be done manually, and I didn’t have the slightest clue about it, but the online help was… actually it was pretty bad, but there were abundant blog posts dealing with the pitfalls of authentication.

Now we have something better than a backup: a snapshot of the system at a given time, and we can make and store as many as we want. [Reversible DevOps](http://tech.moveinblue.com/post/22860006526/reversible-engineering-part-2-devops) at its finest.

### Diagnose the Problem First

So, now was a good time to solve the performance issues that brought us here in the first place. As good engineers we should strive to make a root diagnostic of the performance issues: was it the database? Was it the PHP pages? WordPress, or any of the modules? Any caching issues?

I honestly don’t know, but the website slowed to a crawl and then quickly broke down when too many users accessed the application at the same time. When we pointed the DNS entry to our shiny new EC2 medium instance, the machine quickly collapsed and failed, just as its predecessor.

### Spare your CPU Cycles

There is a time and a place for good engineering; but also one for emergency solutions. So we just threw a bigger instance at the problem until it stabilized. As it happens we required an extra-large instance ([$400+ a month](http://aws.amazon.com/ec2/pricing/) just to keep it running), but once the traffic peak is over a medium instance (rather $115 after the recent price cuts) or perhaps even a small one should be enough.

And of course we will [pay our technical debt](http://www.codinghorror.com/blog/2009/02/paying-down-your-technical-debt.html) in due time. But not just now.

### Build a Secure Base

This is the thorniest point of all: security on the whole installation was not horrible, but not excellent either. Too many open ports, too many exposed software, too many passwords. The attack surface was just too large.

Before you all fire up your favorite terminal application and try to crack the site, note that we did take the time to secure MySQL and Apache, and have closed the most glaring holes after the traffic rush. Now you can shop at the site confidently.

## The End Result

My initial estimation was two to five hours; it took us a little over 2:00 to get it running. Some pre-existing issues with the site images resulted in an additional hour trying to solve it, while the Amazon machine was already dealing with all the incoming traffic. The new extra-large instance was robust and doing its job (as well it should).

Unfamiliar operating system, database, frameworks, web application. How did so many wrongs make a right? For starters the initial application may not have been designed with performance in mind, but it was well crafted and easy to migrate. All modules were standard and didn’t depend on quirky local configurations. The configuration was all stored in a few easy to locate files.

Linux (and Amazon Linux in particular) is an excellent sysadmin environment, with great tools and easy to set up and configure. No time lost on graphical installers, and we did not have to `./configure && make && make install` at any point because most things were a `yum install` away.

But the key point is: the cloud (and Amazon’s cloud in particular) lets us solve our problems in due time, as we see fit. The almost instantaneous capacity of reaction to outside events is invaluable for a small business. We have not leveraged the power to automate yet, but all in due course. And be sure to pay us a visit at [mamamandame.com](http://mamamandame.com/)! especially if you are a Spanish expatriate pining for some jamón ibérico. Just don’t look surprised if you come in from a high-traffic site and find the site down; we may yet have to go for a [Cluster compute instance](http://aws.amazon.com/ec2/#instance).

Posted originally on [Tumblr](http://tech.moveinblue.com/post/24425607645/from-ground-to-cloud-in-two-hours) on 2015-06-04.

