local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local wibox = require('wibox')
local lain = require('lain')

local markup = lain.util.markup

local _M = {}

-- Textclock
_M.clockicon = wibox.widget.imagebox(beautiful.widget_clock)
_M.clock = wibox.widget.textclock()

-- Calendar
lain.widget.cal({
    attach_to = { _M.clock },
    notification_preset = {
        font = beautiful.font,
        fg   = beautiful.fg_normal,
        bg   = beautiful.bg_normal
    }
})

_M.cpuicon = wibox.widget.imagebox(beautiful.widget_cpu)
_M.cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. cpu_now.usage .. "% "))
    end
})

_M.hddicon = wibox.widget.imagebox(beautiful.widget_hdd)
_M.hdd = lain.widget.fs({
    notification_preset = { fg = beautiful.fg_normal, bg = beautiful.bg_normal, font = beautiful.font },
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. fs_now["/"].percentage .. "% "))
    end
})

_M.memicon = wibox.widget.imagebox(beautiful.widget_mem)
_M.mem = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. mem_now.used .. "MB "))
    end
})

_M.netdowninfo = wibox.widget.textbox()
_M.netupinfo = wibox.widget.textbox()

_M.neticon = wibox.widget.imagebox(beautiful.widget_net)
_M.net = lain.widget.net({
    settings = function()
        _M.netupinfo:set_markup(markup.fontfg(beautiful.font, "#e54c62", string.format("%7.1f", net_now.sent) .. " KB/s "))
        _M.netdowninfo:set_markup(markup.fontfg(beautiful.font, "#87af5f", string.format("%7.1f", net_now.received) .. " KB/s "))
    end
})

_M.tempicon = wibox.widget.imagebox(beautiful.widget_temp)
_M.temp = lain.widget.temp({
    timeout  = 2,
    tempfile = '/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon1/temp3_input',  -- AMD CPU
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. math.ceil(coretemp_now) .. "°C "))
    end
})

local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
-- local musicplr = awful.util.terminal .. " -title Music -e ncmpcpp"
local mpdicon = wibox.widget.imagebox(beautiful.widget_music)
mpdicon:buttons(my_table.join(
    -- awful.button({ "Mod4" }, 1, function () awful.spawn(musicplr) end),
    awful.button({ }, 1, function ()
        os.execute("mpc prev")
        _M.mpd.update()
    end),
    awful.button({ }, 2, function ()
        os.execute("mpc toggle")
        _M.mpd.update()
    end),
    awful.button({ }, 3, function ()
        os.execute("mpc next")
        _M.mpd.update()
    end)))
_M.mpdicon = mpdicon
_M.mpd = lain.widget.mpd({
    settings = function()
        if mpd_now.state == "play" then
            artist = " " .. mpd_now.artist .. " "
            title  = mpd_now.title  .. " "
            mpdicon:set_image(beautiful.widget_music_on)
        else
            artist = ""
            title  = ""
            mpdicon:set_image(beautiful.widget_music)
        end

        widget:set_markup(markup.font(beautiful.font, markup("#EA6F81", artist) .. title))
    end
})

return _M
