crazed_geonosian_sentry = Creature:new {
	objectName = "@mob/creature_names:geonosian_crazed_guard",
	 customName = "a crazed Geonosian Sentry",
	socialGroup = "geonosian_creature",
	pvpFaction = "",
	faction = "",
	mobType = MOB_NPC,
	level = 180,
	chanceHit = 22.64,
	damageMin = 280,
	damageMax = 470,
	baseXp = 22288,
	baseHAM = 61000,
	baseHAMmax = 67000,
	armor = 1,
	resists = {25,35,25,65,30,25,15,25,10},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_geonosian_warrior_01.iff",
		"object/mobile/dressed_geonosian_warrior_02.iff",
		"object/mobile/dressed_geonosian_warrior_03.iff"},
	lootGroups = {
	 	{
	        	groups =
			{
				{group = "geonosian_relic", chance = 500000},
				{group = "geonosian_common", chance = 6500000},
				{group = "pistols", chance = 3000000},
			},
			lootChance = 9500000,
		},
	},
	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "geonosian_weapons",
	secondaryWeapon = "none",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(brawlermaster,marksmanmaster,pistoleermaster,riflemanmaster),
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(crazed_geonosian_sentry, "crazed_geonosian_sentry")
