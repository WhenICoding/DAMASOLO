_G._savedEnv = getfenv()
module( "secret_shop", package.seeall )

----------------------------------------------------------------------------------------------------

function GetDesire()

	local npcBot = GetBot();

	if ( npcBot.secretShopMode == true ) then
		return ( 0.5 );
	end

	if ( #npcBot.tableItemsToBuy > 0 ) then
		local sNextItem = npcBot.tableItemsToBuy[1];

		if ( not IsItemPurchasedFromSecretShop( sNextItem ) ) then
			npcBot.secretShopMode = false;
		end
	end
  
	return ( 0.0 );

end

----------------------------------------------------------------------------------------------------

-- TEMPORARY ABANDONMENT
function Think2()

	local npcBot = GetBot();

	local shopLoc1 = GetShopLocation( GetTeam(), SHOP_SECRET );
	local shopLoc2 = GetShopLocation( GetTeam(), SHOP_SECRET2 );

	if ( GetUnitToLocationDistance(npcBot, shopLoc1) <= GetUnitToLocationDistance(npcBot, shopLoc2) ) then
		npcBot:Action_MoveToLocation( shopLoc1 );
	else
		npcBot:Action_MoveToLocation( shopLoc2 );
	end

end

----------------------------------------------------------------------------------------------------

for k,v in pairs( secret_shop ) do	_G._savedEnv[k] = v end

----------------------------------------------------------------------------------------------------