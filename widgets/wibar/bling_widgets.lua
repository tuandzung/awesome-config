local wibox = require('wibox')
local lain = require('lain')
local beautiful = require('beautiful')

local markup = lain.util.markup

local _M = {}

_M.name_widget = wibox.widget {
    markup = markup.font(beautiful.font, " No player "),
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

_M.title_widget = wibox.widget {
    markup = markup.font(beautiful.font, ""),
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

_M.artist_widget = wibox.widget {
    markup = markup.font(beautiful.font, ""),
    align = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
}

return _M
