return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  build = 'make install_jsregexp',
  config = function()
    ls = require 'luasnip'
    snippets = require 'config.snippets'
    ls.add_snippets('go', snippets.go)
  end,
}
