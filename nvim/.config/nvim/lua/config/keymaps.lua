vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>wh', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>wl', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<leader>wj', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>wk', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<S-h>', '<cmd>tabprevious<CR>')
vim.keymap.set('n', '<S-l>', '<cmd>tabnext<CR>')
vim.keymap.set('n', '<C-w>', '<cmd>tabclose<CR>')
vim.keymap.set('n', '<C-t>', '<cmd>tabnew<CR>')

vim.keymap.set('n', '<leader>q', '<cmd>quit<CR>')
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>')

vim.keymap.set('n', '<C-x><C-k>', '<cmd>bdelete<CR>')
vim.keymap.set('n', '<C-x><C-n>', '<cmd>bnext<CR>')
vim.keymap.set('n', '<C-x><C-p>', '<cmd>bprevious<CR>')
vim.keymap.set('n', '<C-x><C-s>', '<cmd>write<CR>')
vim.keymap.set('n', '<leader>,', 'yyp')

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', '<leader>xx', '<cmd>lua vim.diagnostic.setqflist()<CR>')

vim.keymap.set('n', '<leader>es', '<cmd>set spell spelllang=es<CR>')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end)

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end)

vim.keymap.set('n', '[h', function()
  gitsigns.nav_hunk 'prev'
end)

vim.keymap.set('n', ']h', function()
  gitsigns.nav_hunk 'next'
end)

vim.keymap.set('n', '<leader>fw', '<CMD>noautocmd w<CR>')
vim.keymap.set({ 'n', 'v', 'x' }, 'j', 'gj')
vim.keymap.set({ 'n', 'v', 'x' }, 'k', 'gk')

vim.keymap.set('n', '<leader>gg', '<CMD>Neogit cwd=%:p:h<CR>')

vim.keymap.set('n', '<leader>gc', '<CMD>Neogit cwd=~/Backuparch<CR>')
