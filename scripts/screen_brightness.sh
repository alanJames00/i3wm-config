
bar_color="#7f7fff"

# get current brightness
function get_brightness {
    brightness=$(brightnessctl g  | cut -d '.' -f 1)
    
    # max = 255
    # min = 0

    # calculate the percentage out of 255
    brightness_per=$(($brightness * 100 /255))
    echo $brightness_per
}

# Push notification
function push_notification {
    bper=$(get_brightness)
    
    dunstify -t 1000 -r 2593 -u normal "🔆 $bper%" -h int:value:$bper -h string:hlcolor:$bar_color
}


# Main function => Takes whether up or down
case $1 in 
    up)
    # Handle brightness up case
    brightnessctl set +5%
    push_notification
    ;;
    

    down)
    # handle brightness down case
    brightnessctl set 5%-
    push_notification

    
    ;;

esac