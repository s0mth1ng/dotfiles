local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

return {
  go = {
    s('fmain', {
      t { 'func main() {', '\t' },
      i(0),
      t { '', '}' },
    }),
    s('pmain', {
      t { 'package main', '' },
      t { '', '' },
      t { 'func main() {', '\t' },
      i(0),
      t { '', '}' },
    }),
    s('pln', {
      t 'fmt.Println(',
      i(1),
      t ')',
    }),
    s('pf', {
      t 'fmt.Printf("',
      i(1),
      t '", ',
      i(2),
      t ')',
    }),
    s('iferr', {
      t { 'if err != nil {', '\t' },
      t 'return ',
      c(1, {
        t 'err',
        t 'nil',
      }),
      t { '', '}' },
    }),
  },
}
