#!/bin/sh

if pgrep -x sleep.sh >/dev/null; then
	killall swayidle
	~/.config/hypr/scripts/lock_on_sleep.sh &
else
	killall swayidle
	~/.config/hypr/scripts/sleep.sh &
fi
