-- awesome_mode: api-level=4:screen=on

-- load luarocks if installed
pcall(require, 'luarocks.loader')

_G.conf = require('config')

local awful = require('awful')
-- load theme
local beautiful = require('beautiful')
local gears = require('gears')
beautiful.init(gears.filesystem.get_themes_dir() .. 'default/theme.lua')

local rc_dir = awful.util.get_configuration_dir()
package.path = package.path .. ';' .. rc_dir .. 'modules/?.lua;' .. rc_dir .. 'modules/?/init.lua'

require('bindings')

-- load rules
require('rules')

-- load signals
require('signals')

require('utils')

require('modules')
