local _M = {}

local awful = require('awful')
local hotkeys_popup = require('awful.hotkeys_popup')
local beautiful = require('beautiful')
local spawn = awful.spawn

local apps = require('config.apps')

_M.awesomemenu = {
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

_M.mainmenu = awful.menu({
    items = {
        { 'awesome', _M.awesomemenu, beautiful.awesome_icon },
        { 'open terminal', apps.terminal },
    },
})

_M.launcher = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = _M.mainmenu,
})

_M.session = awful.menu({
    {
        '&Lock Desktop',
        function()
            spawn(apps.lockscreen)
        end,
    },
    {
        '&Exit Desktop',
        function()
            awesome.quit()
        end,
    },
    {
        '&Reboot System',
        function()
            spawn(apps.reboot)
        end,
    },
    {
        '&Suspend System',
        function()
            spawn(apps.suspend)
        end,
    },
    {
        '&Power Off',
        function()
            spawn(apps.poweroff)
        end,
    },
})

return _M
