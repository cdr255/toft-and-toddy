---
layout: post
title:  "Moving back to Jekyll"
date:   2017-07-04 22:37:29 -0400
categories: software
tags: jekyll update blogging
---
After a fairly long time using [hexo][hexo] as my main blogging engine, I've decided to give [jekyll][jekyll] another try.

The reasons:

1. I used `hexo g -d` for a few years, and have learned very
   little [Javascript][js] in that time. I've been learning ruby the
   whole time, though... and because of that, I wanted my blogging
   engine to be ruby as well.
2. Hexo has a decent amount of community support—in Chinese-speaking
   communities. I don't yet speak Chinese, so I can't make much use
   out of the documentation there. Jekyll has a much wider
   English-speaking presence online, which will make it easier for me
   to maintain my site.
3. Hexo operates on the basic premise that You will never stop using
   Hexo. It does things in weird ways, with the assumption being You
   are deploying to [heroku][heroku] or a similar dynamic hosting
   service. I've made the switch, on all of my sites, to
   use [Nearly Free Speech][nfs] instead, and so deploying has a
   special, tricky setup… generating the site has a special, tricky
   setup… and version control (which, at least in my hexo sites, has a
   weird, nested-but-unrelated setup) is basically ignored on one end
   and isolated on the other. Jekyll operates as a static site
   generator first, and because of that will make upkeep easier.
4. All of my hexo blogs have had something of an identity crisis this
   year, anyway. With the weird condition my life's been in, I've lost
   some published post's source, and can't currently access the rest
   of the source directories anyway. It's a good time to try something
   new.
5. It's been a few years since I've switched, and I tend to get antsy
   after that amount of time. We'll see if Jekyll breaks that trend.

[heroku]: http://heroku.com "I liked heroku for a while, but they got pricey and I've always preferred static sites."
[hexo]: http://hexo.io "Hexo will still be my fallback, I suppose. Good thing it's all Markdown (or, well, Kramdown)."
[jekyll]: http://jekyllrb.com "I hope Jekyll actually pulls through for me this time..."
[js]: https://en.wikipedia.org/wiki/JavaScript "Javascript is a lot like python, markdown, and a lot of FLOSS in general: A mess of a spec."
[nfs]: https://www.nearlyfreespeech.net "NFS has been very nice and fair. And my sites load 10x faster than on the free tier of heroku."
