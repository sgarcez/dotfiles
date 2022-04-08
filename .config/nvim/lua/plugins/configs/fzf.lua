local fn = vim.fn

fn.setenv(
  "FZF_DEFAULT_OPTS",
  "--ansi --keep-right --marker=+ --padding=1,1 --color=fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#2E3440,hl+:#A3BE8C,pointer:#BF616A,info:#2E3440,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B"
)
fn.setenv("FZF_DEFAULT_COMMAND", "fd --type file --follow --hidden --exclude .git --exclude vendor --color=always")
