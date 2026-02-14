# Kali-Ghost-Scripts

This repository features an advanced network anonymity suite developed to automate operational security (OPSEC) on Kali Linux systems. It focuses on hardware identity masking and dynamic IP rotation through the Tor network.

## Project Reflection & Technical Q&A

### 1. Why did I write the code this way? (XYZ Analysis)
My objective was to eliminate manual configuration risks during security audits. I accomplished a fully automated identity rotation system as measured by reducing the task duration from minutes to under 5 seconds by integrating macchanger with a custom ProxyChains4 routing logic. This ensures that my hardware and network footprints are constantly shifting without manual intervention.

### 2. What challenges did I face?
* **Service Synchronization:** Ensuring that the network interface correctly restored before the Tor service attempted to establish a new circuit was a timing challenge.
* **Proxy Stability:** I had to configure ProxyChains4 with dynamic chaining to ensure that if a specific Tor node failed, the connection would automatically hop to the next available node without dropping the session.
* **DNS Leakage:** A major hurdle was preventing the system from leaking DNS requests. I solved this by forcing all name resolution through the Tor DNS resolver within the configuration file.

### 3. How did I manage network routing?
* **SOCKS5 Integration:** I routed all traffic through the local SOCKS5 proxy (127.0.0.1:9050), which serves as the gateway to the Tor circuit.
* **Interface Control:** The scripts handle the direct state of the eth0 interface, ensuring the MAC address is spoofed while the interface is down to prevent the real address from ever touching the local network.

## Technical Specifications
* **Language:** Bash Scripting
* **Core Tools:** Tor, Macchanger, ProxyChains4
* **Network Protocol:** SOCKS5

## License
This project is licensed under the MIT License - see the LICENSE file for details.

---
**Author:** Arda Meçik
**Student ID:** 1241602620