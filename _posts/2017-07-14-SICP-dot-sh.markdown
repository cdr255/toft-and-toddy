---
layout: post
title:  "SICP.sh"
date: 2017-07-14 01:41:18 -0400
categories: code software
tags: scripting bash linux 
---

>We are about to study the idea of a *computational
>process*. Computational processes are abstract beings that inhabit
>computers. As they evolve, processes manipulate other abstract things
>called *data*. The evolution of a process is directed by a pattern of
>rules called a *program*. People create programs to direct
>processes. In effect, we conjure the spirits of the computer with our
>spells.
{% cite sicp %}

It's this approach to computing that has always fascinated me more
than most others. The [gravity][xkcdfut] of what we are now able to do
with technology, most of which was strictly in the realm of fantasy—or
not even there, because it was so far gone from the reality in which
we used to live as a species—eludes me sometimes… But it always
eventually returns to me.

I spend a *lot* of my time in front of one computer screen or
another. There are very few people who would say the amount of time I
devote to these giant lumps of [carefully organized sand][xkcdsand] is
healthy. And yes, I do indeed go through periods of time where I
rarely touch this computer or that tablet… But it's rare indeed that I
spend any amount of time completely unplugged, as I used to when I was
younger.

Of course, I'm not exactly complaining.

Today I learned a neat little way to make it so shell scripts I write
can easily be symlinked to standard directories—even when they rely on
a relative directory structure—instead of having to live in a
directory in my `$PATH`.

It uses two programs from the [GNU][gnu] [coreutils][coreutils] (It's
also doable with any scripting language worth it's salt, but I don't
like using interpreters in my bash scripts when I can avoid doing so),
so if You don't like GNU for some reason YMMV.

Here's the line of code, for those who are impatient:

~~~bash
cd $(dirname $(readlink -f $0))
~~~

Basically, the problem is that the symlink is not in the directory the
script lives in. `readlink -f` is what we use to discover where the
actual script lives (the `-f` flag [canonicalizes][canon] the
resulting path, meaning there will be no symlinks in the resulting
path at all).

The problem with that is that it includes the name of the
script. `dirname` strips the last bit from a path, removing the
script's name entirely.

For those unused to bash scripting, the `$()` sections run the command
inside in a subshell, returning the output. 

Using the [substitution model][sub] (which can be described as "To
apply a compound procedure to arguments, evaluate the body of the
procedure with each formal parameter replaced by the corresponding
argument."{% cite sicp %}, or "Find the innermost nested commands, run
them, and then proceed outwards using the results in their place."),
we see the flow of the line is such:

1. Find out where the script actually lives (and canonicalize that
   path).
2. Strip the scripts name from that path.
3. Change directory (within the script) to wherever the script lives.

So long as this is placed before the script references any
script-local files, it will work without a problem. Since I cobbled
this answer together from multiple sources, I figured I'd post it here
myself.

### References

{% bibliography --cited_in_order %}

[canon]: https://en.wikipedia.org/wiki/Canonicalization "One of my favorite quotes from Hackers is when they finally got someone using canonical in the canonical way."
[coreutils]: https://www.gnu.org/software/coreutils/coreutils.html "Coreutils are the standard library of bash shell scripting."
[gnu]: https://www.gnu.org/home.en.html "I don't understand people who don't like GNU."
[sub]: https://blog.jayway.com/2011/03/20/the-substitution-model-a-tool-for-understanding-recursion/ "This is another concept I kinda knew but more fully explored in SICP."
[xkcdfut]: https://xkcd.com/354/ "I don't think I'll ever stop loving what wonders we've been able to create."
[xkcdsand]: https://xkcd.com/1349/ "It's important to remember this, too. It's all math and logic, under the hood. And *lots* of sand."
