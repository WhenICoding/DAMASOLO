-- generic util
----------------------------------------------------------------------------------------------------

local X = {}

----------------------------------------------------------------------------------------------------

-- by date: 2016/12/31
-- unit goes to destination towards target in a straight line
-- the paramter 'distance' means the distance from unitLoc to destination in a straight line
function X.GetUnitsToLocationTowardsTarget( unitsLoc, targetLoc, distance )
    
	-- Get angle
	local unitX = unitsLoc[1];
	local unitY = unitsLoc[2];
	local targetX = targetLoc[1];
	local targetY = targetLoc[2];

	local vX = (targetX-unitX);
	local vY = (targetY-unitY);

	local radians = math.atan( vX / vY );

	local point = {}
	point[1] = unitsLoc[1] + (math.sin(radians) * distance);
	point[2] = unitsLoc[2] + (math.cos(radians) * distance);

	return Vector(point[1], point[2]);
end

----------------------------------------------------------------------------------------------------

-- by date: 2016/12/31
-- unit goes some distance towards fountain
function X.GetTowardsFountainLocation( unitLoc, distance )
	
	local destination = {};
	if ( GetTeam() == TEAM_RADIANT ) then
		destination[1] = unitLoc[1] - distance / math.sqrt(2);
		destination[2] = unitLoc[2] - distance / math.sqrt(2);
	end

	if ( GetTeam() == TEAM_DIRE ) then
		destination[1] = unitLoc[1] + distance / math.sqrt(2);
		destination[2] = unitLoc[2] + distance / math.sqrt(2);
	end
	return Vector(destination[1], destination[2]);
end

----------------------------------------------------------------------------------------------------

-- by date: 2017/01/02
-- location to location with specified radian and distance
function X.GetLocationInStraight( location, radian, distance )

	-- Get angle
	local locX = location[1];
	local locY = location[2];

	local direction = radian * math.pi / 180;
	--local direction = radian * 3.1415926535 / 180;

	local point = Vector( locX + (math.cos(direction) * distance), locY + (math.sin(direction) * distance) );

	return point;
end

----------------------------------------------------------------------------------------------------

-- by date: 2017/01/08
-- distance of location to location
function X.GetLocToLocDistance( loc1, loc2 )

	if ( loc1 == nil or loc2 == nil ) then
		return nil;
	end

	local loc1X = loc1[1];
	local loc1Y = loc1[2];

	local loc2X = loc2[1];
	local loc2Y = loc2[2];

	return math.sqrt( math.pow((loc1X - loc2X), 2) + math.pow((loc1Y - loc2Y), 2) );
end

----------------------------------------------------------------------------------------------------

-- by date: 2017/01/08
-- find a furthest and safest tree
function X.GetFurthestAndSafestTreeLocation( npcBot, nRadius, treeNum )

	local tableNearbyTrees = npcBot:GetNearbyTrees( nRadius );
		
	if ( #tableNearbyTrees > treeNum ) then
		local treeLocs = {};
		for _, tree in pairs(tableNearbyTrees) do
			table.insert( treeLocs, GetTreeLocation(tree) );
		end

		local safeTreeLocs = {};

		for i = 1, #tableNearbyTrees, 1 do
			local container = {};
			
			for j = 1, #tableNearbyTrees, 1 do
				local treeDist = X.GetLocToLocDistance( treeLocs[i], treeLocs[j] );

				if ( treeDist < 200 ) then
					table.insert( container, treeDist );
				end
			end

			if ( #container == #tableNearbyTrees ) then
				table.insert( safeTreeLocs, treeLocs[i] );
			end
		end

		local safeTreeLoc = npcBot:GetLocation();
		local safeTreeDistance = 0;
		for _, safeLoc in pairs(safeTreeLocs) do
			local toTreeDistance = X.GetLocToLocDistance( npcBot:GetLocation(), safeLoc );

			if ( toTreeDistance > safeTreeDistance ) then
				safeTreeLoc = treeLocs[i];
				safeDistance = X.GetLocToLocDistance( npcBot:GetLocation(), safeTreeLoc );
			end
		end

		return safeTreeLoc;
	end

	return nil;
end

----------------------------------------------------------------------------------------------------

return X;

----------------------------------------------------------------------------------------------------