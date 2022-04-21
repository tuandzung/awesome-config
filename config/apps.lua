--- Apps table.
local _M = {
    -- common
    terminal = 'kitty',
    editor = 'nvim',
    filemanager = 'nnn',
    browser = 'firefox',
    clipboard = 'copyq',
    sysmon = 'btop',
    mail_client = 'thunderbird',
    music_server = 'mopidy',
    music_player = 'ncmpcpp',
    music_ctl = 'mpc',
    -- session menu
    lockscreen = 'gnome-screensaver-command -l && dm-tool switch-to-greeter',
    reboot = 'systemctl reboot',
    suspend = 'systemctl suspend',
    poweroff = 'systemctl poweroff',
}

-- Commands that need a terminal
_M.editor_cmd = _M.terminal .. ' -e ' .. _M.editor
_M.manual_cmd = _M.terminal .. ' -e man awesome'
_M.sysmon_cmd = _M.terminal .. ' -e ' .. _M.sysmon
_M.fm_cmd = _M.terminal .. ' -e ' .. _M.filemanager
_M.music_cmd = _M.terminal .. ' -e ' .. _M.music_player

_M.clipboard_list = _M.clipboard .. " " .. "menu"

return _M
