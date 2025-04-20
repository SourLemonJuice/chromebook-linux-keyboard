# Chromebook Linux keyboard support

This repository defines hwdb modules and [keyd](https://github.com/rvaiya/keyd) config files to give back the full keyboard support for the Chromebook under Linux.

Or rather, it's just a goal. Chromebooks have so many types. I don't know how to organize them, also don't have chances to test most of them.

## Setup HWDB

The HWDB defined the physical key values at the very low level.\
You can see [hwdb/00-Specific.hwdb](hwdb/00-Specific.hwdb) and [ArchWiki](https://wiki.archlinux.org/title/Map_scancodes_to_keycodes#Remap_specific_device) as an example to write you match rule for your own device.

Create and put the content into `/etc/udev/hwdb.d/61-chromebook.hwdb` file.\
And run these command to update database:

```shell
sudo systemd-hwdb update
sudo udevadm trigger
```

## Generate keyd config

The keyd configurations is the most wanted thing of this project.\
It maps the common and useful shortcuts in chromeOS. Especially the function keys.

Install it at first.

By default, config required this low level hwdb setup:

- Launch -> `henkan`
- (optional)Assistant -> `leftmeta`

If all is done, run `./make.sh` in the repository root. It will ask you which function key layout would you want:

Type A starts with `Back`, `Refresh`, `Fullscreen`, `Overview`...\
Type B starts with `Back`, `Forward`, `Refresh`, `Fullscreen`...

The output file is `./chromebook.conf`, put it into `/etc/keyd/` and run `sudo keyd reload` to reload the configs. That's it.

### Shortcut list

|Shortcuts|Target|
|--|--|
|alt+launch|capslock|
|alt+brightnessdown|backlit down|
|alt+brightnessup|backlit up|
|alt+left|home|
|alt+right|end|
|altgr+backspace|delete|

> I don't know why GNOME doesn't recognize some of `f12+` and `KEY_ZOOM(== KEY_FULL_SCREEN)`, so I mapped the `Fullscreen` to `f18`, the `Overview` to `f17`. To use them, you must change the desktop environment setting.

## Test environment

My test environment is Google Pixlebook Go, codename Atlas. If you find some issue of this project, please report them.

You can also contribute your DMI match rules or other ideas.

## Q&A

- Why use `henkan` as launch key value?\
  Because I'm a chinese, I prefer to use capslock to switch zh/en input methods. Although `henkan` has nothing to do with chinese chars, but it's funny.\
  `zenkakuhankaku` is somatically more appropriate, but it seems doesn't work under wayland.
- Shortcuts not enough or I don't like it.\
  I don't know... try using other native keycodes in `/usr/include/linux/input-event-codes.h`, or just use `f1x` key to implement them in the desktop layer.
- What does repository name come from?\
  [WeirdTreeThing/chromebook-linux-audio](https://github.com/WeirdTreeThing/chromebook-linux-audio)\
  This project is more complicated than mine. awa
