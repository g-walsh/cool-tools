#!/bin/bash

# Generate a full .ovpn file from multiple files generated from my OpenVPN server setup.
# Start with example client named $name
# ca.crt            - server certificate
# client27.key      - client key file
# client27.crt      - client certificate file
# client_temp.ovpn  - template .ovpn file
#
# Updated to include the entire client .crt not just the certificate part.

name=$1
touch ./$name.ovpn ./tmp ./lines

# This next line extracts the certificate part from the client.crt
# cat $name.crt | grep -n '\-----' | grep -o '[0-9]\{2\}' > lines
# line1=$(head -1 lines)
# line2=$(tail -1 lines)

# Comment out using lines rather than whole client.crt file
# echo -e "\n<ca>\n $(cat ca.crt)\n</ca>\n\n<cert>\n $(sed -n $(echo $line1),$(echo $line2)p $name.crt)\n</cert>\n\n<key>\n $(cat $name.key)\n</key>" > ./tmp

echo -e "\n<ca>\n $(cat ca.crt)\n</ca>\n\n<cert>\n $(cat $name.crt)\n</cert>\n\n<key>\n $(cat $name.key)\n</key>" > ./tmp

cat client_temp.ovpn tmp > $name.ovpn

rm ./tmp ./lines
