#! /bin/bash

CLIENTNAME=${CLIENTNAME:-"client"};
STATIC=${STATIC:-false};
DIR=${DIR:-"./openvpn"}

echo "CLIENT NAME: $CLIENTNAME";

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../" || exit;

echo "# Generate a client certificate without a passphrase";
docker-compose run --rm --no-deps openvpn easyrsa build-client-full "$CLIENTNAME" nopass;

echo "# Retrieve the client configuration with embedded certificates";
docker-compose run --rm --no-deps openvpn ovpn_getclient "$CLIENTNAME" > "$DIR/$CLIENTNAME.ovpn";

if [ $STATIC = true ]
then
  echo "# Add static IP route to client@192.168.255.2 (server@192.168.255.1)";
  echo "ifconfig-push 192.168.255.2 192.168.255.1" | docker-compose run --rm --no-deps openvpn tee "/etc/openvpn/ccd/$CLIENTNAME";
fi
