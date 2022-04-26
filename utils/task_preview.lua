local awful = require('awful')
local bling = require('bling')
local wibar = require('widgets.wibar')

bling.widget.task_preview.enable {
    placement_fn = function(c)
        awful.placement.next_to(c, {
            wibar,
            {
                preferred_positions = "bottom",
                preferred_anchors   = "middle",
            }
        })
    end
}
