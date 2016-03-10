#!/bin/bash

# Generate a full .ovpn file from multiple files generated from my OpenVPN server setup.
# Start with example client named $name
# ca.crt            - server certificate
# client27.key      - client key file
# client27.crt      - client certificate file
# client_temp.ovpn  - template .ovpn file

name=$1
touch ./$name.ovpn ./tmp ./lines

cat $name.crt | grep -n '\-----' | grep -o '[0-9]\{2\}' > lines
line1=$(head -1 lines)
line2=$(tail -1 lines)

echo -e "\n<ca>\n $(cat ca.crt)\n</ca>\n\n<cert>\n $(sed -n $(echo $line1),$(echo $line2)p $name.crt)\n</cert>\n\n<key>\n $(cat $name.key)\n</key>" > ./tmp

cat client_temp.ovpn tmp > $name.ovpn

rm ./tmp ./lines
