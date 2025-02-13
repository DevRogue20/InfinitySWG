/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef EMBOLDENPETSCOMMAND_H_
#define EMBOLDENPETSCOMMAND_H_

#include "server/zone/objects/intangible/PetControlDevice.h"
#include "server/zone/managers/creature/PetManager.h"
#include "server/zone/objects/creature/ai/AiAgent.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/managers/skill/SkillManager.h"
#include "server/zone/objects/creature/events/EmboldenPetsAvailableEvent.h"

class EmboldenpetsCommand : public QueueCommand {
public:

	EmboldenpetsCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* player, const uint64& target, const UnicodeString& arguments) const {

		// Infinity:  Updated values
		int coolDownMsec = 6 * 60 * 1000; // 6 min from start of embolden, 4 minutes after embolden ends
		int durationSec =  2 * 60; // 2 min 
		int mindCost = player->calculateCostAdjustment(CreatureAttribute::FOCUS, 100);
		unsigned int buffCRC = STRING_HASHCODE("emboldenPet");

		if (!checkStateMask(player))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(player))
			return INVALIDLOCOMOTION;

		if (player->isDead() || player->isIncapacitated())
			return INVALIDSTATE;

		auto ghost = player->getPlayerObject();
		if (ghost == nullptr)
			return GENERALERROR;

		// Check player mind
		if (player->getHAM(CreatureAttribute::MIND) <= mindCost) {
			player->sendSystemMessage("@pet/pet_menu:sys_fail_embolden"); // "You do not have enough mental focus to embolden."
			return GENERALERROR;
		}

		// Loop over all active pets
		bool petEmboldened = false;
		for (int i = 0; i < ghost->getActivePetsSize(); ++i) {

			ManagedReference<AiAgent*> pet = ghost->getActivePet(i);
			if (pet == nullptr)
				continue;

			Locker plocker(pet, player);  //Lock before getting PCD just in case

			ManagedReference<PetControlDevice*> controlDevice = pet->getControlDevice().get().castTo<PetControlDevice*>();
			if (controlDevice == nullptr)
				continue;

			// Creatures only
			if (controlDevice->getPetType() == PetManager::CREATUREPET) {

				// Check states
				if (pet->isIncapacitated() || pet->isDead())
					continue;

				// Check range
				if (!checkDistance(player, pet, 50.0f))
					continue;

				// Check if pet already has buff
				if (pet->hasBuff(buffCRC)) {
					pet->showFlyText("combat_effects","pet_embolden_no", 0, 153, 0); // "! Already Emboldened !"
					continue;
				}

				//Check cooldown
				if (!pet->checkCooldownRecovery("emboldenPetsCooldown"))  //Pet still has cooldown
					continue;

				// Build 10-20% Health, Action, Mind buff
				ManagedReference<Buff*> buff = new Buff(pet, buffCRC, durationSec, BuffType::OTHER);

				SkillManager* skillManager = SkillManager::instance();
				int chBoxes = 0;
				if (skillManager != nullptr)
					chBoxes = skillManager->getSpecificSkillCount(player,"outdoors_creaturehandler");
				float skillBonus = 0;

				skillBonus = chBoxes / 180.0f;    //Master CH = additional 10% HAM boost

				Locker locker(buff);

				int healthBuff = pet->getBaseHAM(CreatureAttribute::HEALTH) * (0.10 + skillBonus);
				int actionBuff = pet->getBaseHAM(CreatureAttribute::ACTION) * (0.10 + skillBonus);
				int mindBuff = pet->getBaseHAM(CreatureAttribute::MIND) * (0.10 + skillBonus);
				buff->setAttributeModifier(CreatureAttribute::HEALTH, healthBuff);
				buff->setAttributeModifier(CreatureAttribute::ACTION, actionBuff);
				buff->setAttributeModifier(CreatureAttribute::MIND, mindBuff);

				pet->addBuff(buff);
				pet->updateCooldownTimer("emboldenPetsCooldown",coolDownMsec);
				pet->showFlyText("combat_effects","pet_embolden", 0, 153, 0); // "! Embolden !"
				
				Reference<EmboldenPetsAvailableEvent*> task = new EmboldenPetsAvailableEvent(pet);
				pet->addPendingTask("embolden_notify", task, coolDownMsec);

				petEmboldened = true;

			} // end if creature
		} // end active pets loop

		// At least one pet was emboldened
		if (petEmboldened){
			player->inflictDamage(player, CreatureAttribute::MIND, mindCost, false);
			player->sendSystemMessage("@pet/pet_menu:sys_embolden"); // "Your pets fight with renewed vigor"
		}

		return SUCCESS;
	}

};

#endif //EMBOLDENPETSCOMMAND_H_
