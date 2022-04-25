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
local bling = require("bling")
local playerctl = bling.signal.playerctl.lib()

local separators = lain.util.separators
-- Separators
local spr     = wibox.widget.textbox(' ')
local arrl_dl = separators.arrow_left(beautiful.bg_focus, 'alpha')
local arrl_ld = separators.arrow_left('alpha', beautiful.bg_focus)

local function make_fa_icons( code )
  return wibox.widget{
    font = beautiful.icon_font .. beautiful.icon_size,
    markup = ' <span color="'.. beautiful.icon_color ..'">' .. code .. '</span> ',
    align  = 'center',
    valign = 'center',
    widget = wibox.widget.textbox
  }
end

local facpuicon = make_fa_icons('\u{f85a}')
local famemicon = make_fa_icons('\u{f2db}')
local fahddicon = make_fa_icons('\u{f7c9}')
local fatempicon = make_fa_icons('\u{fa0e}')
local fatimeicon = make_fa_icons('\u{f017}' )
local fadownload = make_fa_icons('\u{f6d9}')
local faupload = make_fa_icons('\u{fa51}')
local faspotify = make_fa_icons('\u{f1bc}')

faspotify:buttons(awful.util.table.join(
    awful.button({ }, 1, function ()
        playerctl:previous()
    end),
    awful.button({ }, 2, function ()
        playerctl:play_pause()
    end),
    awful.button({ }, 3, function ()
        playerctl:next()
    end)))

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
                {
                    layout = awful.widget.only_on_screen,
                    screen = awful.screen.focused(),
                    {
                        layout = wibox.layout.fixed.horizontal,
                        s.widgets.keyboardlayout,
                    }
                },
                arrl_ld,
                {
                    layout = awful.widget.only_on_screen,
                    screen = "primary",
                    {
                        layout = wibox.layout.fixed.horizontal,
                        wibox.container.background(faspotify, beautiful.bg_focus),
                        wibox.container.background(bw.artist_widget, beautiful.bg_focus),
                        wibox.container.background(bw.title_widget, beautiful.bg_focus),
                        arrl_dl,
                        fadownload,
                        lw.netdowninfo,
                        faupload,
                        lw.netupinfo,
                        spr,
                        arrl_ld,
                        wibox.container.background(facpuicon, beautiful.bg_focus),
                        wibox.container.background(lw.cpu.widget, beautiful.bg_focus),
                        arrl_dl,
                        fatempicon,
                        lw.temp.widget,
                        arrl_ld,
                        wibox.container.background(famemicon, beautiful.bg_focus),
                        wibox.container.background(lw.mem.widget, beautiful.bg_focus),
                        arrl_dl,
                        fahddicon,
                        lw.hdd.widget,
                        arrl_ld,
                    }
                },
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
                fatimeicon,
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
