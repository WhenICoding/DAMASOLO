_G._savedEnv = getfenv()
module( "purchase", package.seeall )

----------------------------------------------------------------------------------------------------

DB = require( GetScriptDirectory() .. "/gxc/gxcDB" )
J = require( GetScriptDirectory() .. "/gxc/gxcJ" )

----------------------------------------------------------------------------------------------------

local invisibleHeroes = {
	"npc_dota_hero_legion_commander",
	"npc_dota_hero_sand_king",
	"npc_dota_hero_treant",
	"npc_dota_hero_bounty_hunter",
	"npc_dota_hero_broodmother",
	"npc_dota_hero_clinkz",
	"npc_dota_hero_drow_ranger",
	"npc_dota_hero_mirana",
	"npc_dota_hero_nyx_assassin",
	"npc_dota_hero_riki",
	"npc_dota_hero_nevermore",
	"npc_dota_hero_slark",
	"npc_dota_hero_sniper",
	"npc_dota_hero_templar_assassin",
	"npc_dota_hero_viper",
	"npc_dota_hero_invoker"
};

----------------------------------------------------------------------------------------------------

function PurchaseUpgrades( shoppingCart, upgradeItemName )

	if ( upgradeItemName == "item_magic_wand" ) then

		table.insert( shoppingCart, "item_branches" );
		table.insert( shoppingCart, "item_branches" );
		table.insert( shoppingCart, "item_circlet" );
		table.insert( shoppingCart, "item_magic_stick" );

	elseif ( upgradeItemName == "item_ring_of_basilius" ) then

		table.insert( shoppingCart, "item_ring_of_protection" );
		table.insert( shoppingCart, "item_sobi_mask" );

	elseif ( upgradeItemName == "item_glimmer_cape" ) then

		table.insert( shoppingCart, "item_cloak" );
		table.insert( shoppingCart, "item_shadow_amulet" );

	elseif ( upgradeItemName == "item_hood_of_defiance" ) then

		table.insert( shoppingCart, "item_ring_of_regen" );
		table.insert( shoppingCart, "item_cloak" );
		table.insert( shoppingCart, "item_ring_of_health" );

	elseif ( upgradeItemName == "item_lesser_crit" ) then

		table.insert( shoppingCart, "item_blades_of_attack" );
		table.insert( shoppingCart, "item_broadsword" );
		table.insert( shoppingCart, "item_recipe_lesser_crit" );

	elseif ( upgradeItemName == "item_mask_of_madness" ) then

		table.insert( shoppingCart, "item_lifesteal" );
		table.insert( shoppingCart, "item_recipe_mask_of_madness" );

	elseif ( upgradeItemName == "item_null_talisman" ) then

		table.insert( shoppingCart, "item_mantle" );
		table.insert( shoppingCart, "item_circlet" );
		table.insert( shoppingCart, "item_recipe_null_talisman" );

	elseif ( upgradeItemName == "item_iron_talon" ) then

		table.insert( shoppingCart, "item_ring_of_protection" );
		table.insert( shoppingCart, "item_quelling_blade" );
		table.insert( shoppingCart, "item_recipe_iron_talon" );

	elseif ( upgradeItemName == "item_force_staff" ) then

		table.insert( shoppingCart, "item_ring_of_regen" );
		table.insert( shoppingCart, "item_staff_of_wizardry" );
		table.insert( shoppingCart, "item_recipe_force_staff" );

	elseif ( upgradeItemName == "item_vanguard" ) then

		table.insert( shoppingCart, "item_stout_shield" );
		table.insert( shoppingCart, "item_ring_of_health" );
		table.insert( shoppingCart, "item_vitality_booster" );

	elseif ( upgradeItemName == "item_armlet" ) then

		table.insert( shoppingCart, "item_blades_of_attack" );
		table.insert( shoppingCart, "item_gloves" );
		table.insert( shoppingCart, "item_helm_of_iron_will" );
		table.insert( shoppingCart, "item_recipe_armlet" );

	elseif ( upgradeItemName == "item_helm_of_the_dominator" ) then

		table.insert( shoppingCart, "item_gloves" );
		table.insert( shoppingCart, "item_recipe_helm_of_the_dominator" );

	elseif ( upgradeItemName == "item_wraith_band" ) then

		table.insert( shoppingCart, "item_slippers" );
		table.insert( shoppingCart, "item_circlet" );
		table.insert( shoppingCart, "item_recipe_wraith_band" );

	elseif ( upgradeItemName == "item_headdress" ) then

		table.insert( shoppingCart, "item_branches" );
		table.insert( shoppingCart, "item_ring_of_regen" );
		table.insert( shoppingCart, "item_recipe_headdress" );

	elseif ( upgradeItemName == "item_veil_of_discord" ) then

		table.insert( shoppingCart, "item_helm_of_iron_will" );
		table.insert( shoppingCart, "item_recipe_veil_of_discord" );

	elseif ( upgradeItemName == "item_blade_mail" ) then

		table.insert( shoppingCart, "item_robe" );
		table.insert( shoppingCart, "item_chainmail" );
		table.insert( shoppingCart, "item_broadsword" );

	elseif ( upgradeItemName == "item_invis_sword" ) then

		table.insert( shoppingCart, "item_shadow_amulet" );
		table.insert( shoppingCart, "item_claymore" );

	elseif ( upgradeItemName == "item_dragon_lance" ) then

		table.insert( shoppingCart, "item_boots_of_elves" );
		table.insert( shoppingCart, "item_boots_of_elves" );
		table.insert( shoppingCart, "item_ogre_axe" );

	elseif ( upgradeItemName == "item_poor_mans_shield" ) then

		table.insert( shoppingCart, "item_slippers" );
		table.insert( shoppingCart, "item_slippers" );
		table.insert( shoppingCart, "item_stout_shield" );

	elseif ( upgradeItemName == "item_buckler" ) then

		table.insert( shoppingCart, "item_branches" );
		table.insert( shoppingCart, "item_chainmail" );
		table.insert( shoppingCart, "item_recipe_buckler" );

	elseif ( upgradeItemName == "item_aether_lens" ) then

		table.insert( shoppingCart, "item_ring_of_health" );
		table.insert( shoppingCart, "item_energy_booster" );
		table.insert( shoppingCart, "item_recipe_aether_lens" );

	elseif ( upgradeItemName == "item_soul_booster" ) then

		table.insert( shoppingCart, "item_energy_booster" );
		table.insert( shoppingCart, "item_vitality_booster" );
		table.insert( shoppingCart, "item_point_booster" );

	elseif ( upgradeItemName == "item_basher" ) then

		table.insert( shoppingCart, "item_belt_of_strength" );
		table.insert( shoppingCart, "item_javelin" );
		table.insert( shoppingCart, "item_recipe_basher" );

	elseif ( upgradeItemName == "item_sange" ) then

		table.insert( shoppingCart, "item_belt_of_strength" );
		table.insert( shoppingCart, "item_ogre_axe" );
		table.insert( shoppingCart, "item_recipe_sange" );

	elseif ( upgradeItemName == "item_bracer" ) then

		table.insert( shoppingCart, "item_gauntlets" );
		table.insert( shoppingCart, "item_circlet" );
		table.insert( shoppingCart, "item_recipe_bracer" );

	elseif ( upgradeItemName == "item_urn_of_shadows" ) then

		table.insert( shoppingCart, "item_gauntlets" );
		table.insert( shoppingCart, "item_gauntlets" );
		table.insert( shoppingCart, "item_sobi_mask" );
		table.insert( shoppingCart, "item_recipe_urn_of_shadows" );

	elseif ( upgradeItemName == "item_necronomicon_1" ) then

		table.insert( shoppingCart, "item_belt_of_strength" );
		table.insert( shoppingCart, "item_staff_of_wizardry" );
		table.insert( shoppingCart, "item_recipe_necronomicon" );

	elseif ( upgradeItemName == "item_necronomicon_2" ) then

		table.insert( shoppingCart, "item_recipe_necronomicon" );

	elseif ( upgradeItemName == "item_necronomicon_3" ) then

		table.insert( shoppingCart, "item_recipe_necronomicon" );

	elseif ( upgradeItemName == "item_crimson_guard" ) then

		table.insert( shoppingCart, "item_recipe_crimson_guard" );

	elseif ( upgradeItemName == "item_bfury" ) then

		table.insert( shoppingCart, "item_quelling_blade" );
		table.insert( shoppingCart, "item_broadsword" );
		table.insert( shoppingCart, "item_claymore" );

	elseif ( upgradeItemName == "item_yasha" ) then

		table.insert( shoppingCart, "item_boots_of_elves" );
		table.insert( shoppingCart, "item_blade_of_alacrity" );
		table.insert( shoppingCart, "item_recipe_yasha" );

	elseif ( upgradeItemName == "item_soul_ring" ) then

		table.insert( shoppingCart, "item_ring_of_regen" );
		table.insert( shoppingCart, "item_sobi_mask" );
		table.insert( shoppingCart, "item_recipe_soul_ring" );

	elseif ( upgradeItemName == "item_tranquil_boots" ) then

		table.insert( shoppingCart, "item_boots" );
		table.insert( shoppingCart, "item_ring_of_protection" );
		table.insert( shoppingCart, "item_ring_of_regen" );

	elseif ( upgradeItemName == "item_dagon_1" ) then

		table.insert( shoppingCart, "item_staff_of_wizardry" );
		table.insert( shoppingCart, "item_recipe_dagon" );

	elseif ( upgradeItemName == "item_dagon_2" ) then

		table.insert( shoppingCart, "item_recipe_dagon" );

	elseif ( upgradeItemName == "item_dagon_3" ) then

		table.insert( shoppingCart, "item_recipe_dagon" );

	elseif ( upgradeItemName == "item_dagon_4" ) then

		table.insert( shoppingCart, "item_recipe_dagon" );

	elseif ( upgradeItemName == "item_dagon_5" ) then

		table.insert( shoppingCart, "item_recipe_dagon" );

	elseif ( upgradeItemName == "item_black_king_bar" ) then

		table.insert( shoppingCart, "item_ogre_axe" );
		table.insert( shoppingCart, "item_mithril_hammer" );
		table.insert( shoppingCart, "item_recipe_black_king_bar" );

	elseif ( upgradeItemName == "item_ethereal_blade" ) then

		table.insert( shoppingCart, "item_ghost" );
		table.insert( shoppingCart, "item_eagle" );

	elseif ( upgradeItemName == "item_echo_sabre" ) then

		table.insert( shoppingCart, "item_ogre_axe" );

	elseif ( upgradeItemName == "item_phase_boots" ) then

		table.insert( shoppingCart, "item_boots" );
		table.insert( shoppingCart, "item_blades_of_attack" );
		table.insert( shoppingCart, "item_blades_of_attack" );

	elseif ( upgradeItemName == "item_ring_of_aquila" ) then

	elseif ( upgradeItemName == "item_cyclone" ) then

		table.insert( shoppingCart, "item_wind_lace" );
		table.insert( shoppingCart, "item_void_stone" );
		table.insert( shoppingCart, "item_staff_of_wizardry" );
		table.insert( shoppingCart, "item_recipe_cyclone" );

	elseif ( upgradeItemName == "item_lotus_orb" ) then

		table.insert( shoppingCart, "item_energy_booster" );
		table.insert( shoppingCart, "item_platemail" );

	elseif ( upgradeItemName == "item_silver_edge" ) then

		table.insert( shoppingCart, "item_ultimate_orb" );
		table.insert( shoppingCart, "item_recipe_silver_edge" );

	elseif ( upgradeItemName == "item_maelstrom" ) then

		table.insert( shoppingCart, "item_gloves" );
		table.insert( shoppingCart, "item_mithril_hammer" );
		table.insert( shoppingCart, "item_recipe_maelstrom" );

	elseif ( upgradeItemName == "item_power_treads" ) then

		table.insert( shoppingCart, "item_boots" );
		table.insert( shoppingCart, "item_belt_of_strength" );
		table.insert( shoppingCart, "item_gloves" );

	elseif ( upgradeItemName == "item_medallion_of_courage" ) then

		table.insert( shoppingCart, "item_blight_stone" );
		table.insert( shoppingCart, "item_sobi_mask" );
		table.insert( shoppingCart, "item_chainmail" );

	elseif ( upgradeItemName == "item_solar_crest" ) then

		table.insert( shoppingCart, "item_talisman_of_evasion" );

	elseif ( upgradeItemName == "item_shivas_guard" ) then

		table.insert( shoppingCart, "item_platemail" );
		table.insert( shoppingCart, "item_mystic_staff" );
		table.insert( shoppingCart, "item_recipe_shivas_guard" );

	elseif ( upgradeItemName == "item_radiance" ) then

		table.insert( shoppingCart, "item_relic" );
		table.insert( shoppingCart, "item_recipe_radiance" );

	elseif ( upgradeItemName == "item_diffusal_blade_1" ) then

		table.insert( shoppingCart, "item_robe" );
		table.insert( shoppingCart, "item_blade_of_alacrity" );
		table.insert( shoppingCart, "item_blade_of_alacrity" );
		table.insert( shoppingCart, "item_recipe_diffusal_blade" );

	elseif ( upgradeItemName == "item_diffusal_blade_2" ) then

		table.insert( shoppingCart, "item_recipe_diffusal_blade" );

	elseif ( upgradeItemName == "item_oblivion_staff" ) then

		table.insert( shoppingCart, "item_sobi_mask" );
		table.insert( shoppingCart, "item_robe" );
		table.insert( shoppingCart, "item_quarterstaff" );

	elseif ( upgradeItemName == "item_arcane_boots" ) then

		table.insert( shoppingCart, "item_boots" );
		table.insert( shoppingCart, "item_energy_booster" );

	elseif ( upgradeItemName == "item_rod_of_atos" ) then

		table.insert( shoppingCart, "item_staff_of_wizardry" );
		table.insert( shoppingCart, "item_staff_of_wizardry" );
		table.insert( shoppingCart, "item_vitality_booster" );

	elseif ( upgradeItemName == "item_bloodstone" ) then

		table.insert( shoppingCart, "item_recipe_bloodstone" );

	elseif ( upgradeItemName == "item_monkey_king_bar" ) then

		table.insert( shoppingCart, "item_javelin" );
		table.insert( shoppingCart, "item_javelin" );
		table.insert( shoppingCart, "item_demon_edge" );

	elseif ( upgradeItemName == "item_desolator" ) then

		table.insert( shoppingCart, "item_blight_stone" );
		table.insert( shoppingCart, "item_mithril_hammer" );
		table.insert( shoppingCart, "item_mithril_hammer" );

	elseif ( upgradeItemName == "item_pers" ) then

		table.insert( shoppingCart, "item_ring_of_health" );
		table.insert( shoppingCart, "item_void_stone" );

	elseif ( upgradeItemName == "item_ancient_janggo" ) then

		table.insert( shoppingCart, "item_wind_lace" );
		table.insert( shoppingCart, "item_sobi_mask" );
		table.insert( shoppingCart, "item_recipe_ancient_janggo" );

	elseif ( upgradeItemName == "item_orchid" ) then

		table.insert( shoppingCart, "item_recipe_orchid" );

	elseif ( upgradeItemName == "item_manta" ) then

		table.insert( shoppingCart, "item_ultimate_orb" );
		table.insert( shoppingCart, "item_recipe_manta" );

	elseif ( upgradeItemName == "item_greater_crit" ) then

		table.insert( shoppingCart, "item_demon_edge" );
		table.insert( shoppingCart, "item_recipe_greater_crit" );

	elseif ( upgradeItemName == "item_heavens_halberd" ) then

		table.insert( shoppingCart, "item_talisman_of_evasion" );

	elseif ( upgradeItemName == "item_hand_of_midas" ) then

		table.insert( shoppingCart, "item_gloves" );
		table.insert( shoppingCart, "item_recipe_hand_of_midas" );

	elseif ( upgradeItemName == "item_mekansm" ) then

		table.insert( shoppingCart, "item_recipe_mekansm" );

	elseif ( upgradeItemName == "item_ultimate_scepter" ) then

		table.insert( shoppingCart, "item_ogre_axe" );
		table.insert( shoppingCart, "item_staff_of_wizardry" );
		table.insert( shoppingCart, "item_blade_of_alacrity" );
		table.insert( shoppingCart, "item_point_booster" );

	elseif ( upgradeItemName == "item_sphere" ) then

		table.insert( shoppingCart, "item_ultimate_orb" );
		table.insert( shoppingCart, "item_recipe_sphere" );

	elseif ( upgradeItemName == "item_butterfly" ) then

		table.insert( shoppingCart, "item_quarterstaff" );
		table.insert( shoppingCart, "item_talisman_of_evasion" );
		table.insert( shoppingCart, "item_eagle" );

	elseif ( upgradeItemName == "item_sange_and_yasha" ) then

	elseif ( upgradeItemName == "item_travel_boots_1" ) then

		table.insert( shoppingCart, "item_boots" );
		table.insert( shoppingCart, "item_recipe_travel_boots" );

	elseif ( upgradeItemName == "item_travel_boots_2" ) then

		table.insert( shoppingCart, "item_recipe_travel_boots" );

	elseif ( upgradeItemName == "item_vladmir" ) then

		table.insert( shoppingCart, "item_lifesteal" );

	elseif ( upgradeItemName == "item_refresher" ) then

		table.insert( shoppingCart, "item_recipe_refresher" );

	elseif ( upgradeItemName == "item_hurricane_pike" ) then

		table.insert( shoppingCart, "item_recipe_hurricane_pike" );

	elseif ( upgradeItemName == "item_rapier" ) then

		table.insert( shoppingCart, "item_demon_edge" );
		table.insert( shoppingCart, "item_relic" );

	elseif ( upgradeItemName == "item_skadi" ) then

		table.insert( shoppingCart, "item_orb_of_venom" );
		table.insert( shoppingCart, "item_point_booster" );
		table.insert( shoppingCart, "item_ultimate_orb" );
		table.insert( shoppingCart, "item_ultimate_orb" );

	elseif ( upgradeItemName == "item_moon_shard" ) then

		table.insert( shoppingCart, "item_hyperstone" );
		table.insert( shoppingCart, "item_hyperstone" );

	elseif ( upgradeItemName == "item_pipe" ) then

		table.insert( shoppingCart, "item_recipe_pipe" );

	elseif ( upgradeItemName == "item_sheepstick" ) then

		table.insert( shoppingCart, "item_void_stone" );
		table.insert( shoppingCart, "item_ultimate_orb" );
		table.insert( shoppingCart, "item_mystic_staff" );

	elseif ( upgradeItemName == "item_assault" ) then

		table.insert( shoppingCart, "item_chainmail" );
		table.insert( shoppingCart, "item_platemail" );
		table.insert( shoppingCart, "item_hyperstone" );
		table.insert( shoppingCart, "item_recipe_assault" );

	elseif ( upgradeItemName == "item_abyssal_blade" ) then

		table.insert( shoppingCart, "item_recipe_abyssal_blade" );

	elseif ( upgradeItemName == "item_mjollnir" ) then

		table.insert( shoppingCart, "item_hyperstone" );
		table.insert( shoppingCart, "item_recipe_mjollnir" );

	elseif ( upgradeItemName == "item_guardian_greaves" ) then

		table.insert( shoppingCart, "item_recipe_guardian_greaves" );

	elseif ( upgradeItemName == "item_octarine_core" ) then

		table.insert( shoppingCart, "item_mystic_staff" );

	elseif ( upgradeItemName == "item_heart" ) then

		table.insert( shoppingCart, "item_vitality_booster" );
		table.insert( shoppingCart, "item_reaver" );
		table.insert( shoppingCart, "item_recipe_heart" );

	elseif ( upgradeItemName == "item_bloodthorn" ) then

		table.insert( shoppingCart, "item_recipe_bloodthorn" );

	elseif ( upgradeItemName == "item_satanic" ) then

		table.insert( shoppingCart, "item_lifesteal" );
		table.insert( shoppingCart, "item_mithril_hammer" );
		table.insert( shoppingCart, "item_reaver" );

	end

end

----------------------------------------------------------------------------------------------------

function ItemPurchase()

	local npcBot = GetBot();

	WeNeedTpscroll();
	
	-- use item_tome_of_knowledge
	TomeOfKnowledge();

	-- courier, ward, smoke of deceit, dust, gem of true sight and so on
	AuxiliaryItem();

	if ( #npcBot.tableItemsToBuy == 0 ) then
		npcBot:SetNextItemPurchaseValue( 0 );
		return;
	end

	local sNextItem = npcBot.tableItemsToBuy[1];
	npcBot:SetNextItemPurchaseValue( GetItemCost( sNextItem ) );

	if ( npcBot:GetGold() >= GetItemCost( sNextItem ) ) then

		if ( IsItemPurchasedFromSecretShop( sNextItem ) and IsItemPurchasedFromSideShop( sNextItem ) ) then
			if ( npcBot:DistanceFromSecretShop() == 0 or npcBot:DistanceFromSideShop() == 0 ) then
				if ( npcBot:ActionImmediate_PurchaseItem( sNextItem ) == PURCHASE_ITEM_SUCCESS ) then
					table.remove( npcBot.tableItemsToBuy, 1 );
					npcBot.secretShopMode = false;
					npcBot.sideShopMode = false;
				end
			elseif ( npcBot:DistanceFromSecretShop() <= npcBot:DistanceFromSideShop() ) then
				if ( not npcBot.secretShopMode and IsSuitablePurchaseActiveMode() ) then
					npcBot.secretShopMode = true;
					npcBot.sideShopMode = false;
				end
			elseif ( npcBot:DistanceFromSecretShop() > npcBot:DistanceFromSideShop() ) then
				if ( not npcBot.sideShopMode and IsSuitablePurchaseActiveMode() ) then
					npcBot.secretShopMode = false;
					npcBot.sideShopMode = true;
				end
			end
		elseif ( IsItemPurchasedFromSecretShop( sNextItem ) and not IsItemPurchasedFromSideShop( sNextItem ) ) then
			if ( npcBot:DistanceFromSecretShop() == 0 ) then
				if ( npcBot:ActionImmediate_PurchaseItem( sNextItem ) == PURCHASE_ITEM_SUCCESS ) then
					table.remove( npcBot.tableItemsToBuy, 1 );
					npcBot.secretShopMode = false;
					npcBot.sideShopMode = false;
				end
			else
				if ( not npcBot.secretShopMode and IsSuitablePurchaseActiveMode() ) then
					npcBot.secretShopMode = true;
					npcBot.sideShopMode = false;
				end
			end
		elseif ( not IsItemPurchasedFromSecretShop( sNextItem ) and IsItemPurchasedFromSideShop( sNextItem ) ) then
			if ( npcBot:DistanceFromSideShop() == 0 ) then
				if ( npcBot:ActionImmediate_PurchaseItem( sNextItem ) == PURCHASE_ITEM_SUCCESS ) then
					table.remove( npcBot.tableItemsToBuy, 1 );
					npcBot.secretShopMode = false;
					npcBot.sideShopMode = false;
				end
			elseif ( npcBot:DistanceFromSideShop() < 2500 ) then
				if ( not npcBot.sideShopMode and IsSuitablePurchaseActiveMode() ) then
					npcBot.secretShopMode = false;
					npcBot.sideShopMode = true;
				end
			else
				if ( npcBot:ActionImmediate_PurchaseItem( sNextItem ) == PURCHASE_ITEM_SUCCESS ) then
					table.remove( npcBot.tableItemsToBuy, 1 );
					npcBot.secretShopMode = false;
					npcBot.sideShopMode = false;
				end
			end
		else
			if ( npcBot:ActionImmediate_PurchaseItem( sNextItem ) == PURCHASE_ITEM_SUCCESS ) then
				table.remove( npcBot.tableItemsToBuy, 1 );
				npcBot.secretShopMode = false;
				npcBot.sideShopMode = false;
			end
		end

	end

end

----------------------------------------------------------------------------------------------------

function TomeOfKnowledge()

	local npcBot = GetBot();

	if ( not npcBot:IsAlive() or npcBot:IsUsingAbility() ) then
		return;
	end

	local item_knowledge = J.GetItemAvailable( "item_tome_of_knowledge" );

	if ( npcBot:DistanceFromFountain() == 0 ) then
		if ( (J.HasEmptySlotsInInventory() or item_knowledge ~= nil)
			and GetItemStockCount("item_tome_of_knowledge") > 0 
			and npcBot:GetGold() >= GetItemCost("item_tome_of_knowledge") ) then

			npcBot:ActionImmediate_PurchaseItem( "item_tome_of_knowledge" );
		end
	end

	if ( item_knowledge ~= nil ) then
		npcBot:Action_UseAbility( item_knowledge );
	end

end

function WeNeedTpscroll()

	local npcBot = GetBot();

	-- Count current number of TP scrolls
	local iScrollCount = 0;

	if ( J.HasItem("item_tpscroll") ) then
		iScrollCount = 1;
	end

	-- If we are at the sideshop or fountain with no TPs, then buy one or two
	if ( iScrollCount == 0 and npcBot:DistanceFromFountain() == 0 and DotaTime() > 0) then
		npcBot:ActionImmediate_PurchaseItem( "item_tpscroll" );	
	end

end
----------------------------------------------------------------------------------------------------

-- courier, ward, smoke of deceit, dust, gem of true sight and so on
function AuxiliaryItem()

	local npcBot = GetBot();
	npcBot.buyCourier = nil;

	local couriersNum = GetNumCouriers();
	if ( couriersNum > 0 ) then
		for i = 0, couriersNum - 1, 1 do
			local courier = GetCourier(i);
			if ( courier:GetUnitName() == "npc_dota_courier" ) then
				npcBot.buyCourier = courier;
				break;
			end
		end

		for i = 0, couriersNum - 1, 1 do
			local courier = GetCourier(i);
			if ( courier:GetUnitName() == "npc_dota_flying_courier" ) then
				npcBot.buyCourier = courier;
				break;
			end
		end
	end

	local myTeam = GetTeam();
	local enemyTeam = nil;
	local id_team = GetTeamPlayers( myTeam );
	local hero_roles = DB["hero_roles"];

	local mostSuitableSupportName = "";
	local secondSuitableSupportName = "";
	local highestSupportLevel = -1;
	local secondSupportLevel = -1;

	-- make sure the top two support
	for _, id in pairs(id_team) do
		if ( IsPlayerBot(id) ) then
			local heroName = GetSelectedHeroName(id);

			if ( heroName ~= nil and heroName ~= "" and hero_roles[heroName] ~= nil ) then
				local supportLevel = hero_roles[heroName]["support"];

				if ( supportLevel == nil ) then
					supportLevel = 0;
				end

				if ( supportLevel > highestSupportLevel ) then
					secondSuitableSupportName = mostSuitableSupportName;
					secondSupportLevel = highestSupportLevel;

					mostSuitableSupportName = heroName;
					highestSupportLevel = supportLevel;
				elseif ( supportLevel > secondSupportLevel ) then
					secondSuitableSupportName = heroName;
					secondSupportLevel = supportLevel;
				end
			end
		end
	end

	-- avoid only one bot
	if ( secondSuitableSupportName == "" ) then
		secondSuitableSupportName = mostSuitableSupportName;
		secondSupportLevel = highestSupportLevel;
	end

	if ( myTeam == TEAM_RADIANT ) then
		enemyTeam = TEAM_DIRE;
	elseif ( myTeam == TEAM_DIRE ) then
		enemyTeam = TEAM_RADIANT;
	end

	-- decide if there were several invisible enemy heroes.
	local hasInvisibleEnemy = false;
	if ( enemyTeam ~= nil ) then
		for _, id in pairs( GetTeamPlayers(enemyTeam) ) do
			for _, invisibleHeroName in pairs(invisibleHeroes) do
				if ( GetSelectedHeroName(id) == invisibleHeroName ) then
					hasInvisibleEnemy = true;
				end
			end
		end
	end

	---------------------------------------------------------

	-- collect our ally players.
	local id_team = GetTeamPlayers( GetTeam() );
	local allyHeroes = {};

	for _, id in pairs(id_team) do
		table.insert( allyHeroes, GetTeamMember(id) );
	end

	---------------------------------------------------------

	local minute = math.floor(DotaTime() / 60);

	-- share my tango with our friends for .^_^.
	-- if DotaTime < 0, the target will change to the mid-player for the future planning.
	local my_item_tango = J.GetItemInInventory( "item_tango" );
	local ally_item_tango = nil;
	local ally_item_tango_single = nil;
	if ( npcBot:GetUnitName() == mostSuitableSupportName or npcBot:GetUnitName() == secondSuitableSupportName ) then
		for _, ally in pairs(allyHeroes) do
			if ( (DotaTime() > -80 and DotaTime() < -60)
				or (DotaTime() >= 0 and my_item_tango ~= nil and my_item_tango:GetCurrentCharges() > 2 
				and GetUnitToUnitDistance(npcBot, ally) < 400) ) then
				ally_item_tango = J.GetNpcItemIncludeBackpack( ally, "item_tango" );
				ally_item_tango_single = J.GetNpcItemIncludeBackpack( ally, "item_tango_single" );

				if ( ally_item_tango == nil and ally_item_tango_single == nil ) then
					if ( not npcBot:IsUsingAbility() ) then
						npcBot:Action_UseAbilityOnEntity( my_item_tango, ally );
					end
				end
			end
		end
	end

	-- starting items supported
	if ( DotaTime() < 0 and npcBot:GetUnitName() == mostSuitableSupportName ) then
		if ( npcBot.buyCourier == nil and npcBot:GetGold() >= GetItemCost("item_courier") ) then
			npcBot:ActionImmediate_PurchaseItem( "item_courier" );
		end
	elseif ( DotaTime() < 0 and npcBot:GetUnitName() == secondSuitableSupportName ) then
		if ( GetItemStockCount("item_ward_observer") > 0 and npcBot:GetGold() >= GetItemCost("item_ward_observer") * 2 ) then
			npcBot:ActionImmediate_PurchaseItem( "item_ward_observer" );
			npcBot:ActionImmediate_PurchaseItem( "item_ward_observer" );
		end
	elseif ( minute % 2 == 0 and npcBot:GetUnitName() == mostSuitableSupportName ) then
		local my_ward_observer_count = J.GetWardObserverCountIncludeStash();

		if ( my_ward_observer_count < 3 and GetItemStockCount("item_ward_observer") > 0 
			and npcBot:GetGold() >= GetItemCost("item_ward_observer") ) then
			npcBot:ActionImmediate_PurchaseItem( "item_ward_observer" );
		end
	elseif ( minute >= 5 and minute < 15 and npcBot:GetUnitName() == secondSuitableSupportName ) then
		if ( npcBot.buyCourier:IsAlive() and npcBot.buyCourier:GetUnitName() == "npc_dota_courier"
			and npcBot.buyCourier:DistanceFromFountain() == 0
			and npcBot:DistanceFromFountain() > 2000
			and npcBot:GetGold() >= GetItemCost("item_flying_courier") ) then

			npcBot:ActionImmediate_PurchaseItem( "item_flying_courier" );
		end

		--[[
		-- second planning
		local couriersNum = GetNumCouriers();
		if ( couriersNum > 0 ) then
			for i = 0, couriersNum - 1, 1 do
				local courier = GetCourier(i);

				if ( courier:IsAlive() and courier:GetUnitName() == "npc_dota_courier"
					and GetCourierState(courier) == COURIER_STATE_AT_BASE
					and npcBot:DistanceFromFountain() > 2000
					and npcBot:GetGold() >= GetItemCost("item_flying_courier") ) then
					
					npcBot:ActionImmediate_PurchaseItem( "item_flying_courier" );
				end
			end
		end
		]]
	elseif ( minute >= 10 and hasInvisibleEnemy ) then
		if ( npcBot:GetUnitName() == mostSuitableSupportName or npcBot:GetUnitName() == secondSuitableSupportName ) then
			local item_dust = J.GetItemIncludeBackpack( "item_dust" );

			if ( item_dust == nil and GetItemStockCount("item_dust") > 0 
				and npcBot:GetGold() >= GetItemCost("item_dust") ) then
				npcBot:ActionImmediate_PurchaseItem( "item_dust" );
			end
		end
	end

end


-- cant go to secretShop or sideShop in the following active mode
function IsSuitablePurchaseActiveMode()

	local npcBot = GetBot();

	if ( npcBot:GetActiveMode() == BOT_MODE_RETREAT
		or npcBot:GetActiveMode() == BOT_MODE_ATTACK
		or npcBot:GetActiveMode() == BOT_MODE_DEFEND_ALLY
		or npcBot:GetActiveMode() == BOT_MODE_ROSHAN
		or npcBot:GetActiveMode() == BOT_MODE_PUSH_TOWER_TOP
		or npcBot:GetActiveMode() == BOT_MODE_PUSH_TOWER_MID
		or npcBot:GetActiveMode() == BOT_MODE_PUSH_TOWER_BOT 
		or npcBot:GetActiveMode() == BOT_MODE_DEFEND_TOWER_TOP
		or npcBot:GetActiveMode() == BOT_MODE_DEFEND_TOWER_MID
		or npcBot:GetActiveMode() == BOT_MODE_DEFEND_TOWER_BOT ) then
		return false;
	end

	return true;

end

----------------------------------------------------------------------------------------------------

for k,v in pairs( purchase ) do	_G._savedEnv[k] = v end

----------------------------------------------------------------------------------------------------