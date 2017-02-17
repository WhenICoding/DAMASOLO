_G._savedEnv = getfenv()
module( "ability_item", package.seeall )

----------------------------------------------------------------------------------------------------

local J = require( GetScriptDirectory() .. "/gxc/gxcJ" )

----------------------------------------------------------------------------------------------------

ALERT_RANGE = 1300;
VISIBLE_RANGE = 1500;

----------------------------------------------------------------------------------------------------

function GetEnemyMid()

	local npcBot = GetBot();
	local enemyHero = npcBot:GetNearbyHeroes(1000,true,BOT_MODE_NONE);
	if(#enemyHero == 1) then
		return enemyHero[1];
	elseif(#enemyHero > 1) then
		npcBot:ActionImmediate_Chat("请观众远离现场！",true);
	end
end

----------------------------------------------------------------------------------------------------
function AbilityLevelUpThink()
	local npcBot = GetBot();

	if ( npcBot == nil or npcBot.abilityTable == nil ) then
		return;
	end

	if ( npcBot:GetAbilityPoints() > 0 ) then

		-- DotaTime is needed !
		if ( npcBot.abilityTable[1] == nil or DotaTime() < 0 ) then
			return;
		end
		
		local ability = npcBot:GetAbilityByName( npcBot.abilityTable[1] );
		
		if ( ability ~= nil and ability:CanAbilityBeUpgraded() and ability:GetLevel() < ability:GetMaxLevel() ) then
			npcBot:ActionImmediate_LevelAbility( npcBot.abilityTable[1] );
			table.remove( npcBot.abilityTable, 1 );
		end

	end

end

----------------------------------------------------------------------------------------------------

function CourierUsageThink()

	local npcBot = GetBot();
	npcBot.courier = GetCourier(0);

	if ( DotaTime() < 0 or npcBot.courier == nil or npcBot.courier:IsUsingAbility() ) then
		return;
	end

	-- use the courier
	if ( GetCourierState(npcBot.courier) == COURIER_STATE_MOVING or GetCourierState(npcBot.courier) == COURIER_STATE_DELIVERING_ITEMS ) then
--加速
		ConsiderCourierBurst();

	elseif ( GetCourierState(npcBot.courier) == COURIER_STATE_IDLE or GetCourierState(npcBot.courier) == COURIER_STATE_AT_BASE
		or GetCourierState(npcBot.courier) == COURIER_STATE_RETURNING_TO_BASE ) then

		if ( GetCourierState(npcBot.courier) == COURIER_STATE_RETURNING_TO_BASE ) then
			ConsiderCourierBurst();
		end

		--------------------------------------------------------------------------

		local sNextItem = nil;
		if ( npcBot.tableItemsToBuy ~= nil and #npcBot.tableItemsToBuy > 0 ) then
			sNextItem = npcBot.tableItemsToBuy[1];
			npcBot:SetNextItemPurchaseValue( GetItemCost( sNextItem ) );
		end

		--------------------------------------------------------------------------
		npcBot:ActionImmediate_Courier( npcBot.courier, COURIER_ACTION_TAKE_AND_TRANSFER_ITEMS );
		
		if ( GetCourierState(npcBot.courier) == COURIER_STATE_IDLE ) then
			npcBot:ActionImmediate_Courier( npcBot.courier, COURIER_ACTION_RETURN );
		end
		

		if ( GetCourierState(npcBot.courier) == COURIER_STATE_DEAD ) then
			return;
		end
		
	end
end

----------------------------------------------------------------------------------------------------

-- all heroes' common action
function ActionCommonThink()

	-- use our shrines
	-- TODO

	-- attack enemy shrines
	-- TODO

end

----------------------------------------------------------------------------------------------------

function ConsiderCourierBurst()

	local npcBot = GetBot();

	if ( DotaTime() < 0 or npcBot.courier == nil or npcBot.courier:GetUnitName() ~= "npc_dota_flying_courier" ) then
		return;
	end

	local courierAbilityBurst = npcBot.courier:GetAbilityByName( "courier_burst" );

	if ( npcBot.courier:IsUsingAbility() or not courierAbilityBurst:IsFullyCastable() ) then
		return;
	end

	local tableNearbyEnemyHeroes = npcBot.courier:GetNearbyHeroes( ALERT_RANGE, true, BOT_MODE_NONE );
	local tableNearbyEnemyTowers = npcBot.courier:GetNearbyTowers( ALERT_RANGE, true );

	local unitDistance = 0;
	local towerDistance = 0;

	if ( tableNearbyEnemyHeroes ~= nil and #tableNearbyEnemyHeroes > 0 ) then
		local enemyHero = tableNearbyEnemyHeroes[1];
		unitDistance = GetUnitToUnitDistance( npcBot.courier, enemyHero );
	end

	if ( tableNearbyEnemyTowers ~= nil and #tableNearbyEnemyTowers > 0 ) then
		local enemyTower = tableNearbyEnemyTowers[1];
		towerDistance = GetUnitToLocationDistance( npcBot.courier, enemyTower:GetLocation() );
	end

	if ( npcBot.courier:WasRecentlyDamagedByAnyHero(1.0) or npcBot.courier:WasRecentlyDamagedByCreep(1.0)
		or npcBot.courier:WasRecentlyDamagedByTower(1.0)
		or unitDistance < 700 or towerDistance < 800 ) then
		npcBot:ActionImmediate_Courier( npcBot.courier, COURIER_ACTION_BURST );
	end

end

----------------------------------------------------------------------------------------------------

-- not human heroes
function GetBotHeroes()

	local botHeroes = {};

	for i = 1, 5, 1 do
		local hero = GetTeamMember(i);
		
		if ( hero ~= nil and IsPlayerBot( hero:GetPlayerID() ) ) then
			table.insert( botHeroes, hero );
		end
	end

	return botHeroes;

end

----------------------------------------------------------------------------------------------------

for k,v in pairs( ability_item ) do	_G._savedEnv[k] = v end

----------------------------------------------------------------------------------------------------