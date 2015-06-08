-----------------------------------------
-- ID: 17770
-- Item: Mamushito +1
-- Additional Effect: Stun
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 5;
    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_LIGHTNING,0) <= 0.5) then
        return 0,0,0;
    else
        if (not target:hasStatusEffect(EFFECT_STUN)) then
            target:addStatusEffect(EFFECT_STUN, 1, 0, 4);
        end
        return SUBEFFECT_STUN, 160, EFFECT_STUN;
    end
end;