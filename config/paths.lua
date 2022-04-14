local gfs = require('gears.filesystem')

local config_dir = gfs.get_configuration_dir()
local cache_dir = os.getenv('XDG_CACHE_HOME') .. '/awesome/' or config_dir .. '/awesome/cache/'

return {
    config = config_dir,
    themes = config_dir .. '/themes/',
    cache = cache_dir,
    autostart = '/etc/xdg/autostart/:$XDG_CONFIG_HOME/autostart/',
    icons = {
        '/usr/share/icons/Antsy',
        '/usr/share/icons/Papirus/',
        '/usr/share/pixmaps/',
    },
}

-- vim: ft=lua:et:sw=4:ts=8:sts=4:tw=80:fdm=marker
