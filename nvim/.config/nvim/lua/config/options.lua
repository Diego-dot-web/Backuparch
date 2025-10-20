vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.number = true
vim.o.undofile = true
vim.o.relativenumber = true
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.signcolumn = 'yes'
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.updatetime = 250
vim.o.timeoutlen = 500
vim.o.breakindent = true
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.o.list = true
vim.opt.listchars = 'trail:-,nbsp:+,tab:▏ ,lead:·'
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.undolevels = 10000
vim.opt.mouse = 'a'
vim.opt.conceallevel = 2
