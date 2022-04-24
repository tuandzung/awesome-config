local bling = require('bling')
local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

bling.widget.tag_preview.enable {
    show_client_content = true,   -- Whether or not to show the client content
    scale = 0.15,                 -- The scale of the previews compared to the screen
    honor_padding  = true,        -- Honor padding when creating widget size
    honor_workarea = false,       -- Honor work area when creating widget size
    placement_fn = function(c)    -- Place the widget using awful.placement (this overrides x & y)
        awful.placement.top_left(c, {
            margins = {
                top = beautiful.top_panel_height + beautiful.useless_gap
            }
        })
    end,
    background_widget = wibox.widget {    -- Set a background image (like a wallpaper) for the widget
        image = beautiful.wallpaper,
        horizontal_fit_policy = "fit",
        vertical_fit_policy   = "fit",
        widget = wibox.widget.imagebox
    }
}
