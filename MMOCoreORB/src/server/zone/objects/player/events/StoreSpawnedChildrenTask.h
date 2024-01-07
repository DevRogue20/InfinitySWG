
#ifndef STORESPAWNEDCHILDRENTASK_H_
#define STORESPAWNEDCHILDRENTASK_H_

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/intangible/PetControlDevice.h"
#include "server/zone/objects/intangible/tasks/PetControlDeviceStoreTask.h"
//Infinity:  Custom includes
#include "server/zone/objects/player/events/ClearActivePetsTask.h"

class StoreSpawnedChildrenTask : public Task {
	ManagedWeakReference<CreatureObject*> play;
	Vector<ManagedReference<CreatureObject*>> children;

public:
	StoreSpawnedChildrenTask(CreatureObject* creo, Vector<ManagedReference<CreatureObject*>>&& ch) : play(creo), children(std::move(ch)) {
	}

	void run() {
		ManagedReference<CreatureObject*> player = play.get();

		if (player == nullptr)
			return;

		Locker locker(player);

		for (int i = 0; i < children.size(); ++i) {
			CreatureObject* child = children.get(i);

			if (child == nullptr)
				continue;

			Locker clocker(child, player);

			ManagedReference<ControlDevice*> controlDevice = child->getControlDevice().get();

			if (controlDevice == nullptr)
				continue;

			if (controlDevice->isPetControlDevice()) {
				PetControlDeviceStoreTask* storeTask = new PetControlDeviceStoreTask(controlDevice.castTo<PetControlDevice*>(), player, true);

				if (storeTask != nullptr)
					storeTask->execute();
			} else {
				Locker deviceLocker(controlDevice);
				controlDevice->storeObject(player, true);
			}
		}

		//Infinity:  Custom code to clear active pets
		auto ghost = player->getPlayerObject();
		if (ghost != nullptr) {
			ClearActivePetsTask* task = new ClearActivePetsTask(ghost);
			task->schedule(2000);  //Wait 2 seconds for pets to store just in case
		}
	}
};

#endif /* STORESPAWNEDCHILDRENTASK_H_ */
