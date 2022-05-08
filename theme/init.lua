local awful   = require("awful")
local dpi     = require("beautiful.xresources").apply_dpi
local helpers = require("utils.helpers")

local theme                                     = {}
theme.dir                                       = awful.util.get_configuration_dir() .. "theme"
theme.wallpaper                                 = theme.dir .. "/wall.png"
theme.font                                      = "M+ Nerd Font 10"
theme.launcher_icon                             = theme.dir .. "/icons/arch.svg"
theme.awesome_icon                              = theme.dir .. "/icons/awesome.png"
theme.icon_theme                                = "Papirus-Dark"
theme.fg_normal                                 = "#DDDDFF"
theme.fg_focus                                  = "#63BBF2"
theme.fg_urgent                                 = "#0554F2"
theme.bg_normal                                 = "#1A1A1A"
theme.bg_focus                                  = "#313131"
theme.bg_urgent                                 = "#1A1A1A"
theme.border_width                              = dpi(0)
theme.border_radius                             = dpi(0)
theme.border_normal                             = "#3F3F3F"
theme.border_focus                              = "#7F7F7F"
theme.border_marked                             = "#8DE0F2"
theme.tasklist_bg_focus                         = "#1A1A1A"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = dpi(30)
theme.menu_width                                = dpi(140)
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile                               = theme.dir .. "/icons/tile.png"
theme.layout_tileleft                           = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.dir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.dir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.dir .. "/icons/dwindle.png"
theme.layout_max                                = theme.dir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.dir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.dir .. "/icons/floating.png"
theme.widget_ac                                 = theme.dir .. "/icons/ac.png"
theme.widget_battery                            = theme.dir .. "/icons/battery.png"
theme.widget_battery_low                        = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty                      = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem                                = theme.dir .. "/icons/mem.png"
theme.widget_cpu                                = theme.dir .. "/icons/cpu.png"
theme.widget_temp                               = theme.dir .. "/icons/temp.png"
theme.widget_net                                = theme.dir .. "/icons/net.png"
theme.widget_hdd                                = theme.dir .. "/icons/hdd.png"
theme.widget_music                              = theme.dir .. "/icons/note.png"
theme.widget_music_on                           = theme.dir .. "/icons/note_on.png"
theme.widget_vol                                = theme.dir .. "/icons/vol.png"
theme.widget_vol_low                            = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no                             = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute                           = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail                               = theme.dir .. "/icons/mail.png"
theme.widget_mail_on                            = theme.dir .. "/icons/mail_on.png"
theme.useless_gap                               = dpi(5)
theme.titlebar_close_button_focus               = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal              = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active        = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active       = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive      = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive     = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active       = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active      = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive     = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive    = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active     = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active    = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive   = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive  = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active    = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active   = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

-- Titlebar
theme.titlebar_height                   = dpi(29)
theme.titlebar_font                     = theme.font
theme.titlebar_fg_close                 = "#ee4266"
theme.titlebar_fg_minimize              = "#ffb400"
theme.titlebar_fg_maximize              = "#4cbb17"
theme.titlebar_radius                   = dpi(10)
theme.titlebar_button_size              = 13
theme.titlebar_button_margin_horizontal = 5
theme.titlebar_button_margin_top        = 2

-- Topbar
theme.wibar_height = dpi(28)
theme.wibar_margin = dpi(15)
theme.wibar_border_width = dpi(0)
theme.wibar_border_color = theme.border_marked
-- theme.bottom_panel_height = dpi(18)

-- Icons
theme.icon_size = 15
theme.icon_font = "Symbols Nerd Font " -- attention to space at the end!
theme.icon_color = "#bebebe"

-- Systray
theme.systray_icon_spacing = dpi(2)
theme.systray_icon_size = dpi(22)

-- Notification
theme.notification_border_width = theme.border_width
theme.notification_shape = helpers.rrect(10)
theme.notification_icon_size = dpi(100)
theme.notification_margin = dpi(20)
theme.notification_opacity = 0.9
theme.notification_max_width = dpi(600)
theme.notification_bg = theme.bg_focus

-- Taglist
theme.taglist_disable_icon = true
theme.taglist_icons_margin = dpi(8)

theme.tag_preview_widget_border_radius = dpi(10)
theme.tag_preview_client_border_radius = dpi(10) * 0.75
theme.tag_preview_client_opacity = 0.5
theme.tag_preview_client_bg = theme.bg_normal
theme.tag_preview_client_border_color = theme.border_normal
theme.tag_preview_client_border_width = theme.border_width
theme.tag_preview_widget_bg = theme.bg_normal
theme.tag_preview_widget_border_color = theme.border_marked
theme.tag_preview_widget_border_width = dpi(1)
theme.tag_preview_widget_margin = dpi(2)

-- Tasklist
theme.tasklist_spacing = dpi(2)
theme.tasklist_max_widget_size = dpi(300)
theme.tasklist_icons_margin = dpi(4)

theme.task_preview_widget_border_radius = dpi(10)
theme.task_preview_widget_bg = theme.bg_normal
theme.task_preview_widget_border_color = theme.border_marked
theme.task_preview_widget_border_width = dpi(1)
theme.task_preview_widget_margin = dpi(15)

-- Prioritize ncspot over all other players and ignore firefox players (e.g. YouTube and Twitch tabs) completely
theme.playerctl_ignore = "firefox"
theme.playerctl_player = { "ncspot", "%any" }

-- Disable priority of most recently active players
theme.playerctl_update_on_activity = false

-- Only emit the position signal every 2 seconds
theme.playerctl_position_update_interval = 2

theme.flash_focus_start_opacity = 0.6 -- the starting opacity
theme.flash_focus_step = 0.01 -- the step of animation

return theme
