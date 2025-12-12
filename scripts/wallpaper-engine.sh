WALLPAPER_DIR="$HOME/Wallpapers"

ENTRIES=""
for f in "$WALLPAPER_DIR"/*; do
  name=$(basename "$f")
  ENTRIES+="${name}\0icon\x1f${f}\n"
done

SELECTED_NAME=$(echo -en "$ENTRIES" | rofi -dmenu -show-icons -p "Wallpaper:" \
  -theme ~/.config/rofi/themes/wallpaper-engine.rasi)

[[ -z "$SELECTED_NAME" ]] && exit 0
FILE="$WALLPAPER_DIR/$SELECTED_NAME"


swww img "$FILE" --transition-type grow --transition-pos top-right --transition-duration 0.9

wal -i "$FILE"
walcord
pywalfox update
~/.config/mako/update-theme.sh

notify-send "Wallpaper Changed" "to $SELECTED_NAME"
