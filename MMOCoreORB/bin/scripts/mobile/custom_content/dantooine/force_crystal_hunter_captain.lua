force_crystal_hunter_captain = Creature:new {
    customName = "a Force Crystal Hunter Captain",
	socialGroup = "kun",
	faction = "",
    mobType = MOB_NPC,
	level = 205,
	chanceHit = 2.25,
	damageMin = 990,
	damageMax = 1750,
	baseXp = 26921,
	baseHAM = 135200,
	baseHAMmax = 162000,
	armor = 2,
	-- {kinetic,energy,blast,heat,cold,electricity,acid,stun,ls}
	resists = {65,65,35,25,55,45,35,35,15},
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
	creatureBitmask = PACK,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {
        "object/mobile/dressed_dark_jedi_human_male_01.iff",
		"object/mobile/dressed_dark_jedi_human_female_01.iff"},
	lootGroups = {
		{
			groups = {
				{group = "color_crystals", chance = 3500000},
				{group = "power_crystals", chance = 3500000},
				{group = "holocron_dark", chance = 250000},
				{group = "holocron_light", chance = 250000},
				{group = "clothing_attachments", chance = 2500000}
			},
            lootChance = 8500000
		},
        {
            groups = {
				{group = "color_crystals", chance = 3500000},
				{group = "power_crystals", chance = 3500000},
				{group = "holocron_dark", chance = 250000},
				{group = "holocron_light", chance = 250000},
				{group = "clothing_attachments", chance = 2500000}
			},
            lootChance = 6500000
        },
		{ -- Jedi Specific Loot Group
			groups =
			{
				{group = "jedi_clothing_attachments", chance = 4000000},
				{group = "named_crystals", chance = 6000000},
			},
			lootChance = 750000,
		},
	},
	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "mixed_force_weapons",
	secondaryWeapon = "none",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(pikemanmaster,brawlermaster,forcewielder),
	secondaryAttacks = { },
}

CreatureTemplates:addCreatureTemplate(force_crystal_hunter_captain, "force_crystal_hunter_captain")
