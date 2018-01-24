---
layout: post
title:  "Primary Displays"
date: 2017-04-20 -0400
categories: software games
tags: linux WM bug fix
---


I don’t use a standard [Desktop Environment][1]{: target="_blank"
rel="external"} for my GNU/Linux computers. Instead, I opt for a more
minimal [Window Manager][2]{: target="_blank" rel="external"}, like
[Fluxbox][3]{: target="_blank" rel="external"} (my [Slackware][4]{:
target="_blank" rel="external"} default), [StumpWM][5]{: target="_blank"
rel="external"} (my [LISP][6]{: target="_blank" rel="external"} based,
hackable, preference), or [Joe’s Window Manager][7]{: target="_blank"
rel="external"} (Better for laptops and non-[LISP][6]{: target="_blank"
rel="external"} machines). I’m writing this post from [JWM][7]{:
target="_blank" rel="external"}, in fact.

 <a id="more" /> One problem I’ve run into with certain games is caused by the fact that
these more minimal [WMs][2]{: target="_blank" rel="external"} often do
not set a [Primary Display][8]{: target="_blank" rel="external"} by
default. Seeing as the most common setup is one monitor, and there is a
fallback to use the only existing monitor in X, *and* those who have
more than one have probably *explicitly set* their monitors how they
like them, it makes sense they might avoid declaring the only monitor as
primary. And under most use cases, this doesn’t cause any problems.

But, well, if You use [PulseAudio][9]{: target="_blank" rel="external"}
and try to run any [Game Maker][10]{: target="_blank" rel="external"}
games in one of these [WMs][2]{: target="_blank" rel="external"}, You
might find the following error showing up shortly after You launch the
game, and shortly before it crashes:

    [/etc/pulse/client.conf:26] Unknown lvalue 'allow-autospawn-for-root' in section 'n/a'.
    ~/.local/share/Steam/steamapps/common/<GAME FOLDER>/run.sh: line 3:  4320 Floating point exception

So far, I’ve run into this problem with [UNDERTALE][11]{:
target="_blank" rel="external"} and [Siralim 2][12]{: target="_blank"
rel="external"}. Feel free to comment with more games below if the
following fix helps You.

As near as I can tell, the problem comes from the default config (under
[Slackware][4]{: target="_blank" rel="external"}) of [PulseAudio][9]{:
target="_blank" rel="external"} expecting there to be a [Primary
Display][8]{: target="_blank" rel="external"}. Since there isn’t, it
doesn’t know what to do and crashes.

Running the following command sets my laptop’s only display to Primary:

    xrandr --output LVDS1 --primary

And afterwards, I can launch the game without issue.

HTH. YMMV.



[1]: https://en.wikipedia.org/wiki/Desktop_environment
[2]: https://en.wikipedia.org/wiki/Window_manager
[3]: http://fluxbox.org/
[4]: http://www.slackware.com/
[5]: https://stumpwm.github.io/
[6]: http://www.sbcl.org/
[7]: https://joewing.net/projects/jwm/
[8]: https://unix.stackexchange.com/questions/5263/is-it-possible-to-control-which-monitor-is-considered-the-primary-monitor
[9]: https://www.freedesktop.org/wiki/Software/PulseAudio/
[10]: http://www.yoyogames.com/gamemaker
[11]: http://undertale.com/
[12]: http://www.thylacinestudios.com/siralim2/
