vim()
{
    echo "keycode 66 = Caps_Lock
        keycode 9 = Escape
        remove Lock = Caps_Lock
        add Lock = Escape
        keycode 9 = Caps_Lock
        keycode 66 = Escape" | xmodmap -

    local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff

    command vim "$@"
    stty "$STTYOPTS"

    echo "keycode 66 = Caps_Lock
        keycode 9 = Escape
        add Lock = Caps_Lock
        remove Lock = Escape" | xmodmap -
}
