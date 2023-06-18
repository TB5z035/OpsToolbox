#!/bin/bash
set -e
set -x

NORMAL_USER=${1:-$NORMAL_USER}
echo "Add user ${NORMAL_USER}"

if id -u ${NORMAL_USER} >/dev/null 2>&1; then
    echo "User ${NORMAL_USER} already exists"
    exit 0
fi

mkdir /data
useradd -md /data/${NORMAL_USER} -s /bin/bash ${NORMAL_USER}
echo ${ADMIN_USER}:${ADMIN_USER}@123! | chpasswd
chage -d 0 $ADMIN_USER

sudo -u ${ADMIN_USER} /usr/local/miniconda3/bin/conda init bash
sudo -u ${ADMIN_USER} /usr/local/miniconda3/bin/conda config --set auto_activate_base false
sudo -u ${ADMIN_USER} /usr/local/miniconda3/bin/conda config clean -i -y
sudo -u ${ADMIN_USER} cp ./sources/.condarc /data/${ADMIN_USER}/.condarc
sudo -u ${ADMIN_USER} conda run pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
