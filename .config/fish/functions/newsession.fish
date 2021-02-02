
function newsession
    set targetdir ~/projects/beat/$argv[1]
    if not test -d $targetdir
        mkdir $targetdir
        cd $targetdir
        git clone git@github.com:taxibeat/$argv[1].git .
    end

    if test -n "$TMUX"
        tmux new-session -d -s $argv[1] -c $targetdir
        tmux switch-client -t $argv[1]
    else
        tmux new-session -s $argv[1] -c $targetdir
    end
end
