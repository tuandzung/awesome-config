--- Apps table.
local _M = {
    -- common
    terminal = os.getenv('TERMINAL') or 'kitty',
    editor = os.getenv('EDITOR') or 'nvim',
    filemanager = os.getenv('FILEXP') or 'pcmanfm',
    browser = os.getenv('BROWSER') or 'firefox',
    sysmon = 'btop',
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

return _M
