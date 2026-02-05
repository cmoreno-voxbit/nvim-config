return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Terminal" },
    },
    config = function()
      require("toggleterm").setup({
        shade_terminals = true,
      })
    end,
  },
}
