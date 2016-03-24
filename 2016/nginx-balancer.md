---
title: Creating a Balancer With Nginx
subtitle: 'Or How We Replaced an expensive ELB from Amazon AWS To Process Thousands of Requests per Second'
footer: Published on 2016-03-18.
  [Comments, improvements?](mailto:alexfernandeznpm@gmail.com)
---

![Picture credit: [George E. Curtis](https://commons.wikimedia.org/wiki/File:Maria_Spelterini_at_Suspension_Bridge.jpg)](pics/balancer.jpg "Maria Spelterini at Suspension Bridge")

## ELBs Are Too Expensive

Amazon Balancers (or Elastic Load Balancers, in their terminology)
are awesome things:
they are able to process many thousands of requests per second
without issues for weeks on end.
If you have used Amazon with some kind of high availability setup,
you have probably used an ELB.

At MediaSmart Mobile we have had peaks of over 300 krps
(300 thousand requests per second),
and all have gone through an ELB.
Without a hitch.
Continuously (at night traffic never goes below 100 krps).
But they were increasing our costs too much:
it got to the point where 25% of our total Amazon bill
went to pay the ELBs.

### How We Got There

## Nginx to the Rescue

### Lua Logging

### Monitoring

### Other Modifications

## Conclusion

ELBs are amazing.
If you are handling a moderate-to-high amount of traffic,
say below 100 krps,
they are easy to set up and great to operate.

But Nginx is equally amazing,
very configurable and cheap to operate.

