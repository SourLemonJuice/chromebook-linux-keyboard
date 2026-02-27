# Chromebook Linux keyboard support

This repository defines hwdb modules and [keyd](https://github.com/rvaiya/keyd) config files to give back the full keyboard support for the Chromebook on Linux.

## Setup HWDB

The HWDB defined the physical key values at the very low level.\
You can see [hwdb/00-any.hwdb](hwdb/00-any.hwdb) and [ArchWiki](https://wiki.archlinux.org/title/Map_scancodes_to_keycodes#Remap_specific_device) as an example to write you match rule for your own device.

Create and put the content into `/etc/udev/hwdb.d/61-chromebook.hwdb` file.\
And run these command to update database:

```shell
sudo systemd-hwdb update
sudo udevadm trigger
```

## Install keyd config

Keyd maps the common and useful shortcuts in chromeOS, especially the function keys.\
Install it at first.

The configurations required those low level HWDB setup:

- Launch -> `f24`

Run `./install.sh` as root to select your function keys layout and install it.

### Shortcut list

See [keyd/function-a.conf](keyd/function-a.conf)

> I mapped the `Fullscreen` to `f13`, the `Overview` to `f14`. To use them, you must change the desktop environment setting.\
> Make sure you have already disabled some legacy f13-f24 translation feature. In KDE: Settings -> Keyboard -> Keyboard -> Key Bindings -> (turn on it) -> Function keys -> Turn on "Use F13-F24 as usual function keys"

## Test environment

My test environment is Google Pixlebook Go, codename Atlas. If you find some issue of this project, please report them.

You can also contribute your DMI match rules or other ideas.

## Q&A

- Shortcuts not enough or I don't like it.\
  I don't know... try using other native keycodes in `/usr/include/linux/input-event-codes.h`, or just use `f1x` key to implement them in the desktop layer.
- What does repository name come from?\
  [WeirdTreeThing/chromebook-linux-audio](https://github.com/WeirdTreeThing/chromebook-linux-audio)\
  This project is more complicated than mine. awa
- ~~Why use `henkan` as launch key value?~~\
  Because I'm a chinese, I prefer to use capslock to switch zh/en input methods. Although `henkan` has nothing to do with chinese chars, but it's funny.\
  `zenkakuhankaku` is somatically more appropriate, but it seems doesn't work under wayland.
