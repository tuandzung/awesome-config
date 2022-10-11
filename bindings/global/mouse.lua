local awful = require('awful')
local widgets = require('widgets')

awful.mouse.append_global_mousebindings({
    awful.button({
        modifiers = {},
        button = 3,
        on_press = function()
            widgets.menu.main_menu:toggle()
        end,
    }),
})
