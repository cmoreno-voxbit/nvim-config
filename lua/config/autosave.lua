vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "TextChangedI" }, {
  callback = function()
    vim.cmd("wa!") -- runs whenever you exit INSERT mode
  end,
})
