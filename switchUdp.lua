-- file : switchUdp.lua
local module = {}

local switch_state = "OFF"

local function goUp()
--    if gpio.read(config.SWITCH_DATA_PIN) == gp-io.LOW then
    
--        mytimer:start()
--        return switch_state
--    end
    print("Go UP!") 
    switch_state = "OFF"
    gpio.write(config.LED_DATA_PIN, gpio.LOW)  -- Led OFF 
    return stat
end

local function onPinDown()
    if switch_state == "ON" then
        return switch_state
    end

    print("Switch down!")  -- print status
    switch_state = "ON"         
    gpio.write(config.LED_DATA_PIN,gpio.HIGH)  -- Led ON

    -- Send packet
    if connected == true then
        socket:send(config.UDP_SERVER_PORT, BroadcastIP,"TRIG_"..config.CLIENT_ID)
        print("Sent packet to Puppetrace")

        socketTCP = net.createConnection(net.TCP, 0)
        socketTCP:connect(config.LapTracerTK_PORT, config.UDP_SERVER_HOST)
        socketTCP:send(config.CLIENT_ID..string.char(13))
        print("Sent packet to LapTK")

    end

    local mytimer = tmr.create()
    mytimer:register(config.SWITCH_DELAY, tmr.ALARM_SINGLE, goUp)
    mytimer:start()
    
    return stat
end

function module.start()
    print("Switch UDP module")

    gpio.write(config.LED_DATA_PIN, gpio.LOW)  -- Led OFF
    gpio.mode(config.SWITCH_DATA_PIN, gpio.INT, gpio.PULLUP)
    gpio.trig(config.SWITCH_DATA_PIN, 'down', onPinDown)

   
end

return module
