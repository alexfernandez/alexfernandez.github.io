---
title: Continuous Deployment With StriderCD
subtitle: 'A Promising Product With Some Rough Edges'
footer: Published on 2016-02-01.
  [Comments, improvements?](mailto:alexfernandeznpm@gmail.com)
---

![Picture credit: [Department of Navy, USA](https://commons.wikimedia.org/wiki/File:Photograph_with_caption_%22View_of_Attendance_at_a_Movie_in_Permanent_Recreation_Building,%22_U.S._Naval_Ammunition..._-_NARA_-_283490.jpg)](pics/attendance.jpg "View of Attendance at a Movie in Permanent Recreation Building")

As you may know I work full time for MediaSmart Mobile,
but I also work as a freelancer for other people.
Usually as a scalability consultant,
although I also work in other areas
such as continuous deployment.
This gives me the opportunity to know other interesting projects,
and quite often to use cool new products.

If you are new to continuous deployment
you may want to get
[some background](http://alexfernandez.github.io/2012/continuous-deployment.html)
before you read this article.

## The Project

My friend [Diego Lafuente](https://twitter.com/tufosa)
asked me to help him in
[TaxiTime](http://taxitime.com),
an ambitious global taxicab aggregator from
[HotelBeds](http://www.hotelbeds.com/home).

### Continuous Deployment

As always, the first and most important part of a software project for me
is to set up continuous deployment,
which ensures that the developers can just do their thing
and see the results in almost real time.
I am the author of the humble npm package
[deployment](https://www.npmjs.com/package/deployment),
which is used in MediaSmart Mobile with certain success.
But alas, it lacks a GUI and has therefore to be setup from the command line,
which can be cumbersome.

I had a serious case of GUI envy.
But the options were not attractive.
Travis-CI for private companies is
[expensive](https://travis-ci.com/plans),
and installing a
[Ruby](https://github.com/travis-ci/travis-ci)
package locally was not in the plans.
Plus, I am bothered beyond measure by terminology;
Travis has "Continuous Integration" in the title,
which I consider to be
[an intermediate step](http://alexfernandez.github.io/2012/continuous-deployment.html)
on the way to CD.
I have long followed [Jenkins](https://jenkins-ci.org/)
from a distance,
but it is a
[Java](https://github.com/jenkinsci/jenkins) monster.
And again there is the CI in the title.

### Meet StriderCD

Some time before, Juan Carlos Delgado (CTO of llollo.com)
mentioned to me in a private conversation that he was using
[StriderCD](http://stridercd.com).
I liked two things about it very much.
First, that it had "Continuous Deployment" in the title.
Second, and this won my heart, it is written in Node.js.

Diego was kind enough to let me play with this new toy for his project,
and of course I (being a responsible freelancer)
would only bill for these hours if StriderCD fit the need.
So I started installing and configuring it.

## StriderCD in Practice

The immediate goal is to set up an integration environment,
where code is deployed every time that a change is made on the repository.

### GitHub Integration

StriderCD uses [webhooks](https://developer.github.com/webhooks/)
to be notified when there are changes on the repository.
This integration is thus a vital point.
The idea is, like in Travis-CI,
to authenticate using OAuth2 so that Strider
can set up the webhooks for you.
But in this case you have to do the integration yourself,
and it is not trivial.

The worst part is 

## Conclusion

This project would not have been possible without Diego Lafuente,
Juan Carlos Delgado or Fernando Sanz;
my gratitude goes to them all.

