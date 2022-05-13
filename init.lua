long_name = "Gnomes"
short_name = "gnomes"
for_module = "tome"
version = {1,7,2}
addon_version = {2,0,2}
weight = 2000
author = {"Werekracken"}
tags = {"Race", "race", "Gnomes", "gnomes", "Gnome", "gnome", "Tinker", "tinker", "garden", "ensorcelled"}
homepage = "https://te4.org/user/102798/addons"
description = [[
Adds gnomes as a new race. They are a distant relative to dwarves and know the location of the Iron Council.

Garden Gnomes have nature skills, but are not necessarily antimagic.
Ensorcelled Gnomes have magic skills.
Tinker Gnomes have tinkers. (only available if you have Embers DLC enabled)
Iron Gnomes have strength and constitution skills. (only available if you have Embers DLC enabled)
Cursed gnomes have hate skills.
Shady gnomes have cunning skills.

https://github.com/Werekracken/tome-gnomes



All gnomes get:
A second tool slot. (Most tools share a cooldown so it's not amazing to have a second one, but can save your butt by not having to equip a different tool in combat.)
Two generic trees. (If your class also has that tree then you get that tree at +0.3 talent level.)
An extra generic talent point every 10th level.
Special alchemist golems.
size_category = 1, the smallest
life_rating = 14, equal to dwarves

--
Garden gnomes
Stat modifiers: +2 Willpower, +2 Cunning

Generic Trees:
Wild-Gift / Call of the Wild
Wild-Gift / Fungus

These trees add a huge amount of survivability.

--
Ensorcelled gnomes
Stat modifiers: +2 Magic, +2 Cunning

Generic Trees:
Spell / Divination
Spell / Staff Combat

--
Cursed gnomes
Stat modifiers: +2 Willpower, +2 Cunning

Generic Trees:
cursed/dark-sustenance
cursed/cursed-form
cursed/cursed-aura (optional)

--
Shady gnomes
Stat modifiers: +2 Dexterity, +2 Cunning

Generic trees:
Cunning / Scoundrel
Cunning / Lethality

--
Tinker gnomes
Only available if you have Embers DLC.

Stat modifiers: +4 Cunning

Generic Trees:
Steamtech / Physics
Steamtech / Chemistry

They also start with the steam resource, a steam generator implant, and medical injector implants in inventory if you want to go that route.

--
Iron gnomes
Only available if you have Embers DLC.

Stat modifiers: +2 Cunning, +2 Strength

Generic Trees:
Technique / Conditioning
Steamtech / Blacksmith

--
Gnomish alchemist golems

Class Trees:
Technique / Shield Offense
Golem / Fighting
Golem / Arcane
Spell / Enhancement

Generic Trees:
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

--
Comments
There is not much new here. The goal of gnomes is to add more race variety.

A good amount of the gnomish alchemist golem changes were inspired by the "Golem - The Ironbreaker" addon.

The intent with the golems is to have a fun variant and potentially more useful in the mid and late game, and it fits with the gnome theme of cunning and tools.

I'm aware there is another addon named "Let there be gnomes" which was last updated in 2015, but this addon has nothing to do with it. Having never tried that addon I have no idea if there would be compatibility issues if you loaded them both (if you even could load a race addon that hasn't been updated in 6 years /shrug).


--
Changelog
- v1.0.0 Initial release of tinker, garden, and ensorcelled gnomes.
- There is an issue with tinker gnome alchemist where using the "interact with golem" interface can duplicate tinkers. Auto-swap tinkers doesn't work correctly on the golem either. I'm not sure how to fix this...
- Not a bug with this addon: demonologist tinker slots and demon slots don't play well together. The problem is not specific to the gnomes addon.
- v1.0.1 Fixed the Ensorcelled Gnomes spell/utility tree so it is properly disabled when silenced.
- v1.0.2 Fixed some copy/paste errors between v1.0.0 and v.1.0.1.
- v1.1.0 Updated init.lua and put the long description on the Gnomes addon page. Added the Cursed gnomes.
- v1.1.1 Changed the overload of golemancy to a superload, which is a better way to do it. (Thanks FL0RENT_.)
- v2.0.0 I read somewhere on the forums where DarkGod said that class trees shouldn't be given to races, so I took out class trees. Gave gnomes a second tool slot and +2 Cun. Bumped life per level a little. Added Shifty gnomes.
- v2.0.1 Since they are cousins to dwarves, give them the same life rating. (Gnomes were way too squishy.)  And remove the exp penalty because gnomes are definitely not OP.
- v2.0.2 Added Iron Gnomes. Added the trees they get to their descriptions in the class selection so you have an idea of what you're getting before you choose them.
]]
overload = true
superload = true
hooks = true
data = true
