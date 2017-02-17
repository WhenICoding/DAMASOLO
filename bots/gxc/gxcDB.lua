-- generic database
----------------------------------------------------------------------------------------------------

local X = {}

----------------------------------------------------------------------------------------------------

-- ["carry"] will become more useful later in the game if they gain a significant gold advantage.
-- ["durable"] has the ability to last longer in teamfights.
-- ["support"] can focus less on amassing gold and items, and more on using their abilities to gain an advantage for the team.
-- ["escape"] has the ability to quickly avoid death.
-- ["nuker"] can quickly kill enemy heroes using high damage spells with low cooldowns.
-- ["pusher"] can quickly siege and destroy towers and barracks at all points of the game.
-- ["disabler"] has a guaranteed disable for one or more of their spells.
-- ["initiator"] good at starting a teamfight.
-- ["jungler"] can farm effectively from neutral creeps inside the jungle early in the game.

X["hero_roles"] = {
	["npc_dota_hero_abaddon"] = {
		["carry"] = 1,
		["durable"] = 2,
		["support"] = 2

	},

	["npc_dota_hero_alchemist"] = {
		["carry"] = 2,
		["durable"] = 2,
		["support"] = 1,
		["nuker"] = 1,
		["disabler"] = 1,
		["initiator"] = 1
	},

	["npc_dota_hero_axe"] = {
		["durable"] = 3,
		["disabler"] = 2,
		["initiator"] = 3,
		["jungler"] = 2
	},

	["npc_dota_hero_beastmaster"] = {
		["durable"] = 2,
		["nuker"] = 1,
		["disabler"] = 2,
		["initiator"] = 2
	},

	["npc_dota_hero_brewmaster"] = {
		["carry"] = 1,
		["durable"] = 2,
		["nuker"] = 1,
		["disabler"] = 2,
		["initiator"] = 3
	},

	["npc_dota_hero_bristleback"] = {
		["carry"] = 2,
		["durable"] = 3,
		["nuker"] = 1,
		["initiator"] = 1
	},

	["npc_dota_hero_centaur"] = {
		["durable"] = 3,
		["escape"] = 1,
		["nuker"] = 1,
		["disabler"] = 1,
		["initiator"] = 3
	},

	["npc_dota_hero_chaos_knight"] = {
		["carry"] = 3,
		["durable"] = 2,
		["pusher"] = 2,
		["disabler"] = 2,
		["initiator"] = 1
	},

	["npc_dota_hero_rattletrap"] = {
		["durable"] = 1,
		["nuker"] = 1,
		["disabler"] = 2,
		["initiator"] = 3
	},

	["npc_dota_hero_doom_bringer"] = {
		["carry"] = 1,
		["durable"] = 2,
		["nuker"] = 1,
		["disabler"] = 2,
		["initiator"] = 2
	},

	["npc_dota_hero_dragon_knight"] = {
		["carry"] = 2,
		["durable"] = 2,
		["nuker"] = 1,
		["pusher"] = 3,
		["disabler"] = 2,
		["initiator"] = 1
	},

	["npc_dota_hero_earth_spirit"] = {
		["durable"] = 1,
		["escape"] = 2,
		["nuker"] = 2,
		["disabler"] = 1,
		["initiator"] = 1
	},

	["npc_dota_hero_earthshaker"] = {
		["support"] = 1,
		["nuker"] = 1,
		["disabler"] = 2,
		["initiator"] = 3
	},

	["npc_dota_hero_elder_titan"] = {
		["durable"] = 1,
		["nuker"] = 1,
		["disabler"] = 1,
		["initiator"] = 2
	},

	["npc_dota_hero_huskar"] = {
		["carry"] = 2,
		["durable"] = 2,
		["initiator"] = 1
	},

	["npc_dota_hero_wisp"] = {
		["support"] = 3,
		["escape"] = 2,
		["nuker"] = 1
	},

	["npc_dota_hero_kunkka"] = {
		["carry"] = 1,
		["durable"] = 1,
		["nuker"] = 1,
		["disabler"] = 1,
		["initiator"] = 1
	},

	["npc_dota_hero_legion_commander"] = {
		["carry"] = 1,
		["durable"] = 1,
		["nuker"] = 1,
		["disabler"] = 2,
		["initiator"] = 1
	},

	["npc_dota_hero_life_stealer"] = {
		["carry"] = 2,
		["durable"] = 2,
		["escape"] = 1,
		["disabler"] = 1,
		["jungler"] = 1
	},

	["npc_dota_hero_lycan"] = {
		["carry"] = 2,
		["durable"] = 1,
		["escape"] = 1,
		["pusher"] = 3,
		["jungler"] = 1
	},

	["npc_dota_hero_magnataur"] = {
		["escape"] = 1,
		["nuker"] = 1,
		["disabler"] = 2,
		["initiator"] = 3
	},

	["npc_dota_hero_night_stalker"] = {
		["carry"] = 1,
		["durable"] = 2,
		["nuker"] = 1,
		["disabler"] = 2,
		["initiator"] = 2
	},

	["npc_dota_hero_omniknight"] = {
		["durable"] = 1,
		["support"] = 2,
		["nuker"] = 1
	},

	["npc_dota_hero_phoenix"] = {
		["support"] = 1,
		["escape"] = 2,
		["nuker"] = 3,
		["disabler"] = 1,
		["initiator"] = 2
	},

	["npc_dota_hero_pudge"] = {
		["durable"] = 2,
		["nuker"] = 1,
		["disabler"] = 2,
		["initiator"] = 2
	},

	["npc_dota_hero_sand_king"] = {
		["escape"] = 2,
		["nuker"] = 2,
		["disabler"] = 2,
		["initiator"] = 3,
		["jungler"] = 1
	},

	["npc_dota_hero_slardar"] = {
		["carry"] = 2,
		["durable"] = 2,
		["escape"] = 1,
		["disabler"] = 1,
		["initiator"] = 2
	},

	["npc_dota_hero_spirit_breaker"] = {
		["carry"] = 1,
		["durable"] = 2,
		["escape"] = 1,
		["disabler"] = 2,
		["initiator"] = 2
	},

	["npc_dota_hero_sven"] = {
		["carry"] = 2,
		["durable"] = 2,
		["nuker"] = 1,
		["disabler"] = 2,
		["initiator"] = 2
	},

	["npc_dota_hero_tidehunter"] = {
		["durable"] = 3,
		["nuker"] = 1,
		["disabler"] = 2,
		["initiator"] = 3
	},

	["npc_dota_hero_shredder"] = {
		["durable"] = 2,
		["escape"] = 2,
		["nuker"] = 2
	},

	["npc_dota_hero_tiny"] = {
		["carry"] = 3,
		["durable"] = 2,
		["nuker"] = 2,
		["pusher"] = 2,
		["disabler"] = 1,
		["initiator"] = 2
	},

	["npc_dota_hero_treant"] = {
		["durable"] = 1,
		["support"] = 3,
		["escape"] = 1,
		["disabler"] = 1,
		["initiator"] = 2
	},

	["npc_dota_hero_tusk"] = {
		["nuker"] = 1,
		["disabler"] = 2,
		["initiator"] = 2
	},

	["npc_dota_hero_abyssal_underlord"] = {
		["durable"] = 1,
		["support"] = 1,
		["escape"] = 2,
		["nuker"] = 1,
		["disabler"] = 1
	},

	["npc_dota_hero_undying"] = {
		["durable"] = 2,
		["support"] = 1,
		["nuker"] = 1,
		["disabler"] = 1
	},

	["npc_dota_hero_skeleton_king"] = {
		["carry"] = 2,
		["durable"] = 3,
		["support"] = 1,
		["disabler"] = 2,
		["initiator"] = 1
	},

	["npc_dota_hero_antimage"] = {
		["carry"] = 3,
		["escape"] = 3,
		["nuker"] = 1
	},

	["npc_dota_hero_arc_warden"] = {
		["carry"] = 3,
		["escape"] = 3,
		["nuker"] = 1
	},

	["npc_dota_hero_bloodseeker"] = {
		["carry"] = 1,
		["nuker"] = 1,
		["disabler"] = 1,
		["initiator"] = 1,
		["jungler"] = 1
	},

	["npc_dota_hero_bounty_hunter"] = {
		["escape"] = 2,
		["nuker"] = 1
	},

	["npc_dota_hero_broodmother"] = {
		["carry"] = 1,
		["escape"] = 3,
		["nuker"] = 1,
		["pusher"] = 3
	},

	["npc_dota_hero_clinkz"] = {
		["carry"] = 2,
		["escape"] = 3,
		["pusher"] = 1
	},

	["npc_dota_hero_drow_ranger"] = {
		["carry"] = 2,
		["pusher"] = 1,
		["disabler"] = 1
	},

	["npc_dota_hero_ember_spirit"] = {
		["carry"] = 2,
		["escape"] = 3,
		["nuker"] = 1,
		["disabler"] = 1,
		["initiator"] = 1
	},

	["npc_dota_hero_faceless_void"] = {
		["carry"] = 2,
		["durable"] = 1,
		["escape"] = 1,
		["disabler"] = 2,
		["initiator"] = 3
	},

	["npc_dota_hero_gyrocopter"] = {
		["carry"] = 3,
		["nuker"] = 1,
		["disabler"] = 1
	},

	["npc_dota_hero_juggernaut"] = {
		["carry"] = 2,
		["escape"] = 1,
		["pusher"] = 1
	},

	["npc_dota_hero_lone_druid"] = {
		["carry"] = 2,
		["durable"] = 1,
		["pusher"] = 3,
		["jungler"] = 1
	},

	["npc_dota_hero_luna"] = {
		["carry"] = 2,
		["nuker"] = 2,
		["pusher"] = 1
	},

	["npc_dota_hero_medusa"] = {
		["carry"] = 3,
		["durable"] = 1,
		["disabler"] = 1
	},

	["npc_dota_hero_meepo"] = {
		["carry"] = 2,
		["escape"] = 2,
		["nuker"] = 2,
		["pusher"] = 1,
		["disabler"] = 1,
		["initiator"] = 1
	},

	["npc_dota_hero_mirana"] = {
		["carry"] = 1,
		["support"] = 1,
		["escape"] = 2,
		["nuker"] = 1,
		["disabler"] = 1
	},

	["npc_dota_hero_monkey_king"] = {
		["carry"] = 2,
		["escape"] = 2,
		["disabler"] = 1,
		["initiator"] = 1
	},

	["npc_dota_hero_morphling"] = {
		["carry"] = 3,
		["durable"] = 2,
		["escape"] = 3,
		["nuker"] = 1,
		["disabler"] = 1
	},

	["npc_dota_hero_naga_siren"] = {
		["carry"] = 3,
		["support"] = 1,
		["escape"] = 1,
		["pusher"] = 2,
		["disabler"] = 2,
		["initiator"] = 1
	},

	["npc_dota_hero_nyx_assassin"] = {
		["escape"] = 1,
		["nuker"] = 2,
		["disabler"] = 2,
		["initiator"] = 2
	},

	["npc_dota_hero_phantom_assassin"] = {
		["carry"] = 3,
		["escape"] = 1
	},

	["npc_dota_hero_phantom_lancer"] = {
		["carry"] = 2,
		["escape"] = 2,
		["nuker"] = 1,
		["pusher"] = 1
	},

	["npc_dota_hero_razor"] = {
		["carry"] = 2,
		["durable"] = 2,
		["nuker"] = 1,
		["pusher"] = 1
	},

	["npc_dota_hero_riki"] = {
		["carry"] = 2,
		["escape"] = 2,
		["disabler"] = 1
	},

	["npc_dota_hero_nevermore"] = {
		["carry"] = 2,
		["nuker"] = 3
	},

	["npc_dota_hero_slark"] = {
		["carry"] = 2,
		["escape"] = 3,
		["nuker"] = 1,
		["disabler"] = 1
	},

	["npc_dota_hero_sniper"] = {
		["carry"] = 3,
		["nuker"] = 1
	},

	["npc_dota_hero_spectre"] = {
		["carry"] = 3,
		["durable"] = 1,
		["escape"] = 1
	},

	["npc_dota_hero_templar_assassin"] = {
		["carry"] = 2,
		["escape"] = 1
	},

	["npc_dota_hero_terrorblade"] = {
		["carry"] = 3,
		["nuker"] = 1,
		["pusher"] = 2
	},

	["npc_dota_hero_troll_warlord"] = {
		["carry"] = 3,
		["durable"] = 1,
		["pusher"] = 2,
		["disabler"] = 1
	},

	["npc_dota_hero_ursa"] = {
		["carry"] = 2,
		["durable"] = 1,
		["disabler"] = 1,
		["jungler"] = 1
	},

	["npc_dota_hero_vengefulspirit"] = {
		["carry"] = 1,
		["support"] = 3,
		["escape"] = 1,
		["nuker"] = 1,
		["pusher"] = 1,
		["disabler"] = 1,
		["initiator"] = 2
	},

	["npc_dota_hero_venomancer"] = {
		["carry"] = 1,
		["support"] = 2,
		["nuker"] = 1,
		["pusher"] = 1,
		["disabler"] = 1,
		["initiator"] = 1
	},

	["npc_dota_hero_viper"] = {
		["carry"] = 1,
		["durable"] = 2,
		["disabler"] = 1,
		["initiator"] = 1
	},

	["npc_dota_hero_weaver"] = {
		["carry"] = 2,
		["escape"] = 3
	},

	["npc_dota_hero_ancient_apparition"] = {
		["support"] = 2,
		["nuker"] = 1,
		["disabler"] = 1
	},

	["npc_dota_hero_bane"] = {
		["durable"] = 1,
		["support"] = 2,
		["nuker"] = 1,
		["disabler"] = 3
	},

	["npc_dota_hero_batrider"] = {
		["escape"] = 1,
		["disabler"] = 2,
		["initiator"] = 3,
		["jungler"] = 2
	},

	["npc_dota_hero_chen"] = {
		["support"] = 2,
		["pusher"] = 2,
		["jungler"] = 3
	},

	["npc_dota_hero_crystal_maiden"] = {
		["support"] = 3,
		["nuker"] = 2,
		["disabler"] = 2,
		["jungler"] = 1
	},

	["npc_dota_hero_dark_seer"] = {
		["escape"] = 1,
		["disabler"] = 1,
		["initiator"] = 1,
		["jungler"] = 1
	},

	["npc_dota_hero_dazzle"] = {
		["support"] = 3,
		["nuker"] = 1,
		["disabler"] = 1
	},

	["npc_dota_hero_death_prophet"] = {
		["carry"] = 1,
		["nuker"] = 1,
		["pusher"] = 3,
		["disabler"] = 1
	},

	["npc_dota_hero_disruptor"] = {
		["support"] = 2,
		["nuker"] = 1,
		["disabler"] = 2,
		["initiator"] = 1
	},

	["npc_dota_hero_enchantress"] = {
		["support"] = 2,
		["durable"] = 1,
		["support"] = 2,
		["pusher"] = 2,
		["disabler"] = 1,
		["jungler"] = 3
	},

	["npc_dota_hero_enigma"] = {
		["pusher"] = 2,
		["disabler"] = 2,
		["initiator"] = 2,
		["jungler"] = 3
	},

	["npc_dota_hero_invoker"] = {
		["carry"] = 1,
		["escape"] = 1,
		["nuker"] = 3,
		["pusher"] = 1,
		["disabler"] = 2
	},

	["npc_dota_hero_jakiro"] = {
		["support"] = 1,
		["nuker"] = 2,
		["pusher"] = 2,
		["disabler"] = 1
	},

	["npc_dota_hero_keeper_of_the_light"] = {
		["support"] = 3,
		["nuker"] = 2,
		["disabler"] = 1,
		["jungler"] = 1
	},

	["npc_dota_hero_leshrac"] = {
		["carry"] = 1,
		["support"] = 1,
		["nuker"] = 3,
		["pusher"] = 3,
		["disabler"] = 1
	},

	["npc_dota_hero_lich"] = {
		["support"] = 3,
		["nuker"] = 2
	},

	["npc_dota_hero_lina"] = {
		["carry"] = 1,
		["support"] = 1,
		["nuker"] = 3,
		["disabler"] = 1
	},

	["npc_dota_hero_lion"] = {
		["support"] = 2,
		["nuker"] = 3,
		["disabler"] = 3,
		["initiator"] = 2
	},

	["npc_dota_hero_furion"] = {
		["carry"] = 1,
		["escape"] = 1,
		["nuker"] = 1,
		["pusher"] = 3,
		["jungler"] = 3
	},

	["npc_dota_hero_necrolyte"] = {
		["carry"] = 1,
		["durable"] = 1,
		["nuker"] = 2,
		["disabler"] = 1
	},

	["npc_dota_hero_ogre_magi"] = {
		["durable"] = 1,
		["support"] = 2,
		["nuker"] = 2,
		["disabler"] = 2,
		["initiator"] = 1
	},

	["npc_dota_hero_oracle"] = {
		["support"] = 3,
		["escape"] = 1,
		["nuker"] = 3,
		["disabler"] = 2,
	},

	["npc_dota_hero_obsidian_destroyer"] = {
		["carry"] = 2,
		["nuker"] = 2,
		["disabler"] = 1
	},

	["npc_dota_hero_puck"] = {
		["escape"] = 3,
		["nuker"] = 2,
		["disabler"] = 3,
		["initiator"] = 3
	},

	["npc_dota_hero_pugna"] = {
		["nuker"] = 2,
		["pusher"] = 2
	},

	["npc_dota_hero_queenofpain"] = {
		["carry"] = 1,
		["escape"] = 3,
		["nuker"] = 3
	},

	["npc_dota_hero_rubick"] = {
		["support"] = 2,
		["nuker"] = 1,
		["disabler"] = 1
	},

	["npc_dota_hero_shadow_demon"] = {
		["support"] = 2,
		["nuker"] = 1,
		["disabler"] = 2,
		["initiator"] = 1
	},

	["npc_dota_hero_shadow_shaman"] = {
		["support"] = 2,
		["nuker"] = 2,
		["pusher"] = 3,
		["disabler"] = 3,
		["initiator"] = 1
	},

	["npc_dota_hero_silencer"] = {
		["carry"] = 1,
		["support"] = 1,
		["nuker"] = 1,
		["disabler"] = 2,
		["initiator"] = 2
	},

	["npc_dota_hero_skywrath_mage"] = {
		["support"] = 2,
		["nuker"] = 3,
		["disabler"] = 1
	},

	["npc_dota_hero_storm_spirit"] = {
		["carry"] = 2,
		["escape"] = 3,
		["nuker"] = 2,
		["disabler"] = 1,
		["initiator"] = 1
	},

	["npc_dota_hero_techies"] = {
		["nuker"] = 3,
		["disabler"] = 1
	},

	["npc_dota_hero_tinker"] = {
		["carry"] = 1,
		["nuker"] = 3,
		["pusher"] = 2
	},

	["npc_dota_hero_visage"] = {
		["durable"] = 1,
		["support"] = 1,
		["nuker"] = 2,
		["pusher"] = 1,
		["disabler"] = 1
	},

	["npc_dota_hero_warlock"] = {
		["support"] = 1,
		["disabler"] = 1,
		["initiator"] = 2
	},

	["npc_dota_hero_windrunner"] = {
		["carry"] = 1,
		["support"] = 1,
		["escape"] = 1,
		["nuker"] = 1,
		["disabler"] = 1
	},

	["npc_dota_hero_winter_wyvern"] = {
		["support"] = 3,
		["nuker"] = 1,
		["disabler"] = 2
	},

	["npc_dota_hero_witch_doctor"] = {
		["support"] = 3,
		["nuker"] = 2,
		["disabler"] = 1
	},

	["npc_dota_hero_zuus"] = {
		["nuker"] = 3
	}
}

----------------------------------------------------------------------------------------------------

return X

----------------------------------------------------------------------------------------------------