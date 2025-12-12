font_line=$(grep '^font=' ~/.config/foot/foot.ini 2>/dev/null | head -1)
if [ -z "$font_line" ]; then
  # fallback if no config
  echo "Unknown font"
else
  # Remove 'font=' and get first word (font family)
  font_name=$(echo "$font_line" | cut -d= -f2 | awk '{print $1}')
  echo "$font_name"
fi
