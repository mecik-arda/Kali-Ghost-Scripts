#!/bin/bash
sudo ifconfig eth0 down
sudo macchanger -r eth0
sudo ifconfig eth0 up
notify-send "$USER" "MAC Address Successfully Masked!"
