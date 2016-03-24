---
title: Creating a Balancer With Nginx and an Erlang Filter
subtitle: 'Or How We Replaced an expensive ELB from Amazon AWS To Process Thousands of Requests per Second'
footer: Published on 2016-03-18.
  [Comments, improvements?](mailto:alexfernandeznpm@gmail.com)
---

![Picture credit: [George E. Curtis](https://commons.wikimedia.org/wiki/File:Maria_Spelterini_at_Suspension_Bridge.jpg)](pics/balancer.jpg "Maria Spelterini at Suspension Bridge")

## ELBs Are Too Expensive

Amazon Balancers (or Elastic Load Balancers, in their terminology)
are awesome things:
they are able to process 

