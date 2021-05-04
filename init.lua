long_name = "Gnomes"
short_name = "gnomes"
for_module = "tome"
version = {1,7,2}
addon_version = {1,1,1}
weight = 2000
author = {"Werekracken"}
tags = {"race", "gnomes", "gnome", "tinker", "garden", "ensorcelled"}
homepage = "https://te4.org/user/102798/addons"
description = [[
Adds gnomes as a new race. They are a distant relative to dwarves and know the location of the Iron Council.

Garden Gnomes have willpower and nature related skills, but are not necessarily antimagic.
Encorcelled Gnomes have magic related skills.
Tinker Gnomes (only available if you have Embers DLC enabled) have tinkers.
Cursed gnomes have willpower and hate related skills.

https://github.com/Werekracken/tome-gnomes



-All gnomes
size_category = 1, the smallest
life_rating = 7, tied for the lowest with yeeks
An extra generic talent point every 10th level.
Experience penalty: 10%

Each subrace of gnome focuses on utility and survivability with 2 generic trees and 1 class tree, while trying not to use anything class defining in their class trees



-Garden gnomes
Stat modifiers: +2 Willpower

--existing class trees
Wild-gift / Moss

--existing generic trees
Wild-Gift / Call of the Wild
Wild-Gift / Fungus

These trees add a huge amount of survivability.



-Ensorcelled gnomes
Stat modifiers: +2 Magic

--new class trees
Spell / Utility
Magical Proficiency: Passive low mana regen (so that classes without innate mana regen don't have to keep a manasurge rune inscribed) and low fire/cold damage penetration.
Water Jet: Low cold damage, spell stun. A modified version of the water jet spell used to annoy you as a trap in Lake of Nur.
Fire Push: Low fire damage, knockback.
Air Cushion: Sustained +move speed and -knockback resist. A spellified version of Skate.

--existing generic trees
Spell / Divination
Spell / Staff Combat



-Cursed gnomes
Stat modifiers: +2 Willpower

--existing class trees
cursed/fears

--existing generic trees
cursed/dark-sustenance
cursed/cursed-form
cursed/cursed-aura (optional)



-Tinker gnomes
Only available if you have Embers DLC.

Stat modifiers: +2 Cunning

--existing class trees
Cunning / Trapping

--existing generic trees
Steamtech / Physics
Steamtech / Chemistry

They also start with the steam resource, a steam generator implant, and medical injector implants in inventory if you want to go that route.



-Gnomish alchemist golems
--existing class trees
Technique / Shield Offense
Golem / Fighting
Golem / Arcane
Spell / Enhancement

--existing generic trees
Technique / Conditioning
Technique / Thuggery

All skill trees are are locked and have x1.00 multiplier (instead of x1.30).

--Starting points
2 category points.
2 stat points.
1 class point.
1 generic point.

--Level up points
2 stat points every level.
1 class point every other level.
1 generic point every 4th level.
1 category point at level 20.
1 category point at level 34.

But wait, there's more!

In addition to the normal golem slots of MAINHAND, OFFHAND, BODY, and 2 GEM slots, gnomish alchemist golems also get LITE, HEAD, CLOAK, HANDS, BELT, and FEET slots.

Additionally for tinker gnomes:
Your golem can equip tinkers too!
Your golem can use steamsaws, but you probably want to equip the golem with a steam generator.
Steamsaw Mastery is included in Golem Power for tinker gnomes.
Your golem can use both runes and implants.



-Comments
There is not much new here. The new class tree for ensorcelled gnomes is mostly cookie cutter and the gnome models are modified halfling models (with cool hair options and beards). The goal of gnomes is to add some variety by making a race that with more options while still feeling like actual race and not just an Adventurer.

A good amount of the gnomish alchemist golem changes were inspired by the "Golem - The Ironbreaker" addon.

The intent with the golems is to have a fun variant and potentially more useful in the mid and late game, and it fits with the gnome theme of making the best tools.

I'm aware there is another addon named "Let there be gnomes" which was last updated in 2015, but this addon has nothing to do with it. Having never tried that addon I have no idea if there would be compatibility issues if you loaded them both (if you even could load a race addon that hasn't been updated in 6 years /shrug).



---Changelog
v1.0.0
Initial release of tinker, garden, and ensorcelled gnomes.
- There is an issue with tinker gnome alchemist where using the "interact with golem" interface can duplicate tinkers. Auto-swap tinkers doesn't work correctly on the golem either. I'm not sure how to fix this...
- Not a bug with this addon: demonologist tinker slots and demon slots don't play well together. The problem is not specific to the gnomes addon.

v1.0.1
Fixed the Ensorcelled Gnomes spell/utility tree so it is properly disabled when silenced.

v1.0.2
Fixed some copy/paste errors between v1.0.0 and v.1.0.1.

v1.1.0
Updated init.lua and put the long description on the Gnomes addon page.
Added the Cursed gnomes.

v1.1.1
Changed the overload of golemancy to a superload, which is a better way to do it. (Thanks FL0RENT_.)
]]
overload = true
superload = true
hooks = true
data = true
