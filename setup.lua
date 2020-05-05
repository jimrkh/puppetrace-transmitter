-- file : setup.lua

local module = {}

connected = false
LapTrackerTK = false

local function wifi_wait_ip()
    print("Waiting for IP address...")
    if wifi.sta.getip() == nil then 
        connected = false
    else
        IPtimer:stop()
        print("WiFi ready Local IP: " .. wifi.sta.getip())
        BroadcastIP = wifi.sta.getbroadcast()
        print("Broadcast IP: " .. BroadcastIP)
        connected = true
        socket = net.createUDPSocket()
       
    end 
end

local function wifi_start(aps)
    if aps then
        for key,value in pairs(aps) do
           if SSID and SSID[key] then
                print("Connecting to " .. key .. " network.")
                wifi.sta.config({ssid=key, pwd=SSID[key]})
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
