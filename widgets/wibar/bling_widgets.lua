local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local lain = require('lain')
local beautiful = require('beautiful')
local bling = require("bling")
local playerctl = bling.signal.playerctl.lib()

local markup = lain.util.markup

local _M = {}

local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local musicicon = wibox.widget.imagebox(beautiful.widget_music)
musicicon:buttons(my_table.join(
    awful.button({ }, 1, function ()
        playerctl:previous()
    end),
    awful.button({ }, 2, function ()
        playerctl:play_pause()
    end),
    awful.button({ }, 3, function ()
        playerctl:next()
    end)))
_M.musicicon = musicicon

_M.name_widget = wibox.widget {
    markup = markup.font(beautiful.font, " No player "),
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

_M.title_widget = wibox.widget {
    markup = markup.font(beautiful.font, " Nothing playing "),
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

_M.artist_widget = wibox.widget {
    markup = markup.font(beautiful.font, " Nothing playing  >>"),
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

return _M
