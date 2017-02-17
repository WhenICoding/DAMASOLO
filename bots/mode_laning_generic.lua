_G._savedEnv = getfenv()
module( "laning", package.seeall )

----------------------------------------------------------------------------------------------------
--[[
GetDesire() - 每帧都被调用，需要返回一个0到1之间的浮点值，该值标志了该模式有多大可能成为当前激活模式
OnStart() - 当该模式成为当前激活模式时调用
OnEnd() - 当该模式让出控制权给其他被激活模式时调用
Think() - 当该模式为当前激活模式时，每帧都被调用。负责发出机器人的行为指令。
]]

RMT = Vector(-4147,-3635);
DMT = Vector(4197,3756);

tmp1 = 0;

npcBot = GetBot();

--Damage multiplier = 1 - 0.06 × armor ÷ (1 + (0.06 × |armor|))
ADTable = {
1.265,1.231,1.194,1.153,1.107,1.057,1.000,0.943,0.893,0.847,0.806,0.769,0.735,0.704,0.676,0.649,0.625
};--护甲攻击力对应值，从-6开始

function GetDesire()
	return 1.0;
end

function OnStart()
print("start");
end

function OnEnd()
	return;
end

function Think()
	if( DotaTime() < 0 ) then
		if(tmp1 == 0) then
			if(GetTeam() == TEAM_RADIANT) then
			print("ik");
				npcBot:Action_MoveToLocation(RMT);
			elseif(GetTeam() == TEAM_DIRE) then
				npcBot:Action_MoveToLocation(DMT);
			end
			tmp1 = 1;
		end
	elseif(DotaTime() > 0) then--正补反补A人技能走位顺序待调整
		BlockCreep();	--不负责任的卡兵
		local HasWeekCreepEnemy = KillCreep();	--可能会出现无脑越塔补兵的情况		
		local HasWeekCreepEnemy = DenyCreep();
		local CanAttackEnemy = AttackEnemy();
		--ConsiderUsingPAO();
		local NeedToMove = false;
		if(HasWeekCreepEnemy == true) then
			Move();
		end
	end
end

function BlockCreep()
	if(DotaTime() < 30 and DotaTime() > 0 and GetEnemyMid() == nil) then
		local tableNearbyLaneCreeps = npcBot:GetNearbyLaneCreeps(800, false);
		local frontCreep = 0;
		local dis = 9999999999.0;
		if ( tableNearbyLaneCreeps ~= nil ) then
			for i = 1,#tableNearbyLaneCreeps do
				local loc = tableNearbyLaneCreeps[i]:GetLocation();
				nowDis = (loc.x)*(loc.x)+(loc.y)*(loc.y);	--float型
				if(nowDis < dis) then
					dis = nowDis;
					frontCreep = i;
				end
			end
		end
		if(frontCreep ~= 0) then
			local v = Vector(tableNearbyLaneCreeps[frontCreep]:GetLocation().x+100,tableNearbyLaneCreeps[frontCreep]:GetLocation().y+100);
			if( GetTeam() == TEAM_RADIANT ) then
				npcBot:Action_MoveToLocation(v);
			elseif( GetTeam() == TEAM_DIRE ) then
				npcBot:Action_MoveToLocation(v);
			end
		end
	end
end

function KillCreep()
	local tableNearbyLaneCreeps = npcBot:GetNearbyLaneCreeps(1000, true);
	if(tableNearbyLaneCreeps == nil) then
		return false;
	elseif(tableNearbyLaneCreeps ~= nil) then
		local damage = npcBot:GetAttackDamage();
		print(armor);
		for i = 1,#tableNearbyLaneCreeps do
			local armor = tableNearbyLaneCreeps[i]:GetArmor();
			if(tableNearbyLaneCreeps[i]:GetHealth() < damage*ADTable[armor+7]) then--7为修正值
				npcBot:Action_AttackUnit(tableNearbyLaneCreeps[i],false);
				return true;
			end
			
		end
	end
end

function DenyCreep()
	local tableNearbyLaneCreeps = npcBot:GetNearbyLaneCreeps(1000, false);
	if(tableNearbyLaneCreeps == nil) then
		return false;
	elseif(tableNearbyLaneCreeps ~= nil) then
		local damage = npcBot:GetAttackDamage();
		for i = 1,#tableNearbyLaneCreeps do
			local armor = tableNearbyLaneCreeps[i]:GetArmor();
			if(tableNearbyLaneCreeps[i]:GetHealth() < damage*ADTable[armor+7]) then--7为修正值
				npcBot:Action_AttackUnit(tableNearbyLaneCreeps[i],false);
				return true;
			end
			
		end
	end
end

function AttackEnemy()
	local enemy = GetEnemyMid();
	if(enemy == nil) then return false; end
	local dist = GetUnitToUnitDistance(enemy,npcBot);
	if(dist > 500) then return false; end
	npcBot:Action_AttackUnit(enemy,false);
	return true;
end

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

function Move()

end

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

for k,v in pairs( laning ) do	_G._savedEnv[k] = v end

