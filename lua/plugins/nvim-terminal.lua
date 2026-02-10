return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<leader>t", "<cmd>1ToggleTerm<cr>", desc = "Terminal" },
      { "<leader>T", "<cmd>1ToggleTerm<cr>", desc = "Terminal" },
    },
    config = function()
      require("toggleterm").setup({
        size = 60,
        shade_terminals = true,
        insert_mappings = true,
        terminal_mappings = true,
        start_in_insert = true,
      })

      function _G.set_terminal_keymaps()
        local opts = {buffer = 0}
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      end

      vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
    end,
  },
}
