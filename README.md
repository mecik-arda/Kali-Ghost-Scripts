# Kali-Ghost-Scripts

This repository features an advanced network anonymity suite developed to automate operational security (OPSEC) on Kali Linux systems. It focuses on hardware identity masking and dynamic IP rotation through the Tor network.

## Project Reflection & Technical Q&A

### 1. Why did I write the code this way?
My objective was to eliminate manual configuration risks during security audits. I accomplished a fully automated identity rotation system as measured by reducing the task duration from minutes to under 5 seconds by integrating macchanger with a custom ProxyChains4 routing logic. This ensures that hardware and network footprints are constantly shifting without manual intervention.

### 2. What challenges did I face?
* **Service Synchronization:** Ensuring that the network interface correctly restored before the Tor service attempted to establish a new circuit was a timing challenge.
* **Proxy Stability:** I had to configure ProxyChains4 with dynamic chaining to ensure that if a specific Tor node failed, the connection would automatically hop to the next available node.
* **DNS Leakage:** I prevented the system from leaking DNS requests by forcing all name resolution through the Tor DNS resolver within the configuration file.

### 3. How did I manage network routing?
* **SOCKS5 Integration:** All traffic is routed through the local SOCKS5 proxy (127.0.0.1:9050), acting as the gateway to the Tor circuit.
* **Interface Control:** The scripts handle the state of the eth0 interface, ensuring the MAC address is spoofed while the interface is down to prevent the real address from ever touching the local network.

## Technical Features

* **Hardware Identity Rotation**: The mac_degistir.sh script automates the process of taking the network interface down, assigning a random hardware address, and restoring connectivity.
* **Network Layer Anonymization**: The yeni_ip.sh script forces the Tor service to establish a new circuit, ensuring a different global exit node.
* **Identity Auditing**: The sorgula.sh script provides verification of both local and external identifiers to prevent data leaks.

## Installation

Follow these steps to set up the environment and dependencies on your Kali Linux system:

### 1. Update System & Install Dependencies
First, ensure your package list is updated and install the required tools:
```bash
sudo apt update && sudo apt install tor macchanger proxychains4 -y
```
2. Clone the Repository

Clone this project to your local machine:
```bash
git clone https://github.com/mecik-arda/Kali-Ghost-Scripts.git
cd Kali-Ghost-Scripts
```
3. Set Executable Permissions
```bash
Grant execution permissions to all script files:
chmod +x sorgula.sh mac_degistir.sh yeni_ip.sh
```
4. Enable Tor Service
Start the Tor service and enable it to run on boot:
```bash
sudo systemctl start tor
sudo systemctl enable tor
```
How to Use

To maintain operational security, follow these steps to deploy and run the scripts:
1. Configure ProxyChains

Ensure /etc/proxychains4.conf is set to route traffic through Tor:
```bash

sudo nano /etc/proxychains4.conf
# Ensure 'dynamic_chain' is enabled
# Ensure 'socks5 127.0.0.1 9050' is at the bottom
```
2. Execution Steps

    Verify Current Identity:```bash ./sorgula.sh```

    Shift MAC Address:```bash sudo ./mac_degistir.sh```

    Rotate Tor IP:```bash sudo ./yeni_ip.sh```

    Confirm Anonymity:```bash ./sorgula.sh```

Technical Specifications
```bash
    Language: Bash Scripting

    Core Tools: Tor, Macchanger, ProxyChains4

    Environment: Kali Linux
```
License

This project is licensed under the MIT License - see the LICENSE file for details.

Author: Arda Meçik
Student ID: 1241602620
