local nice = require('nice')

nice {
    win_shade_enabled = true,
    titlebar_height = 29,
    titlebar_radius = 11,
    titlebar_font = "Iosevka 10",
    button_size = 13,
    button_margin_horizontal = 5,
    button_margin_top = 2,
    minimize_color = "#ffb400",
    maximize_color = "#4CBB17",
    close_color = "#ee4266",
    sticky_color = "#774f73",
    floating_color = "#774f73",
    ontop_color = "#774f73",
    tooltip_messages = {
        close = "Close",
        minimize = "Minimize",
        maximize_active = "Unmaximize",
        maximize_inactive = "Maximize",
    },
    mb_resize = nice.MB_MIDDLE,
    mb_contextmenu = nice.MB_RIGHT,
}

