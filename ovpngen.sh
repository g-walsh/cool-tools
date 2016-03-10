#!/bin/bash

# Generate a full .ovpn file from multiple files generated from my OpenVPN server setup.
# Start with example client named $name
# ca.crt            - server certificate
# client27.key      - client key file
# client27.crt      - client certificate file
# client_temp.ovpn  - template .ovpn file

name=$1
touch ./$name.ovpn ./tmp

echo -e "\n<ca>\n $(cat ca.crt)\n</ca>\n\n<cert>\n $(cat $name.crt)\n</cert>\n\n<key>\n $(cat $name.key)\n</cert>" > ./tmp

cat client_temp.ovpn tmp > $name.ovpn

rm ./tmp
