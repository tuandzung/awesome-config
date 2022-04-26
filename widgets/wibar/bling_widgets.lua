local awful = require('awful')
local wibox = require('wibox')
local lain = require('lain')
local beautiful = require('beautiful')
local make_fa_icons = require('utils.helpers').make_fa_icons
local bling = require('bling')

local playerctl = bling.signal.playerctl.lib()

local markup = lain.util.markup

local _M = {}

_M.name_widget = wibox.widget {
    markup = markup.font(beautiful.font, " No player "),
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

_M.title_widget = wibox.widget {
    markup = markup.font(beautiful.font, " "),
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

_M.artist_widget = wibox.widget {
    markup = markup.font(beautiful.font, " "),
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

_M.spotifyicon = make_fa_icons('\u{f1bc}')

_M.spotifyicon:buttons(awful.util.table.join(
    awful.button({ }, 1, function ()
        playerctl:previous()
    end),
    awful.button({ }, 2, function ()
        playerctl:play_pause()
    end),
    awful.button({ }, 3, function ()
        playerctl:next()
    end)))

return _M
