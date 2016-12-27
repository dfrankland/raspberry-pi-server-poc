#! /bin/bash

# Navigate to file directory
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" || exit;

# Remove any generated files
rm -rf ./openvpn/conf ./nginx/*.ovpn* ./raspberrypi/*.ovpn*

# Initial setup of OpenVPN
SERVER=$SERVER ./openvpn/setup.sh;

# Initialize setup of clients connected to OpenVPN
STATIC=false CLIENTNAME=nginx DIR=./nginx ./openvpn/add-client.sh;
STATIC=true CLIENTNAME=raspberrypi DIR=./raspberrypi ./openvpn/add-client.sh;
