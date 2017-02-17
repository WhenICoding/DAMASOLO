require( GetScriptDirectory() .. "/ability_item_usage_generic" )

----------------------------------------------------------------------------------------------------

local TalentTree = {
	"special_bonus_movement_speed_15",
	"special_bonus_attack_speed_20",
	"special_bonus_spell_amplify_6",
	"special_bonus_hp_175",
	"special_bonus_evasion_15",
	"special_bonus_unique_nevermore_1",
	"special_bonus_attack_range_150",
	"special_bonus_unique_nevermore_2"
};

local AbilityTable = {
	"nevermore_shadowraze1",
	"nevermore_necromastery",
	"nevermore_shadowraze1",
	"nevermore_necromastery",
	"nevermore_shadowraze1",
	"nevermore_necromastery",

	"nevermore_shadowraze1",
	"nevermore_necromastery",
	"nevermore_requiem",
	"special_bonus_attack_speed_20",
	"nevermore_dark_lord",
	"nevermore_requiem",

	"nevermore_dark_lord",
	"nevermore_dark_lord",
	"special_bonus_hp_175",
	"nevermore_dark_lord",
	"nevermore_requiem",

	"special_bonus_unique_nevermore_1",
	"special_bonus_attack_range_150"
};

----------------------------------------------------------------------------------------------------
tmp1 = 0;

npcBot = GetBot();
npcBot.abilityTable = AbilityTable;

ALERT_RANGE = 1300;
VISIBLE_RANGE = 1500;

CastPoint = 0.55;
radius = 250;
ZCastRange = 200;
XCastRange = 450;
CCastRange = 700;

rtzBlock = Vector(-5034.497070,-4414.029785,384.000000);
--[[
function AbilityUsageThink()

	if(tmp1 == 0 and GetGameMode() ~= GAMEMODE_1V1MID ) then
		npcBot:ActionImmediate_Chat("要把游戏模式设为中路单挑啊",true);
		tmp1 = 1;
	end

	if(GetTeam() == TEAM_RADIANT) then
		block();
	end
	
	if ( npcBot:IsUsingAbility() ) then return end;
	
	abilityZ = GetBot():GetAbilityByName( "nevermore_shadowraze1" );
	abilityX = GetBot():GetAbilityByName( "nevermore_shadowraze2" );
	abilityC = GetBot():GetAbilityByName( "nevermore_shadowraze3" );
	ZXCDamage = abilityZ:GetAbilityDamage();

	ConsiderUsingPAO(abilityX,XCastRange);
	ConsiderUsingPAO(abilityC,CCastRange);
	ConsiderUsingPAO(abilityZ,ZCastRange);
	--Vector(-1864.778076, -4351.264160, 128.000000);
	--npcBot:Action_MoveToLocation(Vector(-5034.497070,-4414.029785,384.000000));
end
]]
function ConsiderUsingPAO(abil,range)
	if ( npcBot:IsUsingAbility() or not abil:IsFullyCastable() ) then 
		return;
	end
	local enemy = GetEnemyMid();
	if(enemy == nil) then return; end
	local dist = GetUnitToUnitDistance(enemy,npcBot);
	if(dist > range-50 and dist < range+50) then
		--npcBot:ActionImmediate_Chat("转",true);
		npcBot:Action_MoveToUnit(enemy);
		npcBot:Action_Delay(10);
		--npcBot:ActionImmediate_Chat("延",true);
		npcBot:Action_UseAbility(abil);
	end
end

function GetFront(creep)--获取小兵和前线的距离
	local loc = creep:GetLocation();
	return (loc.x)*(loc.x)+(loc.y)*(loc.y);
end

function block()
	if(DotaTime() < 0) then
		npcBot:Action_MoveToLocation(rtzBlock);
	elseif(DotaTime() < 30 and DotaTime() > 0 and GetEnemyMid() == nil) then
	
		local NearbyLaneCreeps = npcBot:GetNearbyLaneCreeps(800, false);
		local frontCreep = nil;
		local dis = 9999999999;
		if ( tableNearbyLaneCreeps ~= nil ) then
			for _, creep in pairs(tableNearbyLaneCreeps) do
				nowDis = GetFront(creep);
				if(nowDis < dis) then
					dis = nowDis;
					frontCreep = creep;
				end
			end
		end
		if( GetTeam() == TEAM_RADIANT ) then
			npcBot:Action_MoveToLocation(Vector(frontCreep.x+50,frontCreep.y+50));
		elseif( GetTeam() == TEAM_DIRE ) then
			npcBot:Action_MoveToLocation(Vector(frontCreep.x-50,frontCreep.y-50));
		end
	end
end
----------------------------------------------------------------------------------------------------