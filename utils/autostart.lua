local run_one_pid = require("utils").shell.run_one_pid
local apps = _G.conf.apps

-- { Composite manager
run_one_pid("picom")
-- }

-- { Hide mouse when not use
run_one_pid("unclutter")
-- }

-- { Password manager
-- run_one_pid("1password")
-- run_one_pid("bitwarden-desktop")
-- }

-- { Browser
run_one_pid(apps.browser, nil, "/usr/lib/firefox/firefox")
-- }

-- { Clipboard manager
run_one_pid(apps.clipboard)
-- }

-- { Network manager
run_one_pid("nm-applet")
-- }

-- { IM framework
run_one_pid("ibus-daemon", "-drx")
-- }

-- { Redshift
require("utils.redshift").redshift_init()
-- }

-- { MPD
run_one_pid(apps.music_server, nil, "/usr/bin/python /usr/bin/mopidy")
-- }

-- { Ferdi
run_one_pid("rambox", nil, "/opt/Rambox/rambox")
-- }

-- { Mail
run_one_pid(apps.mail_client)
-- }
run_one_pid("gnome-screensaver")

