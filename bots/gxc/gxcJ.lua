-- generic judge
----------------------------------------------------------------------------------------------------

local X = {}

----------------------------------------------------------------------------------------------------

function X.GetItemAvailable( item_name )

	local npcBot = GetBot();

	local item = nil;

	for i = 0, 5 do
		local sCurItem = npcBot:GetItemInSlot(i);
		
		if ( sCurItem ~= nil and sCurItem:GetName() == item_name and sCurItem:IsFullyCastable() ) then
			item = sCurItem;
		end
	end

	return item;
end

----------------------------------------------------------------------------------------------------

function X.GetItemInInventory( item_name )

	local npcBot = GetBot();

	local item = nil;

	for i = 0, 5 do
		local sCurItem = npcBot:GetItemInSlot(i);
		
		if ( sCurItem ~= nil and sCurItem:GetName() == item_name ) then
			item = sCurItem;
		end
	end

	return item;
end

----------------------------------------------------------------------------------------------------

function X.GetNpcItemInInventory( npc, item_name )

	local item = nil;

	if ( npc ~= nil and npc:IsHero() ) then
		for i = 0, 5 do
			local sCurItem = npc:GetItemInSlot(i);
			
			if ( sCurItem ~= nil and sCurItem:GetName() == item_name ) then
				item = sCurItem;
			end
		end
	end

	return item;
end

----------------------------------------------------------------------------------------------------

function X.GetItemIncludeBackpack( item_name )

	local npcBot = GetBot();

	local item = nil;

	for i = 0, 8 do
		local sCurItem = npcBot:GetItemInSlot(i);
		if ( sCurItem ~= nil and sCurItem:GetName() == item_name ) then
			item = sCurItem;
		end
	end

	return item;
end

----------------------------------------------------------------------------------------------------

function X.GetNpcItemIncludeBackpack( npc, item_name )

	local item = nil;

	if ( npc ~= nil and npc:IsHero() ) then
		for i = 0, 8 do
			local sCurItem = npc:GetItemInSlot(i);
			
			if ( sCurItem ~= nil and sCurItem:GetName() == item_name ) then
				item = sCurItem;
			end
		end
	end

	return item;
end

----------------------------------------------------------------------------------------------------

function X.GetItemInBackpack( item_name )

	local npcBot = GetBot();

	local item = nil;

	for i = 6, 8 do
		local sCurItem = npcBot:GetItemInSlot(i);
		if ( sCurItem ~= nil and sCurItem:GetName() == item_name ) then
			item = sCurItem;
		end
	end

	return item;
end

----------------------------------------------------------------------------------------------------

function X.GetItemIncludeStash( item_name )

	local npcBot = GetBot();

	local item = nil;

	for i = 0, 14 do
		local sCurItem = npcBot:GetItemInSlot(i);
		
		if ( sCurItem ~= nil and sCurItem:GetName() == item_name ) then
			item = sCurItem;
		end
	end

	return item;
end

----------------------------------------------------------------------------------------------------

function X.GetItemInStash( item_name )

	local npcBot = GetBot();

	local item = nil;

	for i = 9, 14 do
		local sCurItem = npcBot:GetItemInSlot(i);
		
		if ( sCurItem ~= nil and sCurItem:GetName() == item_name ) then
			item = sCurItem;
		end
	end

	return item;
end

----------------------------------------------------------------------------------------------------

function X.HasItem( item_name )

	local npcBot = GetBot();
	npcBot.courier = GetCourier(0);

	for i = 0, 14 do
		local sCurItem = npcBot:GetItemInSlot(i);
		
		if ( sCurItem ~= nil and sCurItem:GetName() == item_name ) then
			return true;
		end
	end

	if ( npcBot.courier ~= nil ) then
		for i = 0, 8 do
			local sCurItem = npcBot.courier:GetItemInSlot(i);
			
			if ( sCurItem ~= nil and sCurItem:GetName() == item_name ) then
				return true;
			end
		end
	end

	return false;
end

----------------------------------------------------------------------------------------------------

function X.HasEmptySlotsInInventory()

	local npcBot = GetBot();

	for i = 0, 5 do
		local sCurItem = npcBot:GetItemInSlot(i);
		
		if ( sCurItem == nil ) then
			return true;
		end
	end

	return false;
end

----------------------------------------------------------------------------------------------------

function X.HasEmptySlotsIncludeBackpack()

	local npcBot = GetBot();

	for i = 0, 8 do
		local sCurItem = npcBot:GetItemInSlot(i);
		
		if ( sCurItem == nil ) then
			return true;
		end
	end

	return false;
end

----------------------------------------------------------------------------------------------------

function X.GetCheapestItemInInventory()

	local npcBot = GetBot();

	local cheapestItem = nil;
	local cheapestValue = 100000;

	for i = 0, 5 do
		local sCurItem = npcBot:GetItemInSlot(i);

		if ( sCurItem == nil ) then
			return nil;
		else
			local itemCost = GetItemCost(sCurItem:GetName());
			if ( itemCost < cheapestValue ) then
				cheapestValue = itemCost;
				cheapestItem = sCurItem;
			end
		end
	end

	return cheapestItem;
end

----------------------------------------------------------------------------------------------------

function X.GetWardObserverCountIncludeStash()

	local npcBot = GetBot();

	local count = 0;

	for i = 0, 14 do
		local sCurItem = npcBot:GetItemInSlot(i);
		
		if ( sCurItem ~= nil and sCurItem:GetName() == "item_ward_observer" ) then
			local charges = sCurItem:GetCurrentCharges();
			count = count + charges;
		end

		if ( sCurItem ~= nil and sCurItem:GetName() == "item_ward_dispenser" ) then
			local charges = 0;
			if ( sCurItem:GetToggleState() ) then
				charges = sCurItem:GetCurrentCharges();
			else
				charges = sCurItem:GetSecondaryCharges();
			end
			
			count = count + charges;
		end
	end

	return count;

end

----------------------------------------------------------------------------------------------------

function X.GetItemCountInStash()

	local npcBot = GetBot();

	local count = 0;

	for i = 9, 14 do
		local sCurItem = npcBot:GetItemInSlot(i);
		
		if ( sCurItem ~= nil and sCurItem:GetName() ~= "" ) then
			count = count + 1;
		end
	end

	return count;
end

----------------------------------------------------------------------------------------------------

function X.GetModifierIndexByName( modifierName )

	local npcBot = GetBot();

	if ( modifierName ~= nil and modifierName == "") then
		local modifierCount = npcBot:NumModifiers();

		for i = 1, modifierCount, 1  do
			if ( npcBot:GetModifierName(i) == modifierName ) then
				return i;
			end
		end
	end

	return -1;

end

----------------------------------------------------------------------------------------------------

return X;

----------------------------------------------------------------------------------------------------