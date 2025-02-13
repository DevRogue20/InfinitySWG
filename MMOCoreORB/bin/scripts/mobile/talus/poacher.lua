poacher = Creature:new {
	objectName = "@mob/creature_names:poacher_talus",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "poacher",
	faction = "",
	mobType = MOB_NPC,
	level = 70,
	chanceHit = 2.45,
	damageMin = 350,
	damageMax = 525,
	baseXp = 7112,
	baseHAM = 16500,
	baseHAMmax = 19000,
	armor = 2,
	resists = {75,15,15,25,0,0,85,85,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 2 * 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_commoner_naboo_twilek_female_02.iff",
		"object/mobile/dressed_quest_farmer.iff",
		"object/mobile/dressed_criminal_smuggler_human_female_01.iff",
		"object/mobile/dressed_criminal_smuggler_human_male_01.iff",
		"object/mobile/dressed_biribas_tarun.iff",
		"object/mobile/dressed_brigade_scout_trandoshan_male_01.iff",
		"object/mobile/dressed_brigade_scout_trandoshan_female_01.iff"
	},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 6000000},
				{group = "tailor_components", chance = 1500000},
				{group = "loot_kit_parts", chance = 1500000},
				{group = "wearables_common", chance = 1000000}
			}
		}
	},
	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "pirate_weapons_heavy",
	secondaryWeapon = "none",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(brawlermaster,marksmanmaster,tkamaster,riflemanmaster),
	secondaryAttacks = { },
	reactionStf = "@npc_reaction/townperson",
}

CreatureTemplates:addCreatureTemplate(poacher, "poacher")
