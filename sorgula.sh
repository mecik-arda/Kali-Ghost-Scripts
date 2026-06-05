#!/bin/bash
INTERFACE=$(ip route | grep default | awk '{print $5}' | head -n 1)
if [ -z "$INTERFACE" ]; then
  INTERFACE="eth0"
fi
echo "--- IDENTITY AUDIT REPORT ---"
echo "TIMESTAMP: $(date)"
echo "-----------------------------"
# Local MAC Address Audit
echo "CURRENT MAC ADDRESS ($INTERFACE):"
ip link show $INTERFACE | grep link/ether | awk '{print $2}'
echo "-----------------------------"
# External IP Address Audit (via Tor)
echo "PUBLIC IP ADDRESS (TOR):"
proxychains4 curl -s https://ident.me
echo -e "\n-----------------------------"
echo "Audit Completed."
