-- file : config.lua
local module = {}

-- Device
module.CLIENT_ID = node.chipid()
module.DEVICE_TYPE = "puppetrace"

-- Wifi Settings
module.SSID = {}
module.SSID["yourssid"] = "yourpwd"
-- module.SSID["ssid"] = "pwd"
-- ...

-- UDP Server
module.UDP_SERVER_HOST = "127.0.0.1"
module.UDP_SERVER_PORT = 4000

-- LED
module.LED_DATA_PIN = 4

-- Switch
module.SWITCH_DATA_PIN = 3  -- The contact switch is connected to pin
module.SWITCH_DELAY = 1000  -- [ms]

return module
