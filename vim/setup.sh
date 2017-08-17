#!/bin/sh
RC=~/.vimrc
RED='\033[0;31m'
NC='\033[0m' # No Color

# Moves any old .vimrc
if [ -f $RC ]; then
    mv $RC ./vimrc-presetup
    echo old $RC moved to ./vimrc-presetup
fi

# Sets up .vimrc so it will be found by vim
ln .vimrc $RC

ln -s $(pwd) ~/.vim

# Checks if exuberant ctags are installed
command -v dpkg >/dev/null 2>&1 || \
{ echo >&2 "${RED}Unable to verify existance of packages. Aborting"; exit 1; }

dpkg -s exuberant-ctags > /dev/null 2>&1
if [ $? -ne 0 ]; then 
    echo
    echo ${RED}exuberant-ctags not installed, please refer to the README${NC}
fi
