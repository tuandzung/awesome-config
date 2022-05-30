--- Apps table.
local _M = {
    -- common
    terminal = 'kitty',
    editor = 'nvim',
    filemanager = 'nnn',
    browser = 'firefox -ProfileManager',
    clipboard = 'greenclip daemon',
    sysmon = 'btop',
    mail_client = 'thunderbird',
    music_server = 'mopidy',
    music_player = 'ncspot',
    music_ctl = 'mpc',
    alfred = 'rofi',
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
_M.music_cmd = _M.terminal .. ' -e ' .. _M.music_player

_M.apps_launcher = _M.alfred .. ' -show drun'
_M.command_launcher = _M.alfred .. ' -show run'
_M.clipboard_list = _M.alfred
    .. " -modi 'clipboard:greenclip print' -show clipboard -run-command '{cmd}'"
    .. " ; "
    .. "xdotool key Shift+Insert"
_M.calculator = _M.alfred
    .. " -modi calc -show calc -no-show-match -no-sort -calc-command "
    .. '"' .. "echo -n '{result}' | xclip -selection clipboard" .. '"'

return _M
