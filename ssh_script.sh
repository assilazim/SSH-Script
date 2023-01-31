#!/bin/bash

#Store the server username we are going to connect to
USERNAME=${1:-'USERNAME'}
#Store the server we are going to connect to
SERVER=${2:-'SERVER'}

#allow user to override password if they wish, otherwise use specified
PASSWORD=${3:-'PASSWORD'}
FILE=~/.ssh/id_rsa.pub

#generate the public and private keys from current system in rsa file
generate_ssh_key() {
    if ! ( [ -f ~/.ssh/id_rsa ] && [ -f ~/.ssh/id_rsa.pub ] ); then
        #if keys exists, do nothing and ssh into server
        #if keys do not exist, create key and auto fill file save location and password protection
        ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ""
    fi
}

add_key() {
    local __password="$1" __username="$2" __server="$3" __file="$4"
    #use grep to compare the input file to the output file to check for duplicates. -q to silence stdout of grp
    #-x to check for match of the entire line of text from input to the other file  and -f to read the text from the input file
    if sshpass -p $PASSWORD ssh $USERNAME@$SERVER 'grep -q -x -f '$__file' ~/.ssh/authorized_keys'; then
        echo "Key is already in ssh file"
    else
        cat "$__file" | sshpass -p "$__password" ssh -q -o StrictHostKeyChecking=no $__username@$__server "$(typeset -f generate_ssh_key);
        generate_ssh_key; cat >> ~/.ssh/authorized_keys"
    fi
}

#main function
main() {
    generate_ssh_key
    add_key "$PASSWORD" "$USERNAME" "$SERVER" "$FILE"
    ssh $USERNAME@$SERVER 
}

main
