return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      -- 1. Setup the core plugin engine
      require("toggleterm").setup({
        -- open_mapping = [[<C-/>]], -- Standard shortcut
        shade_terminals = true,
        insert_mappings = true,
        terminal_mappings = true,
        start_in_insert = true,
      })

      -- 2. Define the keymaps
      local opts = { noremap = true, silent = true }

      -- Leader + small 't' for Horizontal (bottom of screen)
      vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm direction=horizontal<cr>", {
        desc = "Toggle Terminal Horizontal",
        noremap = opts.noremap,
        silent = opts.silent,
      })

      -- -- Leader + capital 'T' for Floating (middle of screen)
      -- vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm direction=float<cr>", {
      --   desc = "Toggle Terminal Float",
      --   noremap = opts.noremap,
      --   silent = opts.silent,
      -- })

      -- 3. Setup terminal mode escape rules
      function _G.set_terminal_keymaps()
        local t_opts = { buffer = 0 }
        -- Allows exiting terminal insert mode with Escape
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], t_opts)
      end

      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
  },
}
