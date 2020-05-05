-- file : init.lua

config = require("config")

dofile("credentials.lua")

print("Starting ESP-"..config.CLIENT_ID.."...")

require("setup").start()

-- Apps modules
switchUdp = require("switchUdp")
heartbeat = require("heartbeat")

-- start apps
switchUdp.start()
heartbeat.start()
