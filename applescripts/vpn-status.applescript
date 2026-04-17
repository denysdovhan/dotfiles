#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title VPN Status
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🌐

# Documentation:
# @raycast.description Check the status of GlobalProtect VPN
# @raycast.author denysdovhan
# @raycast.authorURL https://raycast.com/denysdovhan

tell application "System Events" to tell process "GlobalProtect"
  set statusMsg to "unknown"
  repeat 2 times
    click menu bar item 1 of menu bar 2
    delay 2
    try
      tell window 1
        if exists (first button whose title is "Disconnect") then
          set statusMsg to "connected"
        else if exists (first button whose title is "Connect") then
          set statusMsg to "disconnected"
        else
          set allButtons to title of every button
          set statusMsg to "unknown:" & (allButtons as text)
        end if
      end tell
      key code 53
      return statusMsg
    end try
    delay 1
  end repeat
  key code 53
  return statusMsg
end tell
