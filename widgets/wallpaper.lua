local awful = require('awful')
local gears = require('gears')
local mod = require('bindings.mod')
local wallpaper = _G.conf.vars.wallpaper
local utils = require('utils')

local math, string = math, string
local collectgarbage = collectgarbage
local screen = screen

--- Filter specific image formats.
-- @tparam str file The file to check.
local file_filter = function(file)
    return string.match(file, '%.png$') or string.match(file, '%.jpg$') or string.match(file, '%.svg$')
end

--- Return table of file paths.
-- @tparam str lines The output of ls.
local get_files = function(lines)
    local files = {}
    for file in lines:gmatch('[^\r\n]+') do
        if file_filter(file) then
            local filepath = file
            table.insert(files, filepath)
        end
    end

    return files
end

--- Return random and unique table index.
-- @tparam int index The last index used.
-- @tparam int total The total number of items in table.
local get_index = function(index, total)
    local old = index

    while old == index do
        index = math.random(1, total)
    end

    return index
end

--- Get image path from table.
-- @tparam str path The directory containing the images
-- @tparam table files The files table.
-- @tparam int index The table index to use.
local get_image = function(path, files, index)
    return path .. '/' .. files[index]
end

--- Set wallpaper for screen.
-- @param str image The image path.
-- @param str mode The display mode (center, tile, max, fit).
-- @param screen s The screen to set the wallpaper for. Set to nil to span.
local set_wallpaper = function(image, mode, s)
    local color = wallpaper.color or '#333'

    if mode == 'center' then
        gears.wallpaper.centered(image, s, color, 1)
    elseif mode == 'tile' then
        gears.wallpaper.tiled(image, s, { 0, 0 })
    elseif mode == 'max' then
        gears.wallpaper.maximized(image, s, false, { 0, 0 })
    elseif mode == 'fit' then
        gears.wallpaper.fit(image, s, color)
    else
        gears.wallpaper.set(image)
    end

    collectgarbage('step', 4000)
end

--- Set keybinding to shuffle wallpaper.
-- @tparam obj timer The shuffle timer.
local set_keybinding = function(timer)
    awful.keyboard.append_global_keybindings({
        awful.key({ mod.super, mod.alt }, 'w', function()
            timer:emit_signal('wallpaper_shuffle')
        end, { description = 'set random wallpaper', group = 'Awesome: extras' }),
    })
end

local path = wallpaper.path
local mode = wallpaper.mode or 'max'
local span = wallpaper.span or false
local color = wallpaper.color or '#333'
local timeout = wallpaper.timeout or 10
local timer = gears.timer({ timeout = timeout })

-- If path is directory, enable shuffler
if utils.is_dir(path) then
    awful.spawn.easy_async('ls -a "' .. path .. '"', function(lines)
        local files = get_files(lines)
        local index = get_index(1, #files)
        local image = get_image(path, files, index)

        for s = 1, screen.count() do
            if span then
                s = nil
            end
            set_wallpaper(image, mode, s)
            if span then
                break
            end
        end

        -- Convert timeout to seconds
        timeout = timeout * 60

        if timeout >= 1 then
            timer:connect_signal('wallpaper_shuffle', function()
                timer:stop()

                index = get_index(index, #files)
                image = get_image(path, files, index)

                for s = 1, screen.count() do
                    if span then
                        s = nil
                    end
                    set_wallpaper(image, mode, s)
                    if span then
                        break
                    end
                end

                timer.timeout = timeout
                timer:start()
            end)

            timer:start()
        end

        if timer.started then
            set_keybinding(timer)
        end
    end)

    -- If path is file, set single wallpaper
elseif utils.is_file(path) then
    for s = 1, screen.count() do
        if span then
            s = nil
        end
        set_wallpaper(path, mode, s)
        if span then
            break
        end
    end

    -- If anything else, set solid color
else
    -- TODO: generate Awesome wallpaper instead
    gears.wallpaper.set(color)
end
