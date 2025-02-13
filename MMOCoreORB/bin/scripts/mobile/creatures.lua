Creature = {
	objectName = "",
	socialGroup = "",
	faction = "",
	level = 0,
	chanceHit = 0.000000,
	damageMin = 0,
	damageMax = 0,
	range = 0,
	baseXp = 0,
	baseHAM = 0,
	armor = 0,
	resists = {0,0,0,0,0,0,0,0,0},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.000000,
	ferocity = 0,
	pvpBitmask = NONE,
	creatureBitmask = NONE,
	diet = 0,
	scale = 1.0,

	templates = {},
	lootGroups = {},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "unarmed",
	secondaryWeapon = "none",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = {{"",""}},
	secondaryAttacks = { },
	conversationTemplate = "",
	personalityStf = "",
	optionsBitmask = AIENABLED
}

function Creature:new (o)
	o = o or { }
	setmetatable(o, self)
    self.__index = self
    return o
end

CreatureTemplates = { }

function CreatureTemplates:addCreatureTemplate(obj, file)
	if (obj == nil) then
		print("null template specified for " .. file)
	else
		addTemplate(file, obj)
	end
end

function getCreatureTemplate(crc)
	return CreatureTemplates[crc]
end

function deepcopy(t)
  local u = { }
  for k, v in pairs(t) do u[k] = v end
  return setmetatable(u, getmetatable(t))
end

function merge(a, ...)
	local r = deepcopy(a)

	for j,k in ipairs({...}) do
		for i, v in pairs(k) do
			table.insert(r,v)
		end
	end

	return r
end

includeFile("creatureskills.lua")
includeFile("conversation.lua")
includeFile("serverobjects.lua")
