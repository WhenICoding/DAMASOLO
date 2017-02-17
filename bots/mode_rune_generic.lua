_G._savedEnv = getfenv()
module( "rune", package.seeall )

----------------------------------------------------------------------------------------------------

local J = require( GetScriptDirectory() .. "/gxc/gxcJ" )

----------------------------------------------------------------------------------------------------

ALERT_RANGE = 1300;
RUNE_RANGE = 1000;

local minute = 0;
local second = 0;

----------------------------------------------------------------------------------------------------

function GetDesire()

	local npcBot = GetBot();

	local runeList = { RUNE_BOUNTY_1, RUNE_BOUNTY_2, RUNE_BOUNTY_3, RUNE_BOUNTY_4,
		RUNE_POWERUP_1, RUNE_POWERUP_2 };

	local tableNearbyEnemyHeroes = npcBot:GetNearbyHeroes( ALERT_RANGE, true, BOT_MODE_NONE );

	-- see a rune if we walk by it
	for _, rune in pairs(runeList) do
		local runeLocation = GetRuneSpawnLocation(rune);

		if ( runeLocation ~= nil ) then
			local distance = GetUnitToLocationDistance( npcBot, runeLocation );

			if ( distance < RUNE_RANGE and GetRuneStatus(rune) == RUNE_STATUS_AVAILABLE ) then
				npcBot.grabRune = rune;

				if ( (npcBot:GetActiveMode() ~= BOT_MODE_RETREAT
					and npcBot:GetActiveMode() ~= BOT_MODE_ATTACK
					and npcBot:GetActiveMode() ~= BOT_MODE_EVASIVE_MANEUVERS
					and npcBot:GetActiveMode() ~= BOT_MODE_DEFEND_ALLY)
					or (tableNearbyEnemyHeroes ~= nil and #tableNearbyEnemyHeroes <= 0) ) then

					return RemapValClamped( distance, RUNE_RANGE, 200, 0.7, 1.0 );
				else
					return RemapValClamped( distance, RUNE_RANGE, 200, 0.0, 1.0 );
				end
			end
		end
	end

	if ( IsInvisibleUnitGrabRune() ) then
		SolveTheInvisibleUnitGrabRune();
	end

	return ( 0.0 );
end

----------------------------------------------------------------------------------------------------

function Think()

	GrabRuneNearby();

end

----------------------------------------------------------------------------------------------------

-- grab a rune if we walk by it
function GrabRuneNearby()

	local npcBot = GetBot();

	if ( npcBot.grabRune ~= nil ) then
		local runeLocation = GetRuneSpawnLocation(npcBot.grabRune);

		if ( runeLocation ~= nil ) then
			local distance = GetUnitToLocationDistance( npcBot, runeLocation );

			if ( distance < RUNE_RANGE and GetRuneStatus(npcBot.grabRune) == RUNE_STATUS_AVAILABLE ) then
				npcBot:Action_PickUpRune( npcBot.grabRune );
			end
		end
	end

end

----------------------------------------------------------------------------------------------------

-- an invisible enemy unit has grabbed the upcoming or ready rune ?
function IsInvisibleUnitGrabRune()

	local npcBot = GetBot();
	
	local tableNearbyEnemyHeroes = npcBot:GetNearbyHeroes( ALERT_RANGE, true, BOT_MODE_NONE );
	local tableNearbyAllyHeroes = npcBot:GetNearbyHeroes( ALERT_RANGE, false, BOT_MODE_NONE );

	minute = math.floor(DotaTime() / 60);
	second = DotaTime() % 60;

	if ( tableNearbyEnemyHeroes ~= nil and tableNearbyAllyHeroes ~= nil ) then
		if ( #tableNearbyEnemyHeroes <= 0 and #tableNearbyAllyHeroes <= 0 ) then
			if ( minute % 2 == 0 and second < 5 ) then
				if ( minute ~= 0 ) then
					local powerupList = { RUNE_POWERUP_1, RUNE_POWERUP_2 };
					for _, rune in pairs(powerupList) do
						local runeLocation = GetRuneSpawnLocation(rune);

						if ( runeLocation ~= nil ) then
							local distance = GetUnitToLocationDistance( npcBot, runeLocation );

							if ( distance < RUNE_RANGE and GetRuneStatus(rune) == RUNE_STATUS_MISSING ) then
								return true;
							end
						end
					end
				end

				local bountyList = { RUNE_BOUNTY_1, RUNE_BOUNTY_2, RUNE_BOUNTY_3, RUNE_BOUNTY_4 };
				for _, rune in pairs(bountyList) do
					local runeLocation = GetRuneSpawnLocation(rune);

					if ( runeLocation ~= nil ) then
						local distance = GetUnitToLocationDistance( npcBot, runeLocation );

						if ( distance < RUNE_RANGE and GetRuneStatus(rune) == RUNE_STATUS_MISSING ) then
							return true;
						end
					end
				end
			end
		end
	end
	
	return false;
end

----------------------------------------------------------------------------------------------------

function SolveTheInvisibleUnitGrabRune()

	local npcBot = GetBot();

	local item_dust = nil;
	local item_ward_sentry = nil;

	item_dust = J.GetItemAvailable( "item_dust" );
	item_ward_sentry = J.GetItemAvailable( "item_ward_sentry" );

	if ( item_dust ~= nil and item_dust:IsFullyCastable() ) then
		npcBot:Action_UseAbility( item_dust );
	elseif ( item_ward_sentry ~= nil and item_ward_sentry:IsFullyCastable() ) then
		local point = npcBot:GetLocation() + Vector( RandomFloat( -100.0, 100.0 ), RandomFloat( -100.0, 100.0 ) );
		npcBot:Action_UseAbilityOnEntity( item_ward_sentry, point );
	end

end

----------------------------------------------------------------------------------------------------

for k,v in pairs( rune ) do	_G._savedEnv[k] = v end