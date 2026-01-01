return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  branch = 'master',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {
      'go',
      -- 'python',
      'yaml',
      'json',
      'sql',
      'bash',
      'markdown',
      'markdown_inline',
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = { enable = true },
  },
}
