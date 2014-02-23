function onUse(cid, item, fromPosition, itemEx, toPosition)
	local cfg = {
	cfg.refuel = 42 * 60 * 1000,
	storageExhaust = 55668,
	exhaustTime = 86400
	}
	
		if exhaustion.check(cid, config.storageExhaust) ~= false then
			doPlayerSendCancel(cid, "You can only refill once every 24 hours!")		
		elseif(getPlayerStamina(cid) >= cfg.refuel) then
			doPlayerSendCancel(cid, "Your stamina is already full.")
		else
			doPlayerSetStamina(cid, cfg.refuel)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your stamina has been refilled.")
			exhaustion.set(cid, config.storageExhaust, config.exhaustTime)
		end
	return true
end
