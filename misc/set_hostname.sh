#!/bin/bash
set -x
set -e

HOSTNAME=${1:-$HOSTNAME}
echo "Set new hostname ${HOSTNAME}"
hostnamectl set-hostname ${HOSTNAME}
echo "127.0.0.1 ${HOSTNAME}" >> /etc/hosts