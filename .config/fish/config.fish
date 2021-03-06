if not status is-interactive
    exit
end

set -x GPG_TTY (tty)

set -gx PATH ~/.local/bin ~/bin ~/go/bin ~/.cargo/bin $PATH
set -gx GO_PATH $HOME/go/
set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
set -gx EDITOR vim
set -gx TERM xterm-256color
set -gx FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git --exclude vendor --color=always'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_DEFAULT_OPTS "--ansi"

source ~/.config/fish/aliases.fish

bash ~/.theme.sh

# Fish syntax highlighting
set -g fish_color_autosuggestion '555'  'brblack'
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape 'bryellow'  '--bold'
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match 'bryellow'  '--background=brblack'
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

starship init fish | source

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
