--Copyright (C) 2009 <SWGEmu>

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
--which carries forward this exception.


object_installation_mining_ore_shared_mining_ore_harvester_heavy = SharedInstallationObjectTemplate:new {
	clientTemplateFileName = "object/installation/mining_ore/shared_mining_ore_harvester_heavy.iff"
	--Data below here is deprecated and loaded from the tres, keeping for easy lookups
--[[
	appearanceFilename = "appearance/ins_all_min_s02_u1.apt",
	arrangementDescriptorFilename = "",

	certificationsRequired = {},
	clearFloraRadius = 15,
	clientDataFile = "clientdata/installation/client_shared_mining_ore_harvester_style_2.cdf",
	clientGameObjectType = 4099,
	collisionActionBlockFlags = 0,
	collisionActionFlags = 51,
	collisionActionPassFlags = 1,
	collisionMaterialBlockFlags = 0,
	collisionMaterialFlags = 1,
	collisionMaterialPassFlags = 0,
	containerType = 0,
	containerVolumeLimit = 1,
	customizationVariableMapping = {},

	detailedDescription = "",

	gameObjectType = 4099,

	locationReservationRadius = 0,
	lookAtText = "",

	noBuildRadius = 0,

	objectName = "@installation_n:heavy_ore_mine",
	onlyVisibleInTools = 0,

	paletteColorCustomizationVariables = {},
	portalLayoutFilename = "",

	rangedIntCustomizationVariables = {},

	scale = 1,
	scaleThresholdBeforeExtentTest = 0.5,
	sendToClient = 1,
	slotDescriptorFilename = "abstract/slot/descriptor/tangible.iff",
	snapToTerrain = 1,
	socketDestinations = {},
	structureFootprintFileName = "footprint/installation/mining_ore/shared_mining_ore_harvester_style_2.sfp",
	surfaceType = 1,

	targetable = 1,
	totalCellNumber = 0,

	useStructureFootprintOutline = 0,

	clientObjectCRC = 1077924017,
	derivedFromTemplates = {"object/object/base/shared_base_object.iff", "object/tangible/base/shared_tangible_base.iff", "object/tangible/base/shared_tangible_craftable.iff", "object/installation/base/shared_installation_base.iff", "object/installation/mining_ore/base/shared_mining_ore_base.iff"}
]]
}

ObjectTemplates:addClientTemplate(object_installation_mining_ore_shared_mining_ore_harvester_heavy, "object/installation/mining_ore/shared_mining_ore_harvester_heavy.iff")

object_installation_mining_ore_shared_mining_ore_harvester_style_1 = SharedInstallationObjectTemplate:new {
	clientTemplateFileName = "object/installation/mining_ore/shared_mining_ore_harvester_style_1.iff"
	--Data below here is deprecated and loaded from the tres, keeping for easy lookups
--[[
	appearanceFilename = "appearance/ins_all_mobile_ore_refinery.apt",
	arrangementDescriptorFilename = "",

	certificationsRequired = {},
	clearFloraRadius = 15,
	clientDataFile = "clientdata/installation/client_shared_mobile_ore_refinery.cdf",
	clientGameObjectType = 4099,
	collisionActionBlockFlags = 0,
	collisionActionFlags = 51,
	collisionActionPassFlags = 1,
	collisionMaterialBlockFlags = 0,
	collisionMaterialFlags = 1,
	collisionMaterialPassFlags = 0,
	containerType = 0,
	containerVolumeLimit = 1,
	customizationVariableMapping = {},

	detailedDescription = "",

	gameObjectType = 4099,

	locationReservationRadius = 0,
	lookAtText = "",

	noBuildRadius = 0,

	objectName = "@installation_n:small_ore_mine",
	onlyVisibleInTools = 0,

	paletteColorCustomizationVariables = {},
	portalLayoutFilename = "",

	rangedIntCustomizationVariables = {},

	scale = 1,
	scaleThresholdBeforeExtentTest = 0.5,
	sendToClient = 1,
	slotDescriptorFilename = "abstract/slot/descriptor/tangible.iff",
	snapToTerrain = 1,
	socketDestinations = {},
	structureFootprintFileName = "footprint/installation/mining_ore/shared_mining_ore_harvester_style_1.sfp",
	surfaceType = 1,

	targetable = 1,
	totalCellNumber = 0,

	useStructureFootprintOutline = 0,

	clientObjectCRC = 1719643610,
	derivedFromTemplates = {"object/object/base/shared_base_object.iff", "object/tangible/base/shared_tangible_base.iff", "object/tangible/base/shared_tangible_craftable.iff", "object/installation/base/shared_installation_base.iff", "object/installation/mining_ore/base/shared_mining_ore_base.iff"}
]]
}

ObjectTemplates:addClientTemplate(object_installation_mining_ore_shared_mining_ore_harvester_style_1, "object/installation/mining_ore/shared_mining_ore_harvester_style_1.iff")

object_installation_mining_ore_shared_mining_ore_harvester_style_2 = SharedInstallationObjectTemplate:new {
	clientTemplateFileName = "object/installation/mining_ore/shared_mining_ore_harvester_style_2.iff"
	--Data below here is deprecated and loaded from the tres, keeping for easy lookups
--[[
	appearanceFilename = "appearance/ins_all_min_s01_u1.apt",
	arrangementDescriptorFilename = "",

	certificationsRequired = {},
	clearFloraRadius = 15,
	clientDataFile = "clientdata/installation/client_shared_mining_ore_harvester_style_1.cdf",
	clientGameObjectType = 4099,
	collisionActionBlockFlags = 0,
	collisionActionFlags = 51,
	collisionActionPassFlags = 1,
	collisionMaterialBlockFlags = 0,
	collisionMaterialFlags = 1,
	collisionMaterialPassFlags = 0,
	containerType = 0,
	containerVolumeLimit = 1,
	customizationVariableMapping = {},

	detailedDescription = "",

	gameObjectType = 4099,

	locationReservationRadius = 0,
	lookAtText = "",

	noBuildRadius = 0,

	objectName = "@installation_n:ore_mine",
	onlyVisibleInTools = 0,

	paletteColorCustomizationVariables = {},
	portalLayoutFilename = "",

	rangedIntCustomizationVariables = {},

	scale = 1,
	scaleThresholdBeforeExtentTest = 0.5,
	sendToClient = 1,
	slotDescriptorFilename = "abstract/slot/descriptor/tangible.iff",
	snapToTerrain = 1,
	socketDestinations = {},
	structureFootprintFileName = "footprint/installation/mining_ore/shared_mining_ore_harvester_style_2.sfp",
	surfaceType = 1,

	targetable = 1,
	totalCellNumber = 0,

	useStructureFootprintOutline = 0,

	clientObjectCRC = 3177710925,
	derivedFromTemplates = {"object/object/base/shared_base_object.iff", "object/tangible/base/shared_tangible_base.iff", "object/tangible/base/shared_tangible_craftable.iff", "object/installation/base/shared_installation_base.iff", "object/installation/mining_ore/base/shared_mining_ore_base.iff"}
]]
}

ObjectTemplates:addClientTemplate(object_installation_mining_ore_shared_mining_ore_harvester_style_2, "object/installation/mining_ore/shared_mining_ore_harvester_style_2.iff")

-- Infinity

object_installation_mining_ore_shared_mining_ore_harvester_advanced = SharedInstallationObjectTemplate:new {
	clientTemplateFileName = "object/installation/mining_ore/shared_mining_ore_harvester_advanced.iff"
}

ObjectTemplates:addClientTemplate(object_installation_mining_ore_shared_mining_ore_harvester_advanced, "object/installation/mining_ore/shared_mining_ore_harvester_advanced.iff")
