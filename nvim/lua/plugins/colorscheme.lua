return {
  {
    "RedsXDD/neopywal.nvim",
    name = "neopywal",
    lazy = false,
    priority = 1000,
    config = function()
      local pywal_available = vim.fn.filereadable(vim.fn.expand("~/.cache/wal/colors.json")) == 1

      if pywal_available then
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
      else
        vim.cmd.colorscheme("onedark")
      end
    end,
  },
}
