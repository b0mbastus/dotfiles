#!/bin/bash

# Run tmux server if not currently running
tmux new -s Hacking &
# tmux attach -t Hacking &

# Split window
tmux rename-window Main &
tmux split-window -v &

tmux new-window -n Python &