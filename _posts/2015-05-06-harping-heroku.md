---
layout: post
title: "Harping Heroku"
date: 2015-05-06 12:55:46
categories:
 - software
tags:
 - heroku
 - webdev
 - process
 - example
---


Since I just spent [about][firsttweet] an [hour][lasttweet] setting up
the dependencies for my [Harp.js][harp] website on [Heroku][heroku], I
figured I would document the process here.

The [guide][harpguide] that's up on their website is outdated, as far
as I can tell. Perhaps the [buildpack][bp] is the focus of attention
now. I tried that once, but since I want to know how to do it anyway,
I [did it by hand][json] when there was some kind of error. Of course,
I am new to the [Node.js][node] world, so... [YMMV][ymmv].

{% raw %}
<!-- more -->
{% endraw %}

__TL;DR:__ [Here][github] is the final version that worked for me. Be
sure to add `/node_modules` to `.gitignore` after `npm install`.

Anyway, I have nearly decided to host my website on [Heroku][heroku]
after its launch [actually happens][launchtweet]. Reasons are many,
but include the following:

  1. [Heroku][heroku] will most likely be [cheaper][hprice] than my
     current set up.
  2. [Ipage][ipage], who I use now, has been less-than-optimal for a
     while now: renewing me silently at an increased rate, down times,
     etc. It is time for a move of some sort.
  3. [Heroku][heroku] and its ilk are the [up and coming][newthing]
     thing in the tech world right now. I want experience using it in
     some fashion under my belt.
  4. [This site][toft] is working just fine, and that is a good enough
     recommendation for me.

In any event, I created a [heroku app][cdr255heroku] for the site,
following the [guide's][harpguide] instructions, and what to You know?
An error appears.

Checking the [logs][hlogs], It is a missing dependency... which I
found odd. It ran fine on my machine, and I followed the instructions
on the site to a T. But anyway, I then began another trek through
[dependency hell][hell] in order to solve this.

What it comes down to is that it seems the [guide][harpguide] assumes
there will be some kind of [automatic dependency resolution][deps],
whereas (much like [Slackware Linux][slack]) [Heroku][heroku] did not
seem to be providing that... or, rather the version of [npm][npm]
heroku was using didn't.

Eventually, I got through every single dependency it wanted... And
[here][github] is the resulting [package.json][pkg] file. But then,
once I deployed it, I did something crucial: I uploaded the working
project to [Github][githubrepo] for the first time. And then, looking
at the pushed project, I had the answer.

It had been using the locally built packages which were in the repo,
something that (in a separate [article][herokuarticle] I found halfway
through [dependency hell][hell], trying to follow best practices)
[Heroku][heroku] advises against because of this very reason.

So, in short, the [guide][harpguide] on the [Harp.js][harp] website
doesn't have the __crucial__ step of adding the /node_modules
directory et al to the [.gitignore][gitignore] file associated with
the project before committing the setup for [Heroku][heroku].

Had I been more experienced with [npm][npm] or [Node.js][node] in
general, I might have noticed that omission and just done it
myself. But since [Harp.js][harp] is not targeted exclusively towards
the [Node.js][node] crowd, _and_ considering they took the time to
describe a [fairly common][pkg] part of deploying a [Node.js][node]
project complete with [boilerplate][guide] code, I feel as though that
should be mentioned somewhere in the guide.

As I was writing this post, they [contacted][harptweet]. I've
responded to them this morning, and will update this post after I hear
back from them.

At least it is [here][thispost] now, though. [HTH][hth]!

[firsttweet]: https://twitter.com/cdr255/status/595791698300694529 "I've grown to like twitter more and more since I have started using it this year. It really is a great way for people to communicate, especially for questions or problems like this one."
[lasttweet]: https://twitter.com/cdr255/status/595804030154182656 "I was very surprised to see, not even an hour after I posted my tweet saying I figured it out, that the harp devs had contacted me, asking what they could do to improve the docks. I knew I chose the right service."
[harp]: http://harpjs.com/ "Harp has been a joy to work with: It is simple, does what You need it to and gets out of the way. No frills, unless You add them, and best of all the whole things is FOSS."
[heroku]: https://dashboard.heroku.com/ "As far as I have used them, Heroku stands tall above the rest as a reliable, easy to use, and well documented service. There are rumors of a shift in focus towards enterprise development floating around right now; I can easily see why. They have a very good service put together."
[harpguide]: http://harpjs.com/docs/deployment/heroku "This guide just seemed a bit outdated when I used it. Things being the way they are in the Tech world, it's not uncommon for docs to get old and unusable unless they are constantly updated. That's why wikis have become so common: Just let the users do it."
[bp]: https://github.com/zeke/harp-buildpack "This buildpack is completely deprecated, now that I look at it further. In the README, it just recommends using the standard Node.js buildpack... But, if You were going to do that anyway, why not just define everything by hand?"
[json]: http://www.json.org/ "Javascript is a whole new world to me at the moment. I have experience with Ruby, Lua, C++, and LISP, but have largely stayed away from Javascript out of a lingering resentment towards its early use."
[node]: https://nodejs.org/ "Node.js seems so powerful: An entire web server, with dynamic compilation, written entirely in Javascript. I want to learn to use it, but I am a fair way off, I am afraid. We'll see."
[ymmv]: http://www.urbandictionary.com/define.php?term=ymmv "Your Mileage May Vary: If I'd have known more about Node and npm development in the first place, I probably would have done what I needed to do out of habit. And, if You want to use the buildpack, I am sure there is a way to make it work. But neither of those apply to me."
[github]: https://github.com/cdr255/cdr255-website/blob/master/package.json "I am still using my ultra-defined package.json, for now, for two reasons: 1. It took me so long to create that I just don't want to throw it away. And 2. I want to keep my development environment as close to my production environment as possible, and these are literally the packages and versions I have installed on my local computer."
[launchtweet]: https://twitter.com/cdr255/status/595778424775520256 "I originally had planned to launch the site last Friday, but ran into a bottleneck: Moving all of my older content to the new site, and making it uniformly formatted and organized."
[hprice]: https://www.heroku.com/pricing "There are rumors right now about Heroku crippling the free tier and pushing people who use it like I do into the ~$7 Hobbyist block. I am willing to pay ~$7 for the way I use it, but doing so definitely enables me to seek other services for more competitive rates."
[ipage]: http://www.ipage.com/ipage/index.html "Ipage was great for starting out, because it was cheap (~$2/mo!) and because it taught me what to expect in a paid hosting service (both good and bad). Recently, I have just had problem after problem every time I deal with them... but, then, I was renewed without warning or notice at a much higher, second year rate. So, maybe I am a bit salty in that regard."
[newthing]: http://stackoverflow.com/questions/11008787/what-exactly-is-heroku "I am not really that into following trends, but the service and cloud based development scene has been around long enough that I feel that I want to give it a try, at least. At the very least, I will learn something new."
[toft]: http://www.toftandtoddy.com/ "This blog has become one of the highlights of my days, and though there is sometimes a small bit of lag when first loading the page, once I am actually on the site it responds just fine. Thanks, Heroku, for making that possible!"
[cdr255heroku]: https://cdr255.herokuapp.com/ "This site is not finished yet; I just wanted to see if it would deploy or not, and have a pushable version on the web. When it is up, it will be at cdr255.com... and it won't have a bunch of empty pages and broken links."
[hlogs]: https://devcenter.heroku.com/articles/logging "The logs were, as usual, my savior when it came to figuring out what was going wrong with my site. And, again, Heroku did this very well: To view the most recent logs, all I needed to do was type 'heroku logs' in the working directory. Much more convenient than even a 'cat run.log', because it is updated on the refresh."
[hell]: http://en.wikipedia.org/wiki/Dependency_hell "I have a love / hate relationship with dependency hell. On one hand, I love that it has taught and teaches me so much about software, my computer, and how things fit together. On the other hand, it just *takes* *so* **long!** Just a matter of doing things right vs. doing them quickly, I guess."
[deps]: https://devmanual.gentoo.org/general-concepts/dependencies/ "Gentoo, as a project, was very good in this regard... especially considering how much configuration it allows. Other giants with dependency resolution are Debian and Red Hat. All do a great job; I am linking Gentoo because they got a bit more verbose about it."
[slack]: http://www.slackware.com/ "Slackware, as a whole, has taught me more than just about any other software project out there: No automatic dependency resolution, no preconceived ideas about start up, no unneeded patches, and a very Do It Yourself attitude all rolled together into one great working, fully capable operating system."
[npm]: https://www.npmjs.com/ "NPM seems just about as powerful as Ruby's gem command, but comes with local directory install built in (no need for things like rbenv or rvm). I am impressed with it, though it does confuse me at times."
[pkg]: https://docs.npmjs.com/files/package.json "This is what really impressed me about npm: Such a simple syntax, and in such a terse, easy to use format. **And** You don't even *need* to do it by hand, if You don't want to. Bravo."
[githubrepo]: https://github.com/cdr255/cdr255-website "My site will always be on github as well as wherever I deploy it, especially for reasons like this post. I want to both remind myself and help others if they run into the same snags I did."
[herokuarticle]: https://devcenter.heroku.com/articles/deploying-nodejs#how-to-keep-build-artifacts-out-of-git "This article was my silver bullet for the werewolf of deploying this project. Again, I think it was largely my inexperience with the best practices of npm that caused these issues... but without this article, I would not have known what I was doing wrong."
[gitignore]: https://www.gitignore.io/ "The first file I add to a project tends to be the README.md file, but the *second* file is definitely the .gitignore. There are always files that just don't need to be in the git tree, like *~ backups. This site helps You generate a good, working .gitignore based on the project and environment."
[thispost]: # "I think this is one of the first *real* tech posts I have done on this blog, in any of its forms. It has a lot of chaff, but I am fairly happy with how it turned out. I'll try to post more tech stuff in the future, too."
[hth]: http://www.urbandictionary.com/define.php?term=HTH "Hope This / That Helps! This is just my $0.02 about the subject, and a recounting of my own experiences. As I said above, YMMV!"
[harptweet]: https://twitter.com/HarpWebServer/status/595823331175182336 "I am very impressed that they contacted me, and so promptly, too! Shows that they really care about the project, and the users who choose to use it."
