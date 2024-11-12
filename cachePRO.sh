#!/usr/bin/env sh

shopt -s nullglob

figlet cachePRO
echo 'You need these commands:'
sleep 3
echo 'figlet (You can install with brew install figlet command!)'
sleep 1
echo 'toilet (You can install with brew install toilet command!)'
sleep 1
echo 'brew (You can install brew using brew.sh website!)'
sleep 1
echo 'sh (This is built-in on all devices!)'
sleep 1
echo 'read (This is built-in on all devices!)'
sleep 1
echo 'sudo (This is built-in on all devices!)'
sleep 1
echo 'rm (This is built-in on all devices!)'
sleep 1
echo 'echo (This is built-in on all devices!)'
sleep 1
echo 'if (This is built-in on all devices!)'
sleep 1
echo 'sleep (This is built-in on all devices!)'
sleep 1
echo 'Important information:'
sleep 3
echo 'Letters except Y or y (Yes) means N and n (No)'
sleep 1
echo 'It can require admin permissions! (Your password required but it will be in the cache! Don’t forget we will clear the cache!)'
sleep 1
echo 'Don’t forget it is dangerous! (It’s NOT VERY dangerous!)'
sleep 1
echo 'Please backup important files! (You don’t have to do that but please backup!)'
sleep 1
read -p "Are you sure? (Y or N): " YN

if [ "$YN" = "Y" ] || [ "$YN" = "y" ]; then
  clear
  echo 'Enter your password:'
  sudo -v
  frames=(
    "Cleaning   "
    "Cleaning.  "
    "Cleaning.. "
    "Cleaning..."
    "Cleaning   "
    "Cleaning.  "
    "Cleaning.. "
    "Cleaning..."
    "Cleaning   "
    "Cleaning.  "
    "Cleaning.. "
   )

    duration=5
    start_time=$(date +%s)

    
    while [ $(($(date +%s) - start_time)) -lt $duration ]; do
       for frame in "${frames[@]}"; do
         clear
         figlet "$frame"
         sleep 0.5
       done
     done

  sudo rm -rf ~/Library/Caches/* >/dev/null 2>&1
  sudo rm -rf /Library/Caches/* >/dev/null 2>&1
  sudo killall -HUP mDNSResponder >/dev/null 2>&1
  sudo atsutil databases -remove >/dev/null 2>&1
  sudo rm -rf /private/var/log/* >/dev/null 2>&1
  sudo rm -rf ~/.cache/* >/dev/null 2>&1
  sudo rm -rf /System/Library/Caches/* >/dev/null 2>&1
  sudo rm -rf /private/var/db/Cache* >/dev/null 2>&1
  sudo rm -rf /private/var/folders/* >/dev/null 2>&1
  sudo rm -rf /private/var/tmp/* >/dev/null 2>&1
  sudo rm -rf /private/var/root/Library/Caches/* >/dev/null 2>&1
  sudo rm -rf /private/var/root/Library/Logs/* >/dev/null 2>&1
  sudo rm -rf /private/var/root/Library/Preferences/* >/dev/null 2>&1

  read -p "Cleanup completed! Do you want to reboot now? (Y or N): " REBOOT
  if [ "$REBOOT" = "Y" ] || [ "$REBOOT" = "y" ]; then

  frames=(
    "Rebooting   "
    "Rebooting.  "
    "Rebooting.. "
    "Rebooting..."
    "Rebooting   "
    "Rebooting.  "
    "Rebooting.. "
    "Rebooting..."
    "Rebooting   "
    "Rebooting.  "
    "Rebooting.. "
    "Rebooting..."
  )

  duration=5
  start_time=$(date +%s)

  while [ $(($(date +%s) - start_time)) -lt $duration ]; do
    for frame in "${frames[@]}"; do
      clear
      figlet "$frame"
      sleep 0.5
    done
  done

    while [ $(($(date +%s) - start_time)) -lt $duration ]; do
      for frame in "${frames[@]}"; do
        clear
        figlet "$frame"
        sleep 0.5
      done
    done
    sudo reboot
  else
    echo 'Operation completed without rebooting.'
  fi
else
  echo 'Operation canceled by user.'
fi
