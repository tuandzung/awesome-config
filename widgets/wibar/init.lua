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

local separators = lain.util.separators
-- Separators
local spr        = wibox.widget.textbox(' ')
local arrl_dl    = separators.arrow_left(beautiful.bg_focus, 'alpha')
local arrl_ld    = separators.arrow_left('alpha', beautiful.bg_focus)

return function(s)
    local systray = wibox.widget.systray()
    systray.base_size = beautiful.systray_icon_size

    local final_systray = wibox.widget {
        systray,
        halign = 'center',
        valign = 'center',
        layout = wibox.container.place
    }

    s.widgets = {
        layoutbox = layoutbox(s),
        taglist = taglist(s),
        tasklist = tasklist(s),
        keyboardlayout = awful.widget.keyboardlayout(),
        promptbox = awful.widget.prompt(),
        systray = final_systray,
        textclock = wibox.widget.textclock(),
    }

    s.widgets.wibar = awful.wibar({
        screen = s,
        position = 'top',
        margins = {
            top = beautiful.wibar_margin,
            left = beautiful.wibar_margin * 10,
            right = beautiful.wibar_margin * 10,
        },
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
                {
                    layout = awful.widget.only_on_screen,
                    screen = 'primary',
                    {
                        layout = wibox.layout.fixed.horizontal,
                        s.widgets.keyboardlayout,
                    }
                },
                arrl_ld,
                {
                    layout = awful.widget.only_on_screen,
                    screen = 'primary',
                    {
                        layout = wibox.layout.fixed.horizontal,
                        wibox.container.background(bw.artist_widget, beautiful.bg_focus),
                        wibox.container.background(bw.spotifyicon, beautiful.bg_focus),
                        wibox.container.background(bw.title_widget, beautiful.bg_focus),
                        arrl_dl,
                        lw.netdownicon,
                        lw.netdowninfo,
                        lw.netupicon,
                        lw.netupinfo,
                        spr,
                        arrl_ld,
                        wibox.container.background(lw.cpuicon, beautiful.bg_focus),
                        wibox.container.background(lw.cpu.widget, beautiful.bg_focus),
                        arrl_dl,
                        lw.tempicon,
                        lw.temp.widget,
                        arrl_ld,
                        wibox.container.background(lw.memicon, beautiful.bg_focus),
                        wibox.container.background(lw.mem.widget, beautiful.bg_focus),
                        arrl_dl,
                        lw.hddicon,
                        lw.hdd.widget,
                        arrl_ld,
                        wibox.container.background(lw.volicon, beautiful.bg_focus),
                        wibox.container.background(lw.volume.widget, beautiful.bg_focus),
                        arrl_dl,
                        lw.clockicon,
                        lw.clock,
                        spr,
                        arrl_ld,
                    }
                },
                wibox.container.background(s.widgets.layoutbox, beautiful.bg_focus),
            },
        },
    })

    -- s.widgets.wibar = awful.wibar({
    -- screen = s,
    -- position = 'bottom',
    -- height = beautiful.bottom_panel_height,
    -- widget = {
    -- layout = wibox.layout.align.horizontal,
    -- -- left widgets
    -- {
    -- layout = wibox.layout.fixed.horizontal,
    -- s.widgets.taglist,
    -- },
    -- -- middle widgets
    -- s.widgets.tasklist,
    -- -- right widgets
    -- {
    -- layout = wibox.layout.fixed.horizontal,
    -- s.widgets.systray
    -- },
    -- },
    -- })
end
