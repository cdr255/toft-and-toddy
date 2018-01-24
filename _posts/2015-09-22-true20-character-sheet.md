---
layout: post
title: "True20 Character Sheet"
date: 2015-09-22 18:34:14
categories:
 - games
 - ttrpg
 - code
tags:
 - emacs
 - forms-mode
 - downloads
 - process
---


I am starting a long-term [TTRPG][ttrpg] campaign come October that I
am calling __Empyrean Tempest__.

The system we are using is called [True20][true20] by
[Green Ronin Publishing][green ronin], which is alternate version of
the [d20 srd][d20] released under the [OGL][ogl] by
[Wizards of the Coast][wizards]. I've found it to improve a lot of the
more boring parts of the [d20][d20] system, and remove many things
which are either limiting or just superfluous to having a good
[ttrpg][ttrpg] experience.

One thing I focus (perhaps a bit too much) on when running a game is
the [Character Sheet][char sheet]. <!-- more --> The stock
[true20 character sheet][true20stock] is fine, though it is only
form-fillable "provided You have a printer and pencil handy". There
are a [few others][others], too... Including a truly
[form-fillable][form20] version of the above sheet.

I personally liked the [Mad Irishman][mad irish] sheet, since I like
having all of the work present on the sheet, for when things
inevitably change mid-game. Some people say that it clutters up the
sheet with unnecessary detail, but I like the convenience of being
constantly able to prove that my math was correct. More on that in a
future post.

However, as I mentioned in [another post][character details] about
[ttrpgs][ttrpg], I like to do most of my work (which includes things
like my fully recreational role-playing games... and this blog, too!)
in [GNU/Emacs][emacs]. One thing the Emacs *cannot* do is fill out
PDFs... so, once again, I took to my favorite overlooked mode,
[forms-mode][forms-mode], to create a solution.

It took me a few days of 4-5 hours of work (especially in the proofing
stage... those who look at the code will find a lot of variables
tacked on to the end of the list, instead of next to the relevant
ones... whoops!), totaling around 20 man-hours for the whole
project. I did have to spread it out across four days, because after a
certain point I began to make obvious mistakes in the code.

But, with over 270 variables, four screens of code, and a little bit
of research (which I'll share in a minute), I was able to make it
happen. The file is available [here][mysheet], free to download from
my site. The full code is available at the end of this post, too.

The two main things I learned were little nuggets of truth that I
never would have thought I needed. First, the answer to the question:
"How do You print a variable's value in more than one place on a
form?" And let me tell You, it was not easy for someone
not-as-fluent-as-they-perhaps-should-be in LISP to figure out... But
the answer is actually pretty simple: The `'(nth # list)` function.

There is a variable in [forms-mode][forms-mode] called
`forms-fields`. It stores, internally, the values for each individual
variable defined for the active form (as a list, of course). The
[manual][manual-fields] says:

> A formatting element that is a list specifies a function call. This
> function is called every time a record is displayed, and its result,
> which must be a string, is inserted in the display text. The
> function should do nothing but returning a string. The function you
> call can access the fields of the record as a list in the variable
> forms-fields.

Unfortunately, I was unsure which function to use (or how to define a
function that could be used) to access that variable. Then, I found a
little [Postscript][postscript] document on an [MIT server][server]
called `forms.PS`, which told me to use `'(nth # forms-fields)` to
display the contents of the variable numbered # (so, for example, to
show the 256th variable's contents, You can use `'(nth 256
forms-fields)`).

The only thing I had to change about the way I was writing the file
was comments to keep track of which number each variable actually was
(see code below for what I mean). Then, the problem became trivial.

The second problem related to printing the resulting file.

First, and this is a major bug in `forms-mode` IMHO, You need to
ensure that any paragraph-long variables are harp wrapped to under 80
columns. This is the [default][eighty] that will fit on a sheet of
Letter paper. The bug is that You **cannot** use `auto-fill-mode` or
any of the `fill-` functions on a `forms-mode` buffer... doing so
causes some kind of loop which makes Emacs lock up (You can end the
loop with a few `C-g`s, but that keeps Your text from being
formatted).

Obviously, when You are actually coding the form, You need to be
conscious of the column limit...  Don't push any text / expected
variables past 75 columns or so!

After that, I wanted to be working on a purely-[ASCII][ascii] based
file- I needed to leave forms-mode, but have the form still be
present. You can write the file out as normal, using `C-x C-w`. No
problem there.

Next, I had a few issues with `lp`, the default [TUI][tui] printing
program. It was printing the text larger than I wanted, I didn't want
to have to use a really long command to change some settings each
time, and I had some difficulties setting the default location.

I eventually came across `a2ps`, which did some nice formatting
(including making the file 2-up to save toner and paper) and eased
printing somewhat.

One non-trivial problem that still remains is **page-breaks**. You'll
notice that while the first page breaks as it should, the second one
will split the *Feats & Abilities* block across two pages. To get
around this, You need to keep the *Feats* variable at a constant *15
lines*- no more, no less. Use carriage returns until You get to 15
lines, then push non-active traits into *Special Abilities*- which can
be as long as You want (within reason).

So long as *Feats* is 15 lines long, *Special Abilities* will be
pushed to page 3, and everything will look as it should. I do not
believe there is a better way to get around this, at least at this
time. [YMMV][ymmv]

Until next time, Happy Gaming! 

~~~ scheme
;; true20-chars.form - True20 Character Sheet, v1.0 -*- forms -*-
     
     ;; This provides a form based Character Sheet for True20.
     ;; Downloaded from cdr255.com.
     
     ;; Set the name of the data file.
     (setq forms-file "true20-chars.dat")
     
     ;; Use forms-enumerate to set field names and number thereof.
     (setq forms-number-of-fields
           (forms-enumerate
            '(char-name                       
	      char-player                     
	      char-created
	      char-campaign
	      ; 5
	      char-roles                      
	      char-sex                        
	      char-gender                     
	      char-sexual-orient              
	      char-height
	      ; 10
	      char-weight
	      char-hair
	      char-eyes
	      char-skin                       
	      char-handedness
	      ; 15
	      char-nation
	      char-religion
	      char-virtue
	      char-vice                       
	      char-personality
	      ; 20
	      char-background
	      char-str
	      char-dex
	      char-con                        
	      char-int
	      ; 25
	      char-wis
	      char-cha
	      char-size
	      char-size-mod
       	      char-speed 
	      ; 30                     
	      char-wealth
	      char-rep
	      char-conviction
	      char-init
	      char-init-misc
	      ; 35                  
	      char-bab
	      char-melee
	      char-melee-misc                 
	      char-ranged
	      char-ranged-misc
	      ; 40
	      char-grapple     
	      char-grapple-misc
	      char-dodge
	      char-dodge-misc
	      char-parry
	      ; 45
	      char-parry-misc
	      char-tough
	      char-tough-misc
	      char-fort
	      char-fort-base
	      ; 50
	      char-fort-misc
	      char-ref
	      char-ref-base
	      char-ref-misc
	      char-wil
	      ; 55
	      char-wil-base
	      char-wil-misc
	      char-nonlethal-1
	      char-nonlethal-2
	      char-nonlethal-3
	      ; 60
	      char-nonlethal-4
	      char-lethal-1
	      char-lethal-2
	      char-lethal-3
	      char-lethal-4
	      ; 65
	      char-lethal-5
	      char-fatigue-1
	      char-fatigue-2
	      char-fatigue-3
	      char-weapon-1
	      ; 70
	      char-weapon-1-atk
	      char-weapon-1-dam
	      char-weapon-1-cri
	      char-weapon-1-ran
	      char-weapon-1-not
	      ; 75
	      char-weapon-2
	      char-weapon-2-atk
	      char-weapon-2-dam
	      char-weapon-2-cri
	      char-weapon-2-ran
	      ; 80
	      char-weapon-2-not
	      char-weapon-3
	      char-weapon-3-atk
	      char-weapon-3-dam
	      char-weapon-3-cri
	      ; 85
	      char-weapon-3-ran
	      char-weapon-3-not
	      char-weapon-4
	      char-weapon-4-atk
	      char-weapon-4-dam
	      ; 90
	      char-weapon-4-cri
	      char-weapon-4-ran
	      char-weapon-4-not
	      char-weapon-5
	      char-weapon-5-atk
	      ; 95
	      char-weapon-5-dam
	      char-weapon-5-cri
	      char-weapon-5-ran
	      char-weapon-5-not
	      char-equipment
	      ; 100
	      char-load
	      char-tot-load
	      char-possessions
	      char-move-acc
	      char-move-all-out
	      ; 105
	      char-languages
	      char-skill-acro
	      char-skill-acro-ranks
	      char-skill-acro-misc
	      char-skill-bluf
	      ; 110
	      char-skill-bluf-ranks
	      char-skill-bluf-misc
	      char-skill-clim
	      char-skill-clim-ranks
	      char-skill-clim-misc
	      ; 115
	      char-skill-conc
	      char-skill-conc-ranks
	      char-skill-conc-misc
	      char-skill-craf-name
	      char-skill-craf
	      ; 120
	      char-skill-craf-ranks
	      char-skill-craf-misc
	      char-skill-dipl
	      char-skill-dipl-ranks
	      char-skill-dipl-misc
	      ; 125
	      char-skill-disa
	      char-skill-disa-ranks
	      char-skill-disa-misc
	      char-skill-disg
	      char-skill-disg-ranks
	      ; 130
	      char-skill-disg-misc
	      char-skill-esca
	      char-skill-esca-ranks
	      char-skill-esca-misc
	      char-skill-gath
	      ; 135
	      char-skill-gath-ranks
	      char-skill-gath-misc
	      char-skill-hand
	      char-skill-hand-ranks
	      char-skill-hand-misc
	      ; 140
	      char-skill-heal
	      char-skill-heal-ranks
	      char-skill-heal-misc
	      char-skill-inti
	      char-skill-inti-ranks
	      ; 145
	      char-skill-inti-misc
	      char-skill-jump
	      char-skill-jump-ranks
	      char-skill-jump-misc
	      char-skill-know1-name
	      ; 150
	      char-skill-know1
	      char-skill-know1-ranks
	      char-skill-know1-misc
	      char-skill-know2-name
	      char-skill-know2
	      ; 155
	      char-skill-know2-ranks
	      char-skill-know2-misc
	      char-skill-know3-name
	      char-skill-know3
	      char-skill-know3-ranks
	      ; 160
	      char-skill-know3-misc
	      char-skill-know4-name
	      char-skill-know4
	      char-skill-know4-ranks
	      char-skill-know4-misc
	      ; 165
	      char-skill-noti
	      char-skill-noti-ranks
	      char-skill-noti-misc
	      char-skill-perf-name
	      char-skill-perf
	      ; 170
	      char-skill-perf-ranks
	      char-skill-perf-misc
	      char-skill-ride
	      char-skill-ride-ranks
	      char-skill-ride-misc
	      ; 175
	      char-skill-sear
	      char-skill-sear-ranks
	      char-skill-sear-misc
	      char-skill-sens
	      char-skill-sens-ranks
	      ; 180
	      char-skill-sens-misc
	      char-skill-slei
	      char-skill-slei-ranks
	      char-skill-slei-misc
	      char-skill-stea
	      ; 185
	      char-skill-stea-ranks
	      char-skill-stea-misc
	      char-skill-surv
	      char-skill-surv-ranks
	      char-skill-surv-misc
	      ; 190
	      char-skill-swim
	      char-skill-swim-ranks
	      char-skill-swim-misc
	      char-skill-extr1-name
	      char-skill-extr1
	      ; 195
	      char-skill-extr1-ranks
	      char-skill-extr1-misc
	      char-skill-extr2-name
	      char-skill-extr2
	      char-skill-extr2-ranks
	      ; 200
	      char-skill-extr2-misc
	      char-skill-extr3-name
	      char-skill-extr3
	      char-skill-extr3-ranks
	      char-skill-extr3-misc
	      ; 205
	      char-skill-extr4-name
	      char-skill-extr4
	      char-skill-extr4-ranks
	      char-skill-extr4-misc
	      char-skill-extr5-name
	      ; 210
	      char-skill-extr5
	      char-skill-extr5-ranks
	      char-skill-extr5-misc
	      char-skill-extr6-name
	      char-skill-extr6
	      ; 215
	      char-skill-extr6-ranks
	      char-skill-extr6-misc
	      char-feats
	      char-abilities
	      char-notes
	      ; 220
	      char-powers
	      char-power-bonus
	      char-power-rank
	      char-power-misc
	      char-power-save
	      ; 225
	      char-power-level
	      char-power-save-misc
	      char-grapple-size
	      char-armor
	      char-armor-bonus
	      ; 230
	      char-armor-traits
	      char-shield
	      char-shield-bonus
	      char-shield-traits
	      char-tough-bonus
	      ; 235
	      char-skill-extr1-stat
	      char-skill-extr1-stat-name
	      char-skill-extr2-stat
	      char-skill-extr2-stat-name
	      char-skill-extr3-stat
	      ;240
	      char-skill-extr3-stat-name
	      char-skill-extr4-stat
	      char-skill-extr4-stat-name
	      char-skill-extr5-stat
	      char-skill-extr5-stat-name
	      ;245
	      char-skill-extr6-stat
	      char-skill-extr6-stat-name
	      char-arm-che-pen
	      char-arm-mod
	      char-shield-training
	      ;250
	      char-light-load
	      char-med-load
	      char-heavy-load
	      char-max-load
	      char-tot-weight
	      ;255
	      char-power-ability
	      char-power-ability-mod
	      char-profession-skill
	      char-weapon-1-rng
	      char-weapon-2-rng
	      ;260
	      char-weapon-3-rng
	      char-weapon-4-rng
	      char-weapon-5-rng
	      char-skill-points
	      char-hero-track
	      ;266
	      char-push-load
	      )))
     
     ;; The following functions are used by this form for layout purposes.
     ;;
     (defun arch-tocol (target &optional fill)
       "Produces a string to skip to column TARGET.
     Prepends newline if needed.
     The optional FILL should be a character, used to fill to the column."
       (if (null fill)
           (setq fill ? ))
       (if (< target (current-column))
           (concat "\n" (make-string target fill))
         (make-string (- target (current-column)) fill)))
     ;;
     (defun arch-rj (target field &optional fill)
       "Produces a string to skip to column TARGET\
      minus the width of field FIELD.
     Prepends newline if needed.
     The optional FILL should be a character,
     used to fill to the column."
       (arch-tocol (- target (length (nth field forms-fields))) fill))
     
     ;; Record filters.
     ;;
     (defun new-record-filter (the-record)
       "Form a new record with some defaults."
       (aset the-record char-player (user-full-name))
       (aset the-record char-created (current-time-string))
       the-record)                           ; return it
     (setq forms-new-record-filter 'new-record-filter)
     
     ;; The format list.
     (setq forms-format-list
          (list
	   "====== True20 Character Sheet v1.0 (cdr255) ======\n\n"
	   " --- DETAIL BLOCK --- \n"
	   " Name: " char-name " Player: " char-player " Created: " char-created "\n"
	   " Bio. Sex: " char-sex " Gender Id: " char-gender " Campaign: " char-campaign "\n"
	   " Height: " char-height " Weight: " char-weight " Sexual Preference: " char-sexual-orient "\n"
	   " Hair: " char-hair " Eyes: " char-eyes " Skin: " char-skin " Nation: " char-nation "\n"
	   " Religion: " char-religion " Virtue: " char-virtue " Vice: " char-vice " Handedness: " char-handedness "\n\n"
	   " Backgrounds: " char-background "\n"
	   " Roles (Level): " char-roles "\n"
	   " Personality: " char-personality "\n"
	   " -------------------- \n\n"
	   " --- STATS  BLOCK --- \n"
	   " ========+    ------------- [ Initiative = Dex + Misc. ] ------------- \n"
	   " Str: " char-str " |    Initiative: " char-init " [ (" '(nth 22 forms-fields) ") + (" char-init-misc ") ]  |  Base Combat Bonus: " char-bab " \n"
	   " Dex: " char-dex " |    \n"
	   " Con: " char-con " |    ---- [ Attack Bonus = BCB + Ability + Size + Misc ] ---- \n" 
	   " Int: " char-int " |    Melee Bonus:   " char-melee   " [ (" '(nth 35 forms-fields) ") + (" '(nth 22 forms-fields) ") + (" '(nth 28 forms-fields)  ") + (" char-melee-misc   ") ]\n"
	   " Wis: " char-wis " |    Ranged Bonus:  " char-ranged  " [ (" '(nth 35 forms-fields) ") + (" '(nth 22 forms-fields) ") + (" '(nth 28 forms-fields) ") + (" char-ranged-misc  ") ]\n"
	   " Cha: " char-cha " |    Grapple Bonus: " char-grapple " [ (" '(nth 35 forms-fields) ") + (" '(nth 21 forms-fields) ") + (" char-grapple-size ") + (" char-grapple-misc ") ]\n"
	   " --------+\n"
	   " Size:        --- [ Def Bonus = 10 + BCB + Ability + Size + Misc ] ---  \n"
	   " " char-size " - (" char-size-mod ")   Dodge: " char-dodge " [ 10 + (" '(nth 35 forms-fields) ") + (" '(nth 22 forms-fields) ") + (" '(nth 28 forms-fields) ") + (" char-dodge-misc ") ]\n"
	   " Speed: " char-speed     "'   Parry: " char-parry " [ 10 + (" '(nth 35 forms-fields) ") + (" '(nth 21 forms-fields) ") + (" '(nth 28 forms-fields) ") + (" char-parry-misc ") ]\n"
	   " Wealth: " char-wealth   "\n"
	   " Rep:    " char-rep"    ------- [ Save = Base (Armor) + Ability + Misc ] -------  \n"
           " Conviction:  Toughness: " char-tough " [ (" '(nth 234 forms-fields) ") + (" '(nth 23 forms-fields) ") + (" char-tough-misc ") ]\n"
	   "  [" char-conviction "]     Fortitude: " char-fort  " [ (" char-fort-base   ") + (" '(nth 23 forms-fields) ") + (" char-fort-misc  ") ]\n"
	   "              Reflex:    " char-ref   " [ (" char-ref-base    ") + (" '(nth 22 forms-fields) ") + (" char-ref-misc   ") ]\n"
	   "              Will:      " char-wil   " [ (" char-wil-base    ") + (" '(nth 25 forms-fields) ") + (" char-wil-misc   ") ]\n"
	   " -------------------- \n\n"
	   " --- COMBAT BLOCK --- \n"
	   " ======= Damage Store ======= \n"
	   " Non ( Bruised: [" char-nonlethal-1 "] Dazed: [" char-nonlethal-2 "]   Staggered: [" char-nonlethal-3 "] Unconscious: [" char-nonlethal-4 "] )\n"
	   " Let ( Hurt: [" char-lethal-1 "] Wounded: [" char-lethal-2 "] Disabled: [" char-lethal-3 "] Dying: [" char-lethal-4 "] Dead: [" char-lethal-5 "] )\n"
           " Fat ( Winded: [" char-fatigue-1 "]          Fatigued:  [" char-fatigue-2 "]          Exhausted: [" char-fatigue-3 "] )\n"
	   " ============================ \n"
	   " Armor:  " char-armor  " Stats: " char-armor-bonus  " Traits: " char-armor-traits  "\n"
	   " Shield: " char-shield " Stats: " char-shield-bonus " Traits: " char-shield-traits "\n" 
	   " Total Armor Bonus: " char-tough-bonus " [ (" '(nth 229 forms-fields) ") + (" '(nth 232 forms-fields) ") ]\n"
	   " ============================ \n"
	   " Attack 1: " char-weapon-1 "\n"
	   " To Hit: " char-weapon-1-atk " Dam: " char-weapon-1-dam " Crit: " char-weapon-1-cri " Range: " char-weapon-1-rng "\n"
	   " Notes: " char-weapon-1-not "\n"
	   " Attack 2: " char-weapon-2 "\n"
	   " To Hit: " char-weapon-2-atk " Dam: " char-weapon-2-dam " Crit: " char-weapon-2-cri " Range: " char-weapon-2-rng "\n"
	   " Notes: " char-weapon-2-not "\n"
	   " Attack 3: " char-weapon-3 "\n"
	   " To Hit: " char-weapon-3-atk " Dam: " char-weapon-3-dam " Crit: " char-weapon-3-cri " Range: " char-weapon-3-rng "\n"
	   " Notes: " char-weapon-3-not "\n"
	   " Attack 4: " char-weapon-4 "\n"
	   " To Hit: " char-weapon-4-atk " Dam: " char-weapon-4-dam " Crit: " char-weapon-4-cri " Range: " char-weapon-4-rng "\n"
	   " Notes: " char-weapon-4-not "\n"
	   " Attack 5: " char-weapon-5 "\n"
	   " To Hit: " char-weapon-5-atk " Dam: " char-weapon-5-dam " Crit: " char-weapon-5-cri " Range: " char-weapon-5-rng "\n"
	   " Notes: " char-weapon-5-not "\n"
	   "\n\n\n\n\n\n\n\n\n\n"
	   " -------------------- \n\n"
	   " -- FEATURES BLOCK -- \n\n"
	   " ========== Skills ========== \n"              
	   " Armor Check Penalty: " char-arm-che-pen " [ -1 * ( (" '(nth 229 forms-fields)  ") + (" '(nth 232 forms-fields) ") - (" char-arm-mod ") - (" char-shield-training ") ) ]\n"
	   " [ -1 * ( Armor Bonus + Shield Bonus - Armor Mods - Shield Training) ]\n\n"
	   " Skill Name: Score [ Ranks + Misc + Ability (Name) ] \n"
	   " ^ = Cannot be used untrained. \n"
	   " * = Armor Check Penalty Applies (2x on Swim).\n"
	   " Total Skill Points Spent: " char-skill-points ". \n"
           "                              \n"
	   " " char-skill-acro " - Acrobatics^* [ (" char-skill-acro-ranks ") + (" char-skill-acro-misc ") + (" '(nth 22 forms-fields) ") + (" '(nth 247 forms-fields)  ") <Dex> ]\n"
	   " " char-skill-bluf " - Bluff [ (" char-skill-bluf-ranks ") + (" char-skill-bluf-misc ") + (" '(nth 26 forms-fields) ") <Cha> ]""\n"
	   " " char-skill-clim " - Climb* [ (" char-skill-clim-ranks ") + (" char-skill-clim-misc ") + (" '(nth 21 forms-fields) ") + (" '(nth 247 forms-fields)  ") <Str> ]""\n"
	   " " char-skill-conc " - Concentration [ (" char-skill-conc-ranks ") + (" char-skill-conc-misc ") + (" '(nth 25 forms-fields) ") <Wis> ]""\n"
	   " " char-skill-craf " - Craft(" char-skill-craf-name ")^ [ (" char-skill-craf-ranks ") + (" char-skill-craf-misc ") + (" '(nth 24 forms-fields) ") <Int> ]" "\n"
	   " " char-skill-dipl " - Diplomacy [ (" char-skill-dipl-ranks ") + (" char-skill-dipl-misc ") + (" '(nth 26 forms-fields) ") <Cha> ]""\n"
	   " " char-skill-disa " - Disable Device^ [ (" char-skill-disa-ranks ") + (" char-skill-disa-misc ") + (" '(nth 24 forms-fields) ") <Int> ]""\n"
	   " " char-skill-disg " - Disguise [ (" char-skill-disg-ranks ") + (" char-skill-disg-misc ") + (" '(nth 26 forms-fields) ") <Cha> ]""\n"
	   " " char-skill-esca " - Escape Artist* [ (" char-skill-esca-ranks ") + (" char-skill-esca-misc ") + (" '(nth 22 forms-fields) ") + (" '(nth 247 forms-fields)  ") <Dex> ]""\n"
	   " " char-skill-gath " - Gather Information [ (" char-skill-gath-ranks ") + (" char-skill-gath-misc ") + (" '(nth 26 forms-fields) ") <Cha> ]""\n"
	   " " char-skill-hand " - Handle Animal [ (" char-skill-hand-ranks ") + (" char-skill-hand-misc ") + (" '(nth 26 forms-fields) ") <Cha> ]""\n"
	   " " char-skill-heal " - Heal^ [ (" char-skill-heal-ranks ") + (" char-skill-heal-misc ") + (" '(nth 25 forms-fields) ") <Wis> ]""\n"
	   " " char-skill-inti " - Intimidate [ (" char-skill-inti-ranks ") + (" char-skill-inti-misc ") + (" '(nth 26 forms-fields) ") <Cha> ]""\n"
	   " " char-skill-jump " - Jump* [ (" char-skill-jump-ranks ") + (" char-skill-jump-misc ") + (" '(nth 21 forms-fields) ") + (" '(nth 247 forms-fields)  ") <Str> ]""\n"
	   " " char-skill-know1 " - Knowledge(" char-skill-know1-name ")^ [ (" char-skill-know1-ranks ") + (" char-skill-know1-misc ") + (" '(nth 24 forms-fields) ") <Int> ]""\n"
	   " " char-skill-know2 " - Knowledge(" char-skill-know2-name ")^ [ (" char-skill-know2-ranks ") + (" char-skill-know2-misc ") + (" '(nth 24 forms-fields) ") <Int> ]""\n"
	   " " char-skill-know3 " - Knowledge(" char-skill-know3-name ")^ [ (" char-skill-know3-ranks ") + (" char-skill-know3-misc ") + (" '(nth 24 forms-fields) ") <Int> ]""\n"
	   " " char-skill-know4 " - Knowledge(" char-skill-know4-name ")^ [ (" char-skill-know4-ranks ") + (" char-skill-know4-misc ") + (" '(nth 24 forms-fields) ") <Int> ]""\n"
	   " " char-skill-noti " - Notice [ (" char-skill-noti-ranks ") + (" char-skill-noti-misc ") + (" '(nth 25 forms-fields) ") <Wis> ]""\n"
	   " " char-skill-perf " - Perform(" char-skill-perf-name ") [ (" char-skill-perf-ranks ") + (" char-skill-perf-misc ") + (" '(nth 26 forms-fields) ") <Cha> ]""\n"
	   " " char-skill-ride " - Ride^ [ (" char-skill-ride-ranks ") + (" char-skill-ride-misc ") + (" '(nth 22 forms-fields) ") <Dex> ]""\n"
	   " " char-skill-sear " - Search [ (" char-skill-sear-ranks ") + (" char-skill-sear-misc ") + (" '(nth 24 forms-fields) ") <Int> ]""\n"
	   " " char-skill-sens " - Sense Motive [ (" char-skill-sens-ranks ") + (" char-skill-sens-misc ") + (" '(nth 25 forms-fields) ") <Wis> ]""\n"
	   " " char-skill-slei " - Sleight of Hand^* [ (" char-skill-slei-ranks ") + (" char-skill-slei-misc ") + (" '(nth 22 forms-fields) ") + (" '(nth 247 forms-fields)  ") <Dex> ]""\n"
	   " " char-skill-stea " - Stealth* [ (" char-skill-stea-ranks ") + (" char-skill-stea-misc ") + (" '(nth 22 forms-fields) ") + (" '(nth 247 forms-fields)  ") <Dex> ]""\n"
	   " " char-skill-surv " - Survival [ (" char-skill-surv-ranks ") + (" char-skill-surv-misc ") + (" '(nth 25 forms-fields) ") <Wis> ]""\n"
	   " " char-skill-swim " - Swim* [ (" char-skill-swim-ranks ") + (" char-skill-swim-misc ") + (" '(nth 21 forms-fields) ") + 2 * (" '(nth 247 forms-fields)  ") <Str> ]""\n"
	   " " char-skill-extr1 " - " char-skill-extr1-name"  [ (" char-skill-extr1-ranks ") + (" char-skill-extr1-misc ") + (" char-skill-extr1-stat ") <" char-skill-extr1-stat-name "> ]\n"
	   " " char-skill-extr2 " - " char-skill-extr2-name"  [ (" char-skill-extr2-ranks ") + (" char-skill-extr2-misc ") + (" char-skill-extr2-stat ") <" char-skill-extr2-stat-name "> ]\n"
	   " " char-skill-extr3 " - " char-skill-extr3-name"  [ (" char-skill-extr3-ranks ") + (" char-skill-extr3-misc ") + (" char-skill-extr3-stat ") <" char-skill-extr3-stat-name "> ]\n"
	   " " char-skill-extr4 " - " char-skill-extr4-name"  [ (" char-skill-extr4-ranks ") + (" char-skill-extr4-misc ") + (" char-skill-extr4-stat ") <" char-skill-extr4-stat-name "> ]\n"
	   " " char-skill-extr5 " - " char-skill-extr5-name"  [ (" char-skill-extr5-ranks ") + (" char-skill-extr5-misc ") + (" char-skill-extr5-stat ") <" char-skill-extr5-stat-name "> ]\n"
	   " " char-skill-extr6 " - " char-skill-extr6-name"  [ (" char-skill-extr6-ranks ") + (" char-skill-extr6-misc ") + (" char-skill-extr6-stat ") <" char-skill-extr6-stat-name "> ]\n"
	   "\nProfession Skill: " char-profession-skill ". \n"
	   " ============================ \n"
	   " ===== Feats & Abilities ==== \n"
	   " Character Archetype: " char-hero-track "\n"
	   " \n"
           " Feats ([Book] pg #): \n " char-feats "\n"
	   " Special Abilities ([Book] pg #): \n " char-abilities "\n"
	   " -------------------- \n\n"
	   " --- ERRATA BLOCK --- \n"
	   " ===== Items & Movement ===== \n"
	   " Movement - Normal: " '(nth 29 forms-fields) "' Accelerated(2x): " char-move-acc "' All-Out(4x): " char-move-all-out "'\n"
	   " Loads    - Light: " char-light-load " lbs Medium: " char-med-load " lbs Heavy: " char-heavy-load " lbs\n"
	   "            Max: " char-max-load " lbs Push/Drag: " char-push-load " lbs\n"
	   " Current Load: " char-tot-load " lbs Type of Load: " char-load " Total Weight of Character: " char-tot-weight " lbs\n\n"
	   " Equipment (weight in lbs): \n " char-equipment "\n"
	   " Possessions (weight in lbs): \n " char-possessions "\n"
	   " ============================ \n"
	   " =========== Powers ========= \n"
	   " Chosen Ability: " char-power-ability " (" char-power-ability-mod ") \n"
	   " Power Bonus: " char-power-bonus " [ (" char-power-rank ") + (" '(nth 256 forms-fields) ") + (" char-power-misc ") ]\n"
           " Power Save : " char-power-save " [ 10 + (" char-power-level ") + ("  '(nth 256 forms-fields) ") + (" char-power-save-misc ") ]\n"
	   " Powers: \n " char-powers "\n"
	   " ============================ \n"
	   " =========== Others ========= \n"
	   " Languages: \n " char-languages "\n"
	   " Notes: \n " char-notes "\n"
          ))
~~~
[ttrpg]: https://en.wikipedia.org/wiki/Tabletop_role-playing_game "I've decided to run another long-term, big-party game because I wanted that sense of community that such a thing provides. Something about one-shots just leads to a sporadic, sparse group of players who meet only rarely... at least, for my core group."
[true20]: http://true20.com/ "True20 is considered a rules-lite version of d20 (which it is, honestly) but it does not share a lot of the trappings that rules-lite games tend to have, especially in this day and age. I would say it leans much more heavily towards 'd20' than to 'rules-lite'."
[green ronin]: http://greenronin.com/ "Though I only have experience with true20 from them, Green Ronin is an interesting company. I've heard a lot of good things about some of their other products, and I'll probably check them out eventually."
[d20]: http://www.d20srd.org/ "Oh, d20... The first system I really read the books of, and the one I've run the most games in. Though it has some major issues, it is a perennial favorite with my group, and one system that I think I will always come back to."
[ogl]: https://en.wikipedia.org/wiki/Open_Game_License "It's so weird to think of the OGL as being something from the past! With DND 5E coming out soon, and 4E in the rear view, the OGL is still standing strong and allowing some of my favorite games (like True20, and OSRIC) to exist. I have a feeling we'll be interacting with it for a very, very long time."
[wizards]: http://company.wizards.com/ "WotC is the company behind both the current incarnations of DND and Magic: the Gathering. Though I disagree with a lot of their more recent design choices, I owe a lot of my life's memories to them, so I still treat them with respect... though I don't really play any of their recent games."
[char sheet]: https://en.wikipedia.org/wiki/Character_sheet "The humble character sheet is, in many ways, even more iconic to this hobby than a set of dice or a d20. Every tabletop role-playing game has some kind of character sheet, even the dice-less ones."
[true20stock]: http://true20.com/2006/04/17/true20_character_sheet/ "I actually think this is a pretty funny joke, and definitely support actually writing out Your character sheets. It makes things much more real to me, kind of like commonplacing in general. But, nonetheless, I am a bit disappointed that it is not actually form fillable."
[others]: http://true20.wikidot.com/player-resources "I'm actually pretty impressed that this wikidot exists. It seems as though not much has been done with true20 in a bit; The fact that this still exists is a very good sign."
[form20]: http://www.phoenixgamesclub.org.uk/index.php?action=tpmod;dl=cat2;tpstart=10 "I personally like all of my character sheets to be form fillable, digitally. It prevents people from having to try to recreate their characters from memory, and if You use a cloud service to hold Your campaign stuff, then it also lets You always have a copy available... just in case."
[mad irish]: http://www.mad-irishman.net/pub_true20.html "This sheet, in contrast to the others mentioned in this post (with the notable exception of the one I created, of course) has most of the math listed out for You: If Your Dex increases, You change creature size, You take off Your armor to swim or whatever, the math is all there in long form so that You can easily adjust it without looking anything up and without memorizing all of the formulae. It really helps the core of my group, at times."
[character details]: http://www.toftandtoddy.com/2014/12/21/character-details/ "This is, in my humble opinion, the true *meat* of a character sheet. The crunch for the system You are using is important, of course (I mean heck, I didn't roll up this sheet for 20 hours for nothing!) but the stats by themselves mean very little in the context of a ROLE playing game."
[emacs]: https://www.gnu.org/software/emacs/ "I use GNU/Emacs to do nearly all of my work. It is, by far, my favorite editor AND my favorite operating-system-which-lacks-a-good-editor, and I highly recommend it to anyone looking to really get their hands dirty with their computer."
[forms-mode]: https://www.gnu.org/software/emacs/manual/html_mono/forms.html "In the words of XKCD: Life is too short for manuals, but sometimes much too short without them. Even though this is actually maintained as an info page, I still think it holds true here. I would have gotten nowhere without it."
[mysheet]: https://s3.amazonaws.com/toft-and-toddy/code/true20-chars.form "And here it is: The fruit of my labors. A mere 22K of E-Lisp code and forms-mode functions, tying together the character sheet I'll be using to house my NPC sheets and my group's PC sheets (as a backup). Let me know what You think, and feel free to adapt it to whatever You need it for!"
[manual-fields]: https://www.gnu.org/software/emacs/manual/html_mono/forms.html#Format-Description "The manual here is very presumptuous, in my opinion. In a way, that made it more fun for me... But it probably should give a hard example anyway, for future generations."
[postscript]: http://www.adobe.com/products/postscript/ "At least, I assume this is a postscript file. I actually read it using Google's cache version, without really downloading the file itself... But, the information is contained therein in any event."
[server]: https://stuff.mit.edu/afs/sipb/contrib/emacs/elisp/forms/ "Nothing quite like an open directory in the subdomain 'stuff' to make You feel like it's the new millennium again, right?"
[eighty]: https://en.wikipedia.org/wiki/Line_printer "A lot of people feel comfortable going out to 132 columns per sheet... But, when given two differing restrictions, I tend to follow the stricter one before the more lax of the two. That way I am sure it *always* works."
[ascii]: https://en.wikipedia.org/wiki/ASCII "From music to forms to books to websites, I do a *lot* of work in pure ASCII text (although, especially since I've begun learning Thai, I have adapted to UTF-8 somewhat... The times, the are a-changin')."
[tui]: https://en.wikipedia.org/wiki/Text-based_user_interface "I prefer using the term 'TUI' to the term 'CLI' or the term 'terminal' or the term 'console' because it is in many ways more accurate: It is *not* a separate console, it is only a *virtual* terminal, and while it *is* a 'Command Line Interface', that is in contrast to something termed a 'Graphic User Interface', so it makes more sense to use the term 'Text-based User Interface' instead."
[ymmv]: http://www.urbandictionary.com/define.php?term=ymmv "Your Mileage May Vary!"
