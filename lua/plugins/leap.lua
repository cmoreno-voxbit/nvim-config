return {
  { "ggandor/leap.nvim", enabled = false },
  {
    "andyg/leap.nvim",
    name = "leap",
    url = "https://codeberg.org/andyg/leap.nvim",
    init = function()
      vim.g.leap_suppress_codeberg_warning = 1
    end,
    config = function()
      local leap = require("leap")
      leap.add_default_mappings()
    end
  },
}
