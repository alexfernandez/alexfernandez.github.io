---
title: Continuous Deployment
footer: Posted originally at [Tumblr](http://tech.moveinblue.com/post/20861955803/continuous-deployment) on 2012-04-10.
---

![Photo credit: [United States Air Force, MSgt. Rickie D. Bickle](https://es.wikipedia.org/wiki/Archivo:Seabees_compactor_roller.jpg)](pics/continuous-deployment.jpg "Seabees compactor roller")

Deploying software is a weird business. Do it often and you may think you are getting crazy; but do it seldom and problems get even worse. A different strategy is gaining traction, which is to deploy all the time – choose changes so small that they can be controlled easily, and build a strong safety net in case anything goes wrong. This is called Continuous Deployment.

## Strategy

Continuous deployment is a technique that requires an iron discipline: we have to appreciate its long term value in order to keep it working always, and to repair it as soon as it breaks. It is a strategic goal for MoveinBlue to make deployments as simple as possible, since we cannot have a dedicated team for production tasks. Anyone with the ability to break the build must also have the tools to repair it.

### Objetives

The main goal of continuous deployment is flexibility: put all changes into production as fast as possible, without compromising the quality of the developments. In fact, quality should tend to be higher when there is a good set of tests before deployment and these tests are passed automatically. The impact of any mistakes is also lower, as any fixes can be applied almost immediately.

There are several secondary goals:

* Do work incrementally, in small batches. Why is this good at all? Mostly because of the increased visibility of developments; when work does not get out in a long time it tends to become frustrating. But also because small batches are easier to integrate.
* Ensure the quality of the code before customers can see it. This bullet point should need no justification, but there it goes: quality without certification is not good quality, and a robust deployment system provides certification that the system works.
* Give confidence to developers. If the system can catch our errors then we grow more confident of the system and of ourselves.

In essence we want to make our work more efficient and fun.

### Continuous Integration

Continuous integration is an established technique: it has been around since about 1999, with [Martin Fowler](http://www.martinfowler.com/articles/continuousIntegration.html) as one of its main proponents.

McConnell mentions a reduced version of continuous integration (the daily build & smoke test) in “Rapid Development” (1996). In its simplest form, changes from all developers are integrated using a dedicated machine in a nightly build. Later Extreme Programming proponents [refined the technique](http://www.extremeprogramming.org/rules/integrateoften.html), adding more tests and exploring more frequent builds driven by the needs of developers.

### Verification

To keep builds in check we must keep a set of tests that can determine if the integrated code works correctly. Again McConnell in “Rapid Development” (1996) proposes a very limited form of testing, which is not valid even for continuous integration. As unit tests spread out it became popular to exercise them at every build.

For continuous deployment we will need a broader set of tests. In fact we will need more than one set of tests, and more than unit tests: we have to maintain at least one set of _integration tests_ that give us end-to-end verification of the code. These tests can be as simple as accessing a URL, and as complex as running JavaScript code in a client application and making sure it works. For our HTML5 application we actually try to use all possible techniques.

Of course all tests must be run on a special testing environment; it would be no good to change the production environment during the tests. Nevertheless we are currently sharing the production database with the testing environment to keep tests as real as possible. We have yet to experience any major drawbacks with this setup, but we are certainly open to use a specific database.

### Deployment

Once the code has been thoroughly tested it is deployed. This deployment can be complete (the code will be used in production by all users) or limited (only certain customers will have access to the new version). In our current case code goes instantly to the main production machine and is seen by all users.

Of course, when tests fail so does the deployment. There are a few other technical causes for deployments to go wrong, such as a broken test environment or a remote system not responding.

See also the section for Continuous Deployment in “Web Operations: Keeping the Data on Time” (2010).

### Monitoring

After the deployment our job is not yet finished: no set of tests is 100% complete, so we have to monitor that the code works well for our users. It is now common to watch certain key parameters (CPU consumption, error log of the HTTP server), specially after a deployment. At the very least we should verify that the code has actually been deployed on the production machines.

The good folks at github go to the extreme of monitoring their Twitter feed [looking for traffic spikes](http://zachholman.com/posts/scaling-github-employees/); we have not gone that far yet, but not because we think they are crazy.

### Auditing

All actions taken by the deployment system must leave a trace in the system. Ideally everything should be in the database, but it is important to leave also log files in the deployment machines that can be inspected if the database fails.

### Automation

All the previous tasks can be automated, and our goal is to keep the process under control while saving work. In fact the continuous deployment machinery is at the very heart of our infrastructure; the main script codifies a nice chunk of existing behavior and good practices. But we should always be sure that deployments can be done manually using a few simple commands, in case a developer has a good reason to bypass the regular mechanism. For instance: an emergency deployment in a moment when the automated deployment environment is broken.

In a future post we will examine our automated approach in more detail.

## Continuous Deployment in Practice

Spelling out all theoretical principles can be nice, but the real value of hearing from a current practitioner is listening to how it performs for them. In our case we can only speak good things about continuous deployment.

### Frequency and Quality

At MoveinBlue we are doing an average of 10~20 deployments a day, with peaks of 30+. Our weekly average is well above 100 deployments. As to failed deployments, they should ideally tend to zero, but in practice they are always at least 10% of all deployments. Failures also tend to cluster: some days there are more failures than successful deployments.

The quality of our deployments can only be as good as our automated tests. Nevertheless it is very high: we are seeing very few regression errors due to changes, perhaps once a week (we are in the process of collecting these statistics now). The occasional bug is easily found and corrected since the relevant developer has the code fresh in their “memory cache”: after all they have just deployed it!

A good (in fact excellent!) practice is adding a new test for every regression test that we find in the field, so we make sure that this particular error will not get past our tests in the future.

### Effort Saved

It takes a certain amount of effort to keep all environments working. Keep in mind that every developer has their own continuous deployment setup, and they tend to get corrupted by certain tests. Also, the testing environment supports a lot of different tests that can go wrong in a multitude of ways, from loss of connectivity for remote services to particular sets of testing data on the database.

But when it works, it works very well! We developers stop worrying obsessively about regressions and they just add features; when somehow an old feature is broken the system beeps the particular developer. We are not afraid to do sweeping changes to existing code, so our codebases are kept flexible and nice as we like them.

