fed_dub_constable = Creature:new {
	objectName = "@mob/creature_names:fed_dub_constable",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	socialGroup = "fed_dub",
	faction = "fed_dub",
	mobType = MOB_NPC,
	level = 78,
	chanceHit = 2,
	damageMin = 590,
	damageMax = 820,
	baseXp = 7612,
	baseHAM = 12000,
	baseHAMmax = 15000,
	armor = 1,
	resists = {50,55,25,-1,-1,60,30,42.5,-1},
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
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dressed_fed_dub_constable_twk_male_01.iff",
		"object/mobile/dressed_fed_dub_constable_twk_female_01.iff"},
	lootGroups = {
		{
			groups = {
				{group = "junk", chance = 3000000},
				{group = "wearables_common", chance = 2000000},
				{group = "carbines", chance = 2000000},
				{group = "tailor_components", chance = 1500000},
				{group = "loot_kit_parts", chance = 1500000}
			}
		},
	},
	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "st_assault_weapons",
	secondaryWeapon = "none",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(marksmanmaster,marksmanmaster,carbineermaster,tkamaster),
	secondaryAttacks = { },
	reactionStf = "@npc_reaction/townperson",

}

CreatureTemplates:addCreatureTemplate(fed_dub_constable, "fed_dub_constable")
