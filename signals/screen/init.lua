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
