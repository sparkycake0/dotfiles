-- Buffers manipulation
vim.keymap.set("n", "<leader>[", "<Cmd>bprev<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader>]", "<Cmd>bnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<C-q>", ":bd<CR>", { noremap = true, silent = true })

-- General
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>e", "<cmd>Telescope file_browser<CR>", { desc = "Open file browser" })

vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Move to left window", remap = false })
vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Move to right window", remap = false })

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    vim.keymap.del("n", "<C-Left>")
    vim.keymap.del("n", "<C-Right>")
    vim.keymap.set("n", "<C-Left>", "<C-w>h", { desc = "Move to left window", remap = false })
    vim.keymap.set("n", "<C-Right>", "<C-w>l", { desc = "Move to right window", remap = false })
  end,
})
