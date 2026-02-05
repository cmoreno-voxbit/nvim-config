return {
  {
    "uga-rosa/ccc.nvim",
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable" },
    keys = {
      { "<leader>cp", "<cmd>CccPick<cr>", desc = "Color Picker" },
    },
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
    config = function(_, opts)
      require("ccc").setup(opts)
    end,
  },
}
