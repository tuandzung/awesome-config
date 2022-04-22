local awful = require('awful')
local wibox = require('wibox')
local beautiful = require('beautiful')

local menu = require('widgets.menu')
local taglist = require('widgets.wibar.taglist')
local tasklist = require('widgets.wibar.tasklist')
local layoutbox = require('widgets.wibar.layoutbox')
local lain = require('lain')
local lw = require('widgets.wibar.lain_widgets')
local bw = require('widgets.wibar.bling_widgets')
local volume_widget = require('awesome-wm-widgets.volume-widget.volume')

local separators = lain.util.separators
-- Separators
local spr     = wibox.widget.textbox(' ')
local arrl_dl = separators.arrow_left(beautiful.bg_focus, 'alpha')
local arrl_ld = separators.arrow_left('alpha', beautiful.bg_focus)

return function(s)
    s.widgets = {
        layoutbox = layoutbox(s),
        taglist = taglist(s),
        tasklist = tasklist(s),
        keyboardlayout = awful.widget.keyboardlayout(),
        promptbox = awful.widget.prompt(),
        systray = wibox.widget.systray(),
        textclock = wibox.widget.textclock(),
    }

    s.widgets.wibar = awful.wibar({
        screen = s,
        position = 'top',
        height = beautiful.top_panel_height,
        widget = {
            layout = wibox.layout.align.horizontal,
            -- left widgets
            {
                layout = wibox.layout.fixed.horizontal,
                menu.launcher,
                s.widgets.taglist,
                s.widgets.promptbox,
            },
            -- middle widgets
            s.widgets.tasklist,
            -- right widgets
            {
                layout = wibox.layout.fixed.horizontal,
                s.widgets.systray,
                spr,
                arrl_ld,
                wibox.container.background(bw.musicicon, beautiful.bg_focus),
                wibox.container.background(bw.artist_widget, beautiful.bg_focus),
                wibox.container.background(bw.title_widget, beautiful.bg_focus),
                arrl_dl,
                lw.neticon,
                lw.netdowninfo,
                lw.netupinfo,
                spr,
                arrl_ld,
                wibox.container.background(lw.cpuicon, beautiful.bg_focus),
                wibox.container.background(lw.cpu.widget, beautiful.bg_focus),
                arrl_dl,
                lw.memicon,
                lw.mem.widget,
                arrl_ld,
                wibox.container.background(lw.tempicon, beautiful.bg_focus),
                wibox.container.background(lw.temp.widget, beautiful.bg_focus),
                arrl_dl,
                lw.hddicon,
                lw.hdd.widget,
                arrl_ld,
                wibox.container.background(spr, beautiful.bg_focus),
                wibox.container.background(spr, beautiful.bg_focus),
                wibox.container.background(
                    volume_widget{
                        widget_type = 'icon_and_text',
                        device = 'pipewire',
                        step = '1'
                    },
                    beautiful.bg_focus
                ),
                wibox.container.background(spr, beautiful.bg_focus),
                wibox.container.background(spr, beautiful.bg_focus),
                arrl_dl,
                lw.clock,
                spr,
                arrl_ld,
                wibox.container.background(s.widgets.layoutbox, beautiful.bg_focus),
            },
        },
    })

    -- s.widgets.wibar = awful.wibar({
        -- screen = s,
        -- position = 'bottom',
        -- widget = {
            -- layout = wibox.layout.align.horizontal,
            -- -- left widgets
            -- {
                -- layout = wibox.layout.fixed.horizontal,
                -- menu.launcher,
                -- s.widgets.taglist,
                -- s.widgets.promptbox,
            -- },
            -- -- middle widgets
            -- s.widgets.tasklist,
            -- -- right widgets
            -- {
                -- layout = wibox.layout.fixed.horizontal,
                -- arrl_dl,
                -- mem_widgets.memicon,
                -- mem_widgets.mem.widget,
                -- arrl_ld,
                -- wibox.container.background(cpu_widgets.cpuicon, beautiful.bg_focus),
                -- wibox.container.background(cpu_widgets.cpu.widget, beautiful.bg_focus),
            -- },
        -- },
    -- })
end
