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


object_draft_schematic_structure_installation_generator_fusion = object_draft_schematic_structure_shared_installation_generator_fusion:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Deed for: Fusion Power Generator",

	craftingToolTab = 1024, -- (See DraftSchematicObjectTemplate.h)
	complexity = 1,
	size = 12,
	factoryCrateSize = 5000,
	factoryCrateType = "object/factory/factory_crate_installation.iff",
   
	xpType = "crafting_structure_general",
	xp = 3900,

	assemblySkill = "structure_assembly",
	experimentingSkill = "structure_experimentation",
	customizationSkill = "structure_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n"},
	ingredientTitleNames = {"load_bearing_frame", "body_shell_structure", "ore_extractor_mill", "structure_foundation", "pile_containment_shielding", "pile_containment_unit", "pile_containment_coolant", "matched_turbine_cluster", "capacitance_storage_compartments", "cell_manufacturing_mechanism"},
	ingredientSlotType = {0, 0, 1, 0, 0, 2, 0, 1, 1, 1},
	resourceTypes = {"steel", "metal", "object/tangible/component/structure/shared_ore_mining_unit.iff", "metal", "ore", "object/tangible/component/structure/shared_wall_module.iff", "chemical", "object/tangible/component/structure/shared_generator_turbine.iff", "object/tangible/component/structure/shared_structure_small_storage_section.iff", "object/tangible/component/structure/shared_manufacturing_mechanism.iff"},
	resourceQuantities = {300, 700, 1, 250, 250, 5, 300, 3, 4, 2},
	contribution = {100, 100, 100, 100, 100, 100, 100, 100, 100, 100},

	targetTemplate = "object/tangible/deed/generator_deed/generator_fusion_deed.iff",

	additionalTemplates = {}
}
ObjectTemplates:addTemplate(object_draft_schematic_structure_installation_generator_fusion, "object/draft_schematic/structure/installation_generator_fusion.iff")
