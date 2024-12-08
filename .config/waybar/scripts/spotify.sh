#!/bin/sh

# Get the current playback state
class=$(playerctl metadata --player=spotify --format '{{lc(status)}}')
icon_playing="●"
icon_paused="○"

# Always fetch the artist and title
info=$(playerctl metadata --player=spotify --format '{{artist}} - {{title}}')

# Truncate info if it is too long
if [[ ${#info} > 40 ]]; then
  info=$(echo "$info" | cut -c1-40)"..."
fi

# Set icon based on playback state
case "$class" in
  "playing")
    icon="$icon_playing"
    ;;
  "paused" | "stopped")
    icon="$icon_paused"
    ;;
  *)
    icon="$icon_paused"
    ;;
esac

# Output the formatted JSON
echo -e "{\"text\":\"$info $icon\", \"class\":\"$class\"}"
