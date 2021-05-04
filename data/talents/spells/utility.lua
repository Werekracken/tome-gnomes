newTalent{
	name = "Magical Proficiency", short_name = "UTILITY_MAGICAL_PROFICIENCY",
	type = {"spell/utility", 1},
    image = "talents/breath_control.png",
	require = spells_req1,
	points = 5,
	mode = "passive",
	tactical = { BUFF = 2 },
	getMana = function(self, t) return math.floor(self:combatTalentSpellDamage(t, 5, 10)) end,
	getEffectPower = function(self, t) return self:combatTalentSpellDamage(t, 10, 20) end,
	passives = function(self, t, p)
		local mana = t.getMana(self, t)
		self:talentTemporaryValue(p, "mana_regen", mana)
		self:talentTemporaryValue(p, "resists_pen", {[DamageType.COLD] = t.getEffectPower(self, t), [DamageType.FIRE] = t.getEffectPower(self, t)})
	end,
	info = function(self, t)
		local mana = t.getMana(self, t)
		return ([[Increases mana regeneration by %d. Increases Cold and Fire damage penetration by +%d%%.
		These will increase with Spellpower.]]):format(mana, t.getEffectPower(self, t))
	end,
}

newTalent{
	name = "Water Jet", short_name = "UTILITY_WATER_JET",
	type = {"spell/utility", 2},
    image = "talents/water_jet.png",
	require = spells_req2,
	points = 5,
	mana = 20,
	cooldown = 8,
	range = 10,
	direct_hit = true,
	reflectable = true,
	requires_target = true,
	tactical = { DISABLE = { stun = 2 }, ATTACK = { COLD = 1 } },
	getDamage = function(self, t) return self:combatScale(self:combatSpellpower() * self:getTalentLevel(t), 12, 0, 65, 265, 0.67) end,
	action = function(self, t)
		local tg = {type="hit", range=self:getTalentRange(t), talent=t}
		local x, y = self:getTarget(tg)
		if not x or not y then return nil end
		self:project(tg, x, y, DamageType.COLDSTUN, self:spellCrit(t.getDamage(self, t)), {type="freeze"})
		game:playSoundNear(self, "talents/ice")
		return true
	end,
	info = function(self, t)
		return ([[Condenses ambient water on a target, inflicting %d cold damage and stunning it for 4 turns.
		The damage will increase with your Spellpower.]]):
		format(damDesc(self, DamageType.COLD,t.getDamage(self, t)))
	end,
}

newTalent{
    name = "Fire Push", short_name = "UTILITY_FIRE_PUSH",
    image = "talents/fire_push.png",
	type = {"spell/utility", 3},
	require = spells_req3,
	points = 5,
	mana = 30,
	cooldown = 8,
	range = 1,
	reflectable = true,
	requires_target = true,
	tactical = { ATTACK = {FIRE = 1}, CLOSEIN = {knockback = 1.5}, ESCAPE = {knockback = 1.5} },
	target = function(self, t) return {type="bolt", range=self:getTalentRange(t), talent=t} end,
	getDamage = function(self, t) return self:combatTalentSpellDamage(t, 8, 100) end,
	action = function(self, t)
		local tg = self:getTalentTarget(t)
		local x, y = self:getTarget(tg)
		if not x or not y then return nil end
		self:projectile(tg, x, y, DamageType.FIREKNOCKBACK, {dist=4, dam=self:spellCrit(t.getDamage(self, t))})
		game:playSoundNear(self, "talents/flame")
		return true
	end,
	info = function(self, t)
		local damage = t.getDamage(self, t)
		return ([[Pushes the target back 4 grids and does %d fire damage.
		The damage will increase with your Spellpower.]]):format(damDesc(self, DamageType.FIREKNOCKBACK, damage))
	end,
}

newTalent{
	name = "Air Cushion", short_name = "UTILITY_AIR_CUSHION",
    image = "talents/windtouched_speed.png",
	type = {"spell/utility", 4},
	require = spells_req4,
	points = 5,
	mode = "sustained",
	cooldown = 8,
	sustain_mana = 40,
	no_energy = true,
	tactical = { SELF = { ESCAPE = 1 }, CLOSEIN = 1},
	getSpeed = function(self, t) return self:combatTalentScale(t, 0.2, 0.5, 0.75) end,
	getKBVulnerable = function(self, t) return 1 - self:combatTalentLimit(t, 1, 0.55, 0.85) end,
	activate = function(self, t)
		return {
			speed = self:addTemporaryValue("movement_speed", t.getSpeed(self, t)),
			knockback = self:addTemporaryValue("knockback_immune", -t.getKBVulnerable(self, t))
		}
	end,
	deactivate = function(self, t, p) -- luacheck: ignore 212
		self:removeTemporaryValue("movement_speed", p.speed)
		self:removeTemporaryValue("knockback_immune", p.knockback)
		return true
	end,
	info = function(self, t)
		return ([[You magically float just off the ground.
		This increases your movement speed by %d%%.
		It also makes you more vulnerable to being pushed around (-%d%% knockback resistance).]]):
		tformat(t.getSpeed(self, t)*100, t.getKBVulnerable(self, t)*100)
	end,
}