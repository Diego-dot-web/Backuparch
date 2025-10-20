vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end)
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end)
vim.keymap.set('n', '[d', function()
  gitsigns.nav_hunk 'prev'
end)

vim.keymap.set('n', ']d', function()
  gitsigns.nav_hunk 'next'
end)
vim.keymap.set('n', '<leader>fw', '<CMD>noautocmd w<CR>')
vim.keymap.set({ 'n', 'v', 't', 'x' }, 'j', 'gj')
vim.keymap.set({ 'n', 'v', 't', 'x' }, 'k', 'gk')
