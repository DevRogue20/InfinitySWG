/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef SABERCOMBOHIT2COMMAND_H_
#define SABERCOMBOHIT2COMMAND_H_

#include "JediCombatQueueCommand.h"

class SaberComboHit2Command : public JediCombatQueueCommand {
public:

	SaberComboHit2Command(const String& name, ZoneProcessServer* server)
		: JediCombatQueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (isWearingArmor(creature)) {
			return NOJEDIARMOR;
		}

		float mods[3] = {0.f, 0.f, 0.f};

		for (int i = 0; i < 2; i++)
			mods[System::random(2)] += 0.5f;

		UnicodeString args = "healthDamageMultiplier=" + String::valueOf(mods[0]) + ";actionDamageMultiplier=" + String::valueOf(mods[1]) + ";mindDamageMultiplier=" + String::valueOf(mods[2]) + ";";

		return doCombatAction(creature, target, args);
	}

};

#endif //SABERCOMBOHIT2COMMAND_H_
