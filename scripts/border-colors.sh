WALJSON="$HOME/.cache/wal/colors.json"
DECOR="$HOME/.config/mango/config/decor.conf"

# pick the pywal colors
FOCUS=$(jq -r '.colors.color7' <"$WALJSON") # blue-ish

# Pywal gives "#rrggbb", we need: 0xrrggbbaa
FOCUS_MANGO="0x${FOCUS:1}FF"

# patch decor.conf
sed -i "s/^focuscolor = .*/focuscolor = $FOCUS_MANGO/" "$DECOR"
