---
layout: post
date: Wed, 06 Jun 2018 16:03:05 -0400
categories:
 - Computers
tags: packages foss linux
---

I'm getting tired of all of these new, supplementary package formats.

([Snap][], [Flatpak][], and [AppImage][] are the three specific ones
I'm talking about here.)

I'm a recent (< 2 years) convert to [RPM][] style packages, coming from
the world of [Slackware][] and it's derivatives. Dependency tracking, one
command installs, and assurances of compatibility are all relatively
new things to me, and I'm not exactly resistant to that change
anymore. I'm glad to leave dependency hell behind.

However, what I've come to think of as "meta-package managers" have
recently emerged: systems which allow You to install software
*outside* of Your package management system, but within their
own. Sounds stupid at first blush, but there are a few cases where it
makes a lot of sense.

For instance, on an episode of [Late Night Linux][], one of the hosts
mentions [Steam][] as a good use case for [Snaps][Snap]. This makes
perfect sense, since all the packages do is download the runtime
anyway. Self contained systems like that, that cannot rely on the
environment already present on Your machine, are a great candidate for
this kind of installation.

Taking a step back, I'm one of those people who heavily uses `~/bin`
and company to install software which is unpackaged. Most of my
in-progress [scripts][] live there, as well as any "extract and run
from the directory" software. I also used to put my [texlive][]
distribution there. So, the idea of 'installing' software outside of a
package management scheme isn't completely alien to me.

However, the idea of these kinds of things being integrated into the
GUI package manager used by the system (like in [Ubuntu][], where the
[Snap][] and the [deb][] are listed one after the other with no
distinguishing marks) is just asking for trouble. Both from the
obvious end-user fiasco (that I experienced while getting my father on
Ubuntu) and from another, more problematic angle.

If we rely on this kind of thing too much, we'll just end up in the
[same situation][] as before, but with three new package managers that
don't care which distro You are running.

I think the reason these systems work so well right now is that there
are so few packages installed by them. Once a critical mass is
reached, You won't be able to use *this* package and *that* package at
the same time, because they rely on different, incompatible versions
of the same library. Trying to police that means making choices about
what can be in the package manager, which is where [RPMs][RPM],
[debs][deb], and others are now.

Or of course, we can do what [Microsoft][] did: install [libraries
alongside everything][], and bloat the system to death.

I'm just frustrated right now, because I've had to switch [Messenger
for Desktop][] out for [Caprine][]. Messenger for Desktop had the
normal slew of *nix packages, whereas Caprine only has .deb and
AppImage. That's troubling to me, and I hope it does not become a
common practice. I don't want to go back to compiling everything
myself.


[Snap]: https://snapcraft.io/ "Snaps have their place, but I don't like the idea."
[Flatpak]: https://flatpak.org/ "Flatpaks seem okay but superfluous. I'm sure they work fine, though."
[AppImage]: https://appimage.org/ "Of the three, I think I like AppImage Best."
[RPM]: https://en.wikipedia.org/wiki/Rpm_(software) "Having tried every package manager from tarballs to emerge, I can now confidently say I like RPMs the best."
[Slackware]: http://www.slackware.com/ "I still love Slackware, but I haven't used it in nearly a year. Maybe I'll try it when 14.3 comes out."
[Late Night Linux]: https://latenightlinux.com/ "I love this podcast. Definitely worth a listen, even if just for the Linux-based tech news."
[Steam]: https://store.steampowered.com/ "Steam is a rootkit-based DRM scheme that, unfortunately, looks like it is here to stay."
[scripts]: https://github.com/cdr255/scripts/ "Mostly bash, though I'm learning guile and ruby."
[texlive]: https://www.tug.org/texlive/ "Yeah, I'm still one of those people who marks up their docs with TeX."
[Ubuntu]: https://www.ubuntu.com/ "Ubuntu is a distribution I show to people who aren't that into computers, and that's why this is a problem."
[deb]: https://en.wikipedia.org/wiki/Deb_(file_format) "The deb package is interesting, but repository hell is another, new experience I'm not ready for right now."
[same situation]: https://xkcd.com/927/ "This also applies to things like chat clients. I still use IRC, tho."
[Microsoft]: https://www.microsoft.com/en-us/ "I am currently really upset that they bought Github."
[libraries alongside everything]: https://en.wikipedia.org/wiki/Dynamic-link_library "What a daft idea this is. I can't believe this is standard in the Windows world."
[Messenger for Desktop]: https://github.com/aluxian/Messenger-for-Desktop "This project is dead, now. Don't install it; it has a bunch of errors. Abandoned by the dev."
[Caprine]: https://sindresorhus.com/caprine/ "Caprine is interesting, and seems to work, but I wish it came natively packaged for RPM. Maybe I can make it work, if I learn how to use Electron."
