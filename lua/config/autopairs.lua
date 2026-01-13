local npairs = require("nvim-autopairs")

npairs.setup({
  check_ts = false,          -- Good. Treesitter lookups add latency.
  enable_moveright = false,
  enable_afterquote = false,
  map_cr = false,            -- DISABLE mapping <CR>. This is a massive performance hog.
  map_bs = false,            -- DISABLE mapping <BS>.
  disable_filetype = { "TelescopePrompt", "spectre_panel", "vim" },
  fast_wrap = {},            -- Disable if not used; otherwise, it adds keymap overhead.
})

local Rule = require('nvim-autopairs.rule')
npairs.get_rules():remove_rule('"')
npairs.get_rules():remove_rule("'")
npairs.clear_rules()
