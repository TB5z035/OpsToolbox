#!/bin/bash
set -e
set -x

NORMAL_USER=${1:-$NORMAL_USER}
USER_UID=${2:-$NORMAL_USER}
GROUP_GID=${3:-$GROUP_GID}
echo "Add user ${NORMAL_USER}"

if id -u ${NORMAL_USER} >/dev/null 2>&1; then
    echo "User ${NORMAL_USER} already exists"
    exit 0
fi

mkdir -p /data
groupadd -g ${GROUP_GID} ${NORMAL_USER}
useradd -md /data/${NORMAL_USER} -s /bin/bash ${NORMAL_USER} -u ${USER_UID} -g ${GROUP_GID}
echo ${NORMAL_USER}:${NORMAL_USER}@123! | chpasswd
chage -d 0 $NORMAL_USER

sudo -u ${NORMAL_USER} /usr/local/miniconda3/bin/conda init bash
sudo -u ${NORMAL_USER} /usr/local/miniconda3/bin/conda config --set auto_activate_base false
sudo -u ${NORMAL_USER} /usr/local/miniconda3/bin/conda clean -i -y
sudo -u ${NORMAL_USER} cp ./sources/.condarc /data/${NORMAL_USER}/.condarc
sudo -u ${NORMAL_USER} /usr/local/miniconda3/bin/conda run pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
