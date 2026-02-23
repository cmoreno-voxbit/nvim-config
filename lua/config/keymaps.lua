vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Find Grep" })
vim.keymap.set("n", "D", '"_ld$', { desc = "Delete until EOL (exclude cursor)" })
vim.keymap.set({ "n", "x" }, "d", '"_d', { noremap = true, silent = true, desc = "Delete without yanking" })
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true, desc = "Delete line without yanking" })
vim.keymap.set("n", "$", "$h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<Cmd>normal! <C-d>zz0<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<Cmd>normal! <C-u>zz0<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x" }, "<Up>", "<Up>zz", { noremap = true, silent = true })
vim.keymap.set({ "n", "v", "x" }, "<Down>", "<Down>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Up>", "<Up>0_zz", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Down>", "<Down>0_zz", { noremap = true, silent = true })
vim.keymap.set("n", "<BS>", "_zz", { noremap = true, silent = true })
vim.keymap.set("n", "o", "o<Esc>zz", { noremap = true, silent = true })
vim.keymap.set("n", "O", "O<Esc>zz", { noremap = true, silent = true })
vim.keymap.set("n", "G", "G}", { noremap = true, silent = true })
vim.keymap.set("v", "G", "G}", { noremap = true, silent = true })
vim.keymap.set("n", "gg", "gg{", { noremap = true, silent = true })
vim.keymap.set("v", "gg", "gg{", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v" }, "<Home>", "_", { noremap = true, silent = true })
vim.keymap.set({"i","n","v","c"}, "<Insert>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v", "x", "o", "c", "t" }, "<F1>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set({ "n", "i", "v", "x", "o", "c", "t" }, "<C-/>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "Q", "<Nop>", { noremap = true })
vim.keymap.set("n", "q", "<Nop>", { noremap = true })
vim.keymap.set("n", "<C-q>", "<Nop>", { noremap = true })
vim.keymap.set("n", "@", "<Nop>", { noremap = true })
vim.keymap.set("n", "@@", "<Nop>", { noremap = true })
vim.keymap.set("n", "p", "<S-p>", { noremap = true, silent = true })
vim.keymap.set("n", "P", "ciw<C-r>0<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "yy", "0y$", { noremap = true, silent = true })
vim.keymap.set("n", "Y", "yiw", { noremap = true, silent = true })
vim.keymap.set("n", "C", '"_ciw', { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<PageDown>", "<C-d>zz0", { desc = "Half page down, center" })
vim.keymap.set({ "n", "v" }, "<PageUp>", "<C-u>zz0", { desc = "Half page up, center" })
vim.keymap.set("n", "<C-S-Up>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-Down>", "<Nop>", { noremap = true, silent = true })
vim.keymap.set("n", "$", "$a <Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-a>", "a", { noremap = true, silent = true })
vim.keymap.set("n", "gg", "gg_", { noremap = true, silent = true })
vim.keymap.set("n", "G", "G_", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", "<Nop>", { noremap = true, silent = true, desc = "next word" })
vim.keymap.set("n", "<C-Left>", "<Nop>", { noremap = true, silent = true, desc = "back word" })
vim.keymap.set({ "n", "v" }, "<C-S-Right>", "$", { noremap = true, silent = true, desc = "End of line" })
vim.keymap.set({ "n", "v" }, "<C-S-Left>", "_", { noremap = true, silent = true, desc = "Start of line" })
vim.keymap.set({ "n", "v" }, "<C-l>", "$", { noremap = true, silent = true, desc = "End of line" })
vim.keymap.set({ "n", "v" }, "<C-h>", "_", { noremap = true, silent = true, desc = "Start of line" })
vim.keymap.set({ "n", "v" }, "<S-l>", "w", { noremap = true, silent = true, desc = "Next word" })
vim.keymap.set({ "n", "v" }, "<S-h>", "b", { noremap = true, silent = true, desc = "Previous word" })
vim.keymap.set({ "n", "v" }, "k", "kzz", { noremap = true, silent = true, desc = "UP + Center Screen" })
vim.keymap.set({ "n", "v" }, "j", "jzz", { noremap = true, silent = true, desc = "DOWN + Center Screen" })
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

local x_mode = "x"
local map_prefix = "<leader>z"
local base_cmd = "gsa"
local delimiters = {
  ["{"] = "}",
  ["("] = ")",
  ["["] = "]",
  ["q"] = '"',
  ["s"] = "'",
  ["b"] = "`",
}

for trigger, target in pairs(delimiters) do
  vim.keymap.set(x_mode, map_prefix .. trigger, base_cmd .. target .. "h", {
    remap = true,
    silent = true,
    desc = "with " .. target,
  })
end

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
  vim.keymap.set(mode, "<C-W><Up>", "<NOP>", { noremap = true, silent = true })
  vim.keymap.set(mode, "<C-W><Down>", "<NOP>", { noremap = true, silent = true })
end

vim.keymap.set("n", "<F5>", function()
  package.loaded["config.keymaps"] = nil
  require("config.keymaps")
  vim.cmd("e!")
  vim.notify("Reload!", vim.log.levels.INFO)
end, { desc = "Reload!" })

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
vim.keymap.set("n", "<leader>R", "<Nop>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>p", function()
  local dir = vim.fn.expand("%:.")
  local formatted = dir:gsub("/", "."):gsub("%.py$", "")
  local output = "from " .. formatted .. " import"
  vim.fn.setreg("0", output) -- yank register
  vim.fn.setreg("+", output)
  vim.notify("Relative path copied to clipboard", vim.log.levels.INFO)
end, { noremap = true, silent = true, desc = "Copy current file directory" })

vim.keymap.set({ "n", "i" }, "<F1>", function()
  local var = vim.fn.input("(Python) Print: ")
  if var == "" then
    return
  end

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local current_line = vim.api.nvim_get_current_line()
  local indent = current_line:match("^%s*") or ""
  local line = indent .. string.format('print(f"%s={%s}")', var, var)

  if vim.api.nvim_get_mode().mode:match("^i") then
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
      "n",
      true
    )
  end

  vim.api.nvim_buf_set_text(
    0,          -- current buffer
    row - 1,    -- line (0-indexed)
    0,          -- start column (align with line indentation)
    row - 1,    -- end line
    0,          -- end column
    { line }    -- text to insert
  )
end)

vim.keymap.set({ "n", "i" }, "<F2>", function()
  local var = vim.fn.input("(Ruby) Print: ")
  if var == "" then
    return
  end

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local current_line = vim.api.nvim_get_current_line()
  local indent = current_line:match("^%s*") or ""
  local line = indent .. string.format('puts "%s=#{%s}"', var, var)

  if vim.api.nvim_get_mode().mode:match("^i") then
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
      "n",
      true
    )
  end

  vim.api.nvim_buf_set_text(
    0,          -- current buffer
    row - 1,    -- line (0-indexed)
    0,          -- start column (align with line indentation)
    row - 1,    -- end line
    0,          -- end column
    { line }    -- text to insert
  )
end)

vim.keymap.set({ "n", "i" }, "<F3>", function()
  local var = vim.fn.input("(Ruby) Tag Content: ")
  if var == "" then
    return
  end

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local current_line = vim.api.nvim_get_current_line()
  local indent = current_line:match("^%s*") or ""
  local line = indent .. string.format("<%%= %s %%>", var)

  if vim.api.nvim_get_mode().mode:match("^i") then
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
      "n",
      true
    )
  end

  vim.api.nvim_buf_set_text(
    0,
    row - 1,
    0,
    row - 1,
    0,
    { line }
  )
end)

vim.keymap.set({"n","i","t"}, "<F12>", function()
  local mode = vim.fn.mode()
  if mode == "i" then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  elseif mode == "t" then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", true)
  end
  vim.cmd("bd!")
end, { noremap = true, silent = true, desc = "Close buffer" })

vim.keymap.set({ "n", "t" }, "<C-Up>", [[<C-\><C-n><C-w>k]], { desc = "Move Up", remap = false })
vim.keymap.set({ "n", "t" }, "<C-Down>", [[<C-\><C-n><C-w>j]], { desc = "Move Down", remap = false })
-- vim.keymap.set("n", "<C-S-Up>", ":resize +2<CR>", { desc = "Make Taller", remap = false })
-- vim.keymap.set("n", "<C-S-Down>", ":resize -2<CR>", { desc = "Make Shorter", remap = false })

vim.keymap.set({"n", "i"}, "<F4>", function()
  local input = vim.fn.input("Calculator: ")
  local solver, err = load("return " .. input)

  if not solver then
    vim.api.nvim_echo({{"Invalid Math!", "ErrorMsg"}}, true, {})
    return
  end

  local ok, result = pcall(solver)
  if ok and type(result) == "number" then
    local result_value = " " .. tostring(result)
    local mode = vim.api.nvim_get_mode().mode
    if mode == "i" then
      vim.api.nvim_feedkeys(result_value, "n", false)
    else
      vim.api.nvim_put({result_value}, "c", true, true)
    end
    return
  end

  vim.api.nvim_echo({{"Invalid Math!", "ErrorMsg"}}, true, {})
end, { 
    desc = "Calculate and insert math", 
    silent = true 
  })

-- vim.keymap.set({'n','i','v'}, '<Up>', '<Nop>')
-- vim.keymap.set({'n','i','v'}, '<Down>', '<Nop>')
-- vim.keymap.set({'n','i','v'}, '<Left>', '<Nop>')
-- vim.keymap.set({'n','i','v'}, '<Right>', '<Nop>')
vim.keymap.set({'n','i','v'}, 'H', '<Nop>')
vim.keymap.set({'n','i','v'}, 'J', '<Nop>')
vim.keymap.set({'n','i','v'}, 'K', '<Nop>')
vim.keymap.set({'n','i','v'}, 'L', '<Nop>')
--END OF FILE
