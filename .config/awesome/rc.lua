local awful = require("awful")
local beautiful = require("beautiful")

require("main.error-handling")
require("layout")

root.keys(require("mapping").rootkeys)

awful.spawn.once("xcompmgr -cF")
beautiful.init(awful.util.getdir("config").."theme.lua")
