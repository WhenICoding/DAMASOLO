

----------------------------------------------------------------------------------------------------
npcBot = GetBot();

function findLocation()--查坐标用
	local tableHero = npcBot:GetNearbyHeroes(1000,false,BOT_MODE_NONE);
	if(tableHero ~= nil) then
		for _, hero in pairs(tableHero) do
			if ( hero:GetHealth() > 2000) then
				local v = hero:GetLocation();
				print(hero:GetMana());
				print(v);
				return;
			end
		end
	end
end

function Think()
	
end

---5034.497070 -4414.029785 384.000000	rtz Block