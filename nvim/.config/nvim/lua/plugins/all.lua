return {
  'NMAC427/guess-indent.nvim',
  'lewis6991/gitsigns.nvim',
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 500,
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>g', group = '[G]it' },
      },
    },
  },
  {
    'LunarVim/breadcrumbs.nvim',
    dependencies = {
      { 'SmiteshP/nvim-navic' },
    },
  },
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      local statusline = require 'mini.statusline'
      statusline.setup {}

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
}
