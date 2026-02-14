#!/bin/bash
echo "--- IDENTITY AUDIT REPORT ---"
echo "TIMESTAMP: $(date)"
echo "-----------------------------"
# Local MAC Address Audit
echo "CURRENT MAC ADDRESS:"
ip link show eth0 | grep link/ether | awk '{print $2}'
echo "-----------------------------"
# External IP Address Audit (via Tor)
echo "PUBLIC IP ADDRESS (TOR):"
proxychains4 curl -s https://ident.me
echo -e "\n-----------------------------"
echo "Audit Completed."
