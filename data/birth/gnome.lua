local ActorInventory = require "engine.interface.ActorInventory"

---------------------------------------------------------
--                       Gnomes                        --
---------------------------------------------------------
newBirthDescriptor{
	type = "race",
	name = "Gnome",
	desc = {
		_t"Gnomes are a small but adaptable race. They get extra talent trees, an extra generic talent point every 10 levels, and their alchemist golems are unique.",
	},
	descriptor_choices = {
		subrace = {
			__ALL__ = "disallow",
			["Tinker Gnome"] = "allow",
			["Iron Gnome"] = "allow",
			["Garden Gnome"] = "allow",
			["Ensorcelled Gnome"] = "allow",
			["Cursed Gnome"] = "allow",
			["Shifty Gnome"] = "allow",
		},
	},
	copy = {
		type = "humanoid", subtype="gnome",
		moddable_tile_base = "base_gnome.png",
		moddable_tile = "halfling_#sex#", --piggyback on halfling art
		size_category = 1, -- the smallest
		life_rating = 14, -- equal to dwarves
		can_see_iron_council = 1,
		extra_generic_point_every = 10,
		starting_intro = "gnome",
		random_name_def = "dwarf_#sex#", random_name_max_syllables = 2,
		default_wilderness = {"playerpop", "allied"},
		faction = "allied-kingdoms",
		starting_zone = "trollmire",
		starting_quest = "start-allied",
		resolvers.inscription("INFUSION:_REGENERATION", {cooldown=10, dur=5, heal=100}, 1),
		resolvers.inscription("INFUSION:_WILD", {cooldown=14, what={physical=true}, dur=4, power=14}, 2),
		resolvers.inscription("INFUSION:_HEALING", {cooldown=12, heal=50}, 3),
		equipdoll = "gnome",
	},
	random_escort_possibilities = { {"tier1.1", 1, 2}, {"tier1.2", 1, 2}, {"daikara", 1, 2}, {"old-forest", 1, 4}, {"dreadfell", 1, 8}, {"reknor", 1, 2}, },
	moddable_attachement_spots = "race_halfling",
	body = { INVEN = 1000, QS_MAINHAND = 1, QS_OFFHAND = 1, MAINHAND = 1, OFFHAND = 1, FINGER = 2, NECK = 1, LITE = 1, BODY = 1, HEAD = 1, CLOAK = 1, HANDS = 1, BELT = 1, FEET = 1, TOOL = 2, QUIVER = 1, QS_QUIVER = 1 },
}

ActorInventory.equipdolls.gnome = { w=48, h=48, itemframe="ui/equipdoll/itemframe48.png", itemframe_sel="ui/equipdoll/itemframe-sel48.png", ix=3, iy=3, iw=42, ih=42, doll_x=116, doll_y=168+64,
	list={
		PSIONIC_FOCUS = {{weight=1, x=48, y=48, subshift="left"}},
		MAINHAND = {{weight=2, x=48, y=120, subshift="left"}},
		OFFHAND = {{weight=3, x=48, y=192, subshift="left"}},
		BODY = {{weight=4, x=48, y=264, subshift="left"}},
		QUIVER = {{weight=5, x=48, y=336, subshift="left"}},
		FINGER = {{weight=6, x=48, y=408, subshift="left"}, {weight=7, x=124, y=408, text="bottom", subshift="left"}},
		LITE = {{weight=8, x=188, y=408, subshift="right"}},
		TOOL = {{weight=9, x=264, y=408, subshift="right", text="bottom"}, {weight=22, x=264, y=480, text="bottom"}},
		FEET = {{weight=10, x=264, y=336}},
		BELT = {{weight=11, x=264, y=264}},
		HANDS = {{weight=12, x=264, y=192}},
		CLOAK = {{weight=13, x=264, y=120}},
		NECK = {{weight=14, x=235, y=48, subshift="right", text="topright"}},
		HEAD = {{weight=15, x=150, y=35, subshift="left", text="bottom"}},
	}
}

---------------------------------------------------------
--                    Garden Gnomes                    --
---------------------------------------------------------
newBirthDescriptor {
	type = 'subrace',
	name = "Garden Gnome",
	desc = {
		_t"Garden Gnomes are wild when nobody is watching. They are small, but have nature abilities to improve their health and healing.",
		_t"They know Call of the Wild and Fungus.",
		_t"",
		_t"#GOLD#Stat modifiers:#LIGHT_BLUE# +2 Willpower, +2 Cunning",
		_t"#GOLD#Life per level:#LIGHT_BLUE# 14",
	},
	power_source = {nature=true},
	inc_stats = { wil=2, cun=2 },
	talents_types = {
		["wild-gift/call"]={true, 0.3},
		["wild-gift/fungus"]={true, 0.3},
	},
	copy = {
		moddable_tile_base = "base_gnome.png",
		moddable_tile = "halfling_#sex#", --piggyback on halfling art
		resolvers.inventory{ id=true,
			{defined="ORB_SCRYING"},
		},
	},
	default_cosmetics = {
		{"hairs", "Green Hair 2"}, -- -- If the hair can't be used by males, no hair gets loaded and it makes him bald as intended.
		{"facial_features", "Green Beard", {sex="Male"}},
	},
	cosmetic_options = {
		hairs = {
			{name="Green Hair 1", file="gnome_hair_green_01"},
			{name="Green Hair 2", file="gnome_hair_green_02", only_for={sex="Female"}},
			{name="Green Hair 3", file="gnome_hair_green_03", only_for={sex="Female"}},
			{name="Green Hair 4", file="gnome_hair_green_04", only_for={sex="Female"}},
		},
		facial_features = {
			{name="Green Beard", file="gnome_beard_green", only_for={sex="Male"}},
		},
	},
  }

---------------------------------------------------------
--                 Ensorcelled Gnomes                  --
---------------------------------------------------------
newBirthDescriptor {
	type = 'subrace',
	name = "Ensorcelled Gnome",
	desc = {
		_t"Ensorcelled Gnomes are touched by the arcane. They are small, but have magic utilities and defenses.",
		_t"They know Divination and Staff Combat.",
		_t"",
		_t"#GOLD#Stat modifiers:#LIGHT_BLUE# +2 Magic, +2 Cunning",
		_t"#GOLD#Life per level:#LIGHT_BLUE# 14",
	},
	power_source = {arcane=true},
	inc_stats = { mag=2, cun=2 },
	talents_types = {
		["spell/divination"]={true, 0.3},
		["spell/staff-combat"]={true, 0.3},
	},
	copy = {
		moddable_tile_base = "base_gnome.png",
		moddable_tile = "halfling_#sex#", --piggyback on halfling art
		resolvers.inventory{ id=true,
			{defined="ORB_SCRYING"},
			{type="scroll", subtype="rune", name="phase door rune", ego_chance=-1000}
		},
	},
	default_cosmetics = {
		{"hairs", "Blue Hair 2"}, -- If the hair can't be used by males, no hair gets loaded and it makes him bald as intended.
		{"facial_features", "Blue Beard", {sex="Male"}},
	},
	cosmetic_options = {
		hairs = {
			{name="Blue Hair 1", file="gnome_hair_blue_01"},
			{name="Blue Hair 2", file="gnome_hair_blue_02", only_for={sex="Female"}},
			{name="Blue Hair 3", file="gnome_hair_blue_03", only_for={sex="Female"}},
			{name="Blue Hair 4", file="gnome_hair_blue_04", only_for={sex="Female"}},
		},
		facial_features = {
			{name="Blue Beard", file="gnome_beard_blue", only_for={sex="Male"}},
		},
	},
}

local orcs = pcall(require, "mod.class.OrcCampaign")
if orcs then
	---------------------------------------------------------
	--                    Tinker Gnomes                    --
	---------------------------------------------------------
	newBirthDescriptor {
		type = 'subrace',
		name = "Tinker Gnome",
		desc = {
			_t"Tinker Gnomes are exceptional engineers and dedicated to tinkering. They are small, but always prepared thanks to the tools they can create.",
			_t"They know tinkering: Physics and Chemistry.",
			_t"",
			_t"#GOLD#Stat modifiers:#LIGHT_BLUE# +4 Cunning",
			_t"#GOLD#Life per level:#LIGHT_BLUE# 14",
		},
		power_source = {steam=true, technique=true},
		inc_stats = { cun=4 },
		talents_types = {
			["steamtech/physics"]={true, 0.2}, --0.2 is the same as tinker classes
			["steamtech/chemistry"]={true, 0.2}, --0.2 is the same as tinker classes
		},
		copy = {
			moddable_tile_base = "base_gnome.png",
			moddable_tile = "halfling_#sex#", --piggyback on halfling art
			resolvers.inventory{ id=true,
				{defined="ORB_SCRYING"},
				{defined="APE", base_list="mod.class.Object:/data-orcs/general/objects/quest-artifacts.lua"},
				{type="scroll", subtype="implant", name="steam generator implant", base_list="mod.class.Object:/data-orcs/general/objects/inscriptions.lua", autoreq=true, ego_chance=-1000},
				{type="scroll", subtype="implant", name="medical injector implant", base_list="mod.class.Object:/data-orcs/general/objects/inscriptions.lua", autoreq=true, ego_chance=-1000},
				{type="scroll", subtype="implant", name="medical injector implant", base_list="mod.class.Object:/data-orcs/general/objects/inscriptions.lua", autoreq=true, ego_chance=-1000},
			},
		},
		game_state = {
			merge_tinkers_data = true, -- drop tinker stuff.
		},
		default_cosmetics = {
			{"hairs", "White Hair 2"}, -- -- If the hair can't be used by males, no hair gets loaded and it makes him bald as intended.
			{"facial_features", "White Beard", {sex="Male"}},
		},
		cosmetic_options = {
			hairs = {
				{name="White Hair 1", file="gnome_hair_white_01"},
				{name="White Hair 2", file="gnome_hair_white_02", only_for={sex="Female"}},
				{name="White Hair 3", file="gnome_hair_white_03", only_for={sex="Female"}},
				{name="White Hair 4", file="gnome_hair_white_04", only_for={sex="Female"}},
			},
			facial_features = {
				{name="White Beard", file="gnome_beard_white", only_for={sex="Male"}},
			},
		},
	}

	---------------------------------------------------------
	--                    Iron Gnomes                    --
	---------------------------------------------------------
	newBirthDescriptor {
		type = 'subrace',
		name = "Iron Gnome",
		desc = {
			_t"Iron Gnomes are tough and strong. They are small, but are quite resilient.",
			_t"They know Conditioning and Blacksmith.",
			_t"",
			_t"#GOLD#Stat modifiers:#LIGHT_BLUE# +2 Cunning, +2 Strength",
			_t"#GOLD#Life per level:#LIGHT_BLUE# 14",
		},
		power_source = {technique=true},
		inc_stats = { cun=2, str=2 },
		talents_types = {
			["steamtech/blacksmith"]={true, 0.2}, --0.2 is the same as tinker classes
			["technique/conditioning"]={true, 0.3},
		},
		copy = {
			moddable_tile_base = "base_gnome.png",
			moddable_tile = "halfling_#sex#", --piggyback on halfling art
			resolvers.inventory{ id=true,
				{defined="ORB_SCRYING"},
			},
		},
		default_cosmetics = {
			{"hairs", "Gray Hair 2"}, -- -- If the hair can't be used by males, no hair gets loaded and it makes him bald as intended.
			{"facial_features", "Gray Beard", {sex="Male"}},
		},
		cosmetic_options = {
			hairs = {
				{name="Gray Hair 1", file="gnome_hair_gray_01"},
				{name="Gray Hair 2", file="gnome_hair_gray_02", only_for={sex="Female"}},
				{name="Gray Hair 3", file="gnome_hair_gray_03", only_for={sex="Female"}},
				{name="Gray Hair 4", file="gnome_hair_gray_04", only_for={sex="Female"}},
			},
			facial_features = {
				{name="Gray Beard", file="gnome_beard_gray", only_for={sex="Male"}},
			},
		},
	}
end

---------------------------------------------------------
--                 Cursed Gnomes                  --
---------------------------------------------------------
newBirthDescriptor {
	type = 'subrace',
	name = "Cursed Gnome",
	desc = {
		_t"Cursed Gnomes are afllicted. They are small and cursed, but can feed off of opponents' hatred and use it against against them.",
		_t"They know Cursed Form and Dark Sustenance.",
		_t"",
		_t"#GOLD#Stat modifiers:#LIGHT_BLUE# +2 Willpower, +2 Cunning",
		_t"#GOLD#Life per level:#LIGHT_BLUE# 14",
	},
	power_source = {psionic=true, technique=true},
	inc_stats = { wil=2, cun=2 },
	talents_types = {
		["cursed/cursed-form"]={true, 0.3},
		["cursed/dark-sustenance"]={true, 0.3},
	},
	talents = {
		[ActorTalents.T_UNNATURAL_BODY] = 1,
	},
	copy = {
		moddable_tile_base = "base_gnome.png",
		moddable_tile = "halfling_#sex#", --piggyback on halfling art
		resolvers.inventory{ id=true,
			{defined="ORB_SCRYING"},
			{type="scroll", subtype="rune", name="phase door rune", ego_chance=-1000}
		},
		chooseCursedAuraTree = true,
		start_check = function(self) self:learnTalent(self.T_TELEPORT_POINT_ZERO, true, nil, {no_unlearn=true}) end,
	},
	default_cosmetics = {
		{"hairs", "Plum Hair 2"}, -- If the hair can't be used by males, no hair gets loaded and it makes him bald as intended.
		{"facial_features", "Plum Beard", {sex="Male"}},
	},
	cosmetic_options = {
		hairs = {
			{name="Plum Hair 1", file="gnome_hair_plum_01"},
			{name="Plum Hair 2", file="gnome_hair_plum_02", only_for={sex="Female"}},
			{name="Plum Hair 3", file="gnome_hair_plum_03", only_for={sex="Female"}},
			{name="Plum Hair 4", file="gnome_hair_plum_04", only_for={sex="Female"}},
		},
		facial_features = {
			{name="Plum Beard", file="gnome_beard_plum", only_for={sex="Male"}},
		},
	},
}

---------------------------------------------------------
--                    Shifty Gnomes                    --
---------------------------------------------------------
newBirthDescriptor {
	type = 'subrace',
	name = "Shifty Gnome",
	desc = {
		_t"Shifty Gnomes are sly and shady. They are small, but dangerous.",
		_t"They know Scoundrel and Lethality.",
		_t"",
		_t"#GOLD#Stat modifiers:#LIGHT_BLUE# +2 Dexterity, +2 Cunning",
		_t"#GOLD#Life per level:#LIGHT_BLUE# 14",
	},
	power_source = {technique=true},
	inc_stats = { dex=2, cun=2 },
	talents_types = {
		["cunning/scoundrel"]={true, 0.3},
		["cunning/lethality"]={true, 0.3},
	},
	copy = {
		moddable_tile_base = "base_gnome.png",
		moddable_tile = "halfling_#sex#", --piggyback on halfling art
		resolvers.inventory{ id=true,
			{defined="ORB_SCRYING"},
		},
	},
	default_cosmetics = {
		{"hairs", "Dark Hair 2"}, -- -- If the hair can't be used by males, no hair gets loaded and it makes him bald as intended.
		{"facial_features", "Dark Beard", {sex="Male"}},
	},
	cosmetic_options = {
		hairs = {
			{name="Dark Hair 1", file="gnome_hair_dark_01"},
			{name="Dark Hair 2", file="gnome_hair_dark_02", only_for={sex="Female"}},
			{name="Dark Hair 3", file="gnome_hair_dark_03", only_for={sex="Female"}},
			{name="Dark Hair 4", file="gnome_hair_dark_04", only_for={sex="Female"}},
		},
		facial_features = {
			{name="Dark Beard", file="gnome_beard_dark", only_for={sex="Male"}},
		},
	},
}

---------------------------------------------------------
--                    All Campaigns                    --
---------------------------------------------------------
-- Shamelessly copied everything in this section from Frog's Barachi race and changed it to apply to gnomes. Thank you Frogge!
-- Add Gnomes to all campaigns
for i, bdata in ipairs(Birther.birth_descriptor_def.world) do
	if bdata.descriptor_choices and bdata.descriptor_choices.race then
		bdata.descriptor_choices.race.Gnome = "allow"
	end
end

--superload Gnomes into special starting scenarios
local demo_def = getBirthDescriptor("subclass", "Demonologist")
local doom_def = getBirthDescriptor("subclass", "Doombringer")

if demo_def then
	local old_start = demo_def.copy.class_start_check

	--quietly masquerades us as a human so we can slip through the (awful and stupid) starting zone checks
	local function new_start(self)
		local real_race = self.descriptor.race
		if real_race == "Gnome" then
			self.descriptor.race = "Human"
		end
		old_start(self)
		self.descriptor.race = real_race
	end

	demo_def.copy.class_start_check = new_start
	doom_def.copy.class_start_check = new_start
end

local writhe_def = getBirthDescriptor("subclass", "Writhing One")
local coe_def = getBirthDescriptor("subclass", "Cultist of Entropy")

if writhe_def then
	local old_start = writhe_def.copy.class_start_check

	--quietly masquerades us as a human so we can slip through the (awful and stupid) starting zone checks
	local function new_start(self)
		local real_race = self.descriptor.race
		if real_race == "Gnome" then
			self.descriptor.race = "Human"
		end
		old_start(self)
		self.descriptor.race = real_race
	end

	writhe_def.copy.class_start_check = new_start
	coe_def.copy.class_start_check = new_start
end

--retrofits gnome support into EoR by (non-destructively) popping in a before_start check
local orcs_def = getBirthDescriptor("world", "Orcs")
if orcs_def then
	local old_start = orcs_def.copy.before_starting_zone

	--are we a gnome? yes? then mess with our start stuff
	local function new_start(self)
		if self.descriptor.race == "Gnome" then
			self.faction = 'kruk-pride'

			self.default_wilderness = {"playerpop", "orc"}
			self.starting_zone = "orcs+town-kruk"
			self.starting_quest = "orcs+kruk-invasion"
		end
		if old_start then old_start(self) end
	end

	orcs_def.copy.before_starting_zone = new_start
end
