#!/bin/bash

# Requires: maim, imagemagick, i3lock-color

# Colors
B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#00ff00cc'  # default
T='#00ff00ee'  # text
W='#880000bb'  # wrong
V='#bb00bbbb' # verifying

lockfi='/tmp/lock'
lockbg='/tmp/lock.png'

maim "$lockbg"
convert "$lockbg" -filter point -resize 10% -resize 1000% "$lockbg"
touch "$lockfi"
i3lock -i "$lockbg" --insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--verifcolor=$T        \
--wrongcolor=$T        \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$W       \
--bshlcolor=$W        \
\
--screen 1            \
--blur 5              \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %Y" \
--keylayout 2 \
--wrongtext="Nope!" \
--radius=260 \
--ring-width=30 \
--timesize=80 \
--datesize=30 \
--layoutsize=20 \

trap "rm $lockfi;" EXIT
