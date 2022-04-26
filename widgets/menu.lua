local _M = {}

local awful = require('awful')
local hotkeys_popup = require('awful.hotkeys_popup')
local beautiful = require('beautiful')
local spawn = awful.spawn
local utils = require("menubar.utils")

local apps = _G.conf.apps

local awesome_menu = {
    {
        'hotkeys',
        function()
            hotkeys_popup.show_help(nil, awful.screen.focused())
        end,
    },
    { 'manual', apps.manual_cmd },
    { 'edit config', apps.editor_cmd .. ' ' .. awesome.conffile },
    { 'restart', awesome.restart },
    { 'quit', awesome.quit },
}

local session_menu = {
    {
        'lock',
        function()
            spawn(apps.lockscreen)
        end,
    },
    {
        'reboot',
        function()
            spawn(apps.reboot)
        end,
    },
    {
        'suspend',
        function()
            spawn(apps.suspend)
        end,
    },
    {
        'power off',
        function()
            spawn(apps.poweroff)
        end,
    },
}

_M.main_menu = awful.menu({
    items = {
        { 'awesome', awesome_menu, beautiful.awesome_icon },
        { 'system', session_menu, utils.lookup_icon("applications-system") }
    },
})

_M.launcher = awful.widget.launcher({
    image = beautiful.launcher_icon,
    menu = _M.main_menu,
})

return _M
