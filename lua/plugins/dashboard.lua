return {
  {
    "goolord/alpha-nvim",
    opts = function(_, dashboard)
      local logo = [[NVIM]]
      dashboard.section.header.val = vim.split(logo, "\n")
    end,
  },
}
