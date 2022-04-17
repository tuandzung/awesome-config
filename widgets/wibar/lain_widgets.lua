local awful = require('awful')
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
        _M.netupinfo:set_markup(markup.fontfg(beautiful.font, "#e54c62", string.format("%06.1f", net_now.sent) .. " KB/s "))
        _M.netdowninfo:set_markup(markup.fontfg(beautiful.font, "#87af5f", string.format("%06.1f", net_now.received) .. " KB/s "))
    end
})

_M.tempicon = wibox.widget.imagebox(beautiful.widget_temp)
_M.temp = lain.widget.temp({
    timeout  = 2,
    tempfile = '/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon0/temp3_input',  -- AMD CPU
    settings = function()
        widget:set_markup(markup.font(beautiful.font, " " .. math.ceil(coretemp_now) .. "°C "))
    end
})

return _M
