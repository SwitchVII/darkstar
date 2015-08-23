---------------------------------------------------------------------------------------------------
-- func: goto
-- auth: SwitchVII
-- desc: Goes to the target player, with a 5 minute cooldown to prevent abuse
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player, target)
	local goto_cooldown = player:getVar("goto_cooldown");
	local realday = os.time();
	
	if (goto_cooldown + 300 < realday) or (goto_cooldown == nil) then
		if (target == nil) then
			player:PrintToPlayer("You must enter a valid player name.");
			return;
		end

		local targ = GetPlayerByName( target );
		if (targ ~= nil) then
			player:setVar("goto_cooldown", os.time());
			player:setPos( targ:getXPos(), targ:getYPos(), targ:getZPos(), 0, targ:getZoneID() );
		else
			player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
		end
	else
		local timeremaining = 300 - (realday - goto_cooldown);
		player:PrintToPlayer( string.format( "Goto unavailable for another %s second(s).",  timeremaining) );
	end
end