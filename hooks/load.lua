local class = require "engine.class"
local Birther = require "engine.Birther"
local ActorTalents = require "engine.interface.ActorTalents"

class:bindHook("ToME:load", function(self, data) -- luacheck: ignore 212
	Birther:loadDefinition("/data-gnomes/birth/gnome.lua")
	ActorTalents:loadDefinition("/data-gnomes/talents/talents.lua")
	dofile("/data-gnomes/gnolemdolly.lua")
end)
