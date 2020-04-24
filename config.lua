-- file : config.lua
local module = {}

-- Device
module.CLIENT_ID = node.chipid()
module.DEVICE_TYPE = "puppetrace"

-- Wifi Settings
module.SSID = {}
module.SSID["W_R0"] = "xxx"
--module.SSID["ssid"] = "pwd"
-- ...

-- UDP Server
module.UDP_SERVER_HOST = "172.22.100.81"
module.UDP_SERVER_PORT = 4000

-- LED
module.LED_DATA_PIN = 2

-- Switch
module.SWITCH_DATA_PIN = 1  -- The contact switch is connected to pin
module.SWITCH_DELAY = 1000  -- [ms]

-- Heartbeat
module.HBINTERVAL = 10000 -- [ms]

return module
