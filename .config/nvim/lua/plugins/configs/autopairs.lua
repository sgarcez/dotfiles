local autopairs = require("nvim-autopairs")

autopairs.setup({
  check_ts = true, -- enable treesitter
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

-- import nvim-cmp plugin safely (completions plugin)
local cmp = require("cmp")

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
