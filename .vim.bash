vim()
{
    # Remap Escape to caps lock
    echo "keycode 66 = Caps_Lock
        keycode 9 = Escape
        remove Lock = Caps_Lock
        add Lock = Escape
        keycode 9 = Caps_Lock
        keycode 66 = Escape" | xmodmap -

    # Save origin terminal settings - so went can remap ctrl-s
    local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff

    # Run vim
    command vim "$@"

    # Restore terminal settings
    stty "$STTYOPTS"

    # Restore caps lock
    echo "keycode 66 = Caps_Lock
        keycode 9 = Escape
        add Lock = Caps_Lock
        remove Lock = Escape" | xmodmap -
}
