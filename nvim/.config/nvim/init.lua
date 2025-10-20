require 'config.options'
require 'config.keymaps'
require 'config.autocmds'
require 'config.lazy'
if vim.fn.argc() == 0 then
  vim.cmd 'terminal'
end
