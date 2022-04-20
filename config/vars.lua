local _M = {}

local awful = require('awful')

_M.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.max,
    awful.layout.suit.magnifier,
}

_M.tags = { '1', '2', '3', '4' }

return _M
