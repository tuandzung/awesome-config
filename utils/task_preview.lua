local awful = require('awful')
local bling = require('bling')
local beautiful = require('beautiful')
local dpi = require('beautiful.xresources').apply_dpi

bling.widget.task_preview.enable {
    placement_fn = function(c)
        awful.placement.top_left(c, {
            margins = {
                top = beautiful.top_panel_height + beautiful.useless_gap,
                left = dpi(150)
            }
        })
    end
}
