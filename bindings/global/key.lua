local awful = require('awful')
local hotkeys_popup = require('awful.hotkeys_popup')
require('awful.hotkeys_popup.keys')
local menubar = require('menubar')

local apps = require('config.apps')
local mod = require('bindings.mod')
local widgets = require('widgets')
local utils = require('utils')
local bling = require('bling')
local lw = require('widgets.wibar.lain_widgets')

local playerctl = bling.signal.playerctl.lib()

menubar.utils.terminal = apps.terminal

-- general awesome keys
awful.keyboard.append_global_keybindings({
    awful.key({
        modifiers = { mod.super },
        key = 's',
        description = 'show help',
        group = 'awesome',
        on_press = hotkeys_popup.show_help,
    }),
    awful.key({
        modifiers = { mod.super },
        key = 'w',
        description = 'show main menu',
        group = 'awesome',
        on_press = function()
            widgets.menu.mainmenu:show()
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.ctrl },
        key = 'r',
        description = 'reload awesome',
        group = 'awesome',
        on_press = awesome.restart,
    }),
    awful.key({
        modifiers = { mod.super, mod.shift },
        key = 'q',
        description = 'quit awesome',
        group = 'awesome',
        on_press = awesome.quit,
    }),
    awful.key({
        modifiers = { mod.super },
        key = 'l',
        description = 'lock screen',
        group = 'awesome',
        on_press = function()
            awful.spawn.with_shell(apps.lockscreen)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = 'Return',
        description = 'open a terminal',
        group = 'launcher',
        on_press = function()
            awful.spawn(apps.terminal)
        end,
    }),
})

-- tags related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({
        modifiers = { mod.super },
        key = 'Left',
        description = 'view preivous',
        group = 'tag',
        on_press = awful.tag.viewprev,
    }),
    awful.key({
        modifiers = { mod.super },
        key = 'Right',
        description = 'view next',
        group = 'tag',
        on_press = awful.tag.viewnext,
    }),
    awful.key({
        modifiers = { mod.super },
        key = 'Escape',
        description = 'go back',
        group = 'tag',
        on_press = awful.tag.history.restore,
    }),
})

-- focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({
        modifiers = { mod.super },
        key = 'j',
        description = 'focus next by index',
        group = 'client',
        on_press = function()
            awful.client.focus.byidx(1)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = 'k',
        description = 'focus previous by index',
        group = 'client',
        on_press = function()
            awful.client.focus.byidx(-1)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = 'Tab',
        description = 'go back',
        group = 'client',
        on_press = function()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.ctrl },
        key = 'j',
        description = 'focus the next screen',
        group = 'screen',
        on_press = function()
            awful.screen.focus_relative(1)
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.ctrl },
        key = 'n',
        description = 'restore minimized',
        group = 'client',
        on_press = function()
            local c = awful.client.restore()
            if c then
                c:active({ raise = true, context = 'key.unminimize' })
            end
        end,
    }),
})

-- layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({
        modifiers = { mod.super, mod.shift },
        key = 'j',
        description = 'swap with next client by index',
        group = 'client',
        on_press = function()
            awful.client.swap.byidx(1)
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.shift },
        key = 'k',
        description = 'swap with previous client by index',
        group = 'client',
        on_press = function()
            awful.client.swap.byidx(-1)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = 'u',
        description = 'jump to urgent client',
        group = 'client',
        on_press = awful.client.urgent.jumpto,
    }),
    awful.key({
        modifiers = { mod.super, mod.alt },
        key = 'l',
        description = 'increase master width factor',
        group = 'layout',
        on_press = function()
            awful.tag.incmwfact(0.05)
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.alt },
        key = 'h',
        description = 'decrease master width factor',
        group = 'layout',
        on_press = function()
            awful.tag.incmwfact(-0.05)
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.shift },
        key = 'h',
        description = 'increase the number of master clients',
        group = 'layout',
        on_press = function()
            awful.tag.incnmaster(1, nil, true)
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.shift },
        key = 'l',
        description = 'decrease the number of master clients',
        group = 'layout',
        on_press = function()
            awful.tag.incnmaster(-1, nil, true)
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.ctrl },
        key = 'h',
        description = 'increase the number of columns',
        group = 'layout',
        on_press = function()
            awful.tag.incnmaster(1, nil, true)
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.ctrl },
        key = 'l',
        description = 'decrease the number of columns',
        group = 'layout',
        on_press = function()
            awful.tag.incnmaster(-1, nil, true)
        end,
    }),
    awful.key({
        modifiers = { mod.alt },
        key = 'space',
        description = 'select next',
        group = 'layout',
        on_press = function()
            awful.layout.inc(1)
        end,
    }),
    awful.key({
        modifiers = { mod.alt, mod.shift },
        key = 'space',
        description = 'select previous',
        group = 'layout',
        on_press = function()
            awful.layout.inc(-1)
        end,
    }),
})

awful.keyboard.append_global_keybindings({
    awful.key({
        modifiers = { mod.super },
        keygroup = 'numrow',
        description = 'only view tag',
        group = 'tag',
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only(tag)
            end
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.ctrl },
        keygroup = 'numrow',
        description = 'toggle tag',
        group = 'tag',
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:viewtoggle(tag)
            end
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.shift },
        keygroup = 'numrow',
        description = 'move focused client to tag',
        group = 'tag',
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    }),
    awful.key({
        modifiers = { mod.super, mod.ctrl, mod.shift },
        keygroup = 'numrow',
        description = 'toggle focused client on tag',
        group = 'tag',
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    }),
})

-- volume
awful.keyboard.append_global_keybindings({
    awful.key({
        modifiers = { mod.super },
        key = ']',
        description = 'increase volume +5',
        group = 'launcher',
        on_press = function()
            awful.spawn('amixer set Master 5%+')
            lw.volume.update()
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = '[',
        description = 'decrease volume -5',
        group = 'launcher',
        on_press = function()
            awful.spawn('amixer set Master 5%-')
            lw.volume.update()
        end,
    })
})

-- open rofi
awful.keyboard.append_global_keybindings({
    awful.key({
        modifiers = { mod.super },
        key = 'space',
        description = 'open rofi app launcher',
        group = 'launcher',
        on_press = function()
            awful.spawn.with_shell(apps.apps_launcher)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = 'r',
        description = 'open rofi command launcher',
        group = 'launcher',
        on_press = function()
            awful.spawn.with_shell(apps.command_launcher)
        end,
    }),
    awful.key({
        modifiers = { mod.alt },
        key = 'v',
        description = 'show rofi clipboard',
        group = 'launcher',
        on_press = function()
            awful.spawn.with_shell(apps.clipboard_list)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = 'c',
        description = 'show rofi calculator',
        group = 'launcher',
        on_press = function()
            awful.spawn.with_shell(apps.calculator)
        end,
    }),
})

-- multimedia
awful.keyboard.append_global_keybindings({
    awful.key({
        modifiers = {},
        key = 'XF86AudioPlay',
        description = 'play song',
        group = 'multimedia',
        on_press = function()
            playerctl:play()
        end,
    }),
    awful.key({
        modifiers = {},
        key = 'XF86AudioPause',
        description = 'pause song',
        group = 'multimedia',
        on_press = function()
            playerctl:pause()
        end,
    }),
    awful.key({
        modifiers = {},
        key = 'XF86AudioStop',
        description = 'stop',
        group = 'multimedia',
        on_press = function()
            playerctl:stop()
        end,
    }),
    awful.key({
        modifiers = {},
        key = 'XF86AudioNext',
        description = 'next song',
        group = 'multimedia',
        on_press = function()
            playerctl:next()
        end,
    }),
    awful.key({
        modifiers = {},
        key = 'XF86AudioPrev',
        description = 'previous song',
        group = 'multimedia',
        on_press = function()
            playerctl:previous()
        end,
    }),
})

-- other key bindings
awful.keyboard.append_global_keybindings({
    awful.key({
        modifiers = { mod.super },
        key = 'n',
        description = 'toggle redshift',
        group = 'others',
        on_press = utils.redshift.redshift_toggle,
    }),
    awful.key({
        modifiers = { mod.super },
        key = 'm',
        description = 'music',
        group = 'others',
        on_press = function()
            awful.spawn(apps.music_cmd)
        end,
    }),
    awful.key({
        modifiers = { mod.super },
        key = 'f',
        description = 'firefox profile manager',
        group = 'others',
        on_press = function()
            awful.spawn(apps.browser)
        end,
    }),
})
