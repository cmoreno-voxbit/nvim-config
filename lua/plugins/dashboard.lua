return {
  {
    "goolord/alpha-nvim",
    lazy = false, 
    priority = 1000,
    opts = function(_, dashboard)
      local logo = [[ NVIM ]]
      dashboard.section.header.val = vim.split(logo, "\n")
      return dashboard
    end,
    config = function(_, opts)
      require("alpha").setup(opts)
    end,
  },
}
