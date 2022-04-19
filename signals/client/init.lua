local gears = require('gears')
local beautiful = require('beautiful')
local awful = require('awful')
require('awful.autofocus')
local wibox = require('wibox')

client.connect_signal("manage", function (c)
  c.shape = function(cairo, width, height)
    gears.shape.rounded_rect(cairo, width, height, beautiful.border_radius)
  end

  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
    and not c.size_hints.user_position
    and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)

client.connect_signal('mouse::enter', function(c)
    c:activate({ context = 'mouse_enter', raise = false })
end)

-- client.connect_signal('request::titlebars', function(c)
    -- -- buttons for the titlebar
    -- local buttons = {
        -- awful.button({
            -- modifiers = {},
            -- button = 1,
            -- on_press = function()
                -- c:activate({ context = 'titlebar', action = 'mouse_move' })
            -- end,
        -- }),
        -- awful.button({
            -- modifiers = {},
            -- button = 3,
            -- on_press = function()
                -- c:activate({ context = 'titlebar', action = 'mouse_resize' })
            -- end,
        -- }),
    -- }

    -- awful.titlebar(c).widget = {
        -- -- left
        -- {
            -- awful.titlebar.widget.iconwidget(c),
            -- buttons = buttons,
            -- layout = wibox.layout.fixed.horizontal,
        -- },
        -- -- middle
        -- {
            -- -- title
            -- {
                -- align = 'center',
                -- widget = awful.titlebar.widget.titlewidget(c),
            -- },
            -- buttons = buttons,
            -- layout = wibox.layout.flex.horizontal,
        -- },
        -- -- right
        -- {
            -- awful.titlebar.widget.floatingbutton(c),
            -- awful.titlebar.widget.maximizedbutton(c),
            -- awful.titlebar.widget.stickybutton(c),
            -- awful.titlebar.widget.ontopbutton(c),
            -- awful.titlebar.widget.closebutton(c),
            -- layout = wibox.layout.fixed.horizontal(),
        -- },
        -- layout = wibox.layout.align.horizontal,
    -- }
-- end)
