PlayerTriggers = { }

function PlayerTriggers:playerLoggedIn(pPlayer)
	if (pPlayer == nil) then
		return
	end
	-- Infinity Custom
	playerTriggers_infinity:playerLoggedIn(pPlayer)

	ServerEventAutomation:playerLoggedIn(pPlayer)
	BestineElection:playerLoggedIn(pPlayer)
end

function PlayerTriggers:playerLoggedOut(pPlayer)
	if (pPlayer == nil) then
		return
	end
	-- Infinity Custom
	playerTriggers_infinity:playerLoggedOut(pPlayer)

	ServerEventAutomation:playerLoggedOut(pPlayer)
end
