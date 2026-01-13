return {
  {
    "stevanmilic/nvim-lspimport",
    event = "LspAttach",
    config = function()
      -- no setup() call needed
      local lspimport = require("lspimport")

      -- optional keymap
      vim.keymap.set("n", "<leader>li", function()
        lspimport.import()
      end, { desc = "Auto import missing symbol" })
    end,
  },
}
