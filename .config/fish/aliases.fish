# abbreviations

# git
abbr -a g git
abbr -a gst git status -sb
abbr -a ga  git add
abbr -a gc  git commit
abbr -a gb  git branch
abbr -a gcm git commit -m
abbr -a gca git commit --amend
abbr -a gco git checkout
abbr -a gp  git push -u origin HEAD
abbr -a gl git pull
abbr -a gd  git diff
abbr -a gds git diff --staged
abbr -a gr  git rebase -i HEAD~15
abbr -a gf  git fetch
abbr -a gfc git findcommit
abbr -a gfm git findmessage

# abbr -a ns newsession
abbr -a srcenv 'export (grep "^[^#]" .env |xargs -L 1)'
abbr -a tma tmux attach -t 

# mage
abbr -a mta mage test:all
abbr -a mtu mage test:unit
abbr -a mtc mage test:cleanup

# utilities
alias ts='tig status'
alias gui='gitui'
alias l='lsd -la'
alias lt='lsd --tree'
alias cat='bat'
alias v='vim (fzf)'
alias vim=nvim

abbr -a yays 'yay -Slq | fzf -q "$1" -m --preview \'yay -Si {1}\'| xargs -ro yay -S'
abbr -a yayr 'yay -Qq | fzf -q "$1" -m --preview \'yay -Qi {1}\' | xargs -ro yay -Rns'

alias watchdocker='bash -c \'while :; do out=$(docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Networks}}\t{{.Image}}");clear; echo "$out";sleep 1; done\''

# taskwarrior
abbr -a t task
abbr -a ta task add
abbr -a tui taskwarrior-tui

alias reload='exec fish'

alias k=kubectl
abbr -a d docker
abbr -a db docker buildx
abbr -a kn kubens
abbr -a tf terraform

abbr -a dg devbox global

alias killcontainers='docker rm -f $(docker ps -a -q)'

alias awsprofile='export AWS_PROFILE=$(aws configure list-profiles | fzf)'
alias ghtoken 'set -gx GITHUB_TOKEN (gh auth token)'
alias awsenvvars 'eval $(aws-sso-creds export)'
alias awslogin='aws sso login'

