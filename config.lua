-- file : config.lua
local module = {}

-- Device
module.CLIENT_ID = node.chipid()
module.DEVICE_TYPE = "puppetrace"

-- Wifi Settings

--module.SSID["ssid"] = "pwd"
-- ...

-- UDP Server
module.UDP_SERVER_HOST = "192.168.137.1"
module.UDP_SERVER_PORT = 4000
module.LapTracerTK_PORT = 65000

-- LED
module.LED_DATA_PIN = 2

-- Switch
module.SWITCH_DATA_PIN = 5  -- The contact switch is connected to pin
module.SWITCH_DELAY = 1000  -- [ms]

-- Heartbeat
module.HBINTERVAL = 10000 -- [ms]



return module
