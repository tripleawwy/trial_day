#!/usr/bin/bash

HOST1="root"
HOST2="ipoque"
HOST3="docker-user"

ssh $HOST1 -q -o "BatchMode=yes" "echo 2>&1" && echo $HOST1 SSH_OK || echo $HOST1 SSH_NOK
ssh $HOST2 -q -o "BatchMode=yes" "echo 2>&1" && echo $HOST2 SSH_OK || echo $HOST2 SSH_NOK
ssh $HOST3 -q -o "BatchMode=yes" "echo 2>&1" && echo $HOST3 SSH_OK || echo $HOST3 SSH_NOK

