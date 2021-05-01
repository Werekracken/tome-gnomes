-- ToME - Tales of Maj'Eyal
-- Copyright (C) 2009 - 2016 Nicolas Casalini
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- Nicolas Casalini "DarkGod"
-- darkgod@te4.org

local _M = loadPrevious(...)
---------------------------------------------

invoke_golem_old = Talents.talents_def.T_REFIT_GOLEM.invoke_golem
Talents.talents_def.T_REFIT_GOLEM.invoke_golem = function(self, t)
	invoke_golem_old(self, t)
	
	
	if self.descriptor.race == "Gnome" then
		self.alchemy_golem.equipdoll = "gnolemdolly"
		self.alchemy_golem.no_points_on_levelup = function(self)
			self.unused_stats = self.unused_stats + 2
			if self.level >= 2 and self.level % 2 == 0 then self.unused_talents = self.unused_talents + 1 end
			if self.level >= 2 and self.level % 4 == 0 then self.unused_generics = self.unused_generics + 1 end
			if self.level == 20 or self.level == 34 then self.unused_talents_types = self.unused_talents_types + 1 end
		end
		self.alchemy_golem.unused_talents_types = 2
		self.alchemy_golem.unused_stats = 2
		self.alchemy_golem.unused_talents = 1
		self.alchemy_golem.unused_generics = 1
		self.alchemy_golem.body = { INVEN = 1000, QS_MAINHAND = 1, QS_OFFHAND = 1, MAINHAND = 1, OFFHAND = 1, BODY=1, LITE = 1, HEAD = 1, CLOAK = 1, HANDS = 1, BELT = 1, FEET = 1, GEM={max = 2, stack_limit = 1} }
		self.alchemy_golem.size_category = 3
		self.alchemy_golem.talents_types = {
			-- generics
			["technique/conditioning"] = false,
			["technique/thuggery"] = false,
			-- class
			["golem/fighting"] = false,
			["golem/arcane"] = false,
			["spell/enhancement"] = false,
			["technique/shield-offense"] = false,
		}
		self.alchemy_golem.talents_types_mastery = {
			["golem/fighting"] = 0,
			["golem/arcane"] = -0,
		}

	end
	
	if self.descriptor.subrace == "Garden Gnome" then
		self.alchemy_golem.power_source = {arcane=true, nature=true}
		self.alchemy_golem.forbid_nature = 0
		self.alchemy_golem.inscription_restrictions = { ["inscriptions/runes"] = true, ["inscriptions/infusions"] = true, }
	end
	
	if self.descriptor.subrace == "Tinker Gnome" then
		-----
		self.alchemy_golem.steam_regen = 1
		-----
		self.alchemy_golem.power_source = {arcane=true, steam=true}
		self.alchemy_golem.inscription_restrictions = { ["inscriptions/runes"] = true, ["inscriptions/implants"] = true, }
		self.alchemy_golem.can_tinker = {steamtech=1}
		self.alchemy_golem.actor = { 
			resolvers.talents{
				[Talents.T_STEAMSAW_MASTERY] = 1,
				[Talents.T_STEAM_POOL]=1,
			},
			
		}
		self.alchemy_golem:resolve()
	end
	
end

---- Golem Power
local learn_old = Talents.talents_def.T_GOLEM_POWER.on_learn
local unlearn_old = Talents.talents_def.T_GOLEM_POWER.on_unlearn

Talents.talents_def.T_GOLEM_POWER.on_learn = function(self, t)
	if not self.alchemy_golem then return end -- Safety net
	learn_old(self, t)
	if self.descriptor.subrace == "Tinker Gnome" then
		self.alchemy_golem:learnTalent(Talents.T_STEAMSAW_MASTERY, true, nil, {no_unlearn=true})
	end
end
Talents.talents_def.T_GOLEM_POWER.on_unlearn = function(self, t)
	if not self.alchemy_golem then return end -- Safety net
	unlearn_old(self, t)
	if self:getTalentLevelRaw(t) == 0 and not self.innate_alchemy_golem then
		self:unlearnTalent(self.T_REFIT_GOLEM)
	end
end







---------------------------------------------
return _M