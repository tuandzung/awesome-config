# Awesome AwesomeWM RC

This is the default **[awesome-git](https://awesomewm.org/apidoc/)** `rc.lua`, but structured for better customization and modularity.
Initially, i did it for myself, because i needed something to start with,
and i decided to share because i didn't find anything similar.
None of the logic was touched, but everything was reformatted to match the code style that i like.

Please note that this is for **[awesome-git](https://awesomewm.org/apidoc/)** and will not work with the stable release.

## Structure

The main `rc.lua` file only load the modules it was split into.
Each module can have its own submodules, and they are all loaded from `init.lua`.

module | description
-------- | -----------
`bindings` | mouse and key bindings
`config` | various variables for apps/tags etc...
`modules` | third-party libraries (e.g. [bling](https://github.com/BlingCorp/bling), [lain](https://github.com/lcpz/lain))
`rules` | client rules
`signals` | all signals are connected here
`widgets` | all widgets are defined here

The `widgets` module is now better organized in this thread.
Please note that the changes affected not only the `widgets` module,
but also `bindings` and `signals`.

Feel free to submit PRs!

## Credits

[This config](https://git.linuxit.us/spider/awesome/src/commit/921c5019df6a03915e09efcb1336bbca518a4401) was used as a base.

## Requirements:

### Minimal
+ [awesome-git](https://aur.archlinux.org/awesome-git) - git version required

### Optional
+ [xorg-xrdb](https://archlinux.org/packages/extra/x86_64/xorg-xrdb/) - autostart dependency
+ [picom-git](https://aur.archlinux.org/picom-git) - compositor with kawaze blur
+ [rofi](https://archlinux.org/packages/community/x86_64/rofi/) - application search and switcher
+ [unclutter](https://archlinux.org/packages/community/x86_64/unclutter/)
+ [copyq](https://archlinux.org/packages/community/x86_64/copyq/)
+ [redshift](https://archlinux.org/packages/community/x86_64/redshift/)
+ [ncmpcpp](https://archlinux.org/packages/community/x86_64/ncmpcpp/)
+ [mopidy](https://archlinux.org/packages/community/any/mopidy/)
+ [gnome-screensaver](https://aur.archlinux.org/packages/gnome-screensaver)
+ [MPlus Nerd Font](https://www.nerdfonts.com/font-downloads)
+ [Iosevka Nerd Font](https://www.nerdfonts.com/font-downloads)
+ [ibus-bamboo](https://aur.archlinux.org/packages/ibus-bamboo)
+ [pipewire](https://archlinux.org/packages/extra/x86_64/pipewire/)
+ [pipewire-alsa](https://archlinux.org/packages/extra/x86_64/pipewire-alsa/)
+ [wireplumber](https://archlinux.org/packages/extra/x86_64/wireplumber/)
