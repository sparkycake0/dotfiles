for output in /sys/class/drm/card*-*; do
  name=$(basename "$output")
  status=$(cat "$output/status" 2>/dev/null || echo "unknown")
  echo "$name : $status"
done
