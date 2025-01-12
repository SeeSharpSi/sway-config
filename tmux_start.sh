#!/bin/bash 

SESSIONNAME="dev"
tmux has-session -t $SESSIONNAME 2> /dev/null

if [ $? != 0 ]; then
    tmux new-session -d -s $SESSIONNAME 
    tmux new-window -t $SESSIONNAME 
    tmux select-window -t $SESSIONNAME:1
fi

tmux attach-session -t $SESSIONNAME > /dev/null
