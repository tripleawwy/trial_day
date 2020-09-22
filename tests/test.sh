#!/usr/bin/bash

HOST="localhost"

USER1="ipoque@$HOST"
USER2="docker-user@$HOST"


data_dir="$(dirname $(dirname $(realpath $0)))"
key1_dir=$data_dir/roles/ssh/files/public_keys/origin
key2_dir=$data_dir/roles/ssh/files/public_keys/docker-user-key

ssh -q -p 2222 -o "BatchMode=yes" $USER1 -i $key1_dir "echo 2>&1" && echo $USER1 SSH_ENABLED || echo $USER1 SSH_DISABLED
ssh -q -p 2222 -o "BatchMode=yes" $USER2 -i $key2_dir "echo 2>&1" && echo $USER2 SSH_ENABLED || echo $USER2 SSH_DISABLED

