local awful = require('awful')
local vars = require('config.vars')
local widgets = require('widgets')

screen.connect_signal('request::wallpaper', function(s)
    widgets.wallpaper(s)
end)

screen.connect_signal('request::desktop_decoration', function(s)
    if s.index == 1
    then
        awful.tag(vars.tags, s, awful.layout.layouts[1])
    end
    if s.index == 2
    then
        awful.tag(vars.tags, s, awful.layout.layouts[2])
    end
    widgets.wibar(s)
end)

-- { Screen signal
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("added", awesome.restart)
screen.connect_signal("removed", awesome.restart)
-- }

