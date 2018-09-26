#!/bin/sh

export SSH_ASKPASS=ksshaskpass
ssh-add $(file ~/.ssh/* | grep 'PEM RSA private key' | cut -d':' -f1) </dev/null
