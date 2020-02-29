---
title: Closing the Gap with Business
footer: Posted originally at [Tumblr](http://tech.moveinblue.com/post/24014061399/closing-the-gap-with-business) on 2012-05-29.
---

![Photo credit: [Tulane Public Relations.](https://www.flickr.com/photos/tulanesally/4307044660/in/photostream/)](pics/closing-the-gap.jpg "Business Class")

The message of this blog post is simple enough: if you want to succeed at building software just reduce the gap between business and engineering. It is written from the point of view of technology, but with the interests of business in mind; after all, few companies can survive if business does not thrive.

A note about terminology: “business” below means the people at your organization that brings home the bacon, while “engineering” encompasses software developers, sysadmins and DevOps people. In those cases where both groups are the same the points stand, albeit with slight modifications.

## Adding Layers

This scenario will be all too common for many people: a project is not going well enough, or fast enough, or cheap enough; so a new management team is put into place to measure, control and improve the work of existing teams. The result: more delays and a great deal of friction between business and engineering.

Sometimes there is a lack of clear requirements: business is not expressing their requests appropriately. The result is the golden age of the business analyst: a team of people that specialize in understanding what business wants and producing a set of requirements. Author [Scott W Ambler](http://www.agilemodeling.com/essays/businessAnalysts.htm) has this to say about them:

> A BSA on a traditional software development project will perform one or more of the following activities: Scope the system. […] Translate technical issues. […] Model and document.

Those three points alone are quite complex undertakings; Ambler points out a total of eight activities. A lot of work that in the end is just playing middle man between business and developers.

Then there is the projects department: an entire team dedicated to prioritizing and carrying out all projects within an organization. But isn’t that what business people should do? It can be contended that business doesn’t necessarily know the internals of existing systems, but that is at best a failure of business, and at worst of the whole organization.

The latest rage is the tech liaison: a pure middle man that explains business people tech concepts and interacts with engineering. Apparently elaborating explicit requirements and dealing with engineers is asking too much from business people, even in tech companies. Astonishing.

Unfortunately these barbaric practices are still in vogue in many places. Business analysts, project managers, projects departments and tech liaisons get to thrive while software projects keep failing. Sometimes business _is_ engineering, chiefly in engineering companies; in this case having intermediate layers is most painful.

## Why Close the Gap

Perhaps you are already building software at your organization, and you wonder why we are complaining about middlemen. After all, aren’t all the layers of analysts and managers doing their job beautifully?

At best what you get when you add layers is a more expensive project. This is not rocket science: more intermediate steps mean more work, and more people cost more money. At worst some information is lost at every step of the process; no translation is 100% accurate, so as a result there will be loose ends that have to be painfully reconstructed at the deep end.

No, business cannot just set high level goals and let a host of middlemen carry them out; that is the role of executives. Ideas must be fleshed out and develop into coherent wholes if they are to be carried out successfully. The business is also (and often mostly) in the details; every “implementation detail” can be important, and will probably be discussed over when a prototype is presented.

This is assuming that business knows exactly what they want; this is often not the case. A requirements waterfall is not helpful to let an idea grow and develop, because changes become so expensive to perform that there are not many chances to get it right.

A tangential benefit of cutting the middlemen may not look important at first sight, but it can be crucial in the long term: the engineering department will be much more motivated when they are closer to business than as an isolated entity within the company.

## How Not to Proceed

We are not advocating a hands-off approach where engineers get to build what they want. Most engineers make poor business people and we are grateful for someone with expertise to set the direction.

Even when business people are willing to make their requests to engineering directly, we are not calling for the death of the tech specification either. There are complex requirements which require understanding by an engineer before they can be implemented; there are always details that can easily be forgotten. We will see below how to create a useful specification.

But it is too easy to go too far in the opposite direction and fall into micromanagement. Given direct control on implementation, most business people will ask for the moon and expect it to be done right before their eyes. What is needed is validation of the details, not an oversight over the design process.

## The Useful Specification

How can we build a written spec that fulfills its role?

Clean room techniques can be useful if we need to have a complete specification of the system: one person writes the specification, another implements it. Both sit in different rooms (ideally they belong to different teams) and only communicate through the spec. Keep in mind that this approach is expensive, specially when what we need is not a complete spec but a working system.

For the rest of us it is better to accept the fact that the specification will never be perfect. You can specify how data will flow and how and when it will be presented, but it will probably take as long as the project duration for the spec to mature. No amount of PSDs (Adobe Photoshop files) is going to make the output look exactly like you want either: the translation from a graphical tool to a working system will always lose something, and those little details will have to be filled in one-to-one sessions.

Just have someone from engineering write down what you know you want and pass it to business people to give their input. It may look stupid to toss around a document with a few phrases in it, but let everyone know that this is an iterative process and that it will get better with their input. Their first reaction will probably be “this is nothing like what we want”, and the best among them will probably write a counter-spec that asks for the moon in one week. Improve the initial spec with the newfound knowledge and keep on working.

As to the rest, Joel Spolsky has a great series about this topic: here are parts [one](http://www.joelonsoftware.com/articles/fog0000000036.html), [two](http://www.joelonsoftware.com/articles/fog0000000035.html), [three](http://www.joelonsoftware.com/articles/fog0000000034.html) and [four](http://www.joelonsoftware.com/articles/fog0000000033.html). Just be sure to let engineering run the show, and let business know what is happening.

## A Frictionless Process

The goal of the engineering department should be to create an environment where business ideas can grow and develop. This includes selecting and nurturing the right ideas. Quite often the most painful requirement of a project is an afterthought that belongs to the “nice to have” category. Perhaps 80% of business needs can be served by a simple set of requirements which represents just 20% of the work; thus the [Pareto principle](http://en.wikipedia.org/wiki/Pareto_principle) can be made to work for us.

The right frictionless process should by now be easy to imagine: a set of continuous improvements with one or two quick initial phases, that make it easy for the business owner to interact with the lowly engineers that do the work. This “business owner” is the person from the business side of the table that owns the final product.

The initial phase (or phases) should be guided by a requirements specification built by the engineering team and validated by business owners, where the feasibility of each part is analysed and a working set of requirements is defined. The team that will finally carry the project out should have the opportunity to read (or even better, write) the specification, to make sure that everything is specified to the right level of detail.

But the job of business people does not end there; as the project is developed they must be around to guide any details that were missed in the spec, and validate the results. Ideally they will design the tests and even write them, but we will not go as far as to call for the “business developer”. One can only wish that miracles happen (and when they do, they are great!).

After this initial phase It is essential to have some sessions where low level improvements are implemented on the spot, with direct guidance from business. It is easy to imagine the business owner sitting with the graphical designer to make modifications to the initial design; now translate that to the front-end developer modifying your HTML5 site directly and publishing the changes. If it is too hard to achieve then the engineering team should give business owners the tools to make the changes and publish them on their own.

Remember to design your processes [close to reversibility](reversible-engineering-part-3); a smooth process can be repeated as often as desired, with short cycles and efficiently.

## Sources of Failure

Suppose we do all the above; are we guaranteed good results? The main (and most pernicious) factor that may boycott our frictionless process is that it is a lot of work. Business people like to work in their area, not refining software or supervising changes. They need to understand first that to have the product built as they want, they have better supervise construction. If 15 years of agile development hasn’t brought home that point, then there is little we can do here.

Another point of failure is that business people often do not feel connected to tech projects; they just have the great idea, and leave implementation to others. Engineers are tasked with building a working implementation and are left to their own devices as to how. The ugly truth is that ideas are a dime a dozen in our very modern world; all the value is in good implementations. Solving this disconnect between business and software is essential for success.

In established organizations the intermediate layers of analysts, managers and liaisons will not like being left out and will immediately justify their existence with a variety of reasons. But they need not fear: intelligent people will probably have a more productive role somewhere else within the organization. Or they can integrate with business and learn their ways, which will probably be more satisfying than being in between a rock and a hard place.

