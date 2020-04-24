-- file : heartbeat.lua

local module = {}

local function sendHB()
    napeti = adc.read(0)

    print("Beat "..napeti)
    -- Send packet
    socket:send(config.UDP_SERVER_PORT, config.UDP_SERVER_HOST,"BEAT_"..config.CLIENT_ID.."_"..napeti)
    -- --

end

function module.start()
    print("Heartbeat module")

    local HBtimer = tmr.create()
    HBtimer:register(config.HBINTERVAL, tmr.ALARM_AUTO, sendHB)
    HBtimer:start()
    
end

return module
