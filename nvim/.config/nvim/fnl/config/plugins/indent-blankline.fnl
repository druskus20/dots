(module config.plugins.indent-blankline
  {autoload {indent_blankline indent_blankline
             utils config.utils}})

(indent_blankline.setup {:space_char_blankline " "
                         :char_highlight_list ["IndentBlanklineIndent1"]})

(set vim.g.indent_blankline_enabled false)





