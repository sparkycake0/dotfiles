return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "javascript",
        "typescript",
        "jsx",
        "tsx",
        "css",
        "html",
        "json",
        "yaml",
        "prisma",
        "sql",
        "lua",
        "python",
        "java",
        "c",
        "cpp",
        "go",
        "rust",
      })
    end,
  },
}
