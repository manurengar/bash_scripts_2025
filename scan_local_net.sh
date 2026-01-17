!#/bin/bash
# Perform a local net scan of devices
# You need to provide with ethn0 or WLAN0 parameters
# Example of usage: ./scan_local_net wlan0
echo "List of available connections\n"
ip link

echo "Start scan:\n"
sudo arp-scan --interface=$1 --localnet
