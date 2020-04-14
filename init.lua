-- file : init.lua

config = require("config")

print("Starting ESP-"..config.CLIENT_ID.."...")

require("setup").start()

-- Apps modules
switchUdp = require("switchUdp")

-- start apps
switchUdp.start()