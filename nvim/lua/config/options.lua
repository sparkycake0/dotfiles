vim.g.snacks_animate = true
vim.o.wrap = true
vim.o.laststatus = 0
vim.o.showmode = false
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "BufEnter" }, {
  callback = function()
    vim.o.laststatus = 0
  end,
})
