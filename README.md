# SSH-Script to automate connecting to servers and increase productivity! 
To use this script, you will need to provide the username, server and the password for the server. The script will then generate the RSA key, add it to the authorized_keys list, and then connect to the server via SSH. To run the script, open a command line terminal and type in the following command:

./ssh_script.sh <username> <server> <password>

Once the key is added, you will be able to connect to the server by typing in the following command:

ssh <username>@<server>

