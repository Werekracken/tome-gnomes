damDesc = Talents.main_env.damDesc

spells_req1 = Talents.main_env.spells_req1
spells_req2 = Talents.main_env.spells_req2
spells_req3 = Talents.main_env.spells_req3
spells_req4 = Talents.main_env.spells_req4
spells_req5 = Talents.main_env.spells_req5
spells_req_high1 = Talents.main_env.spells_req_high1
spells_req_high2 = Talents.main_env.spells_req_high2
spells_req_high3 = Talents.main_env.spells_req_high3
spells_req_high4 = Talents.main_env.spells_req_high4
spells_req_high5 = Talents.main_env.spells_req_high5

if not Talents.talents_types_def["spell/utility"] then
    newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="spell/utility", name = _t"utility", description = _t"Utility spells." }
    load("/data-gnomes/talents/spells/utility.lua")
end

