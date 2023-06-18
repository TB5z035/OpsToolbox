#!/bin/bash
set -e
set -x

ADMIN_USER=${1:-$ADMIN_USER}
echo "Add superuser ${ADMIN_USER}"
ADMIN_USER=${1:-$ADMIN_USER}
useradd -md /data/${ADMIN_USER} -s /bin/bash ${ADMIN_USER}
usermod -aG sudo ${ADMIN_USER}
echo "${ADMIN_USER} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${ADMIN_USER}
echo ${ADMIN_USER}:${ADMIN_USER}@123! | chpasswd
chage -d 0 $ADMIN_USER

sudo -u ${ADMIN_USER} /usr/local/miniconda3/bin/conda init bash
sudo -u ${ADMIN_USER} /usr/local/miniconda3/bin/conda config --set auto_activate_base false
sudo -u ${ADMIN_USER} cp ./sources/.condarc /data/${ADMIN_USER}/.condarc
sudo -u ${ADMIN_USER} conda run pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple