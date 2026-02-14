#!/bin/bash
# Requests a new identity (IP) from the Tor service
sudo service tor restart
echo "Tor circuit renewed, new IP is ready."
# Displays the new public IP address on the screen
proxychains4 curl -s https://ident.me
