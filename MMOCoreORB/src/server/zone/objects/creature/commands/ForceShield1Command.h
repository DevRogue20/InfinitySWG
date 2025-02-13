/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef FORCESHIELD1COMMAND_H_
#define FORCESHIELD1COMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class ForceShield1Command : public JediQueueCommand {
public:

	ForceShield1Command(const String& name, ZoneProcessServer* server) : JediQueueCommand(name, server) {
		buffCRC = BuffCRC::JEDI_FORCE_SHIELD_1;
		blockingCRCs.add(BuffCRC::JEDI_FORCE_SHIELD_2);
		singleUseEventTypes.add(ObserverEventType::FORCESHIELD);
		skillMods.put("force_shield", 25);
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const override {
		return doJediSelfBuffCommand(creature);
	}

	void handleBuff(SceneObject* creature, ManagedObject* object, int64 param) const override {

		ManagedReference<CreatureObject*> player = creature->asCreatureObject();

		if (player == nullptr)
			return;

		auto ghost = player->getPlayerObject();

		if (ghost == nullptr)
			return;

		// Client Effect upon hit (needed)
		player->playEffect("clienteffect/pl_force_shield_hit.cef", "");

		float forceCost = param * 0.095;
		forceCost /= player->getFrsMod("control"); //Infinity:  FRS Mod
		if (ghost->getForcePower() <= forceCost) { // Remove buff if not enough force.
			Buff* buff = player->getBuff(BuffCRC::JEDI_FORCE_SHIELD_1);
			if (buff != nullptr) {
				Locker locker(buff);
				player->removeBuff(buff);
			}
		} 
		else {
			ghost->setForcePower(ghost->getForcePower() - forceCost);
		}
	}

};

#endif //FORCESHIELD1COMMAND_H_
