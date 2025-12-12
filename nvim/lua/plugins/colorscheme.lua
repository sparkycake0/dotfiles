return {
  {
    "RedsXDD/neopywal.nvim",
    name = "neopywal",
    lazy = false,
    priority = 1000,

    config = function()
      require("neopywal").setup({
        transparent_background = true,
        terminal_colors = true,
        dim_inactive = true,
        plugins = {
          mini = {
            files = true,
            cursorword = true,
          },
        },
      })
      vim.cmd.colorscheme("neopywal")
      local pywal_file = vim.fn.expand("~/.cache/wal/colors.json")
      if vim.fn.filereadable(pywal_file) == 0 then
        vim.cmd.colorscheme("onedark")
      end
    end,
  },
  {
    "levouh/tint.nvim",
    opts = {
      tint = -50,
      saturation = 0.8,
    },
  },
}
