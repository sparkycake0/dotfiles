#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x) / Modified for Sway
## Github : @adi1090x
#
## Rofi   : Power Menu
#

# Current Theme
dir="$HOME/.config/rofi/powermenu/"
theme='style-2'

# CMDs
uptime="$(uptime -p | sed -e 's/up //g')"

# Options
shutdown='⏻'
reboot='↻'
suspend='⏾'
logout='⊲'
yes='Y'
no='N'

# Rofi CMD
rofi_cmd() {
  rofi -dmenu \
    -p "Goodbye ${USER}" \
    -mesg "Uptime: $uptime" \
    -theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
  rofi -dmenu \
    -p 'Confirmation' \
    -mesg 'Are you sure?' \
    -theme ${dir}/shared/confirm.rasi
}

# Ask for confirmation
confirm_exit() {
  echo -e "$yes\n$no" | confirm_cmd
}

# Pass options to rofi
run_rofi() {
  echo -e "$shutdown\n$reboot\n$suspend\n$logout" | rofi_cmd
}

# Execute commands
run_cmd() {
  selected="$(confirm_exit)"
  if [[ "$selected" == "$yes" ]]; then
    case $1 in
    '--shutdown')
      poweroff
      ;;
    '--reboot')
      reboot
      ;;
    '--suspend')
      mpc -q pause
      amixer set Master mute
      systemctl suspend
      ;;
    '--logout')
      mmsg -d quit
      ;;
    esac
  else
    exit 0
  fi
}

# Main menu actions
chosen="$(run_rofi)"
case ${chosen} in
$shutdown)
  run_cmd --shutdown
  ;;
$reboot)
  run_cmd --reboot
  ;;
$suspend)
  run_cmd --suspend
  ;;
$logout)
  run_cmd --logout
  ;;
esac
