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


object_tangible_sign_player_shared_house_address = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/sign/player/shared_house_address.iff"
	--Data below here is deprecated and loaded from the tres, keeping for easy lookups
--[[
	appearanceFilename = "appearance/thm_sign_all_hanging.apt",
	arrangementDescriptorFilename = "",

	certificationsRequired = {},
	clearFloraRadius = 0,
	clientDataFile = "",
	clientGameObjectType = 8207,
	collisionActionBlockFlags = 0,
	collisionActionFlags = 51,
	collisionActionPassFlags = 1,
	collisionMaterialBlockFlags = 0,
	collisionMaterialFlags = 1,
	collisionMaterialPassFlags = 0,
	containerType = 0,
	containerVolumeLimit = 1,
	customizationVariableMapping = {},

	detailedDescription = "@sign_detail:sign",

	gameObjectType = 8207,

	locationReservationRadius = 0,
	lookAtText = "@sign_lookat:sign",

	noBuildRadius = 0,

	objectName = "@sign_name:sign",
	onlyVisibleInTools = 0,

	paletteColorCustomizationVariables = {},
	portalLayoutFilename = "",

	rangedIntCustomizationVariables = {},

	scale = 1,
	scaleThresholdBeforeExtentTest = 0.5,
	sendToClient = 1,
	slotDescriptorFilename = "",
	snapToTerrain = 0,
	socketDestinations = {},
	structureFootprintFileName = "",
	surfaceType = 0,

	targetable = 1,
	totalCellNumber = 0,

	useStructureFootprintOutline = 0,

	clientObjectCRC = 2527534357,
	derivedFromTemplates = {"object/object/base/shared_base_object.iff", "object/tangible/base/shared_tangible_base.iff", "object/tangible/sign/base/shared_base_sign.iff", "object/tangible/sign/player/base/shared_player_sign_base.iff"}
]]
}

ObjectTemplates:addClientTemplate(object_tangible_sign_player_shared_house_address, "object/tangible/sign/player/shared_house_address.iff")

object_tangible_sign_player_shared_house_address_corellia = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/sign/player/shared_house_address_corellia.iff"
	--Data below here is deprecated and loaded from the tres, keeping for easy lookups
--[[
	appearanceFilename = "appearance/thm_sign_corl_hanging.apt",
	arrangementDescriptorFilename = "",

	certificationsRequired = {},
	clearFloraRadius = 0,
	clientDataFile = "",
	clientGameObjectType = 8207,
	collisionActionBlockFlags = 0,
	collisionActionFlags = 51,
	collisionActionPassFlags = 1,
	collisionMaterialBlockFlags = 0,
	collisionMaterialFlags = 1,
	collisionMaterialPassFlags = 0,
	containerType = 0,
	containerVolumeLimit = 1,
	customizationVariableMapping = {},

	detailedDescription = "@sign_detail:sign",

	gameObjectType = 8207,

	locationReservationRadius = 0,
	lookAtText = "@sign_lookat:sign",

	noBuildRadius = 0,

	objectName = "@sign_name:sign",
	onlyVisibleInTools = 0,

	paletteColorCustomizationVariables = {},
	portalLayoutFilename = "",

	rangedIntCustomizationVariables = {},

	scale = 1,
	scaleThresholdBeforeExtentTest = 0.5,
	sendToClient = 1,
	slotDescriptorFilename = "",
	snapToTerrain = 0,
	socketDestinations = {},
	structureFootprintFileName = "",
	surfaceType = 0,

	targetable = 1,
	totalCellNumber = 0,

	useStructureFootprintOutline = 0,

	clientObjectCRC = 1770300189,
	derivedFromTemplates = {"object/object/base/shared_base_object.iff", "object/tangible/base/shared_tangible_base.iff", "object/tangible/sign/base/shared_base_sign.iff", "object/tangible/sign/player/base/shared_player_sign_base.iff"}
]]
}

ObjectTemplates:addClientTemplate(object_tangible_sign_player_shared_house_address_corellia, "object/tangible/sign/player/shared_house_address_corellia.iff")

object_tangible_sign_player_shared_house_address_naboo = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/sign/player/shared_house_address_naboo.iff"
	--Data below here is deprecated and loaded from the tres, keeping for easy lookups
--[[
	appearanceFilename = "appearance/thm_sign_nboo_hanging.apt",
	arrangementDescriptorFilename = "",

	certificationsRequired = {},
	clearFloraRadius = 0,
	clientDataFile = "",
	clientGameObjectType = 8207,
	collisionActionBlockFlags = 0,
	collisionActionFlags = 51,
	collisionActionPassFlags = 1,
	collisionMaterialBlockFlags = 0,
	collisionMaterialFlags = 1,
	collisionMaterialPassFlags = 0,
	containerType = 0,
	containerVolumeLimit = 1,
	customizationVariableMapping = {},

	detailedDescription = "@sign_detail:sign",

	gameObjectType = 8207,

	locationReservationRadius = 0,
	lookAtText = "@sign_lookat:sign",

	noBuildRadius = 0,

	objectName = "@sign_name:sign",
	onlyVisibleInTools = 0,

	paletteColorCustomizationVariables = {},
	portalLayoutFilename = "",

	rangedIntCustomizationVariables = {},

	scale = 1,
	scaleThresholdBeforeExtentTest = 0.5,
	sendToClient = 1,
	slotDescriptorFilename = "",
	snapToTerrain = 0,
	socketDestinations = {},
	structureFootprintFileName = "",
	surfaceType = 0,

	targetable = 1,
	totalCellNumber = 0,

	useStructureFootprintOutline = 0,

	clientObjectCRC = 3585850510,
	derivedFromTemplates = {"object/object/base/shared_base_object.iff", "object/tangible/base/shared_tangible_base.iff", "object/tangible/sign/base/shared_base_sign.iff", "object/tangible/sign/player/base/shared_player_sign_base.iff"}
]]
}

ObjectTemplates:addClientTemplate(object_tangible_sign_player_shared_house_address_naboo, "object/tangible/sign/player/shared_house_address_naboo.iff")

object_tangible_sign_player_shared_house_address_tatooine = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/sign/player/shared_house_address_tatooine.iff"
	--Data below here is deprecated and loaded from the tres, keeping for easy lookups
--[[
	appearanceFilename = "appearance/thm_sign_tato_hanging.apt",
	arrangementDescriptorFilename = "",

	certificationsRequired = {},
	clearFloraRadius = 0,
	clientDataFile = "",
	clientGameObjectType = 8207,
	collisionActionBlockFlags = 0,
	collisionActionFlags = 51,
	collisionActionPassFlags = 1,
	collisionMaterialBlockFlags = 0,
	collisionMaterialFlags = 1,
	collisionMaterialPassFlags = 0,
	containerType = 0,
	containerVolumeLimit = 1,
	customizationVariableMapping = {},

	detailedDescription = "@sign_detail:sign",

	gameObjectType = 8207,

	locationReservationRadius = 0,
	lookAtText = "@sign_lookat:sign",

	noBuildRadius = 0,

	objectName = "@sign_name:sign",
	onlyVisibleInTools = 0,

	paletteColorCustomizationVariables = {},
	portalLayoutFilename = "",

	rangedIntCustomizationVariables = {},

	scale = 1,
	scaleThresholdBeforeExtentTest = 0.5,
	sendToClient = 1,
	slotDescriptorFilename = "",
	snapToTerrain = 0,
	socketDestinations = {},
	structureFootprintFileName = "",
	surfaceType = 0,

	targetable = 1,
	totalCellNumber = 0,

	useStructureFootprintOutline = 0,

	clientObjectCRC = 1439154818,
	derivedFromTemplates = {"object/object/base/shared_base_object.iff", "object/tangible/base/shared_tangible_base.iff", "object/tangible/sign/base/shared_base_sign.iff", "object/tangible/sign/player/base/shared_player_sign_base.iff"}
]]
}

ObjectTemplates:addClientTemplate(object_tangible_sign_player_shared_house_address_tatooine, "object/tangible/sign/player/shared_house_address_tatooine.iff")

object_tangible_sign_player_shared_shop_sign_s01 = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/sign/player/shared_shop_sign_s01.iff"
	--Data below here is deprecated and loaded from the tres, keeping for easy lookups
--[[
	appearanceFilename = "appearance/mun_all_sign_shop_s01.apt",
	arrangementDescriptorFilename = "",

	certificationsRequired = {},
	clearFloraRadius = 0,
	clientDataFile = "",
	clientGameObjectType = 8207,
	collisionActionBlockFlags = 0,
	collisionActionFlags = 51,
	collisionActionPassFlags = 1,
	collisionMaterialBlockFlags = 0,
	collisionMaterialFlags = 1,
	collisionMaterialPassFlags = 0,
	containerType = 0,
	containerVolumeLimit = 1,
	customizationVariableMapping = {},

	detailedDescription = "@sign_detail:sign",

	gameObjectType = 8207,

	locationReservationRadius = 0,
	lookAtText = "@sign_lookat:sign",

	noBuildRadius = 0,

	objectName = "@sign_name:sign",
	onlyVisibleInTools = 0,

	paletteColorCustomizationVariables = {},
	portalLayoutFilename = "",

	rangedIntCustomizationVariables = {},

	scale = 1,
	scaleThresholdBeforeExtentTest = 0.5,
	sendToClient = 1,
	slotDescriptorFilename = "",
	snapToTerrain = 0,
	socketDestinations = {},
	structureFootprintFileName = "",
	surfaceType = 0,

	targetable = 1,
	totalCellNumber = 0,

	useStructureFootprintOutline = 0,

	clientObjectCRC = 3889554743,
	derivedFromTemplates = {"object/object/base/shared_base_object.iff", "object/tangible/base/shared_tangible_base.iff", "object/tangible/sign/base/shared_base_sign.iff", "object/tangible/sign/player/base/shared_player_sign_base.iff", "object/tangible/sign/player/base/shared_shop_sign_base.iff"}
]]
}

ObjectTemplates:addClientTemplate(object_tangible_sign_player_shared_shop_sign_s01, "object/tangible/sign/player/shared_shop_sign_s01.iff")

object_tangible_sign_player_shared_shop_sign_s02 = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/sign/player/shared_shop_sign_s02.iff"
	--Data below here is deprecated and loaded from the tres, keeping for easy lookups
--[[
	appearanceFilename = "appearance/mun_all_sign_shop_s02.apt",
	arrangementDescriptorFilename = "",

	certificationsRequired = {},
	clearFloraRadius = 0,
	clientDataFile = "",
	clientGameObjectType = 8207,
	collisionActionBlockFlags = 0,
	collisionActionFlags = 51,
	collisionActionPassFlags = 1,
	collisionMaterialBlockFlags = 0,
	collisionMaterialFlags = 1,
	collisionMaterialPassFlags = 0,
	containerType = 0,
	containerVolumeLimit = 1,
	customizationVariableMapping = {},

	detailedDescription = "@sign_detail:sign",

	gameObjectType = 8207,

	locationReservationRadius = 0,
	lookAtText = "@sign_lookat:sign",

	noBuildRadius = 0,

	objectName = "@sign_name:sign",
	onlyVisibleInTools = 0,

	paletteColorCustomizationVariables = {},
	portalLayoutFilename = "",

	rangedIntCustomizationVariables = {},

	scale = 1,
	scaleThresholdBeforeExtentTest = 0.5,
	sendToClient = 1,
	slotDescriptorFilename = "",
	snapToTerrain = 0,
	socketDestinations = {},
	structureFootprintFileName = "",
	surfaceType = 0,

	targetable = 1,
	totalCellNumber = 0,

	useStructureFootprintOutline = 0,

	clientObjectCRC = 1019366816,
	derivedFromTemplates = {"object/object/base/shared_base_object.iff", "object/tangible/base/shared_tangible_base.iff", "object/tangible/sign/base/shared_base_sign.iff", "object/tangible/sign/player/base/shared_player_sign_base.iff", "object/tangible/sign/player/base/shared_shop_sign_base.iff"}
]]
}

ObjectTemplates:addClientTemplate(object_tangible_sign_player_shared_shop_sign_s02, "object/tangible/sign/player/shared_shop_sign_s02.iff")

object_tangible_sign_player_shared_shop_sign_s03 = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/sign/player/shared_shop_sign_s03.iff"
	--Data below here is deprecated and loaded from the tres, keeping for easy lookups
--[[
	appearanceFilename = "appearance/mun_all_sign_shop_s03.apt",
	arrangementDescriptorFilename = "",

	certificationsRequired = {},
	clearFloraRadius = 0,
	clientDataFile = "",
	clientGameObjectType = 8207,
	collisionActionBlockFlags = 0,
	collisionActionFlags = 51,
	collisionActionPassFlags = 1,
	collisionMaterialBlockFlags = 0,
	collisionMaterialFlags = 1,
	collisionMaterialPassFlags = 0,
	containerType = 0,
	containerVolumeLimit = 1,
	customizationVariableMapping = {},

	detailedDescription = "@sign_detail:sign",

	gameObjectType = 8207,

	locationReservationRadius = 0,
	lookAtText = "@sign_lookat:sign",

	noBuildRadius = 0,

	objectName = "@sign_name:sign",
	onlyVisibleInTools = 0,

	paletteColorCustomizationVariables = {},
	portalLayoutFilename = "",

	rangedIntCustomizationVariables = {},

	scale = 1,
	scaleThresholdBeforeExtentTest = 0.5,
	sendToClient = 1,
	slotDescriptorFilename = "",
	snapToTerrain = 0,
	socketDestinations = {},
	structureFootprintFileName = "",
	surfaceType = 0,

	targetable = 1,
	totalCellNumber = 0,

	useStructureFootprintOutline = 0,

	clientObjectCRC = 1976511021,
	derivedFromTemplates = {"object/object/base/shared_base_object.iff", "object/tangible/base/shared_tangible_base.iff", "object/tangible/sign/base/shared_base_sign.iff", "object/tangible/sign/player/base/shared_player_sign_base.iff", "object/tangible/sign/player/base/shared_shop_sign_base.iff"}
]]
}

ObjectTemplates:addClientTemplate(object_tangible_sign_player_shared_shop_sign_s03, "object/tangible/sign/player/shared_shop_sign_s03.iff")

object_tangible_sign_player_shared_shop_sign_s04 = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/sign/player/shared_shop_sign_s04.iff"
	--Data below here is deprecated and loaded from the tres, keeping for easy lookups
--[[
	appearanceFilename = "appearance/mun_all_sign_shop_s04.apt",
	arrangementDescriptorFilename = "",

	certificationsRequired = {},
	clearFloraRadius = 0,
	clientDataFile = "",
	clientGameObjectType = 8207,
	collisionActionBlockFlags = 0,
	collisionActionFlags = 51,
	collisionActionPassFlags = 1,
	collisionMaterialBlockFlags = 0,
	collisionMaterialFlags = 1,
	collisionMaterialPassFlags = 0,
	containerType = 0,
	containerVolumeLimit = 1,
	customizationVariableMapping = {},

	detailedDescription = "@sign_detail:sign",

	gameObjectType = 8207,

	locationReservationRadius = 0,
	lookAtText = "@sign_lookat:sign",

	noBuildRadius = 0,

	objectName = "@sign_name:sign",
	onlyVisibleInTools = 0,

	paletteColorCustomizationVariables = {},
	portalLayoutFilename = "",

	rangedIntCustomizationVariables = {},

	scale = 1,
	scaleThresholdBeforeExtentTest = 0.5,
	sendToClient = 1,
	slotDescriptorFilename = "",
	snapToTerrain = 0,
	socketDestinations = {},
	structureFootprintFileName = "",
	surfaceType = 0,

	targetable = 1,
	totalCellNumber = 0,

	useStructureFootprintOutline = 0,

	clientObjectCRC = 2385248569,
	derivedFromTemplates = {"object/object/base/shared_base_object.iff", "object/tangible/base/shared_tangible_base.iff", "object/tangible/sign/base/shared_base_sign.iff", "object/tangible/sign/player/base/shared_player_sign_base.iff", "object/tangible/sign/player/base/shared_shop_sign_base.iff"}
]]
}

ObjectTemplates:addClientTemplate(object_tangible_sign_player_shared_shop_sign_s04, "object/tangible/sign/player/shared_shop_sign_s04.iff")


object_tangible_sign_player_shared_efol_hanging_sign_01 = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/sign/player/shared_efol_hanging_sign_01.iff"
}
ObjectTemplates:addClientTemplate(object_tangible_sign_player_shared_efol_hanging_sign_01, "object/tangible/sign/player/shared_efol_hanging_sign_01.iff")

object_tangible_sign_player_shared_house_address_halloween_sign = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/sign/player/shared_house_address_halloween_sign.iff"
}
ObjectTemplates:addClientTemplate(object_tangible_sign_player_shared_house_address_halloween_sign, "object/tangible/sign/player/shared_house_address_halloween_sign.iff")

object_tangible_sign_player_shared_imperial_empire_day_2009_sign_hanging = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/sign/player/shared_imperial_empire_day_2009_sign_hanging.iff"
}
ObjectTemplates:addClientTemplate(object_tangible_sign_player_shared_imperial_empire_day_2009_sign_hanging, "object/tangible/sign/player/shared_imperial_empire_day_2009_sign_hanging.iff")

object_tangible_sign_player_shared_rebel_remembrance_day_2009_sign_hanging = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/sign/player/shared_rebel_remembrance_day_2009_sign_hanging.iff"
}
ObjectTemplates:addClientTemplate(object_tangible_sign_player_shared_rebel_remembrance_day_2009_sign_hanging, "object/tangible/sign/player/shared_rebel_remembrance_day_2009_sign_hanging.iff")

