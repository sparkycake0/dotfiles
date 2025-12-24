if vim.loader then
  vim.loader.enable()
end

require("config.lazy")
require("lazy").setup({
  { import = "plugins" },
})
require("mason").setup({
  log_level = vim.log.levels.DEBUG,
})
vim.g.lazyvim_check_order = false
