--Copyright (C) 2010 <SWGEmu>


--This File is part of Core3.

--This program is free software; you can redistribute 
--it and/or modify it under the terms of the GNU Lesser 
--General Public License as published by the Free Software
--Foundation; either version 2 of the License, 
--or (at your option) any later version.

--This program is distributed in the hope that it will be useful, 
--but WITHOUT ANY WARRANTY; without even the implied warranty of 
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
--See the GNU Lesser General Public License for
--more details.

--You should have received a copy of the GNU Lesser General 
--Public License along with this program; if not, write to
--the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

--Linking Engine3 statically or dynamically with other modules 
--is making a combined work based on Engine3. 
--Thus, the terms and conditions of the GNU Lesser General Public License 
--cover the whole combination.

--In addition, as a special exception, the copyright holders of Engine3 
--give you permission to combine Engine3 program with free software 
--programs or libraries that are released under the GNU LGPL and with 
--code included in the standard release of Core3 under the GNU LGPL 
--license (or modified versions of such code, with unchanged license). 
--You may copy and distribute such a system following the terms of the 
--GNU LGPL for Engine3 and the licenses of the other code concerned, 
--provided that you include the source code of that other code when 
--and as the GNU LGPL requires distribution of source code.

--Note that people who make modified versions of Engine3 are not obligated 
--to grant this special exception for their modified versions; 
--it is their choice whether to do so. The GNU Lesser General Public License 
--gives permission to release a modified version without this exception; 
--this exception also makes it possible to release a modified version 


object_draft_schematic_weapon_lance_nightsister = object_draft_schematic_weapon_shared_lance_nightsister:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Nightsister Energy Lance Schematic",

   craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
   complexity = 1, 
   size = 1, 
   factoryCrateType = "object/factory/factory_crate_weapon.iff",
   
   xpType = "crafting_weapons_general", 
   xp = 250, 

   assemblySkill = "weapon_assembly", 
   experimentingSkill = "weapon_experimentation", 
   customizationSkill = "weapon_customization", 

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n", "craft_weapon_ingredients_n"},
   ingredientTitleNames = {"lance_shaft", "vibro_unit_and_power_cell_brackets", "grip", "vibration_generator"},
   ingredientSlotType = {0, 0, 0, 1},
   resourceTypes = {"steel_quadranium", "copper_polysteel", "metal", "object/tangible/component/weapon/shared_vibro_unit_nightsister.iff"},
   resourceQuantities = {60, 30, 15, 2},
   contribution = {100, 100, 100, 100},


   targetTemplate = "object/weapon/melee/polearm/lance_nightsister.iff",

   additionalTemplates = {
             },

	weaponDots = {
		{
			{"type", 2}, -- 1 = Poison, 2 = Disease, 3 = Fire, 4 = Bleed
			{"attribute", 0}, -- See CreatureAttributes.h in src for numbers.
			{"strength", 40},
			{"duration", 1200},
			{"potency", 70},
			{"uses", 99999999}
		},
		{
			{"type", 2}, -- 1 = Poison, 2 = Disease, 3 = Fire, 4 = Bleed
			{"attribute", 2}, -- See CreatureAttributes.h in src for numbers.
			{"strength", 40},
			{"duration", 1200},
			{"potency", 70},
			{"uses", 99999999}
		}
	},

}
ObjectTemplates:addTemplate(object_draft_schematic_weapon_lance_nightsister, "object/draft_schematic/weapon/lance_nightsister.iff")
