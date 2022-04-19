local awful = require('awful')
local vars = require('config.vars')
local widgets = require('widgets')

screen.connect_signal('request::wallpaper', function(s)
    widgets.wallpaper(s)
end)

screen.connect_signal('request::desktop_decoration', function(s)
    awful.tag(vars.tags, s, awful.layout.layouts[1])
    widgets.wibar(s)
end)

-- { Screen signal
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("added", awesome.restart)
screen.connect_signal("removed", awesome.restart)
-- }

