#!/bin/bash
#Created 2017-04
CONF=~/.tmux.conf


if [ -f $CONF ]; then
    mv $CONF ./config-presetup
    echo old $CONF moved to ./config-presetup
fi

ln .tmux.conf $CONF
