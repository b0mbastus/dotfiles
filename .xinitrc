# Disable screen blanking
# xset -dmps &
# xset s noblank &
# xset s off &

# Update X resources db
xrdb -merge ~/.Xresources &

# Enable wireless card
# ip link set wlp3s0 up &

# Enable system tray icon for the network manager
# nm-applet &

# Enable pulse system tray icon
pasystray &

# Start awesome
exec awesome