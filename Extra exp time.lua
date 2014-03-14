local config = {
    rate = 4.0,
    time = 120,
    storage = 20011
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local tid = itemEx.uid or cid
    if(isPlayer(tid) == false) then
        return false
    end
    if(getPlayerStorageValue(tid, config.storage) == 1) then
        doPlayerSendTextMessage(tid, MESSAGE_STATUS_CONSOLE_BLUE, "You still have extra experience time left.")
        return true
    end
    doPlayerSendTextMessage(tid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your extra experience rate has been activated! It is now: " .. config.rate .. ".")
    doPlayerSetRate(tid, SKILL__LEVEL, config.rate)
    setPlayerStorageValue(tid, config.storage, os.time() + config.time * 60 * 1000 * 1000)
    addEvent(endExpRate, config.time * 60000, tid)
    doRemoveItem(item.uid, 1)
    return true
end

local function endExpRate(tid)
    doPlayerSetRate(tid, SKILL__LEVEL, 1.0)
    setPlayerStorageValue(tid, config.storage, -1)
    doPlayerSendTextMessage(tid, MESSAGE_STATUS_CONSOLE_RED, "Your extra experience time has ended.")
end
