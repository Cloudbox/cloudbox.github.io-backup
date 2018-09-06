#!/bin/bash
#################################################################################
# Title:         Cloudbox: Cloudbox Repo Cloner                                 #
# Author(s):     Desimaniac                                                     #
# URL:           https://github.com/Cloudbox/Cloudbox                           #
# Description:   Clones Cloudbox repo.                                          #
# --                                                                            #
#             Part of the Cloudbox project: https://cloudbox.rocks              #
#################################################################################
#                     GNU General Public License v3.0                           #
#################################################################################
# Usage:                                                                        #
# ======                                                                        #
# curl -s https://cloudbox.rocks/clone.sh | bash                                #
# wget -qO- https://cloudbox.rocks/clone.sh | bash                              #
#################################################################################


## Variables
CLOUDBOX_PATH="$HOME/cloudbox"
CLOUDBOX_REPO="https://github.com/Cloudbox/Cloudbox.git"

## Clone Cloudbox and pull latest commit
if [ -d "$CLOUDBOX_PATH/.git" ]; then
    cd "$CLOUDBOX_PATH"
    git fetch
    git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)
    git submodule init
    git submodule update
else
    git clone --recursive "$CLOUDBOX_REPO" "$CLOUDBOX_PATH"
    cd "$CLOUDBOX_PATH"
    git submodule init
    git submodule update
fi

## Copy initial config files
shopt -s nullglob
for i in *.default; do
    if [ ! -f "${i%.*}" ]; then
        cp -n "${i}" "${i%.*}"
    fi
done
