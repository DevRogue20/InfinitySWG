#include "server/zone/objects/tangible/misc/PlantObject.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/packets/scene/AttributeListMessage.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/objects/player/sui/listbox/SuiListBox.h"
#include "server/zone/objects/player/sui/callbacks/GrowablePlantSuiCallback.h"
#include "server/zone/managers/crafting/CraftingManager.h"
#include "server/zone/objects/resource/ResourceContainer.h"
#include "server/zone/objects/building/BuildingObject.h"
#include "server/zone/objects/tangible/tasks/GrowablePlantPulseTask.h"
#include "server/zone/ZoneServer.h"

void PlantObjectImplementation::fillObjectMenuResponse(ObjectMenuResponse* menuResponse, CreatureObject* player) {
	TangibleObjectImplementation::fillObjectMenuResponse(menuResponse, player);

	if (plantSize == 0)
		return;

	menuResponse->addRadialMenuItem(68, 3, "@plant_grow:nutrients");
	menuResponse->addRadialMenuItemToRadialID(68, 69, 3, "@plant_grow:add_nutrients");
	menuResponse->addRadialMenuItemToRadialID(68, 70, 3, "@plant_grow:remove_nutrients_menu");

	menuResponse->addRadialMenuItem(71, 3, "@plant_grow:water");
	menuResponse->addRadialMenuItemToRadialID(71, 72, 3, "@plant_grow:add_water");
	menuResponse->addRadialMenuItemToRadialID(71, 73, 3, "@plant_grow:remove_water_menu");

	if (fruitCount > 0)
		menuResponse->addRadialMenuItem(74, 3, "@plant_grow:pick_fruit_menu");
}

int PlantObjectImplementation::handleObjectMenuSelect(CreatureObject* player, byte selectedID) {
	ManagedReference<SceneObject*> rootParent = getRootParent();
	ManagedReference<SceneObject*> parent = getParent().get();

	if (rootParent == nullptr || parent == nullptr) {
		return 0;
	}

	ManagedReference<BuildingObject*> building = cast<BuildingObject*>( rootParent.get());

	if ((building == nullptr || !building->isOnAdminList(player) || !parent->isCellObject()) && selectedID >= 69 && selectedID <= 74) {
		player->sendSystemMessage("@plant_grow:must_be_in_building"); // The plant must be in a building which you administrate.
		return 0;
	}

	if (selectedID == 69) { // Add Nutrients
		sendResourceSUI(player, 1);
	} else if (selectedID == 72) { // Add Water
		sendResourceSUI(player, 2);
	} else if (selectedID == 70) { // Remove Nutrients
		nutrientLevel -= 5;

		if (nutrientLevel < 0)
			nutrientLevel = 0;

		player->sendSystemMessage("@plant_grow:remove_nutrients");
	} else if (selectedID == 73) { // Remove Water
		waterLevel -= 5;

		if (waterLevel < 0)
			waterLevel = 0;

		player->sendSystemMessage("@plant_grow:remove_water");
	} else if (selectedID == 74) { // Pick Fruit
		if (fruitCount < 1)
			return 0;

		ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");

		if(inventory->isContainerFullRecursive()){
			player->sendSystemMessage("@plant_grow:no_inventory"); // You do not have any inventory space.
			return 0;
		}

		ZoneServer* zserv = player->getZoneServer();

		fruitCount--;

		String fruitTemplate = "object/tangible/item/plant/force_melon.iff";
		Reference<SceneObject*> fruit = zserv->createObject(fruitTemplate.hashCode(), 1);

		if(fruit == nullptr) {
			return 0;
		}

		if (!inventory->transferObject(fruit, -1, false, false) ) {
			fruit->destroyObjectFromDatabase(true);
			return 0;
		}

		inventory->broadcastObject(fruit, true);
		player->sendSystemMessage("@plant_grow:pick_fruit"); // You pick a piece of fruit from the plant.

	}

	return 1;
}

void PlantObjectImplementation::fillAttributeList(AttributeListMessage* alm, CreatureObject* object) {


	if (object == nullptr) {
		return;
	}

	auto ghost = object->getPlayerObject();

	bool isAdmin = false;

	if (ghost != nullptr)
		isAdmin = ghost->isAdmin();

	int temp = health;

	if (temp > 0 && temp < 10)
		temp = 10;
	else if (temp < 0)
		temp = 0;

	int tempHealth = ceil(temp / 10.f);
	alm->insertAttribute("plant_health_n", "@plant_grow:health_" + String::valueOf(tempHealth));

	if (fruitCount > 0)
		alm->insertAttribute("plant_fruit", fruitCount);

	temp = growthRate;

	if (temp > 10)
		temp = 10;
	else if (temp < -3)
		temp = -3;

	if (temp < 0) {
		temp = temp * -1;
		alm->insertAttribute("plant_growth_rate_n", "@plant_grow:growth_loss_" + String::valueOf(temp));
	} else {
		alm->insertAttribute("plant_growth_rate_n", "@plant_grow:growth_rate_" + String::valueOf(temp));
	}

	temp = waterLevel;

	if (temp > 100)
		temp = 100;

	alm->insertAttribute("plant_water_level_n", "@plant_grow:water_level_" + String::valueOf(temp / 10));

	if (isAdmin) {
		alm->insertAttribute("plant_water_level_n", String::valueOf(temp));
		temp = idealWaterLevel;
		if (temp > 100)
			temp = 100;
		alm->insertAttribute("plant_ideal_water_level_n", "@plant_grow:water_level_" + String::valueOf(temp / 10));
		alm->insertAttribute("plant_ideal_water_level_n", String::valueOf(temp));
	}


	temp = nutrientLevel;

	if (temp > 100)
		temp = 100;

	alm->insertAttribute("plant_nutrient_level_n", "@plant_grow:nutrient_level_" + String::valueOf(temp / 10));

	if (isAdmin) {
		alm->insertAttribute("plant_nutrient_level_n", String::valueOf(temp));
		temp = idealNutrientLevel;
		if (temp > 100)
			temp = 100;
		alm->insertAttribute("plant_ideal_nutrient_level_n", "@plant_grow:nutrient_level_" + String::valueOf(temp / 10));
		alm->insertAttribute("plant_ideal_nutrient_level_n", String::valueOf(temp));
	}

	if (pulseTask != nullptr) {

		AtomicTime nextExecutionTime;

		Core::getTaskManager()->getNextExecutionTime(pulseTask, nextExecutionTime);

		alm->insertAttribute("plant_update_time", getTimeString(-1 * nextExecutionTime.miliDifference()));

	}

	if (isAdmin) {
		String attributeOne, attributeTwo;
		switch (criticalAttribOne) {
			case 10: 
				attributeOne = "UT";
				break;
			case  9:
				attributeOne = "SR";
				break;
			case  8:
				attributeOne = "OQ";
				break;
			case  7:
				attributeOne = "PE";
				break;
			case  6:
				attributeOne = "MA";
				break;
			case  5:
				attributeOne = "FL";
				break;
			case  3:
				attributeOne = "DR";
				break;
			default:
				attributeOne = "Error";
		}
		switch (criticalAttribTwo) {
			case 10: 
				attributeTwo = "UT";
				break;
			case  9:
				attributeTwo = "SR";
				break;
			case  8:
				attributeTwo = "OQ";
				break;
			case  7:
				attributeTwo = "PE";
				break;
			case  6:
				attributeTwo = "MA";
				break;
			case  5:
				attributeTwo = "FL";
				break;
			case  3:
				attributeTwo = "DR";
				break;
			default:
				attributeTwo = "Error";
		}
	
		alm->insertAttribute("plant_critical_attribute_one", attributeOne);
		alm->insertAttribute("plant_critical_attribute_two", attributeTwo);
	}
}

void PlantObjectImplementation::sendResourceSUI(CreatureObject* player, int type) {
	ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

	if (ghost == nullptr)
		return;

	ManagedReference<SuiListBox*> suiBox = new SuiListBox(player, SuiWindowType::GROWABLE_PLANT, SuiListBox::HANDLETWOBUTTON);
	suiBox->setCallback(new GrowablePlantSuiCallback(player->getZoneServer()));
	suiBox->setPromptTitle("@plant_grow:select_resource_sub");
	suiBox->setPromptText("@plant_grow:select_resource_body");
	suiBox->setOkButton(true, "@ok");
	suiBox->setCancelButton(true, "@cancel");
	suiBox->setUsingObject(_this.getReferenceUnsafeStaticCast());
	suiBox->setForceCloseDistance(32.f);

	ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");
	ManagedReference<SceneObject*> sceneObject = nullptr;

	for (int i=0; i< inventory->getContainerObjectsSize(); i++) {
		sceneObject = inventory->getContainerObject(i);

		if (sceneObject == nullptr)
			continue;

		if (sceneObject->isResourceContainer()) {
			ManagedReference<ResourceContainer*> rcno = cast<ResourceContainer*>( sceneObject.get());

			if (rcno == nullptr)
				continue;

			ManagedReference<ResourceSpawn*> spawn = rcno->getSpawnObject();

			if (spawn == nullptr)
				continue;

			if ((type == 1 && spawn->isType("organic")) || (type == 2 && spawn->isType("water"))) {
				suiBox->addMenuItem(spawn->getName(), sceneObject->getObjectID());
			}
		}
	}

	if (suiBox->getMenuSize() > 0) {
		ghost->closeSuiWindowType(SuiWindowType::GROWABLE_PLANT);
		ghost->addSuiBox(suiBox);
		player->sendMessage(suiBox->generateMessage());
	} else {
		if (type == 1)
			player->sendSystemMessage("@plant_grow:no_nutrients"); // You don't have any nutrients.
		else
			player->sendSystemMessage("@plant_grow:no_water"); // You don't have any water.
	}
}

void PlantObjectImplementation::initializePlant(int size) {
	plantSize = size;

	if (size == 0)
		return;

	lastPulse.updateToCurrentTime();

	if (size == 1) {
		idealWaterLevel = 30 + System::random(40);
		idealNutrientLevel = 30 + System::random(40);
	} else {
		idealWaterLevel = 10 + System::random(80);
		idealNutrientLevel = 10 + System::random(80);
	}
	criticalAttribOne = getCriticalAttribute(1 + System::random(6));
	criticalAttribTwo = getCriticalAttribute(1 + System::random(6));

	if (criticalAttribTwo == criticalAttribOne) {
		while (criticalAttribTwo == criticalAttribOne)
			criticalAttribTwo = getCriticalAttribute(1 + System::random(6));
	}

}

void PlantObjectImplementation::changeSize(int size) {
	String plantTemplate = "";

	switch (size) {
	case 0: plantTemplate = "object/tangible/loot/plant_grow/plant_stage_dead.iff"; break;
	case 1: plantTemplate = "object/tangible/loot/plant_grow/plant_stage_1.iff"; break;
	case 2: plantTemplate = "object/tangible/loot/plant_grow/plant_stage_2.iff"; break;
	case 3: plantTemplate = "object/tangible/loot/plant_grow/plant_stage_3.iff"; break;
	}

	ManagedReference<ZoneServer*> zoneServer = getZoneServer();

	if (zoneServer == nullptr)
		return;

	ManagedReference<SceneObject*> parent = getParent().get();

	if (parent == nullptr || !parent->isCellObject())
		return;

	ManagedReference<SceneObject*> obj = zoneServer->createObject(plantTemplate.hashCode(), getPersistenceLevel());

	if (obj == nullptr)
		return;

	Locker clocker(obj, _this.getReferenceUnsafeStaticCast());

	obj->initializePosition(getPositionX(), getPositionZ(), getPositionY());
	obj->setDirection(Math::deg2rad(getDirectionAngle()));

	if (size > 0) {
		ManagedReference<PlantObject*> newPlant = cast<PlantObject*>( obj.get());

		if (newPlant == nullptr)
			return;

		newPlant->setWaterLevel(waterLevel);
		newPlant->setNutrientLevel(nutrientLevel);
		newPlant->setWaterQuality(waterQuality);
		newPlant->setNutrientQuality(nutrientQuality);
		newPlant->setPlantHealth(health);
		newPlant->initializePlant(size);
	}

	parent->transferObject(obj, -1);

	clocker.release();

	pulseTask->cancel();
	destroyObjectFromWorld(true);
	destroyObjectFromDatabase();
}

int PlantObjectImplementation::getCriticalAttribute(int index) {
	switch (index) {
	case 7: return CraftingManager::DR;
	case 6: return CraftingManager::FL;
	case 5: return CraftingManager::PE;
	case 4: return CraftingManager::UT;
	case 3: return CraftingManager::SR;
	case 2: return CraftingManager::MA;
	case 1:
	default: return CraftingManager::OQ;
	}
}

void PlantObjectImplementation::finalize() {
	if (pulseTask != nullptr)
		pulseTask->cancel();
}

void PlantObjectImplementation::startPulse() {
	if (plantSize == 0)
		return;

	uint64 timeSinceLast = lastPulse.miliDifference();

	if (pulseTask != nullptr)
		pulseTask->cancel();

	pulseTask = new GrowablePlantPulseTask(_this.getReferenceUnsafeStaticCast());

	if (timeSinceLast >= PULSERATE)
		pulseTask->execute();
	else
		pulseTask->schedule(PULSERATE - timeSinceLast);
}

//Infinity:  Custom function to next update time
String PlantObjectImplementation::getTimeString(uint32 timestamp) {
	int seconds = timestamp / 1000;

	int hours = seconds / 3600;
	seconds -= hours * 3600;

	int minutes = seconds / 60;
	seconds -= minutes * 60;

	StringBuffer buffer;

	if (hours > 0)
		buffer << hours << "h ";

	if (minutes > 0)
		buffer << minutes << "m ";

	if (seconds > 0)
		buffer << seconds << "s";

	return buffer.toString();
}
