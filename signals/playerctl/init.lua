local beautiful = require("beautiful")
local naughty = require("naughty")
local bling = require("bling")
local wibar_widgets = require("widgets.wibar.bling_widgets")
local playerctl = bling.signal.playerctl.lib()
local lain = require("lain")

local markup = lain.util.markup

playerctl:connect_signal("metadata",
                       function(_, title, artist, album_path, album, new, player_name)
    if new == true then
        naughty.notify({title = title, text = artist, image = album_path})
    end
end)

-- Get Song Info
playerctl:connect_signal("metadata",
                       function(_, title, artist, album_path, album, new, player_name)
    -- Set art widget
    -- art:set_image(gears.surface.load_uncached(album_path))

    -- Set player name, title and artist widgets
    wibar_widgets.name_widget:set_markup_silently(markup.font(beautiful.font, " " .. player_name .. " "))
    wibar_widgets.title_widget:set_markup_silently(markup.font(beautiful.font, " " .. title .. " "))
    wibar_widgets.artist_widget:set_markup_silently(markup.font(beautiful.font, " " .. artist .. " "))
end)
