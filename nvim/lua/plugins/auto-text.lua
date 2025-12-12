return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      map_c_h = true,
    },
    config = true,
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        documentation = {
          auto_show = true,
        },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main = "ibl",
    opts = {},
  },
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        color = {
          suggestion_color = "#4287f5",
        },
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
  },
  { "L3MON4D3/LuaSnip", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
}
