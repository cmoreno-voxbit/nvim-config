return {
  -- This tells Neovim to use the LSP (Language Server Protocol) plugin
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- This is where we tell it which servers to start
      servers = {
        solargraph = {
          -- These are the settings for Solargraph
          settings = {
            solargraph = {
              diagnostics = true,      -- Show us where errors are
              completion = true,       -- Help us finish typing words
              useBundler = true,       -- Use the project's 'bundle' if it exists
              formatting = true,       -- Help keep our code looking pretty
            },
          },
        },
      },
    },
  },
}
