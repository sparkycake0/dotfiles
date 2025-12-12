return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "mason-org/mason.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
  },
}
