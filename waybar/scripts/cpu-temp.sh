TEMP=$(sensors | grep -E 'Package id 0|Tctl|Tdie|CPU Temperature' | head -n 1 | awk '{print $NF}' | tr -d '+°C')

if [ -z "$TEMP" ]; then
  TEMP=$(sensors | grep -m 1 -oE '[0-9]+(\.[0-9])?°C' | tr -d '°C')
fi

CLASS="normal"

if [ -n "$TEMP" ]; then
  echo "{\"text\": \" ${TEMP}°C\"}"
else
  echo "{\"text\": \" N/A\"}"
fi
