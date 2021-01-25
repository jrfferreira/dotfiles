-- To use this script to run daemon when starting, open Automator.app -> choose new app -> add "run AppleScript" -> copy this script into it -> save as an app.
-- To add on startup items, go to System Preferences > Users & Groups > Login Items

tell application "iTerm"
	do shell script "/usr/local/bin/emacs --daemon=main"
end tell