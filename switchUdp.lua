-- file : switchUdp.lua
local module = {}

local switch_state = "OFF"

local function goUp()
    if gpio.read(config.SWITCH_DATA_PIN) == gpio.LOW then
        tmr.alarm(0, config.SWITCH_DELAY, tmr.ALARM_SINGLE, goUp)
        return switch_state
    end
    print("Go UP!") 
    switch_state = "OFF"
    gpio.write(config.LED_DATA_PIN, gpio.HIGH)  -- Led OFF 
    return stat
end

local function onPinDown()
    if switch_state == "ON" then
        return switch_state
    end

    print("Switch down!")  -- print status
    switch_state = "ON"         
    gpio.write(config.LED_DATA_PIN,gpio.LOW)  -- Led ON

    -- Send packet
    socket:send(config.CLIENT_ID)
    -- --
    
    tmr.alarm(0, config.SWITCH_DELAY, tmr.ALARM_SINGLE, goUp)
    return stat
end

function module.start()
    print("Switch UDP module")

    gpio.write(config.LED_DATA_PIN, gpio.HIGH)  -- Led OFF

    gpio.mode(config.SWITCH_DATA_PIN, gpio.INPUT, gpio.PULLUP)
    gpio.trig(config.SWITCH_DATA_PIN, 'down', onPinDown)

    socket = net.createConnection(net.UDP, 0)
    socket:connect(config.UDP_SERVER_PORT, config.UDP_SERVER_HOST)
end

return module