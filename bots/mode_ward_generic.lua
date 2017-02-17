----------------------------------------------------------------------------------------------------

_G._savedEnv = getfenv()
module( "ward", package.seeall )

----------------------------------------------------------------------------------------------------

local XYZ = require( GetScriptDirectory() .. "/gxc/gxcXYZ" )
local U = require( GetScriptDirectory() .. "/gxc/gxcU" )
local J = require( GetScriptDirectory() .. "/gxc/gxcJ" )

----------------------------------------------------------------------------------------------------

WARD_CAST_RANGE = 500 + 500;
WARD_OBSERVER_SIGHT = 1600;
WARD_SENTRY_SIGHT = 150;
WARD_SENTRY_TRUE_SIGHT = 850;

----------------------------------------------------------------------------------------------------

function GetDesire()

	local npcBot = GetBot();

	npcBot.selectedWardPoint = nil;
	npcBot.genericWardPoints = XYZ["genericWardPoint"];
	npcBot.allyWardList = GetUnitList( UNIT_LIST_ALLIED_WARDS );
	npcBot.enemyWardList = GetUnitList( UNIT_LIST_ENEMY_WARDS );
	npcBot.item_ward_observer = J.GetItemAvailable("item_ward_observer");
	npcBot.item_ward_sentry = J.GetItemAvailable("item_ward_sentry");
	npcBot.item_ward_dispenser = J.GetItemAvailable("item_ward_dispenser");

	if ( npcBot.item_ward_observer == nil and npcBot.item_ward_sentry == nil and npcBot.item_ward_dispenser == nil ) then
		return ( 0.0 );
	end

	--------------------------------------------------------------------------

	-- we need wards in starting game
	if ( DotaTime() < 0 and (npcBot.item_ward_observer ~= nil or npcBot.item_ward_dispenser ~= nil) ) then
		return ( 0.4 );
	end

	--------------------------------------------------------------------------

	if ( DotaTime() > 0 and npcBot.genericWardPoints ~= nil and #npcBot.genericWardPoints > 0
		and npcBot:GetActiveMode() ~= BOT_MODE_RETREAT
		and npcBot:GetActiveMode() ~= BOT_MODE_SECRET_SHOP ) then

		for _, point in pairs( npcBot.genericWardPoints ) do

			if ( GetUnitToLocationDistance(npcBot, point) < WARD_CAST_RANGE ) then
				if ( npcBot.enemyWardList ~= nil and #npcBot.enemyWardList > 0 ) then
					for _, wardUnit in pairs(npcBot.enemyWardList) do
						if ( (npcBot.item_ward_sentry ~= nil or npcBot.item_ward_dispenser ~= nil)
							and GetUnitToLocationDistance(wardUnit, point) < WARD_SENTRY_TRUE_SIGHT ) then
							npcBot.selectedWardPoint = point;
							return ( 0.8 );
						end
					end
				end

				if ( npcBot.allyWardList ~= nil and #npcBot.allyWardList > 0 ) then
					for _, wardUnit in pairs(npcBot.allyWardList) do
						if ( wardUnit:GetUnitName() == "npc_dota_observer_wards" 
							and GetUnitToLocationDistance(wardUnit, point) <= WARD_OBSERVER_SIGHT * 1.5 ) then
							return ( 0.0 );
						end
					end
				end

				npcBot.selectedWardPoint = point;
				return ( 0.7 );
			end

		end

	end

	return ( 0.0 );

end

----------------------------------------------------------------------------------------------------

function Think()

	local npcBot = GetBot();

	if ( npcBot:IsUsingAbility() ) then
		return;
	end

	npcBot.item_ward_observer = J.GetItemAvailable("item_ward_observer");
	npcBot.item_ward_sentry = J.GetItemAvailable("item_ward_sentry");
	npcBot.item_ward_dispenser = J.GetItemAvailable("item_ward_dispenser");

	if ( npcBot.item_ward_observer == nil and npcBot.item_ward_sentry == nil and npcBot.item_ward_dispenser == nil ) then
		return;
	end

	-- we need wards in starting game
	if ( DotaTime() < 0 ) then

		if ( npcBot.item_ward_observer ~= nil and npcBot.item_ward_observer:GetCurrentCharges() > 1 ) then
			if ( GetTeam() == TEAM_RADIANT ) then
				npcBot:Action_UseAbilityOnLocation( npcBot.item_ward_observer, XYZ.RAD_TOP_MEDIUM_HIGHLAND_WARD_POINT );
			elseif ( GetTeam() == TEAM_DIRE ) then
				npcBot:Action_UseAbilityOnLocation( npcBot.item_ward_observer, XYZ.DIRE_BOT_RIVERWAY_HIGHLAND_WARD_POINT );
			end
		elseif ( npcBot.item_ward_observer ~= nil and npcBot.item_ward_observer:GetCurrentCharges() > 0 ) then
			if ( GetTeam() == TEAM_RADIANT ) then
				npcBot:Action_UseAbilityOnLocation( npcBot.item_ward_observer, XYZ.RAD_BOT_RIVERWAY_HIGHLAND_WARD_POINT );
			elseif ( GetTeam() == TEAM_DIRE ) then
				-- too far to return the lane for enough time
				--npcBot:Action_UseAbilityOnLocation( npcBot.item_ward_observer, XYZ.DIRE_TOP_RIVERWAY_HIGHLAND_WARD_POINT );
			end
		elseif ( npcBot.item_ward_dispenser ~= nil ) then
			if ( not npcBot.item_ward_dispenser:GetToggleState() ) then
				npcBot.item_ward_dispenser:ToggleAutoCast();
			end

			if ( npcBot.item_ward_dispenser:GetCurrentCharges() > 1 ) then
				if ( GetTeam() == TEAM_RADIANT ) then
					npcBot:Action_UseAbilityOnLocation( npcBot.item_ward_dispenser, XYZ.RAD_TOP_MEDIUM_HIGHLAND_WARD_POINT );
					npcBot:Action_UseAbilityOnLocation( npcBot.item_ward_dispenser, XYZ.RAD_BOT_RIVERWAY_HIGHLAND_WARD_POINT );
				elseif ( GetTeam() == TEAM_DIRE ) then
					npcBot:Action_UseAbilityOnLocation( npcBot.item_ward_dispenser, XYZ.DIRE_BOT_RIVERWAY_HIGHLAND_WARD_POINT );
					--npcBot:Action_UseAbilityOnLocation( npcBot.item_ward_dispenser, XYZ.DIRE_TOP_RIVERWAY_HIGHLAND_WARD_POINT );
				end
			end
		end

	else

		local wardPoint = npcBot.selectedWardPoint;

		if ( wardPoint == nil ) then
			return;
		end

		if ( npcBot.enemyWardList ~= nil and #npcBot.enemyWardList > 0 ) then
			for _, wardUnit in pairs(npcBot.enemyWardList) do
				if ( GetUnitToLocationDistance(wardUnit, wardPoint) < WARD_SENTRY_TRUE_SIGHT ) then
					if ( npcBot.item_ward_sentry ~= nil ) then
						npcBot:Action_UseAbilityOnLocation( npcBot.item_ward_sentry, wardPoint );
					elseif ( npcBot.item_ward_dispenser ~= nil ) then
						if ( npcBot.item_ward_dispenser:GetToggleState() ) then
							npcBot.item_ward_dispenser:ToggleAutoCast();
						end

						npcBot:Action_UseAbilityOnLocation( npcBot.item_ward_dispenser, wardPoint );
					end
				end
			end
		end

		if ( npcBot.item_ward_observer ~= nil ) then
			npcBot:Action_UseAbilityOnLocation( npcBot.item_ward_observer, wardPoint );
		elseif ( npcBot.item_ward_dispenser ~= nil ) then
			if ( not npcBot.item_ward_dispenser:GetToggleState() ) then
				npcBot.item_ward_dispenser:ToggleAutoCast();
			end

			npcBot:Action_UseAbilityOnLocation( npcBot.item_ward_dispenser, wardPoint );
		end

	end

end

----------------------------------------------------------------------------------------------------

for k,v in pairs( ward ) do	_G._savedEnv[k] = v end

----------------------------------------------------------------------------------------------------