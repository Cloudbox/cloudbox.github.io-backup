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
# curl -s https://cloudbox.rocks/repo.sh | bash                                 #
# wget -qO- https://cloudbox.rocks/repo.sh | bash                               #
#################################################################################


## Variables
CLOUDBOX_PATH="$HOME/cloudbox"
CLOUDBOX_REPO="https://github.com/Cloudbox/Cloudbox.git"

## Clone Cloudbox and pull latest commit
if [ -d "$CLOUDBOX_PATH" ]; then
    if [ -d "$CLOUDBOX_PATH/.git" ]; then
        cd "$CLOUDBOX_PATH"
        git fetch
        git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)
        git submodule init
        git submodule update
    else
        cd "$CLOUDBOX_PATH"
        git init
        git remote add origin "$CLOUDBOX_REPO"
        git fetch
        git branch master origin/master
        git checkout -f master
        git submodule init
        git submodule update
    fi
else
    git clone --recursive "$CLOUDBOX_REPO" "$CLOUDBOX_PATH"
    cd "$CLOUDBOX_PATH"
    git submodule init
    git submodule update
fi

## Copy settings and config files into Cloudbox folder
shopt -s nullglob
for i in "$CLOUDBOX_PATH"/defaults/*.default; do
    if [ ! -f "$CLOUDBOX_PATH/$(basename "${i%.*}")" ]; then
        cp -n "${i}" "$CLOUDBOX_PATH/$(basename "${i%.*}")"
    fi
done
