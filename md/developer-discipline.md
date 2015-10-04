% Developer Discipline

![Photo credit: [Christoffer A Rasmussen](http://sv.wikipedia.org/wiki/Fil:Fugle,_%C3%B8rns%C3%B8_073.jpg)](pics/developer-discipline.jpg "Billede af "sort sol" ved Ørnsø i Silkeborg")

At MoveinBlue we use a wonderful technique called Continuous Deployment: every change is automatically tested and put into production as soon as possible, in very small increments. For this process to work smoothly, every developer must follow a few basic rules, designed to make their work and the work of their team mates as fluid as possible. What is required is basically internal discipline: even though the rest of the team will be there to help, it is developers themselves who have to watch it. There is no police and no zen master.

## The Seven Disciplines

Not leaving odds and ends around is a great principle to follow in anything you do; but in a highly complex activity like developing software we need a clearer guide in our daily work. We have distilled this idea into seven different disciplines to be followed during the development process.

### You Break It, You Fix It

The basic principle is that when anyone breaks anything (an environment, the build, permissions…) that person is responsible to fix it, as soon as possible. Assigning guilt is not important; concentrate on fixing things. If you are not ready to fix something, then don’t change it.

### Fix Before Adding

Any error detected in code when developing a new feature must be fixed immediately, before continuing with the feature. Building on an unstable basis is a recipe for disaster.

### Integrate After Adding

Changes added to the local environment (development machines) must be integrated with the rest as soon as possible, before they get rancid. It is interesting to always add new features in small increments of a day or less if at all possible.

### Test Before Integrating

Tests must always be run on the local environment, with the latest changes from the server, before integrating the code with the rest. Any error in the tests (even if it was not caused by our change) must be fixed before going on.

### Fix After Integrating

If the developer is not in the position to fix any possible problem in the server, they should not upload the change. For instance, it is late and the dev is tired after an evening of work: better leave the integration for next day, even if all local tests are running.

### Integrate Before Deploying

Code must be integrated with the rest before it is deployed in production. This principle is the crux of continuous deployment and should always be done automatically; we add it here because the environment must be ready to integrate at all times.

### Verify After Deploying

After a change is deployed the developer should check manually that it works indeed in production before it can be considered as done. If it doesn’t work, then we are back at square one.

## A Fruitful Process

If you manage to follow these disciplines at all times, then the result will be greater quality and satisfaction for all. Also, developers will learn to be much more effective at their jobs. Once you start to follow a discipline, and you find that it actually helps your work, you grow fond of it; and working without following it will seem like an unnecessary risk.

It is inevitable that at some point the team will relax one or more of these disciplines. No problem; we have all been there. Just note down the [technical debt](http://www.codinghorror.com/blog/2009/02/paying-down-your-technical-debt.html) and move on. You will probably feel the deficit and get back into the groove on your own; otherwise it means that the discipline was not useful in your particular case, and you will need to question it. Next time try to use it again and see if it really helps.

Give it a try. Start with one discipline, and add it to your daily work. Then pick another, and so on. In no time you will see how they integrate seamlessly with good development processes, and even with mediocre environments these disciplines will make them tolerable.

`---8<---8<---8<---8<---8<---`

Posted originally at [Tumblr](http://tech.moveinblue.com/post/20182111059/developer-discipline) on 2012-03-30.

Back to [index](index.html).

