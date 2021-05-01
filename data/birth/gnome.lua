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
			["Garden Gnome"] = "allow",
			["Ensorcelled Gnome"] = "allow",
			["Cursed Gnome"] = "allow",
		},
	},
	copy = {
		type = "humanoid", subtype="gnome",
		moddable_tile_base = "base_gnome.png",
		moddable_tile = "halfling_#sex#", --piggyback on halfling art
		size_category = 1, -- the smallest
		life_rating = 7, -- tied for the lowest
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
	},
	random_escort_possibilities = { {"tier1.1", 1, 2}, {"tier1.2", 1, 2}, {"daikara", 1, 2}, {"old-forest", 1, 4}, {"dreadfell", 1, 8}, {"reknor", 1, 2}, },
	moddable_attachement_spots = "race_halfling",
}

---------------------------------------------------------
--                    Garden Gnomes                    --
---------------------------------------------------------
newBirthDescriptor {
	type = 'subrace',
	name = "Garden Gnome",
	desc = {
		_t"Garden Gnomes are wild when nobody is watching. They are small, but have access to nature abilities to improve their health and healing.",
		_t"",
		_t"#GOLD#Stat modifiers:",
		_t"#LIGHT_BLUE# * +2 Willpower",
		_t"#GOLD#Life per level:#LIGHT_BLUE# 10",
		_t"#GOLD#Experience penalty:#LIGHT_BLUE# 10%",
	},
	power_source = {nature=true},
	inc_stats = { wil=2 },
	experience = 1.10,
	talents_types = {
		["wild-gift/call"]={true, 0.3},
		["wild-gift/fungus"]={true, 0.3},
		["wild-gift/moss"]={true, 0.3},
		["cunning/survival"]={false, 0}, -- because everyone gets it
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
		_t"Ensorcelled Gnomes are touched by the arcane. They are small, but have access to magic utilities and defenses.",
		_t"",
		_t"#GOLD#Stat modifiers:",
		_t"#LIGHT_BLUE# * +2 Magic",
		_t"#GOLD#Life per level:#LIGHT_BLUE# 10",
		_t"#GOLD#Experience penalty:#LIGHT_BLUE# 10%",
	},
	power_source = {arcane=true},
	inc_stats = { mag=2 },
	experience = 1.10,
	talents_types = {
		["spell/divination"]={true, 0.3},
		["spell/staff-combat"]={true, 0.3},
		["spell/utility"]={true, 0.3},
		["cunning/survival"]={false, 0}, -- because everyone gets it
	},
	copy = {
		moddable_tile_base = "base_gnome.png",
		moddable_tile = "halfling_#sex#", --piggyback on halfling art
		resolvers.inventory{ id=true,
			{defined="ORB_SCRYING"},
			{type="scroll", subtype="rune", name="phase door rune", ego_chance=-1000, ego_chance=-1000}
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

local status, Orcs = pcall(require, "mod.class.OrcCampaign")
if status then
	---------------------------------------------------------
	--                    Tinker Gnomes                    --
	---------------------------------------------------------
	newBirthDescriptor {
		type = 'subrace',
		name = "Tinker Gnome",
		desc = {
			_t"Tinker Gnomes are exceptional engineers and dedicated to tinkering. They are small, but always prepared thanks to the tools they can create.",
			_t"",
			_t"#GOLD#Stat modifiers: #LIGHT_BLUE#+2 Cunning",
			_t"#GOLD#Experience penalty: #LIGHT_BLUE#10%",
		},
		power_source = {steam=true, technique=true},
		inc_stats = { cun=2 },
		experience = 1.10,
		talents_types = {
			["steamtech/physics"]={true, 0.2}, --0.2 is the same as tinker classes
			["steamtech/chemistry"]={true, 0.2}, --0.2 is the same as tinker classes
			["cunning/trapping"]={true, 0.3},
			["cunning/survival"]={false, 0}, -- because everyone gets it
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
end

---------------------------------------------------------
--                 Cursed Gnomes                  --
---------------------------------------------------------
newBirthDescriptor {
	type = 'subrace',
	name = "Cursed Gnome",
	desc = {
		_t"Cursed Gnomes are afllicted. They are small, but can feed off of opponents' hatred and use their fear against them.",
		_t"",
		_t"#GOLD#Stat modifiers:",
		_t"#LIGHT_BLUE# * +2 Willpower",
		_t"#GOLD#Life per level:#LIGHT_BLUE# 10",
		_t"#GOLD#Experience penalty:#LIGHT_BLUE# 10%",
	},
	power_source = {psionic=true, technique=true},
	inc_stats = { wil=2 },
	experience = 1.10,
	talents_types = {
		["cursed/cursed-form"]={true, 0.3},
		["cursed/dark-sustenance"]={true, 0.3},
		["cursed/fears"]={true, 0.3},
		["cunning/survival"]={false, 0}, -- because everyone gets it
	},
	talents = {
		[ActorTalents.T_UNNATURAL_BODY] = 1,
	},
	copy = {
		moddable_tile_base = "base_gnome.png",
		moddable_tile = "halfling_#sex#", --piggyback on halfling art
		resolvers.inventory{ id=true,
			{defined="ORB_SCRYING"},
			{type="scroll", subtype="rune", name="phase door rune", ego_chance=-1000, ego_chance=-1000}
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