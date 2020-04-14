-- file : setup.lua

local module = {}

module.connected = false

local function wifi_wait_ip()
    print("Waiting for IP address...")
    if wifi.sta.getip() == nil then 
        module.connected = false
    else
        tmr.stop(1)
        print("WiFi ready: " .. wifi.sta.getip())
        module.connected = true
    end 
end

local function wifi_start(aps)
    if aps then
        for key,value in pairs(aps) do
            if config.SSID and config.SSID[key] then
                print("Connecting to " .. key .. " network.")
                wifi.sta.config(key, config.SSID[key])
                wifi.sta.connect()
                config.SSID = nil  -- more secure and save memory
                tmr.alarm(1, 2500, 1, wifi_wait_ip)            
            end
        end
    else
        print("Error getting AP list")
    end
end

function module.start()
    module.connected = false
    wifi.setmode(wifi.STATION)
    wifi.sta.getap(wifi_start)
end

return module
