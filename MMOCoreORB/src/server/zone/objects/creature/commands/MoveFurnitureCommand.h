/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef MOVEFURNITURECOMMAND_H_
#define MOVEFURNITURECOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/building/BuildingObject.h"
#include "server/zone/objects/tangible/components/CityDecorationMenuComponent.h"
#include "server/zone/objects/tangible/components/DestructibleCityDecorationMenuComponent.h"

class MoveFurnitureCommand : public QueueCommand {
public:

	MoveFurnitureCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	//returns false on collision detection
	bool checkCollision(SceneObject* object, Vector3& endPoint) const {
		return CollisionManager::checkLineOfSightInParentCell(object, endPoint);
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		auto ghost = creature->getPlayerObject();
		if (ghost == nullptr)
			return GENERALERROR;

		if (target == 0) {
			creature->sendSystemMessage("No target is selected.  What do you want to move?");
			return GENERALERROR;
		}

		auto zoneServer = server->getZoneServer();
		if (zoneServer == nullptr)
			return GENERALERROR;

		ManagedReference<SceneObject*> object = zoneServer->getObject(target);

		if (object == nullptr || !object->isTangibleObject()) {
			creature->sendSystemMessage("Target object is null or not a tangible object.");
			return GENERALERROR;
		}

		if (object->isPlayerCreature() || (object->isCreatureObject() && !object->isVendor())) {
			creature->sendSystemMessage("Players and non-vendor creature objects cannot be moved with this command.");
			return GENERALERROR;
		}

		ManagedReference<SceneObject*> creatureRootParent = creature->getRootParent();
		ManagedReference<SceneObject*> objectRootParent = object->getRootParent();
		BuildingObject* buildingObject = creatureRootParent != nullptr ? (creatureRootParent->isBuildingObject() ? cast<BuildingObject*>(creatureRootParent.get()) : nullptr) : nullptr;
		ManagedReference<CityRegion*> city = nullptr;
		bool isDeco, isValidCityItem = false;

		if (ghost->getAdminLevel() != 15)  { //// Restrictions for non-admin characters

			if (buildingObject == nullptr) {  // We're outside

				if (creatureRootParent != nullptr && objectRootParent != nullptr) {
					creature->sendSystemMessage("The player and the object both need to be outside.");
					return GENERALERROR;
				}

				city = creature->getCityRegion().get();
				if (city == nullptr) { // Not in a city
					creature->sendSystemMessage("You are not located in a player city.");
					return GENERALERROR;
				}

				if (!city->isMayor(creature->getObjectID())) {  // Not mayor
					creature->sendSystemMessage("You must be mayor to move objects in a city."); 
					return GENERALERROR;
				}

				if (!creature->hasSkill("social_politician_master")) {
					creature->sendSystemMessage("You must be a master politician to move objects in your city."); 
					return GENERALERROR;
				}

				CityDecorationMenuComponent* decorationMenu = cast<CityDecorationMenuComponent*>(object->getObjectMenuComponent());
				DestructibleCityDecorationMenuComponent* destructibleDecorationMenu = cast<DestructibleCityDecorationMenuComponent*>(object->getObjectMenuComponent());

				isDeco = decorationMenu != nullptr || destructibleDecorationMenu != nullptr;
				isValidCityItem = isDeco | object->isMissionTerminal() || object->getObjectTemplate()->getFullTemplateString().contains("trainer");

				if (!isValidCityItem) {
					creature->sendSystemMessage("You can only move objects that are city decorations, mission terminals, or trainers."); 
					return GENERALERROR;
				}
			} 
			else {
				bool onAdmin = buildingObject != nullptr && buildingObject->isOnAdminList(creature);
				bool onVendor = buildingObject != nullptr && buildingObject->isOnPermissionList("VENDOR", creature);

				if (object->isVendor()) {
					if (!onAdmin && !onVendor) {
						creature->sendSystemMessage("You must have admin or vendor access rights to the structure to move a vendor.");
						return GENERALERROR;
					}
				} else if (!onAdmin) {
					creature->sendSystemMessage("@player_structure:admin_move_only"); // You must be an admin to manipulate objects.
					return GENERALERROR;
				}

				if (objectRootParent != buildingObject || buildingObject->containsChildObject(object)) {
					creature->sendSystemMessage("Error moving object " + object->getCustomObjectName().toString());
					creature->sendSystemMessage("@player_structure:move_what"); //What do you want to move?
					return GENERALERROR;
				}

				if (buildingObject->isGCWBase()) {
					creature->sendSystemMessage("@player_structure:no_move_hq"); // You may not move or rotate objects inside a factional headquarters.
					return GENERALERROR;
				}
			}
		}

		String dir;
		float dist = 0.f;

		try {
			UnicodeTokenizer tokenizer(arguments);
			tokenizer.getStringToken(dir);
			dir = dir.toLowerCase();

			if (dir != "up" && dir != "upward" && dir != "down" && dir != "downward" && dir != "forward" && dir != "ahead" && dir != "back" && dir != "backward") {
				StringBuffer message;
				message << "Invalid direction parameter " << '"' << dir << '"' << " received.  Targeted object is " << '"' << object->getCustomObjectName().toString() <<
						'"' << ", template is " << object->getObjectTemplate()->getTemplateFileName() << ".";
				creature->sendSystemMessage(message.toString());		
				throw Exception();
			}

			dist = tokenizer.getIntToken();

			if (dist < 1.f || dist > 500.f)
				throw Exception("@player_structure:movefurniture_params"); //The amount to move must be between 1 and 500.

		} catch (Exception& e) {
			creature->sendSystemMessage("@player_structure:format_movefurniture_distance"); //Format: /moveFurniture <FORWARD/AHEAD/BACK/BACKWARD/UP/UPWARD/DOWN/DOWNWARD> <distance>
			return INVALIDPARAMETERS;
		}

		float degrees = creature->getDirectionAngle();
		float radians = Math::deg2rad(degrees);

		dist /= 100.0f;

		float offsetX = dist * sin(radians);
		float offsetY = dist * cos(radians);

		float x = object->getPositionX();
		float y = object->getPositionY();
		float z = object->getPositionZ();

		if (dir == "forward" || dir == "ahead") {
			x += (offsetX);
			y += (offsetY);
		} else if (dir == "back" || dir == "backward") {
			x -= (offsetX);
			y -= (offsetY);
		} else if (dir == "up" || dir == "upward") {
			z += dist;
		} else if (dir == "down" || dir == "downward") {
			z -= dist;
		}

		Vector3 endPoint(x, y, z);

		if (isValidCityItem && city != nullptr) {  // Non-admin, moving items in a city
			Vector3 cityCenter(city->getPositionX(), city->getPositionY(), z);  //Use same z value as object to avoid elevation issues
			if (endPoint.distanceTo(cityCenter) > city->getRadius()) {
				creature->sendSystemMessage("You cannot move city decorations and objects outside of the city limit radius."); 
				return GENERALERROR;
			}
		}

		if (!checkCollision(object, endPoint)) {
			creature->sendSystemMessage("@player_structure:not_valid_location"); //That is not a valid location.
			return GENERALERROR;
		}

		object->incrementMovementCounter();

		ManagedReference<SceneObject*> objectParent = object->getParent().get();
		if (objectParent != nullptr)
			object->teleport(x, z, y, objectParent->getObjectID());
		else
			object->teleport(x, z, y);

		return SUCCESS;
	}

};

#endif //MOVEFURNITURECOMMAND_H_
