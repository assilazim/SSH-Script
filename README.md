# SSH-Script to automate connecting to servers and increase productivity! 

This script is designed to help users securely connect to a remote server using SSH. To use the script, open a terminal window, navigate to the directory where the script is saved, and enter the following command:

## ./ssh_script.sh [USERNAME] [SERVER] [PASSWORD]

The [USERNAME], [SERVER], and [PASSWORD] parameters should be replaced with the username, server address, and password for the remote server respectively. The script will then generate the necessary public and private SSH keys if they do not already exist, add the user's public key to the server's authorized_keys file, and open an SSH session to the specified server. Once the script has completed, the user can securely connect to the server and begin using it.

With the added key, you will be able to connect to the server from now on by typing in the following command:

## ssh [username]@[server]
