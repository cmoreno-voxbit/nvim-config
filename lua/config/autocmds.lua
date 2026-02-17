-- ~/.config/nvim/lua/config/autocmds.lua

-- Create an augroup for custom autocmds
local autocmd_group = vim.api.nvim_create_augroup("CustomAutoCmds", { clear = true })

-- Track buffer line counts
local buf_line_count = {}

-- Helper: check if buffer is a normal, modifiable file
local function is_normal_file(bufnr)
  return vim.api.nvim_buf_get_option(bufnr, "buftype") == "" and vim.api.nvim_buf_get_option(bufnr, "modifiable")
end

-- Initialize buffer line count on load or new file
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  group = autocmd_group,
  pattern = "*",
  callback = function(args)
    if is_normal_file(args.buf) then
      buf_line_count[args.buf] = vim.api.nvim_buf_line_count(args.buf)
    end
  end,
})

-- Auto-close "[No Name]" buffer when opening a directory
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name == "" and vim.api.nvim_buf_get_option(bufnr, "buftype") == "" then
      vim.cmd("bdelete!")
    end
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  pattern = { "*" },
  command = "silent! wall",
  nested = true,
})
