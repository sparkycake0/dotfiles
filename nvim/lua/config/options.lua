local opt = vim.opt
local g = vim.g

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300
opt.lazyredraw = false

-- UI
opt.wrap = true
opt.linebreak = true
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.showmode = false
opt.laststatus = 0

-- Editing
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.breakindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Files
opt.undofile = true
opt.backup = false
opt.swapfile = false

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }
opt.pumheight = 10

-- Misc
opt.mouse = "a"
opt.confirm = true
opt.hidden = true

-- Snacks config
g.snacks_animate = true

-- Ensure laststatus stays 0
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "BufEnter" }, {
  callback = function()
    vim.o.laststatus = 0
  end,
})
