vim.g.minipairs_disable = true
vim.o.autowriteall = true

local opt = vim.opt

opt.signcolumn = "auto"
opt.numberwidth = 2
opt.cmdheight = 0
opt.laststatus = 3

if vim.env.SSH_TTY then
  opt.clipboard:append("unnamedplus")

  local function paste(_)
    return function()
      local content = vim.fn.getreg('"')
      return vim.split(content, "\n")
    end
  end

  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
      ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
      ["+"] = paste("+"),
      ["*"] = paste("*"),
    },
  }
end
