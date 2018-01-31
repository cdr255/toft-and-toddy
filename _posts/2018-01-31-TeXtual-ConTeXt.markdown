---
layout: post
title:  "TeXtual ConTeXt"
date: Wed, 31 Jan 2018 15:38:37 -0500
categories: 
 - writing
tags: context latex markup
---

The main way I write nowadays is in either [Kramdown][], [Org-mode][]
or in [LaTeX][].

For writing blog posts, webpages, comments, emails, and the like, I
generally use [Kramdown][]. That's because it is simple to write,
follows an intuitive (to me, at least) syntax, and generally stays out
of my way while I get things typed up. When I need to write something
fast, get it out there, or compile it to HTML quickly, it's my go-to
markup language.

[Org-mode][], on the other hand, I use when I need more structure than
a simple page or blog post. When a [Kramdown][] file gets too big, I
convert it over to [Org-mode][]. And story/campaign outlines,
itineraries, world building, and even straight-up writing prose are
all tasks I leave solely to [Org-mode][].

There are many reasons, but a few of the more important ones are: I
use Emacs for all of my plain text editing, and [Org-mode][] is a part
of Emacs. It exports to a lot of different formats, should I need to
export my writing somewhere, including PDF, LaTex, and even [Open
Document Format][odt] and [Microsoft Word][doc]. And it supports only
the most lexical of markups, removing the temptation to fuss with
CSS/SASS/whatever to make my work look better.

Finally, there's [LaTeX][]. And that's really the reason I'm writing
this post (if You couldn't tell from the title). Up until now, when
something is going to be printed, I wrote it in (or converted it to,
and edited it in) [LaTeX][]: Game handouts, booklets, zines,
worksheets, sheet music. It let me define a template, stick my content
in, and compile it to a PDF ready for the printer. No messing around
with fonts or styling (after the initial setup for the document) and
no problems.

Except, of course, for how old it is. Newer standards, like Unicode
support, TrueType fonts, and hyperlinking in PDFs all require packages
that, frankly, don't play well together in [LaTeX][]. 

That's why, starting today, I'm migrating away from [LaTeX][] and
towards [ConTeXt][].

[ConTeXt][] is another layer on top of the original [TeX][] system by
Knuth that implements a lot of the things I found wanting in [LaTeX][]
packages as a part of its *core features*. I don't need to include a
package to use a different character set, or to add a hyperlink, or to
use more than one column per page. That's all baked in.

And while I'm sure in 9 years I'll be speaking of [ConTeXt][] like I
am now of [LaTeX][], for now, I just need something that will work,
reliably. And that's what [ConTeXt][] is offering me.

Once I feel comfortable with it, I'm sure I'll talk more about it
here. As it stands, I've only *just* made a "Hello World"
document.

Stay Tuned.

[ConTeXt]: http://wiki.contextgarden.net/Main_Page  "I'm really hoping that ConTeXt will be a good fit for me. I don't want to go back to writing anything in a word processor; I much prefer working with plain text files. But I need Unicode support, and I also need to be able to rely on getting documents made when I need them. Hopefully, ConTeXt will deliver."
[doc]: https://en.wikipedia.org/wiki/List_of_Microsoft_Office_filename_extensions "Yes, I do hate using Microsoft products, but sometimes I need to work with people who simply do not care. The fact that this is possible without simply copying the raw text (or converting the ODT export over) and fixing it up is a big point in Org-mode's favor because of that. But, no, I don't use this feature regularly, and I don't see myself doing so unless I absolutely have to and have already protested in the future."
[Kramdown]: https://kramdown.gettalong.org/ "I use kramdown instead of markdown because, while markdown does successfully keep things simple and portable without a lot of cruft, I need to be able to add attribute lists and use tables. It also helps that the kramdown compiler can also understand pure and github-flavored markdown as well as HTML, output PDF, HTML, and even (crude) LaTeX, and is written in a language I'm interested in: Ruby."
[LaTeX]: https://www.latex-project.org/ "I'm pretty hard on it in the post, but I've been using LaTeX regularly since 2009. I keep running into a few brick walls, but if I didn't want to do those things all in the same document, LaTeX would still be my print-language of choice. Really, it was the lack of Unicode support that sent me looking for a replacement... The fact that, for whatever reason, I can't easily type in another language or use any of the more recent Unicode characters is a huge deal breaker."
[odt]: https://en.wikipedia.org/wiki/OpenDocument "This is the 'Word Document' format I prefer to use. Not only are Microsoft's offerings incompatible across versions of their own software, they also are inelegant, patent-encumbered, and just a pain to use in a generally FLOSS environment. At this point, LibreOffice is basically indistinguishable in capability from Microsoft Word. But, more on that in another post."
[Org-mode]: https://orgmode.org/ "I've tried for a while to also use Org-mode as a planner, as many who enjoy the syntax have come to do. That doesn't work for me, mostly due to the fact that, when I use Emacs, I'm setting out to do something already: I don't need it telling me I forgot to get my oil changed, or I need to pay a bill. I get enough of that from my phone and (when I actually use it) my bullet journal."
[TeX]: https://www.tug.org/whatis.html "I've never used straight TeX, but from what I've seen of it, I'm very glad things like LaTeX and ConTeXt exist. Having that much control wrapped in that much complexity would spell disaster for me; I would never get anything done, instead choosing to mess around forever with the system, to make it 'Just Right'."
