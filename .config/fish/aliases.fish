alias vim=nvim

# git
# alias git=hub
abbr -a g git
abbr -a gst git status -sb
abbr -a ga  git add
abbr -a gc  git commit
abbr -a gb  git branch
abbr -a gcm git commit -m
abbr -a gca git commit --amend
abbr -a gco git checkout
abbr -a gp  git push
abbr -a gl git pull
# abbr -a gl  git l
abbr -a gd  git diff
abbr -a gds git diff --staged
abbr -a gr  git rebase -i HEAD~15
abbr -a gf  git fetch
abbr -a gfc git findcommit
abbr -a gfm git findmessage

abbr -a ts tig status

# utilities
alias l='lsd -la'
alias lt='lsd --tree'
alias cat='bat'
alias fd='fdfind'

alias watchdocker='bash -c \'while :; do out=$(docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Networks}}\t{{.Image}}");clear; echo $out;sleep 1; done\''

alias markdownd='docker run -it -v $PWD:/opt -p 8888:8080 aerth/markdownd -http=:8080 -index=README.md /opt'

# taskwarrior
alias t='task'
alias ta='task add'

# misc
alias reload='exec fish'

