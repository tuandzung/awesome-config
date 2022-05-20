local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local wibox = require('wibox')
local lain = require('lain')
local make_fa_icons = require('utils.helpers').make_fa_icons

local markup = lain.util.markup

local _M = {}

_M.cpuicon = make_fa_icons('\u{f85a}')
_M.memicon = make_fa_icons('\u{f2db}')
_M.hddicon = make_fa_icons('\u{f7c9}')
_M.tempicon = make_fa_icons('\u{fa0e}')
_M.clockicon = make_fa_icons('\u{f017}')
_M.netdownicon = make_fa_icons('\u{f6d9}')
_M.netupicon = make_fa_icons('\u{fa51}')
_M.volicon = make_fa_icons('\u{fa7d}')

-- Textclock
_M.clock = wibox.widget.textclock()

-- Calendar
lain.widget.cal({
    attach_to = { _M.clock },
    notification_preset = {
        font         = beautiful.font,
        fg           = beautiful.fg_normal,
        bg           = beautiful.bg_focus,
        border_color = beautiful.border_marked,
    }
})

_M.cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. cpu_now.usage .. "% "))
    end
})

_M.hdd = lain.widget.fs({
    notification_preset = {
        fg           = beautiful.fg_normal,
        bg           = beautiful.bg_focus,
        font         = beautiful.font,
        border_color = beautiful.border_marked,
    },
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. fs_now["/"].percentage .. "% "))
    end
})

_M.mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. mem_now.used .. "MB "))
    end
})

_M.netdowninfo = wibox.widget.textbox()
_M.netupinfo = wibox.widget.textbox()
_M.net = lain.widget.net({
    settings = function()
        _M.netupinfo:set_markup(markup.fontfg(beautiful.font, "#e54c62", string.format("%7.1f", net_now.sent) .. " KB/s "))
        _M.netdowninfo:set_markup(markup.fontfg(beautiful.font, "#87af5f", string.format("%7.1f", net_now.received) .. " KB/s "))
    end
})

_M.temp = lain.widget.temp({
    timeout  = 2,
    tempfile = '/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon1/temp3_input', -- AMD CPU
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. math.ceil(coretemp_now) .. "°C "))
    end
})

local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
-- local musicplr = awful.util.terminal .. " -title Music -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(beautiful.widget_music)
mpdicon:buttons(my_table.join(
-- awful.button({ "Mod4" }, 1, function () awful.spawn(musicplr) end),
    awful.button({}, 1, function()
        os.execute("mpc prev")
        _M.mpd.update()
    end),
    awful.button({}, 2, function()
        os.execute("mpc toggle")
        _M.mpd.update()
    end),
    awful.button({}, 3, function()
        os.execute("mpc next")
        _M.mpd.update()
    end)))
_M.mpdicon = mpdicon
_M.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title .. " "
            mpdicon:set_image(beautiful.widget_music_on)
        else
            artist = ""
            title  = ""
            mpdicon:set_image(beautiful.widget_music)
        end

        widget:set_markup(markup.font(beautiful.font, markup("#EA6F81", artist) .. title))
    end
})

local vol_mute = '\u{fa80}'
local vol_zero = '\u{fa7e}'
local vol_low = '\u{fa7f}'
local vol_high = '\u{fa7d}'

-- ALSA volume
_M.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            _M.volicon:set_markup(' <span color="' .. beautiful.icon_color .. '">' .. vol_mute .. '</span> ')
        elseif tonumber(volume_now.level) == 0 then
            _M.volicon:set_markup(' <span color="' .. beautiful.icon_color .. '">' .. vol_zero .. '</span> ')
        elseif tonumber(volume_now.level) <= 50 then
            _M.volicon:set_markup(' <span color="' .. beautiful.icon_color .. '">' .. vol_low .. '</span> ')
        else
            _M.volicon:set_markup(' <span color="' .. beautiful.icon_color .. '">' .. vol_high .. '</span> ')
        end

        widget:set_markup(markup.font(beautiful.font, " " .. volume_now.level .. "% "))
    end
})
_M.volicon:buttons(awful.util.table.join(
    awful.button({}, 1, function()
        awful.util.spawn("amixer set Master toggle")
        _M.volume.update()
    end),
    awful.button({}, 4, function()
        awful.util.spawn("amixer set Master 1%+")
        _M.volume.update()
    end),
    awful.button({}, 5, function()
        awful.util.spawn("amixer set Master 1%-")
        _M.volume.update()
    end)
))

return _M
