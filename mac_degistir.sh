#!/bin/bash
INTERFACE=$(ip route | grep default | awk '{print $5}' | head -n 1)
if [ -z "$INTERFACE" ]; then
  INTERFACE="eth0"
fi
sudo ifconfig $INTERFACE down
sudo macchanger -r $INTERFACE
sudo ifconfig $INTERFACE up
notify-send "$USER" "MAC Address Successfully Masked!"
