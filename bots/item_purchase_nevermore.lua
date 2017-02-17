require( GetScriptDirectory().."/item_purchase_generic" )

----------------------------------------------------------------------------------------------------

local tableItemsToBuy = { 
	"item_flask",
	"item_tango",
	"item_branches",
	"item_branches",
	"item_circlet",

	"item_slippers",
	"item_recipe_wraith_band",
--天鹰戒先不出	
--	"item_sobi_mask",
--	"item_ring_of_protection",
	
	"item_magic_stick",
	"item_circlet",
	"item_boots",

	"item_gloves",
	"item_boots_of_elves",

	"item_robe",
	"item_chainmail",
	"item_broadsword",
----------------------------------------------
	"item_ogre_axe",
	"item_mithril_hammer",
	"item_recipe_black_king_bar",

	"item_blight_stone",
	"item_mithril_hammer",
	"item_mithril_hammer",

	"item_broadsword",
	"item_blades_of_attack",
	"item_recipe_lesser_crit",

	"item_demon_edge",
	"item_recipe_greater_crit",

	"item_ultimate_orb",
	"item_recipe_manta",

	"item_quarterstaff",
	"item_talisman_of_evasion",
	"item_eagle"
};

----------------------------------------------------------------------------------------------------

npcBot = GetBot();

----------------------------------------------------------------------------------------------------

function ItemPurchaseThink()
	--------------------------------------------------------------------------

	npcBot.tableItemsToBuy = tableItemsToBuy;
	purchase.ItemPurchase();

end

----------------------------------------------------------------------------------------------------