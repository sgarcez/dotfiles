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

alias ts='tig status'
alias gui='gitui'
alias l='lsd -la'
alias lt='lsd --tree'
alias cat='bat'
alias v='vim (fzf)'
alias vim=nvim

# taskwarrior
abbr -a t task
abbr -a ta task add
abbr -a tui taskwarrior-tui

alias reload='exec fish'

abbr -a d docker
abbr -a db docker buildx
alias killcontainers='docker rm -f $(docker ps -a -q)'
alias watchcontainers='bash -c \'while :; do out=$(docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Networks}}\t{{.Image}}");clear; echo "$out";sleep 1; done\''

alias k=kubectl
abbr -a kns kubens
abbr -a ktx kubectx
abbr -a tf terraform

alias ghtoken 'set -gx GITHUB_TOKEN (gh auth token)'
alias awsprofile='export AWS_PROFILE=$(aws configure list-profiles | fzf)'
alias awsenvvars 'eval $(aws-sso-creds export)'
alias awslogin='aws sso login'
