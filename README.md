# AceStream Link Loader for VLC

A simple VLC extension that allows you to input and play `acestream://` links directly from the VLC interface.

## Features

- Enter and play `acestream://` links directly in VLC
- Automatically detects running AceStream Engine on common ports
- Automatically closes the extension window after starting playback
- Simple and lightweight Lua extension

## Requirements

- [VLC Media Player](https://www.videolan.org/vlc/)
- [AceStream Engine](https://www.acestream.org) must be running locally (default at `http://127.0.0.1:6878`)
  
## Installation

1. Copy the Lua script `acestream.lua` into the following VLC directory:

   - **Windows:**  
     `%APPDATA%\vlc\lua\extensions\`

   - **Linux/macOS:**  
     `~/.local/share/vlc/lua/extensions/`

   > You may need to create the `extensions` directory if it doesn’t exist.

2. Restart VLC.

3. In VLC, go to `View` → `Ace Stream` to launch the extension.

## Usage

1. Click `View` → `Ace Stream Link Loader` in VLC.
2. Enter a valid `acestream://` link (e.g., `acestream://<hash>`).
3. Click "Play".
4. The stream will open in VLC, and the extension will close automatically.

## Troubleshooting

- If the AceStream Engine is not running, the extension will display an error.
- Make sure your firewall is not blocking requests to `127.0.0.1`.
