---
title: 'Reversible Engineering, Part 2: DevOps'
footer: Posted originally at [Tumblr](http://tech.moveinblue.com/post/22860006526/reversible-engineering-part-2-devops) on 2012-05-11.
---

![Photo credit: [Steve Heron.](https://www.flickr.com/photos/sbh/6784685100/in/photostream)](pics/reversible-engineering-part-2.jpg "Wasted")

In the [first part](reversible-engineering-part-1.html) of this series we explored how to make your engineering processes reversible, with the idea of minimizing complexity; and applied the resulting ideas to software development. In this installment we will extend them to cover the field of development operations, sometimes called DevOps.

## Complexity Revisited

As we saw [before](reversible-engineering-part-1.html), all systems tend to gain complexity as they evolve, in the form of increased bits in their description. The information required to complete describe such a system (and which can be equated to its entropy, if we would want to get all technical) will never be reduced; it can only be increased. This is known as the Second Law of Thermodynamics, and is an essential axiom of our understanding of the physical world; but it applies to information processes as well.

How can we keep the complexity within bounds? The approach we have taken is to evolve the system using always reversible processes; thermodynamic theory ensures that entropy will be kept as a minimum. Of course our processes will never be perfectly reversible in the real world —after all the Second Law tells us that we can never get there— but they can get quite close. Thus our current endeavour is to approach reversibility as much as is practical.

Strictly speaking we don’t even want our processes to be completely reversible: we usually require data to be stored, systems to evolve and our code to increase in capabilities. All those changes are in fact irreversible. But the added complexity has to be worth it. In order to remove unwanted complexity we have to remain as close as possible to reversibility, which is not just a theoretical construct; it is a precise requirement that yields very concrete techniques.

## From Sysadmin to WebOps

Now we will center in our main topic, DevOps or web operations, formerly known as your friendly computer systems department. They are the people that keep the machines running, usually in a basement or some equally unfriendly environment; they deploy the code that developers unthinkingly toss their way, and their beepers go “beep” in the night when things go wrong. In a word: the formerly fearsome sysadmins.

When I have had to work in that capacity I have felt like those thankless steamer engine operators in classical movies: guys covered in grease who were always shouting: “The pressure is building up! The boiler is going to explode any minute now!”; only to be ignored by the captain, the boatswain and any other authority figure that cared to show up in their dank chambers. But things have changed a bit since then. The book [Web Operations](http://shop.oreilly.com/product/0636920000136.do) by Allspaw & Robbins is an invaluable reference for the modern sysadmin.

The current tendency (and the one we follow at MoveinBlue) is to have developers deploy their own code, and having as few pure sysadmins as possible. In fact, the principle of “infrastructure as code” specifies that your infrastructure should also be driven by code, just as any other system. Making your development process reversible has the nice added benefit of being also applicable to operations, as long as this area is driven by code.

Having every tech employee work in all areas is a good thing if you can get away with it: it limits the effective complexity of the system as a whole, since it has to fit in each developer’s head (and leave room for the intricacies of software development). There are other ways to reduce DevOps complexity, and which are direct consequences of our quest for reversibility.

## Reversible DevOps

Here is a thought experiment: try to reverse your systems to the state they had at 2011-11-11T11:11Z. Or at least 2011-11-11. Or close to 2011-11. Can you do it?

Now let us up the ante: instead of a mere thought experiment, go for it right now. Bring up a spare server, set it up with the exact same configuration of that point in time, and deploy the exact version of the code that it would have had at the moment. Can you do it?

Those of you with servers on the cloud and a good snapshot facility are probably smiling smugly, provided that you have done your homework and are using it. The chosen elite that also use a system configuration utility such as chef or puppet are extra-smug: they can fish their configuration at any point and roll back their servers without effort. These are some of the hidden benefits of the cloud: almost exact reversibility of machine state using snapshotting and automated configuration.

Now, perfect reversibility is impossible, at least for any arbitrary length of time: the configuration of your cloud and the underlying operating system, the particular network conditions at the time in a remote location, not to speak the particular machine your code is running on; these are impossible to replicate at will. But it will be good enough for most purposes. I have had occasion to debug a few production problems in a traditional datacenter setup which have turned into guessing games of “what has changed from last Thursday to now”, and being able to rule out code and machine configuration from the start would have simplified the task enormously.

## Reversible Deployments

In the old days deployments to production were rare, momentuous events: the whole company clung to their imaginary guns, and the day after was an endless source of entertainment for sysadmins — and often for developers. Now many companies have turned to [continuous deployment](continuous-deployment.html): the practice of deploying code to production in small increments, as soon as every little part is ready.

Work cycles are well known in thermodynamics as a means of making processes repeatable; the steam engine is the classic example of doing work in small increments, and modern combustion engines serve as well. Short, fast cycles tend to increase performance up to a point; there is a sweet spot for every process where the maximum power is achieved. In general, short iterations are closer to the steady state and therefore more efficient.

The same principle applies to the develop-integrate-test-deploy cycle: somehow contrary to intuition, frequent deployments tend to be much more stable than mastodontic releases. The key lies, once more, in reversibility: as is the case with engines, smaller cycles are much easier to revert if the need arises. The sysadmin-developer knows exactly what has been deployed and how to back-pedal the change — or how to patch it on the fly. It doesn’t even have to be manual: since deployment is usually automated these days, it is not hard to do a script that deploys yesterday’s code either.

It is not unusual [even for small operations](http://www.codypowell.com/taods/2012/04/i-aint-afraid-of-no-downtime-scaling-continuous-deployment.html) to make [ten](http://www.slideshare.net/jallspaw/10-deploys-per-day-dev-and-ops-cooperation-at-flickr), [fifty](http://timothyfitz.wordpress.com/2009/02/10/continuous-deployment-at-imvu-doing-the-impossible-fifty-times-a-day/) or even [hundreds](http://toni.org/2010/05/19/in-praise-of-continuous-deployment-the-wordpress-com-story/) of deployments per day. [Github is doing about 24](http://scottchacon.com/2011/08/31/github-flow.html); at MoveinBlue we are doing an average of 15 deployments per day, every day. This tendency is unlikely to change any time soon, and it is a good thing.

## Reversible Verification

An important part of deployment is verification of the code to deploy: before the code reaches production the most important bits must be verified. Verification includes integration, tests, validation and certification; and it can be manual or automatic. We are going to center on automated testing as it is where we should devote most of our efforts, but what we learn will spill over to manual testing and to other processes.

It is very frequent for tests to leave artifacts which accumulate and that have to be cleaned up. Quite often failed tests also leave the system in an unstable state that has to be corrected manually, even if the tests themselves are automatic. This is a waste of time: tests should always clean up after themselves. Not coincidentally, leftover artifacts are the hallmark of an irreversible process.

Tests should also be robust: they should yield the same result (positive or negative) in the same conditions. Test suites which have to be run several times to leave the system in a desired final state are another waste of time; time spent making them robust is time well employed. The relationship with reversibility is not so obvious in this case, but it is there: a reversible process must always leave the system in the same state where it started. If a test run with one particular codebase was successful at one point, the next run should also be successful.

Tests should always leave an audit trail, which (in the case of success) serves also as certification that the system has passed the tests. Is this certification irreversible? Not necessarily: if the state of the system can be described by a single bit at any point (certified / not certified), the complexity will not be increased from one run to the next. It should not matter how much time ago or by which route the certification was done; code should always be certified before it reaches production. Provided that the certification is sound, there is a solid base to build upon.

## Data Munching

An important part of DevOps is to manage data; these days there is a insanely huge amount of data to manage (known appropriately as “big data”). We want to store user history, logs and other data, and sometimes we are forced by law as in the case of financial records. Looking for boundless growth in bits? Here it is in all its glory! Can we do anything about it?

First, not all data is necessary.  We don’t need to store everything since the beginning of time, or we will suffer the consequences. Database schemas change, formats evolve, and old data grows warts and gets cracks around the edges.We can compact logs and store them only for a certain period; we can anonymize the data and make it even more useful than the raw files; and we can rotate backups and logs with a given pattern, as has been done since about forever. Data retention policies force very specific requirements which have to be studied and met, just like any other requirement. After a certain time we should reach a steady state where we forget almost as much data as we collect, which is equivalent to having a reversible process.

Non-relational databases have something to offer here too: schema-less storage is much more flexible than traditional structured datastores, and it avoids flag-day changes to the schema. This is not just a theoretical irreversibility; such changes are known to have taken [several months to complete](http://www.slideshare.net/jzawodn/mysql-and-search-at-craigslist). A database without a fixed schema goes a long way to make data format changes painless and easy to revert.

And of course, real time beats batch, all the time. Here too doing work in small increments is vastly better than having costly data loadings which tend to break in mysterious ways. A bad piece of data which has just entered the system is easy to track and correct; a huge loading is almost impossible to revert with any confidence, it can at most be repeated.

## The Elusive Steady State

We have stated at the beginning that we would like our systems to evolve and to grow in time; however we seem to have centered all the time in making our systems reversible, sometimes even daring to reference some miraculous steady state. How can both objectives be rendered compatible?

As it happens, they are not in conflict. A reversible process does not mean an unchanging system; it evolves but in carefully controlled ways, never straying too far from the point of equilibrium. A well designed DevOps process allows our information systems to evolve while maintaining reversibility, or something that resembles it.

The steady state is not stable by virtue of not moving; it flows and it evolves, but there are no brusque changes which mark definite points in time. Instead of a major release we get a continuous flow of changes that improve our systems all the time, and which at the same time allow us to revert any particular change or the complete system state.

Keeping reversibility in mind can be a great help not to stray too far from the steady state of improvement.

## To Be Continued

In the [third and final part](reversible-engineering-part-3.html) of this series we will explore reversible management: how to manage your company without making drastic changes. Stay tuned!

