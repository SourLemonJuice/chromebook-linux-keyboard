# Chromebook Linux keyboard support

This repository defines hwdb modules and [keyd](https://github.com/rvaiya/keyd) config files to give back the full keyboard support for the Chromebook.

Or rather, it's just a goal. Chromebooks have so many types. I don't know how to organize them, also don't have chances to test most of them.

## File naming

The files under `hwdb/` and `keyd/` are the different chromebook codenames.\
Use `/sys/devices/virtual/dmi/id/product_name` to identify them.

For example, the value of Google Pixelbook Go is `Atlas`.

## Support Modules

|Manufacture|Product name|Codename|
|--|--|--|
|Google|Pixelbook Go|Atlas|
