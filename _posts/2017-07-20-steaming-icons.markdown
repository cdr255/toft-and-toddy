---
layout: post
title:  "Steaming Icons"
date: 2017-07-20 22:17:33 -0400
categories: software games
tags: linux steam gtk multilib
---

One thing that's bugged me since I reinstalled [Slackware 14.2][slack]
and switched to [XFCE 4][xfce] as my [WM/DE][wmde]: [Steam][steam]q's
system tray icon wouldn't display.

I finally figured out what the problem was, after an hour or two of
googling: My multilib setup (Steam is 32-bit only for some reason)
prevented the pixbuf cache of 32-bit icons from being updated, and
therefore prevented the icon from being found by XFCE.

The solution was to run the following command manually: 

`gdk-pixbuf-query-loaders-32 --update-cache`

Credit for the solution goes to [zakame and SeB][linquest]

You'll need to sudo or su, because the file it creates is under
`/usr/lib/`. But, once that command is run, the default "Image Not
Found" icon no longer appeared in my taskbar: Instead, an
interestingly-almost-the-same-color-gray version of the steam icon
shows up.

I miss when icons had vibrant, saturated colors.



[linquest]: http://www.linuxquestions.org/questions/slackware-14/gdk-pixbuf-and-multilib-current-4175610293/ "So glad to have learned linux with LinuxQuestions.org available to me"
[slack]: http://www.slackware.com/ "The one, the only, always there to let me do what I wanna do."
[steam]: http://store.steampowered.com/ "I prefer GOG when I can, but Steam has done a *lot* of good for gaming on linux."
[wmde]: https://unix.stackexchange.com/questions/20385/windows-managers-vs-login-managers-vs-display-managers-vs-desktop-environment "I've long been a user of WMs instead of DEs, mostly because I do most tasks in a terminal anyway."
[xfce]: https://xfce.org/ "I switched mostly because I was tired of dealing with display issues when it came to gaming on linux."
