/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef FORCEREVIVECOMMAND_H_
#define FORCEREVIVECOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/creature/buffs/PrivateBuff.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/managers/gcw/GCWManager.h"

class ForceReviveCommand : public JediQueueCommand {
public:

	ForceReviveCommand(const String& name, ZoneProcessServer* server)
		: JediQueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (isWearingArmor(creature)) {
			return NOJEDIARMOR;
		}
		
		int res = doCommonJediSelfChecks(creature);
		if (res != SUCCESS)
			return res;		

		ManagedReference<SceneObject*> object = server->getZoneServer()->getObject(target);

		// Fail if target is not a player...
		if (object == nullptr || !object->isPlayerCreature())
			return INVALIDTARGET;

		if (object != nullptr) {
			if (!object->isCreatureObject()) {
				TangibleObject* tangibleObject = dynamic_cast<TangibleObject*>(object.get());

				if (tangibleObject != nullptr && tangibleObject->isAttackableBy(creature)) {
					object = creature;
				} else {
					creature->sendSystemMessage("@healing_response:healing_response_a2"); //You cannot apply resuscitation medication without a valid target!
					return GENERALERROR;
				}
			}
		}
		else {
			object = creature;
		}


		ManagedReference<CreatureObject*> creatureTarget = cast<CreatureObject*>(object.get());

		if (creatureTarget == nullptr)
			return INVALIDTARGET;
		
		Locker clocker(creatureTarget, creature);

		if (!creatureTarget->isPlayerCreature()) {
			creature->sendSystemMessage("@healing_response:healing_response_a3"); // You cannot apply resuscitation medication to a non-player entity!
			return GENERALERROR;
		}

		if (creatureTarget == creature) {
			creature->sendSystemMessage("@error_message:target_self_disallowed"); //You cannot target yourself with this command.
			return GENERALERROR;
		}

		if(!checkDistance(creature, creatureTarget, 32))
			return TOOFAR;

		if (!canPerformSkill(creature, creatureTarget))
			return 0;

		bool playerFactionBase = false;
		ManagedReference<SceneObject*> parent = creatureTarget->getParent().get();
		if (parent != nullptr && parent->isCellObject()) {
			ManagedReference<CellObject*> cell = cast<CellObject*>(parent.get());
			if (cell != nullptr) {
				ManagedReference<BuildingObject*> building = cell->getParent().get().castTo<BuildingObject*>();
				if (building != nullptr) {
					int baseType = building->getFactionBaseType();
					if (baseType == 1) {   //PLAYERFACTIONBASE = 1
						playerFactionBase = true;
					}
				}
			}
		}

		if (playerFactionBase && !creatureTarget->checkCooldownRecovery("forceRevive"))  {
			const Time* cooldownTime = creatureTarget->getCooldownTime("forceRevive");
			if (cooldownTime != nullptr) {
				float timeLeft = fabs(cooldownTime->miliDifference()) / 1000.f;
				creature->sendSystemMessage("You can use the forceRevive command again on this target in " + String::format("%.1f", timeLeft) + " second" + ((timeLeft == 1.0f) ? "." : "s."));
				return GENERALERROR;
			}
			else {
				creature->sendSystemMessage("You can only use forceRevive command inside a faction base once every 10 minutes.");
                return GENERALERROR;
			}
		}	
		
		int healthToHeal = 1500;
		int actionToHeal = 1500;
		int mindToHeal = 1500;

		int healedHealth = creatureTarget->healDamage(creature, CreatureAttribute::HEALTH, healthToHeal);
		int healedAction = creatureTarget->healDamage(creature, CreatureAttribute::ACTION, actionToHeal);
		int healedMind = creatureTarget->healDamage(creature, CreatureAttribute::MIND, mindToHeal);

		creatureTarget->removeFeignedDeath();

		int healedHealthWounds = creatureTarget->healWound(creature, CreatureAttribute::HEALTH, 250);
		int healedActionWounds = creatureTarget->healWound(creature, CreatureAttribute::ACTION, 250 );
		int healedMindWounds = creatureTarget->healWound(creature, CreatureAttribute::MIND, 250);

		checkForTef(creature, creatureTarget);

		applyDebuff(creatureTarget);

		creatureTarget->notifyObservers(ObserverEventType::CREATUREREVIVED, creature, 0);		

		if (playerFactionBase) {
			int cooldown = 600000;  // 10 minutes
			creatureTarget->updateCooldownTimer("forceRevive", cooldown); 
		}
				
		return SUCCESS;
	}

	bool canPerformSkill(CreatureObject* creature, CreatureObject* creatureTarget) const {
		if (!creatureTarget->isDead()) {
			creature->sendSystemMessage("@healing_response:healing_response_a4"); //Your target does not require resuscitation!
			return false;
		}

		if (!creatureTarget->isResuscitable()) {
			creature->sendSystemMessage("@healing_response:too_dead_to_resuscitate"); //Your target has been dead too long. There is no hope of resuscitation.
			return false;
		}

		if (!creatureTarget->isHealableBy(creature)) {
			creature->sendSystemMessage("@healing:pvp_no_help");  //It would be unwise to help such a patient.
			return false;
		}

		ManagedReference<GroupObject*> group = creature->getGroup();

		if (group == nullptr || !group->hasMember(creatureTarget)) {
			if (creature->isPlayerCreature()) {
				CreatureObject* player = cast<CreatureObject*>(creature);
				CreatureObject* consentOwner = cast<CreatureObject*>( creatureTarget);

				PlayerObject* ghost = consentOwner->getPlayerObject();

				if (!ghost->hasInConsentList(player->getFirstName().toLowerCase())) {
					if ((consentOwner->getWeapon() != nullptr && consentOwner->getWeapon()->isJediWeapon()) || consentOwner->hasSkill("force_title_jedi_rank_02")) {
						creature->sendSystemMessage("@healing_response:jedi_must_consent"); // You must have consent from a Jedi resuscitation target!
						return false;
					} else {
						creature->sendSystemMessage("@healing_response:must_be_grouped"); //You must be grouped with or have consent from your resuscitation target!
						return false;
					}
				}

			} else {
				return false;
			}
		}
		return true;
	}

	float getCommandDuration(CreatureObject* object, const UnicodeString& arguments) const {
		return defaultTime * 3.0;
	}

    void applyDebuff(CreatureObject* creature) const {
		// Apply grogginess debuff
        ManagedReference<PrivateBuff *> debuff = new PrivateBuff(creature, STRING_HASHCODE("private_groggy_debuff"), 60, BuffType::JEDI);
		Locker locker(debuff);

        for(int i=0; i<CreatureAttribute::ARRAYSIZE; i++)
   	        debuff->setAttributeModifier(i, -100);

			creature->sendSystemMessage("Your grogginess will expire in 60.0 seconds.");
            creature->addBuff(debuff);
	}

};

#endif //FORCEREVIVECOMMAND_H_
