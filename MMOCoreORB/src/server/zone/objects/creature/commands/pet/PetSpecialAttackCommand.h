
#ifndef PETSPECIALATTACKCOMMAND_H_
#define PETSPECIALATTACKCOMMAND_H_

#include "server/zone/objects/creature/commands/CombatQueueCommand.h"
#include "server/zone/objects/creature/ai/AiAgent.h"
#include "templates/params/ObserverEventType.h"
#include "server/zone/managers/creature/PetManager.h"

class PetSpecialAttackCommand : public CombatQueueCommand {
public:
	PetSpecialAttackCommand(const String& name, ZoneProcessServer* server) : CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		ManagedReference<PetControlDevice*> controlDevice = creature->getControlDevice().get().castTo<PetControlDevice*>();
		if (controlDevice == nullptr)
			return GENERALERROR;

		int petType = controlDevice->getPetType();
		if (petType == PetManager::DROIDPET || petType == PetManager::FACTIONPET) {
			return GENERALERROR;
		}

		ManagedReference<AiAgent*> pet = cast<AiAgent*>(creature);
		if (pet == nullptr)
			return GENERALERROR;

		if (pet->hasRidingCreature())
			return GENERALERROR;

		if (pet->getPosture() != CreaturePosture::UPRIGHT && pet->getPosture() != CreaturePosture::KNOCKEDDOWN)
			pet->setPosture(CreaturePosture::UPRIGHT);

		Reference<TangibleObject*> targetObject = server->getZoneServer()->getObject(target, true).castTo<TangibleObject*>();
		if (targetObject == nullptr || !targetObject->isAttackableBy(pet)) {
			pet->showFlyText("npc_reaction/flytext", "confused", 204, 0, 0); // "?!!?!?!"
			return INVALIDTARGET;
		}

		StringTokenizer tokenizer(arguments.toString());

		if (!tokenizer.hasMoreTokens())
			return GENERALERROR;

		int attackNumber = tokenizer.getIntToken();

		if (!tokenizer.hasMoreTokens())
			return GENERALERROR;

		uint64 playerID = tokenizer.getLongToken();

		Reference<CreatureObject*> player = server->getZoneServer()->getObject(playerID, true).castTo<CreatureObject*>();

		if (player == nullptr)
			return GENERALERROR;

		if (player->isSwimming() || pet->isSwimming()) {
			pet->showFlyText("npc_reaction/flytext", "confused", 204, 0, 0); // "?!!?!?!"
			return GENERALERROR;
		}

		Locker tarLocker(targetObject, creature);

		if (!targetObject->isAttackableBy(pet)) {
			pet->showFlyText("npc_reaction/flytext", "confused", 204, 0, 0); // "?!!?!?!"
			return INVALIDTARGET;
		}

		if (!CollisionManager::checkLineOfSight(player, targetObject) || !playerEntryCheck(player, targetObject)) {
			pet->showFlyText("npc_reaction/flytext", "confused", 204, 0, 0); // "?!!?!?!"
			return INVALIDTARGET;
		}

		ManagedReference<TangibleObject*> targetTano = targetObject.castTo<TangibleObject*>();

		if (attackNumber < 1 || attackNumber > 2)
			return INVALIDPARAMETERS;

		Locker clocker(controlDevice, creature);

		switch (attackNumber) {
		case 1:
			controlDevice->setLastCommand(PetManager::SPECIAL_ATTACK1);
			break;
		case 2:
			controlDevice->setLastCommand(PetManager::SPECIAL_ATTACK2);
			break;
		}

		controlDevice->setLastCommandTarget(targetTano);

		if (!pet->isInCombat()) {
			pet->notifyObservers(ObserverEventType::STARTCOMBAT, pet->getLinkedCreature().get());
		} else if (targetTano != pet->getFollowObject().get()) {
			pet->setDefender(targetTano);
		}

		pet->selectSpecialAttack(attackNumber - 1);
		pet->enqueueAttack(QueueCommand::FRONT);

		return SUCCESS;
	}
};

#endif /* PETSPECIALATTACKCOMMAND_H_ */
