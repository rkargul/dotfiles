function revil
    env -s ~/.emacs_remote/emacs emacsclient -c $argv &>/dev/null &
end
