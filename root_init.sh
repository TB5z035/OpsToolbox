#!/bin/bash
set -e
set -x

ADMIN_USER=${1:-"cloudroot"}
HOSTNAME=${2:-$HOSTNAME}

# Set up apt tuna source 
./install/tuna_source.sh

# Install conda
./install/setup_conda.sh

# Set hostname
./misc/set_hostname.sh ${HOSTNAME}

# Add superuser
./misc/add_superuser.sh ${ADMIN_USER}

# Disable root account
# This should not be run by root
# ./misc/disable_root.sh

# Install docker
./install/setup_docker.sh

# Install nvidia drivers and cuda toolkit
./install/setup_nvidia.sh

echo "Two more things to check:"
echo "1. Docker source"
echo "2. Docker storage location"