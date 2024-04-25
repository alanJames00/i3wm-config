
# Xinput touchpad id
touchpad_id=11

# Get current Status of touchpad
function get_touchpad_status {
    
    st=$( xinput list-props $touchpad_id | grep "Device Enabled" | grep -o "[01]$" )
    echo $st
}

# disable touchpad
function disable_touchpad {
    xinput --disable $touchpad_id

    # send Notification
    notify-send "Touchpad Disabled"
}

# enable touchpad
function enable_touchpad {
    xinput --enable $touchpad_id

    # send Notification
    notify-send "Touchpad Enabled"
}



# Main Function
status=$(get_touchpad_status)

case $status in

    1)
        disable_touchpad
    ;;

    0)
        enable_touchpad
    ;;

esac