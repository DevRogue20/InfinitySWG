/*
 * LuaAiAgent.h
 *
 *  Created on: 21/01/2012
 *      Author: victor
 */

#ifndef LUAAIAGENT_H_
#define LUAAIAGENT_H_


#include "engine/engine.h"

#include "server/zone/objects/creature/LuaCreatureObject.h"

namespace server {
namespace zone {
namespace objects {
namespace creature {
namespace ai {
	class AiAgent;

	class LuaAiAgent : public LuaCreatureObject {
	public:
		// Constants
		static const char className[];
		static Luna<LuaAiAgent>::RegType Register[];

		// Initialize the pointer
		LuaAiAgent(lua_State *L);
		~LuaAiAgent();

		int _setObject(lua_State* L);
		int setAITemplate(lua_State* L);
		int setFollowObject(lua_State* L);
		int setOblivious(lua_State* L);
		int setWatchObject(lua_State* L);
		int setStalkObject(lua_State* L);
		int getFollowObject(lua_State* L);
		int storeFollowObject(lua_State* L);
		int restoreFollowObject(lua_State* L);
		int getTargetOfTargetID(lua_State* L);
		int getMovementState(lua_State* L);
		int setMovementState(lua_State* L);
		int setNextPosition(lua_State* L);
		int getMaxDistance(lua_State* L);
		int generatePatrol(lua_State* L);
		int clearPatrolPoints(lua_State* L);
		int clearCurrentPath(lua_State* L);
		int setDestination(lua_State* L);
		int isWaiting(lua_State* L);
		int stopWaiting(lua_State* L);
		int setWait (lua_State* L);
		int setCurrentSpeed(lua_State* L);
		int getTargetFromMap(lua_State* L);
		int getTargetFromDefenders(lua_State* L);
		int getTargetFromTargetsDefenders(lua_State* L);
		int validateTarget(lua_State* L);
		int validateFollow(lua_State* L);
		int followHasState(lua_State* L);
		int selectSpecialAttack(lua_State* L);
		int selectDefaultAttack(lua_State* L);
		int validateStateAttack(lua_State* L);
		int removeDefender(lua_State* L);
		int removeDefenders(lua_State* L);
		int enqueueAttack(lua_State* L);
		int isRetreating(lua_State* L);
		int isFleeing(lua_State* L);
		int runAway(lua_State* L);
		int getKinetic(lua_State* L);
		int getEnergy(lua_State* L);
		int getElectricity(lua_State* L);
		int getStun(lua_State* L);
		int getBlast(lua_State* L);
		int getHeat(lua_State* L);
		int getCold(lua_State* L);
		int getAcid(lua_State* L);
		int getLightSaber(lua_State* L);
		int isStalker(lua_State* L);
		int isKiller(lua_State* L);
		int getFerocity(lua_State* L);
		int getAggroRadius(lua_State* L);
		int getArmor(lua_State* L);
		int getDespawnOnNoPlayerInRange(lua_State* L);
		int getNumberOfPlayersInRange(lua_State* L);
		int getFactionString(lua_State* L);
		int getChanceHit(lua_State* L);
		int getDamageMin(lua_State* L);
		int getDamageMax(lua_State* L);
		int getBaseXp(lua_State* L);
		int getDiet(lua_State* L);
		int hasLoot(lua_State* L);
		int isEventMob(lua_State* L);
		int isPet(lua_State* L);
		int isFactionPet(lua_State* L);
		int isAggressiveTo(lua_State* L);
		int isAttackableBy(lua_State* L);
		int isCamouflaged(lua_State* L);
		int shouldRetreat(lua_State* L);
		int leash(lua_State* L);
		int clearCombatState(lua_State* L);
		int checkLineOfSight(lua_State* L);
		int activateRecovery(lua_State* L);
		int executeBehavior(lua_State* L);
		int info(lua_State* L);
		int spatialChat(lua_State* L);
		int setDefender(lua_State* L);
		int addDefender(lua_State* L);
		int assist(lua_State* L);
		int checkRange(lua_State* L);
		int getSocialGroup(lua_State* L);
		int getLastCommand(lua_State* L);
		int getLastCommandTarget(lua_State* L);
		int setLastCommandTarget(lua_State* L);
		int setAlertDuration(lua_State* L);
		int alertedTimeIsPast(lua_State* L);
		int setLevel(lua_State* L);
		int hasReactionChatMessages(lua_State* L);
		int sendReactionChat(lua_State* L);
		int addPatrolPoint(lua_State* L);
		int setConvoTemplate(lua_State* L);
		int setHomeLocation(lua_State* L);
		int setNoAiAggro(lua_State* L);
		int doDespawn(lua_State* L);
		int getCreatureTemplateName(lua_State* L);
		int isInRangeOfHome(lua_State* L);
		int getPatrolPointsSize(lua_State* L);
		int addCreatureFlag(lua_State* L);
		int removeCreatureFlag(lua_State* L);
		int setAIDebug(lua_State* L);
		int storePet(lua_State* L);
		int setEventArea(lua_State* L);
		int setHamRegenDisabled(lua_State* L);
		// Infinity:  Custom hooks
		int getPetType(lua_State* L);
	private:
		AiAgent* realObject;
	};
}
}
}
}
}

using namespace server::zone::objects::creature::ai;

#endif /* LUAAIAGENT_H_ */
