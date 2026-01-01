return {
  'deparr/tairiki.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('tairiki').setup {
      default_dark = 'tomorrow',
      diagnostics = {
        darker = false,
        background = false,
        undercurl = false,
      },
      code_style = {
        comments = { italic = true },
      },
      -- colors = function(c, opts)
      --   c.fg = '#FFFFFF'
      --   c.bg_light4 = c.bg
      -- end,
    }
    vim.cmd.colorscheme 'tairiki'
  end,
}
