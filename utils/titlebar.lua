local nice = require('nice')
local beautiful = require("beautiful")

nice {
    win_shade_enabled = true,
    titlebar_height = beautiful.titlebar_height,
    titlebar_radius = beautiful.titlebar_radius,
    titlebar_font = beautiful.titlebar_font,
    button_size = beautiful.titlebar_button_size,
    button_margin_horizontal = beautiful.titlebar_button_margin_horizontal,
    button_margin_top = beautiful.titlebar_button_margin_top,
    minimize_color = beautiful.titlebar_fg_minimize,
    maximize_color = beautiful.titlebar_fg_maximize,
    close_color = beautiful.titlebar_fg_close,
    tooltip_messages = {
        close = "Close",
        minimize = "Minimize",
        maximize_active = "Unmaximize",
        maximize_inactive = "Maximize",
    },
    mb_resize = nice.MB_MIDDLE,
    mb_contextmenu = nice.MB_RIGHT,
}

