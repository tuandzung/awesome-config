local awful = require('awful')
local ruled = require('ruled')
local beautiful = require('beautiful')

ruled.client.connect_signal('request::rules', function()
    -- All clients will match this rule.
    ruled.client.append_rule({
        id = 'global',
        rule = {},
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
            maximized_horizontal = false,
            maximized_vertical = false,
            size_hints_honor = false,
            titlebars_enabled = false,
        },
    })

    -- Floating clients.
    ruled.client.append_rule({
        id = 'floating',
        rule_any = {
            instance = { 'copyq', 'pinentry' },
            class = {
                'Arandr',
                'Blueman-manager',
                'Gpick',
                'Kruler',
                'Sxiv',
                'Tor Browser',
                'Wpa_gui',
                'veromix',
                'xtightvncviewer',
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name = {
                'Event Tester', -- xev.
            },
            role = {
                'AlarmWindow', -- Thunderbird's calendar.
                'ConfigManager', -- Thunderbird's about:config.
                'pop-up', -- e.g. Google Chrome's (detached) Developer Tools.
            },
        },
        properties = { floating = true },
    })

    -- Add titlebars to normal clients and dialogs
    -- ruled.client.append_rule({
        -- id = 'titlebars',
        -- rule_any = { type = { 'normal', 'dialog' } },
        -- properties = { titlebars_enabled = true },
    -- })

    -- Set Firefox to always map on the tag named '2' on screen 1.
    ruled.client.append_rule {
        rule_any = { class = { "Firefox", "firefox" } },
        except = { type = "dialog" },
        properties = { screen = "primary", tag = '2' }
    }

    ruled.client.append_rule {
        rule_any = { class = { "Thunderbird", instance = "Mail" } },
        properties = { screen = "primary", tag = '3' }
    }

    ruled.client.append_rule {
        rule_any = { class = { "Rambox", "Ferdi", "TelegramDesktop" } },
        properties = { screen = "primary", tag = '4' }
    }
end)
