<<<<<<< HEAD:scripts/globals/mobskills/Inferno.lua
---------------------------------------------------
-- Inferno
-- Deals fire elemental damage to enemies within area of effect.
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

	local dmgmod = 2;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 8,ELE_FIRE,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	return dmg;

end
=======
---------------------------------------------------
-- Voracious Trunk
-- Steal one effect
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)

    -- str down - chr down
    local effectType = math.random(136, 142);

    skill:setMsg(MobDrainAttribute(mob, target, effectType, 10, 3, 120));

    return 1;
end;
>>>>>>> upstream/master:scripts/globals/mobskills/Absorbing_Kiss.lua
