nabek_acolyte1 = Creature:new {
	customName = "Apok (Nabek's Apprentice)",
	faction = "thug",
	socialGroup = "thug",
	mobType = MOB_NPC,
	level = 200,
	chanceHit = 7,
	damageMin = 700,
	damageMax = 1150,
	baseXp = 20000,
	baseHAM = 195000,
	baseHAMmax = 250000,
	armor = 2,
	resists = {45,60,40,45,45,60,60,40,15},
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
		"object/mobile/dressed_dark_jedi_human_male_01.iff"},
	
		lootGroups = {
		{
			groups = {

				{group = "loot_kit_parts", chance = 500000},
				{group = "armor_attachments", chance = 1000000},
				{group = "clothing_attachments", chance = 1000000},
				{group = "color_crystals", chance = 7500000},
			}
		}
	},
	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "dark_jedi_weapons_gen3",
	secondaryWeapon = "none",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(lightsabermaster),
	secondaryAttacks = { },
	}
	
	CreatureTemplates:addCreatureTemplate(nabek_acolyte1, "nabek_acolyte1")
