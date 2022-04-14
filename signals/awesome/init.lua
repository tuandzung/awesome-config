local awesome = awesome
local menus = require('widgets.menu')

--- AwesomeWM is about to enter the event loop.
awesome.connect_signal('startup', function()
    -- Load menus
    _G.menus = {
        main = menus.mainmenu,
        session = menus.session,
    }

    -- Wallpaper
    -- require('widgets.wallpaper')

    -- XDG autostart
    require('utils.autostart')
end)
