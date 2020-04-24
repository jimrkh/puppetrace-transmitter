-- file : setup.lua

local module = {}

module.connected = false


local function wifi_wait_ip()
    print("Waiting for IP address...")
    if wifi.sta.getip() == nil then 
        module.connected = false
    else
        IPtimer:stop()
        print("WiFi ready: " .. wifi.sta.getip())
        module.connected = true
    end 
end

local function wifi_start(aps)
    if aps then
        for key,value in pairs(aps) do
           if config.SSID and config.SSID[key] then
                print("Connecting to " .. key .. " network.")
                
                wifi.sta.config({ssid=key, pwd=config.SSID[key]})
                wifi.sta.connect()
                config.SSID = nil  -- more secure and save memory
                IPtimer:start()

            end
        end
    else
          print("Error getting AP list")
    end
end

function module.start()

    adc.force_init_mode(adc.INIT_ADC)
    IPtimer = tmr.create()
    IPtimer:register(2500, tmr.ALARM_AUTO, wifi_wait_ip)
    
    module.connected = false
    wifi.setmode(wifi.STATION)
    wifi.sta.getap(wifi_start)
    
    
end

return module
