/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef REVOKESKILLCOMMAND_H_
#define REVOKESKILLCOMMAND_H_

#include "server/zone/managers/skill/SkillManager.h"

class RevokeSkillCommand : public QueueCommand {
public:
	RevokeSkillCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		auto zoneServer = server->getZoneServer();
		if (zoneServer == nullptr) {
			return GENERALERROR;
		}

		ManagedReference<SceneObject*> object = zoneServer->getObject(target);

		if (object == nullptr || !object->isCreatureObject() || !object->isPlayerCreature()) {
			return INVALIDTARGET;
		}

		ManagedReference<CreatureObject*> targetCreature = cast<CreatureObject*>(object.get());

		if (targetCreature == nullptr) {
			return INVALIDTARGET;
		}

		Locker clocker(targetCreature, creature);

		String skillName = arguments.toString();
		String firstName = targetCreature->getFirstName();

		if (targetCreature->hasSkill(skillName)) {

			SkillManager* skillManager = SkillManager::instance();
			bool skillRemoved = skillManager != nullptr && skillManager->surrenderSkill(skillName, targetCreature, true, true);  //Check FRS

			if (skillRemoved) {
				targetCreature->sendSystemMessage("An admin removed your skill " + skillName + ".");
				creature->sendSystemMessage("Removed skill " + skillName + " from player " + firstName);
			}
			else {
				//targetCreature->sendSystemMessage("An admin failed to remove your skill " + skillName + ".");
				creature->sendSystemMessage("Failed to remove skill " + skillName + " from player " + firstName);
			}
		}
		else {
			creature->sendSystemMessage("Player " + firstName + " does not have skill " + skillName);
		}

		return SUCCESS;
	}
};

#endif // REVOKESKILLCOMMAND_H_
