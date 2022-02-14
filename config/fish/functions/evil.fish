function evil --wraps='emacsclient -t' --wraps='emacsclient -c -a emacs' --wraps='emacsclient -c -a emacs &'
    nohup emacsclient -c -s emacs $argv &>/dev/null &
end
