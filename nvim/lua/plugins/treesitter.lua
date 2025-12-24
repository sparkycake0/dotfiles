return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "javascript",
        "typescript",
        "tsx",
        "css",
        "html",
        "json",
        "yaml",
        "lua",
        "python",
        "rust",
        "go",
        "c",
        "cpp",
        "java",
      })
      opts.highlight = { enable = true }
      opts.indent = { enable = true }
      return opts
    end,
  },
}
