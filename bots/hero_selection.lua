

----------------------------------------------------------------------------------------------------
local team = GetTeam();
local playerId = -1;

local herolist = {
	"npc_dota_hero_axe",
	"npc_dota_hero_axe",
	"npc_dota_hero_axe",
	"npc_dota_hero_axe"
};

function Think()
	idRandiant = GetTeamPlayers( TEAM_RADIANT );
	idDire = GetTeamPlayers( TEAM_DIRE );
	if ( team == TEAM_RADIANT )
	then
		local j = 1;
		for i, id in pairs(idRandiant) do
			if(j == 4) then
				SelectHero( id, "npc_dota_hero_nevermore" );
			elseif(j < 4) then
				if ( IsPlayerBot(id) ) then
					SelectHero( id, herolist[j] );
					j = j+1;
				end
			end
		end
	elseif ( team == TEAM_DIRE )
	then
		local j = 1;
		for i, id in pairs(idDire) do
			if(j == 5) then
				SelectHero( id, "npc_dota_hero_nevermore" );
			elseif(j < 5) then
				if ( IsPlayerBot(id) ) then
					SelectHero( id, herolist[j] );
					j = j+1;
				end
			end
		end
	end

end

----------------------------------------------------------------------------------------------------
