sith_shadow_thug_nonaggro = Creature:new {
	objectName = "@mob/creature_names:shadow_thug_nonaggro",
	socialGroup = "sith_shadow",
	faction = "sith_shadow_nonaggro",
	mobType = MOB_NPC,
	level = 127,
	chanceHit = 1,
	damageMin = 570,
	damageMax = 1050,
	baseXp = 2503,
	baseHAM = 44300,
	baseHAMmax = 54300,
	armor = 1,
	resists = {55,65,50,55,60,60,60,50,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = { "sith_shadow" },
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 4000000},
				{group = "tailor_components", chance = 1500000},
				{group = "loot_kit_parts", chance = 1500000},
				{group = "printer_parts", chance = 1000000},
				{group = "wearables_common", chance = 1000000},
				{group = "clothing_attachments", chance = 500000},
				{group = "armor_attachments", chance = 500000},
			},
		},
		{
			groups = {
				{group = "village_resources", chance =  10000000}
			},
			lootChance = 1000000
		},
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "pirate_weapons_heavy",
	secondaryWeapon = "none",
	conversationTemplate = "",

	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(riflemanmaster,pistoleermaster,carbineermaster,marksmanmaster,brawlermaster),
	secondaryAttacks = {}
}

CreatureTemplates:addCreatureTemplate(sith_shadow_thug_nonaggro, "sith_shadow_thug_nonaggro")
