if not status is-interactive
    exit
end

devbox global shellenv --init-hook | source

set -x GPG_TTY (tty)

set -gx PATH ~/.local/bin ~/bin ~/go/bin ~/.cargo/bin $PATH
set -gx GO_PATH $HOME/go/
set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
set -gx EDITOR nvim
set -gx FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git --exclude vendor --color=always'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_DEFAULT_OPTS '--ansi --color=bg:#2b303b,bg+:#2b303b,pointer:#ebcb8b'
set -gx DOCKER_CLI_HINTS false

set -gx XDG_CONFIG_HOME "$HOME/.config"

source ~/.config/fish/aliases.fish
if test -f ~/.config/fish/aliases-private.fish
    source ~/.config/fish/aliases-private.fish
end

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
zoxide init fish | source

# carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish # disable auto-loaded completions (#185)
carapace _carapace | source

if type -q op
    op completion fish | source
end

direnv hook fish | source

# No greeting when starting an interactive shell.
function fish_greeting
end
