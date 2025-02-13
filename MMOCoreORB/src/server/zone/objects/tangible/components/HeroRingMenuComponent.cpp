#include "HeroRingMenuComponent.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "templates/params/creature/CreatureAttribute.h"
#include "server/zone/objects/tangible/wearables/WearableObject.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/objects/tangible/components/HeroRingDataComponent.h"
#include "server/zone/packets/object/PlayClientEffectObjectMessage.h"

//Infinity:  Custom includes
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/objects/player/PlayerObject.h"

void HeroRingMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {

	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);

	TangibleObject* ring = cast<TangibleObject*>(sceneObject);

	if (ring == nullptr)
		return;

	HeroRingDataComponent* data = cast<HeroRingDataComponent*>(ring->getDataObjectComponent()->get());

	if (data == nullptr || !data->isHeroRingData())
		return;

	if (data->getCharges() > 0)
		menuResponse->addRadialMenuItem(20, 3, "@quest/hero_of_tatooine/system_messages:menu_restore"); // Restore Life

}

int HeroRingMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {

	if (selectedID == 20) { // Restore Life

		if (player == nullptr)
			return 0;

		if (!sceneObject->isASubChildOf(player))
			return 0;

		WearableObject* wearable = cast<WearableObject*>(sceneObject);

		if (wearable == nullptr)
			return 0;

		HeroRingDataComponent* data = cast<HeroRingDataComponent*>(wearable->getDataObjectComponent()->get());

		if (data == nullptr || !data->isHeroRingData())
			return 0;

		int charges = data->getCharges();

		if (charges <= 0)
			return 0;

		if (!wearable->isEquipped()) {
			player->sendSystemMessage("@quest/hero_of_tatooine/system_messages:restore_not_equipped");
			return 0;
		}

		if (!player->isDead()) {
			player->sendSystemMessage("@quest/hero_of_tatooine/system_messages:restore_not_dead");
			return 0;
		}

		ZoneServer* zoneServer = player->getZoneServer();
		if (zoneServer == nullptr)
			return 0;

		bool liveServer = zoneServer->getGalaxyName() == "SWG Infinity";   // Infinity:   Change behavior for test servers
	
		if (liveServer && !player->checkCooldownRecovery("mark_of_hero")) {   //No cooldown on test
			const Time* timeRemaining = player->getCooldownTime("mark_of_hero");
			StringIdChatParameter cooldown("quest/hero_of_tatooine/system_messages", "restore_not_yet");
			cooldown.setTO(getCooldownString(timeRemaining->miliDifference() * -1));
			player->sendSystemMessage(cooldown);
			return 0;
		}

		player->removeFeignedDeath();

		if (liveServer) {
			player->healDamage(player, CreatureAttribute::HEALTH, 200);
			player->healDamage(player, CreatureAttribute::ACTION, 200);
			player->healDamage(player, CreatureAttribute::MIND, 200);
			data->setCharges(charges - 1);
		}
		else {
			for (int i = 0; i < 9; ++i) {
				player->setWounds(i, 0);
			}	
			player->setShockWounds(0);

			player->healDamage(player, CreatureAttribute::HEALTH, 10000);
			player->healDamage(player, CreatureAttribute::ACTION, 10000);
			player->healDamage(player, CreatureAttribute::MIND, 10000);

			auto ghost = player->getPlayerObject();

			if (ghost != nullptr) {
				//close clone window
				ghost->removeSuiBoxType(SuiWindowType::CLONE_REQUEST);
				
				if (ghost->getJediState() > 1)
					ghost->setForcePower(ghost->getForcePowerMax());
			}

			ManagedReference<PlayerManager*> playerManager = zoneServer->getPlayerManager();
			if (playerManager != nullptr)
				playerManager->gmenhanceCharacter(player, 3500);
		}

		String hardpoint = "";

		if (player->getSlottedObject("ring_r") != nullptr && player->getSlottedObject("ring_r")->getObjectID() == sceneObject->getObjectID())
			hardpoint = "hold_r";
		else if (player->getSlottedObject("ring_l") != nullptr && player->getSlottedObject("ring_l")->getObjectID() == sceneObject->getObjectID())
			hardpoint = "hold_l";

		PlayClientEffectObjectMessage* effect = new PlayClientEffectObjectMessage(player, "clienteffect/item_ring_hero_mark.cef", hardpoint);
		player->broadcastMessage(effect, false);

		player->sendSystemMessage("@quest/hero_of_tatooine/system_messages:restore_msg");
		player->addCooldown("mark_of_hero", 23 * 3600 * 1000); // 23 hours

		return 0;
	} else {
		return TangibleObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
	}

}

String HeroRingMenuComponent::getCooldownString(uint32 delta) const {

	int seconds = delta / 1000;

	int hours = seconds / 3600;
	seconds -= hours * 3600;

	int minutes = seconds / 60;
	seconds -= minutes * 60;

	StringBuffer buffer;

	if (hours > 0) {
		buffer << hours << " hour";

		if (hours > 1)
			buffer << "s";

		if (minutes > 0 || seconds > 0)
			buffer << ", ";
	}

	if (minutes > 0) {
		buffer << minutes << " minute";

		if (minutes > 1)
			buffer << "s";

		if (seconds > 0)
			buffer << ", ";
	}

	if (seconds > 0) {
		buffer << seconds << " second";

		if (seconds > 1)
			buffer << "s";
	}

	return buffer.toString();
}
