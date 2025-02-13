janta_warrior = Creature:new {
	objectName = "@mob/creature_names:janta_warrior",
	randomNameType = NAME_GENERIC,
	randomNameTag = true,
	mobType = MOB_NPC,
	socialGroup = "janta_tribe",
	faction = "janta_tribe",
	level = 90,
	chanceHit = 0.7,
	damageMin = 695,
	damageMax = 800,
	baseXp = 6655,
	baseHAM = 17000,
	baseHAMmax = 23000,
	armor = 1,
	resists = {40,40,20,10,20,25,20,30,-1},
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
	creatureBitmask = PACK + HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
		"object/mobile/dantari_male.iff",
		"object/mobile/dantari_female.iff"},
	lootGroups = {
		{
			groups = {
				{group = "janta_common", chance = 5000000},
				{group = "melee_weapons", chance = 2500000},
				{group = "junk", chance = 2500000}
				},
				lootChance = 10000000
		},
		{
			groups = {
				{group = "combat_practice", chance = 100 * (100000)}
				},
				lootChance = 25 * (100000)
		}
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "primitive_weapons",
	secondaryWeapon = "unarmed",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(pikemanmaster,fencermaster,brawlermaster),
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(janta_warrior, "janta_warrior")
