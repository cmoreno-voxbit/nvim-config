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

-- ================================
-- AUTOSAVE ON ALL BUFFER MUTATIONS
-- ================================

local autosave_events = {
  "InsertLeave",
  "TextChanged",
  "TextChangedI",
  "TextChangedP",
  "CursorHold",
  "CursorHoldI",
  "BufEnter",
  "FocusGained",
  "BufLeave",
  "InsertEnter",
}

vim.api.nvim_create_autocmd(autosave_events, {
  group = autocmd_group,
  pattern = "*",
  callback = function(args)
    local bufnr = args.buf
    if not is_normal_file(bufnr) then
      return
    end

    if vim.api.nvim_buf_get_option(bufnr, "modified") then
      vim.api.nvim_buf_call(bufnr, function()
        vim.cmd("silent! write")
      end)
    end

    buf_line_count[bufnr] = vim.api.nvim_buf_line_count(bufnr)
  end,
})

-- Auto-formatting was intentionally removed
