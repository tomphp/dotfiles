vim()
{
    # Remap Escape to caps lock
    #echo "keycode 66 = Control_L
    #      clear Lock
    #      add Control = Control_L" | xmodmap -

    # Save origin terminal settings - so went can remap ctrl-s
    local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff

    # Run vim
    command vim "$@"

    # Restore terminal settings
    stty "$STTYOPTS"

    # Restore caps lock
    #echo "keycode 66 = Caps_Lock" | xmodmap - 
    #echo "remove Control = Caps_Lock" | xmodmap -
    #echo "add Lock = Caps_Lock" | xmodmap -
}
