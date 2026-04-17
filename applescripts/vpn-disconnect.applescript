#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Disconnect VPN
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🌐

# Documentation:
# @raycast.description Disconnect from GlobalProtect VPN
# @raycast.author denysdovhan
# @raycast.authorURL https://raycast.com/denysdovhan

tell application "System Events" to tell process "GlobalProtect"
  repeat 2 times
    click menu bar item 1 of menu bar 2
    delay 2
    try
      tell window 1
        click (first button whose title is "Disconnect")
      end tell
      return "ok"
    end try
    delay 1
  end repeat
  return "error:panel did not open"
end tell
