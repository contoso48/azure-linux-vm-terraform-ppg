# azure-linux-vm-terraform-ppg
Deploy an Azure Linux VM into an existing VNET and Proximity Placement Group

Install Sockperf via cloud-init to test network latency
Source:  https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-test-latency 


Assumptions: 
- Ubuntu apt-get works (internet connection is available)
- SSH is possible via Bastion or VPN or Express Route connection. Otherwise, add a Public IP. 

# Receiver setup von VM01
sudo sockperf sr --tcp -i 10.6.192.7 -p 4001

# Sender / Client Setup  on VM02
sudo sockperf ping-pong -i 10.6.192.7  --tcp -m 101 -t 300 -p 4001  --full-rtt 

# Adjust the internal IP address and socket/port as needed



