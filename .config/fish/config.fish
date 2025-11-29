if not status is-interactive
    exit
end

~/.local/bin/mise activate fish | source

set -gx PATH ~/.local/bin ~/bin ~/go/bin ~/.cargo/bin ~/.local/share/nvim/mason/bin ~/Applications $PATH
set -gx PATH /Applications/WezTerm.app/Contents/MacOS $PATH
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx EDITOR nvim
set -x GPG_TTY (tty)
set -gx GO_PATH $HOME/go/

set -gx FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git --exclude vendor --color=always'
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_DEFAULT_OPTS '--ansi --color=bg:#2b303b,bg+:#2b303b,pointer:#ebcb8b'

source ~/.config/fish/aliases.fish
if test -f ~/.config/fish/aliases-private.fish
    source ~/.config/fish/aliases-private.fish
end

# if test -f ~/.theme.sh
#     bash ~/.theme.sh
# end

if command -q starship
    set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
    starship init fish | source
end

if command -q zoxide
    zoxide init fish | source
end

if command -q carapace
    carapace _carapace | source
end

if command -q dirennv
    direnv hook fish | source
end

# No greeting when starting an interactive shell.
function fish_greeting
end

if test ~/.config/fish/config_private.fish
    source ~/.config/fish/config_private.fish
end

set -gx ANTHROPIC_API_KEY (bat ~/.config/anthropic/api_key 2>/dev/null)
