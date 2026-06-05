#!/bin/bash
INTERFACE=$(ip route | grep default | awk '{print $5}' | head -n 1)
if [ -z "$INTERFACE" ]; then
  INTERFACE="eth0"
fi
sudo ip link set dev "$INTERFACE" down
sudo macchanger -r "$INTERFACE"
sudo ip link set dev "$INTERFACE" up
notify-send "$USER" "MAC Address Successfully Masked!"
