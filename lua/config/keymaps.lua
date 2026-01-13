-- keymaps.lua
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Find Grep" })
vim.keymap.set("n", "D", '"_ld$', { desc = "Delete until EOL (exclude cursor)" })
vim.keymap.set({ "n", "x" }, "d", '"_d', { noremap = true, silent = true, desc = "Delete without yanking" })
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true, desc = "Delete line without yanking" })
vim.keymap.set("n", "<C-j>", "<Cmd>cnext<CR>", { noremap = true, silent = true, desc = "Next Quickfix" })
vim.keymap.set("n", "<C-k>", "<Cmd>cprev<CR>", { noremap = true, silent = true, desc = "Previous Quickfix" })
vim.keymap.set("n", "<C-Q>", "<Cmd>cclose<CR>", { noremap = true, silent = true, desc = "Close Quickfix" })
vim.keymap.set("n", "$", "$h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<Cmd>normal! <C-d>zz0<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<Cmd>normal! <C-u>zz0<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "j", "j0wzz", { noremap = true, silent = true })
vim.keymap.set("n", "k", "k0wzz", { noremap = true, silent = true })
vim.keymap.set("n", "<Up>", "<Up>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", "<Down>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Up>", "<Up>0_zz", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Down>", "<Down>0_zz", { noremap = true, silent = true })
vim.keymap.set("n", "<BS>", "_zz", { noremap = true, silent = true })
vim.keymap.set("n", "o", "o<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "O", "O<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "G", "G}", { noremap = true, silent = true })
vim.keymap.set("v", "G", "G}", { noremap = true, silent = true })
vim.keymap.set("n", "gg", "gg{", { noremap = true, silent = true })
vim.keymap.set("v", "gg", "gg{", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v" }, "<Home>", "_", { noremap = true, silent = true })
vim.keymap.set("n", "<Insert>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("i", "<Insert>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("v", "<Insert>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("c", "<Insert>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v", "x", "o", "c", "t" }, "<F1>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "Q", "<Nop>", { noremap = true })
vim.keymap.set("n", "q", "<Nop>", { noremap = true })
vim.keymap.set("n", "<C-q>", "<Nop>", { noremap = true })
vim.keymap.set("n", "@", "<Nop>", { noremap = true })
vim.keymap.set("n", "@@", "<Nop>", { noremap = true })
vim.keymap.set("n", "p", "<S-p>", { noremap = true, silent = true })
vim.keymap.set("n", "P", "ciw<C-r>0<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "yy", "0y$", { noremap = true, silent = true })
vim.keymap.set("n", "Y", "yiw", { noremap = true, silent = true })
vim.keymap.set("n", "C", "ciw", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<PageDown>", "<C-d>zz0", { desc = "Half page down, center" })
vim.keymap.set({ "n", "v" }, "<PageUp>", "<C-u>zz0", { desc = "Half page up, center" })
vim.keymap.set("n", "$", "$a <Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-a>", "$<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "gg", "gg_", { noremap = true, silent = true })
vim.keymap.set("n", "G", "G_", { noremap = true, silent = true })
vim.keymap.set(
  "n",
  "<leader><Right>",
  "<Cmd>silent! bnext<CR>",
  { noremap = true, silent = true, desc = "Next buffer" }
)
vim.keymap.set(
  "n",
  "<leader><Left>",
  "<Cmd>silent! bprevious<CR>",
  { noremap = true, silent = true, desc = "Previous buffer" }
)
vim.keymap.set({ "v", "x" }, "Z", "gsa}h", { desc = "Selection → {selection}", remap = true })
vim.keymap.set({ "v", "x" }, "z", "gsa)h", { desc = "Selection → (selection)", remap = true })

local trouble = require("trouble")
vim.keymap.set("n", "<F2>", function()
  if trouble.is_open() then
    trouble.next({ skip_groups = true, jump = true })
  end
end, { noremap = true, silent = true, desc = "Next Diagnostic" })

vim.keymap.set("n", "<F3>", function()
  if trouble.is_open() then
    trouble.prev({ skip_groups = true, jump = true })
  end
end, { noremap = true, silent = true, desc = "Previous Diagnostic" })

vim.keymap.set("n", "<C-i>", function()
  local win = 0
  local cursor = vim.api.nvim_win_get_cursor(win)
  vim.cmd("normal! ggVG=")
  vim.api.nvim_win_set_cursor(win, cursor)
  vim.cmd("normal! zz")
end, { noremap = true, silent = true, desc = "Indent whole file and return" })

local modes = { "n", "i", "v", "x", "s", "o", "t", "c" }
for _, mode in ipairs(modes) do
  vim.keymap.set(mode, "<C-W><Up>", "<NOP>")
  vim.keymap.set(mode, "<C-W><Down>", "<NOP>")
  vim.keymap.set(mode, "<C-W><Down>", "<NOP>")
end

vim.keymap.set("n", "<F5>", function()
  package.loaded["config.keymaps"] = nil
  require("config.keymaps")
  vim.notify("Keymaps reloaded!", vim.log.levels.INFO)
end, { desc = "Reload keymaps" })

vim.keymap.set("n", "<leader>r", function()
  local win = 0
  local cursor = vim.api.nvim_win_get_cursor(win)
  local word = vim.fn.expand("<cword>")
  local new_word = vim.fn.input("Replace '" .. word .. "' with: ")
  if new_word ~= "" then
    vim.cmd(string.format("%%s/%s/%s/g", word, new_word))
  end
  vim.api.nvim_win_set_cursor(win, cursor)
  vim.cmd("normal! zz")
end, { desc = "Replace word (with prompt)" })

vim.keymap.set("v", "<leader>r", function()
  local win = 0
  local cursor = vim.api.nvim_win_get_cursor(win)
  vim.cmd('normal! "hy')
  local selected_text = vim.fn.getreg("h")
  local cmd = ":%s/" .. vim.fn.escape(selected_text, "/\\") .. "//g"
  local keys = vim.api.nvim_replace_termcodes(cmd .. "<Left><Left>", true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
  vim.api.nvim_win_set_cursor(win, cursor)
  vim.cmd("normal! zz")
end, { desc = "Replace Visually" })
vim.keymap.set("n", "<leader>m", "<Cmd>Mason<CR>", { noremap = true, silent = true, desc = "Mason" })
vim.keymap.set("n", "<leader>M", "<Cmd>LazyExtras<CR>", { noremap = true, silent = true, desc = "Lazy Extras" })

vim.keymap.set("n", "<leader>p", function()
  local dir = vim.fn.expand("%:.")
  local formatted = dir:gsub("/", "."):gsub("%.py$", "")
  local output = "from " .. formatted .. " import"
  vim.fn.setreg("+", output)
  vim.notify("Relative path copied to clipboard", vim.log.levels.INFO)
end, { noremap = true, silent = true, desc = "Copy current file directory" })

--END OF FILE
