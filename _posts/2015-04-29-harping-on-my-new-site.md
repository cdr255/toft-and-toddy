---
layout: post
title: "Harping on my New Site"
date: 2015-04-29 13:07:37
categories:
 - software
tags:
 - harpjs
 - nodejs
 - programming
 - webdev
---


As I just spent an entire day working on it yesterday, I think I'll
discuss how my [website][cdr255] redesign is going so far today.

I was very upset at how outdated and messy my site has looked for
quite some time now. (N/B: It's still the old version as I write this;
the new one is slated to go up on Friday the 1st of May.) I made it
using [webgen][webgen] about two years ago, and I never really updated
it in any meaningful way. And boy, does it show.

[Webgen][webgen], of course, is not the problem there. The problem
rests squarely on my shoulders; I simply did not update it, and when I
did, I didn't know the system well enough to make it
[Simple and Clean][simple]. I needed a change, and I needed to tear it
down anyway, so I went looking for a new
[Static Site Generator][static] to power my site.

{% raw %}
<!-- more -->
{% endraw %}

The reason I wanted a [static][static] is simple: I have, for most of
my life, been using [older computers][comps]. And even now, as I write
this, my internet is [so slow][slow] that it can't load facebook
reliably... at least not for chatting. I want my site to be viewable,
no matter how bad Your connection or hardware is. And
[dynamic][dynamic] sites just don't let that happen as well as
[static][static] ones do.

Also, in regards to server use, it has its most
[obvious benefits][staticben].

Anyway, I tried a bunch out. I don't know [Go][golang], so
[Hugo][hugo] had the same problems that I had with
[Webgen][webgen]. And [Jekyll][jekyll] was just too powerful for my
purposes, and its cousin [Octopress][octopress] was too focused on
blogging.

This blog runs on [Hexo][hexo], so I toyed with the idea of making
*both* of my main sites with it... But well, [Hexo][hexo] is good for
a blog, but using it for a homepage is nontrivial, unless You want a
homepage that is *also* a blog.

Then, I stumbled across [Harp][harp]: A little "Static web server"
that takes a strict but powerful approach to designing a site and
(provided You stick with it) allows You to both run it as a server and
compile it down to static source files. It was exactly what I was
looking for, although I recognized that I had a lot of work ahead of
me: There were no themes built in that I could derive from, aside from
a simple one-page welcome screen.

I was gonna do it (almost) from scratch, but I was able to do it
*right*.

Anyway, alongside [Harp][harp] I'm using:

 - [Markdown][markdown] for the actual content, the whole reason to
   have a site in the first place.
 - [Jade][jade] as a template language, so that I don't need to keep
   rewriting the same boilerplate in each file, or manually loop
   through certain data elements.
 - [Less][less] and [CSS3][css3] to style the site, make it look pretty,
   and bring everything together.
 - [HTML5][html5] for when something just **won't work** in Jade or
   Markdown.
 - [Javsscript][js]... well, [Harp][harp], [Jade][jade], [Less][less],
   and the version of [Markdown][markdown] I am using
   ([marked][marked], I believe) are all written in it, and I am a bit
   of a [cynic][cynic] when it comes to [Murphy's Law][murphy].

I'll let You know how it goes!

[cdr255]: http://cdr255.com "The point of my homepage, as opposed to this blog, is to collect all of my work as it is completed in a compact, easy-to-use center... and to provide a jumping-off point to all of my other web profiles."
[webgen]: http://webgen.gettalong.org/ "Webgen was really, really useful while I used it, in the limited capacity with which I used its features, anyway. If You are looking for a Static Site Generator, and are familiar with ERB and Ruby, I definitely recommend it."
[simple]: https://www.youtube.com/watch?v=UigzN-4JR14 "I am actually much more familiar with the Japanese version of this song, 'Hikari'. Having never really liked the series to begin with, I have listened to Utada Hikaru's work more than I have played the game. Still, it is fun to use as a reference."
[static]: https://www.staticgen.com/ "This like will take You to an aggregator of FOSS Static Site Generators, that is able to sort them based on their Github statistics. Jekyll is, and always has been, at the top... but all of the ones I talk about in this post are there, along with many, many others I haven't tried yet!"
[comps]: http://penny-arcade.com/comic/2012/03/14 "Man, I wish I'd have been more sentient back in the early days of personal computing... Don't get me wrong, I was on MS-DOS and writing .bat files, but I didn't really dive into computers (or heck, discover *NIX!) until I was in middle school, around 2002. As much as I love what remains from the era, I can only imagine how much more I'd have appreciated it if I could really have *appreciated* it back then."
[slow]: http://www.cad-comic.com/cad/20021104 "I actually use Verizon... but I am certainly not one of their more appreciated customers. I am very glad that Comcast and Time Warner didn't merge, if only because two huge companies might pay a modicum more of attention to the little guy than one gargantuan one. And hey, also the lobbyists should stay divided. I'm looking at You, comcast."
[dynamic]: http://en.wikipedia.org/wiki/Dynamic_web_page "Dynamic sites are great for a few specific use cases, if You have an excess of computing power, or if You have content that changes by the minute. Otherwise, Static Sites are generally better practice, if only because of the decrease in cost to the owner of the site."
[staticben]: http://en.wikipedia.org/wiki/Static_web_page "Static sites are easier to develop, faster to load and transfer, and are getting to the point where (at least for things like blogs and personal sites) there is nothing dynamic sites can do that static ones can't."
[golang]: https://golang.org/ "Go is an interesting conundrum to me: On the one hand, hey, it is by Google and has a pretty good support network around it. But on the other, there is no real *reason* that a person should learn it. It is not everywhere like PERL and Python, not different enough to be like Haskell or LISP, and not standard enough to be Java or C. As for scripting, I already know a good number of languages, and Go just doesn't grab me like it would need to. I dunno. I'll think about it."
[hugo]: http://gohugo.io/ "For those who know Go and need something like what I've been talking about here, check out Hugo: It is a very neat and tidy static site generator that has a bunch of themes which are great for jumping off from bundled with it. It is actively developed, and I would be using it, but I don't know Go... And it uses the SimPL license right now, which is suboptimal if it ever comes to court."
[jekyll]: http://jekyllrb.com/ "Jekyll and its liquid templates, man. No arguing that it is powerful and useful, and it is basically the posterchild for people unsure about static site generation, but it is a bit of overkill for my use case here: It was more important that I keep everything simple, than that I be able to simply do everything."
[octopress]: http://octopress.org/ "Octopress is a name which has always made me scratch my head. It isn't really related to Wordpress at all, so why go to the trouble of making it seem that way? If You like Jekyll, but wanna focus more on blogging, here ya go."
[hexo]: http://hexo.io/ "This entire site is hosted through Hexo, and I can easily say that it fits my use case perfectly. Having set the site up the way I like it, all I need to do to update the site is type a single command (after writing new content, of course). Highly recommended, especially if You have an interest in Node.js or Javascript."
[harp]: http://harpjs.com/ "I've only just used it today, but I *did* end up working with it for well over six hours straight. It is a very well designed server, and lets You view Your changes as soon as the files are saved. Also, with the number of preprocessors it supports, it is very easy to recommend. Try it out today!"
[markdown]: http://daringfireball.net/projects/markdown/ "Oh, Markdown. The Markup language that got me off of hand-coding my own XHTML 1.0. If You are not familiar with it, it is one of the easiest things in the world to learn. The syntax is very similar to how emails and such were written before HTML became the standard, and there are variations that support just about anything You could want from HTML. Also, it is natively supported by Github and Tumblr."
[jade]: http://jade-lang.com/ "Jade is a language I hadn't really used much until today. So, having played around with it a bit, I have to say that I like it a lot! If You need something that Markdown won't let You easily do, Jade definitely will let You do it. It's just a matter of me learning the syntax now, as Jade is very picky with its whitespace."
[less]: http://lesscss.org/ "Less is more...  but most is the best screen reader, right? Haha. Just kidding. Less is what You should use if You want to make Your CSS read more like code, with less redundancy and more variables. SASS works too, but I am more familiar with Less."
[css3]: http://www.w3.org/Style/CSS/ "CSS is something which, if You use the web, You appreciate greatly. It is the thing sites use to make everything colorful, pretty and aligned just so. If You have ever made a custom template for a site like Neopets or Tumblr, You have used it. If not, why not start now?"
[html5]: http://www.w3.org/TR/html5/ "I honestly was pretty commited to XHTML 1.1, but HTML5 just kept getting better and better, so I eventually made the switch. It is just so powerful and capable; there are whole games written using it, CSS3, and Node. I am very impress with it, still."
[javascript]: http://en.wikipedia.org/wiki/JavaScript "ECMAScript is another word for it, if You want to distance Yourself from Java and trademarks. I am just really diving it to it recently, having long stood against it in favor of a faster, simpler Web. But with the things it can do OUTSIDE of snowflakes on a webpage, I am excited to get my hands dirty."
[marked]: https://github.com/chjj/marked "By this, I mean that because this whole setup is in Javascript it needed a version of Markdown written in Javascript too. The one they went with was marked, which allows for Github Flavored Markdown as well as tables, literal line breaks, and a bunch of more additions to the original standard."
[cynic]: http://en.wikipedia.org/wiki/Cynicism_(contemporary) "I am pretty convinced something is going to break with either Hexo or Harp in the next few days. I hope I am wrong, but I can't help but assume that I am right. I wonder what that says about me as a person?"
[murphy]: http://somethingpositive.net/sp09212009.shtml "One of my favorite quotes from this story arc is that 'Murphy doesn't take days off.' This one is slightly NSFW, depending on Your tempermant and place of work, I guess. Strong language, alcohol use. T for Teen."
