if status --is-login && [ (tty) = /dev/tty1 ]
    # Say hello!
    set_color green
    echo "Hey\! Welcome back :)"
    set_color yellow
    echo "Hold on, I'm working..."
    set_color normal

    startx &>/dev/null
end
if status is-interactive
    # Load bunker ssh keys
    eval (keychain --agents gpg,ssh --eval --gpg2 --quiet bunker)
end
