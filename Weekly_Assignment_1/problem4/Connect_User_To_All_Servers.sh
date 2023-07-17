#!/bin/bash

File_Containing_All_Remote_Servers=${1:-"servers.txt"}
echo "Enter ID_RSA_PUB key"
read ID_RSA_PUB

while IFS=' ' read -r server_username server_ip_address
do
  server="$server_username@$server_ip_address"

  echo "Connecting to $server..."

  key_exists=$(ssh "$server" "grep -F '$ID_RSA_PUB' ~/.ssh/authorized_keys")

  if [ -z "$key_exists" ]; then
    echo $ID_RSA_PUB | ssh $server "cat >> ~/.ssh/authorized_keys"
    echo "Public key copied to $server"
  else
    echo "Public key already exists on $server. Skipping."
  fi

  echo
done < "$File_Containing_All_Remote_Servers"
