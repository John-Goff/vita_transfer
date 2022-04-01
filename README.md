# VitaTransfer

A simple utility for transferring and converting GBA game saves from `.sav` format to `.srm`.

This is mostly intended for my own use, so some elements may need to be modified if you attempt to use this on your own Vita.

The files are stored on the PS Vita under `ux0:/data/retroarch/savefiles`. You must first open
VitaShell on your vita and start the FTP server. You can pass the options `--port(-p)` and `--ip(-i)`
to configure the port your FTP server is running on. They default to `192.168.2.245:1337`.

## Installation

Clone this repo. Clone https://github.com/c99koder/srm-to-sav and make sure the `sav-to-srm.py` and `srm-to-sav.py` files are visible in your PATH. Then from this repo you can do `MIX_ENV=prod mix escript.build`.

## Usage
The `vita_transfer` command takes a few mandatory arguments. First is ONE OF `-t` or `-f` to indicate the direction of transfer. If the file on your local PC is more recent and you want to upload this to the vita, you use `-t` or `--to`. To transfer a file from your vita to your PC use `-f` or `--from`. You must use only one of these two arguments at a time. You also must specify the game save you want to transfer using the `-g` argument. The filename must match what's on your device, but the extension is ignored, so it can be either `sav` or `srm`.
