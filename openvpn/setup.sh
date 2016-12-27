#! /bin/bash

SERVER=openvpn;

echo "SERVER URL COMMON NAME: $SERVER";

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../" || exit;

echo "# Initialize the configuration files and certificates";
docker-compose run --rm --no-deps openvpn ovpn_genconfig -c -u "udp://$SERVER";
docker-compose run --rm --no-deps openvpn ovpn_initpki;
