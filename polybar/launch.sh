#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bars
polybar -r example &
polybar -r tray &
polybar -r power &
polybar -r info &
polybar -r i3 &
