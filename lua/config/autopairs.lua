-- ~/.config/nvim/lua/config/autopairs.lua
local npairs = require("nvim-autopairs")

npairs.setup({
  check_ts = true,        -- optional: use treesitter
  enable_moveright = true,
  enable_afterquote = false,
})

-- remove quote rules
npairs.get_rules():remove_rule('"')
npairs.get_rules():remove_rule("'")
