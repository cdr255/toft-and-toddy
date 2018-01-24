---
layout: post
title:  "Gaining Guile"
date: 2017-07-12 03:22:31 -0400
categories: code software
tags: scheme guile scripting 
---

I've been toying with the idea of hacking away at personal coding
projects again.

The last big project I worked on was [humour][humour], a small C++
program that implements a virtual version of a specified deck of
symbolic cards. The program lets You draw an arbitrary number of
pseudo-random cards from the deck, and displays the pertinent
information on the standard output.

It was a learning project for me. See, I'm pretty experienced on the
sysadmin side of things, and I can write decent shell (okay,
really [bash][bash]) code. But… When it comes to actually structuring
a large program, creating data structures and class functions that
interplay well with one another to solve a problem, all while
maintaining some semblance of consistency and order… I'm just not very
good.

I attribute that weakness to three main points of failure:

1. I'm simply ignorant of a decent chunk of advanced programming
   concepts. 
   
   I know the difference between [recursion][recursion]
   and [iteration][iteration], I know the basic ideas
   of [encapsulation][encap], and I think I
   understand [functional][functional][func]
   and [object‐oriented][oop] paradigms well enough. But I don't
   really understand what I can do with those paradigms, I can't
   (easily) implement encapsulation without wading through hours of
   guess‐and‐check style debugging, and I struggle to create
   algorithms using recursion and iteration to accomplish complex
   tasks.
   
   Basically: I'm self‐taught… and it shows.
2. I lack familiarity with a few go‐to languages, but have a passing
   knowledge of many.
   
   I started programming (for real, anyway) with [C++][cpp]. I would
   *not* recommend that to anyone but masochists; If I had started
   with a higher level language like [BASIC][basic]
   or [Python][python], I would probably be a lot more knowledgeable
   about certain higher-level concepts by now.
   
   See, a big side effect of starting with such a huge and
   relatively‐low‐level language as C++ was that, since I was young
   and impatient, I started flitting back and forth around different
   languages: spending the night with [Perl][perl], the weekend
   with [Ruby][ruby], and the Summer with [LISP][lisp]. It's let me
   abstract away a lot of simple syntax, and learn the actual concepts
   behind simple concepts like accepting input, writing to stdout,
   looping and recursing… but also prevented me from learning the more
   complex forms and functions I would have learned by persevering.
   
   Basically: I really gotta focus on a few languages for the time
   being, and learn them *fully*. *Including* their
   full [standard libs][stl].
3. I don't program enough for *fun*.
   
   Like I said, I mostly write shell code… And then, I also mostly
   write shell code to solve a problem I'm currently having, so I
   don't have to deal with the boring parts of a problem anymore. It's
   not often I decide to sit down and try to create a program to give
   me a deck of cards, or a program to challenge myself in a fun
   way. And when I *do* do that, I often quit a day or two later
   because I get frustrated at my own lofty goals.
   
   Basically: I need to program more frequently, and on a simpler scale.

So, I'm a self‐taught no‐fun shallow‐water programmer. And I want to
improve.

One book a lot of people recommend is the [SICP][sicp]. Since the
examples are all in [Scheme][scheme], I needed to choose a Scheme
implementation… Because there was no way I was trying to understand
the examples without typing them in and running them. I
chose [GNU Guile][guile] for a few reasons, the simplest being that it
comes stock on [Slackware][slack] 14.2.

I'll admit, learning another language to try to focus on learning the
languages I know is a bit silly (and
oddly [appropriate for computer science][csxkcd] in general). But I've
already started, and there is nothing to do about it now.

Below, I've included a simple little hello world script. I'm not going
to spam my blog with example code, but I wanted to share where I am
right now in learning… And other than primitives (and what I know from
hacking [Common Lisp][cl] for a while) that’s all I know so far.


~~~ scheme
#! /usr/bin/env guile 
!#
(display "Hello World")
(newline)
~~~

[bash]: https://www.gnu.org/software/bash/
[basic]: https://en.wikipedia.org/wiki/BASIC
[cl]: http://wiki.c2.com/?LispSchemeDifferences
[cpp]: https://en.wikipedia.org/wiki/C%2B%2B
[csxkcd]: https://xkcd.com/927/
[encap]: https://en.wikipedia.org/wiki/Encapsulation_(computer_programming)
[func]: https://en.wikipedia.org/wiki/Functional_programming
[guile]: https://www.gnu.org/software/guile/
[humour]: https://github.com/cdr255/humour
[iteration]: https://en.wikipedia.org/wiki/Iteration#Computing
[lisp]: https://common-lisp.net/
[oop]: https://en.wikipedia.org/wiki/Object-oriented_programming
[perl]: https://www.perl.org/
[python]: https://www.python.org/
[recursion]: https://en.wikipedia.org/wiki/Recursion_(computer_science)
[ruby]: https://www.ruby-lang.org/en/
[scheme]: http://www.schemers.org/
[sicp]: https://mitpress.mit.edu/sicp/
[slack]: http://www.slackware.com/
[stl]: https://en.wikipedia.org/wiki/Standard_library
