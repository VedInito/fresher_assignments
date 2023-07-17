# SSH Public Key Deployment Script

This Bash script automates the process of adding public keys to multiple remote machines using SSH. It simplifies the task of configuring consistent and secure authentication across a list of IP addresses and usernames.

## Usage

1. Create a file named `servers.txt` (or specify a different file using the first command-line argument) containing the list of remote servers in the format: `username IP_address` (one combination per line).
2. Run the script by executing the following command: `./ssh_public_key_deployment.sh`.
3. When prompted, enter the path or content of the `ID_RSA_PUB` key.
4. The script connects to each remote server, checks for the existence of the public key in the authorized keys, and adds it if necessary.
5. Status updates are displayed for each operation, indicating whether the public key was copied or already exists on the remote machine.

## Implementation Details

The script reads the server list from `servers.txt` and prompts for the `ID_RSA_PUB` key. It then iterates through each server, connecting via SSH, and performs the necessary tasks. The script checks if the specified public key exists in the authorized keys for the given user. If not, it adds the key to the authorized keys file. Status updates are provided for each operation, ensuring transparency and simplifying the process of managing SSH authentication configurations.

Please ensure you have the necessary permissions and SSH access to the remote machines before using this script.
