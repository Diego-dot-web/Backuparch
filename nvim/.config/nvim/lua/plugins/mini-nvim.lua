return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }

      require('mini.surround').setup()
    end,
  },
  {
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      opts = {},
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = {},
  },
}
