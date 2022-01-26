(module config.plugins.indent-blankline
  {autoload {indent_blankline indent_blankline
             utils config.utils}})

(set vim.opt.list true)
(indent_blankline.setup {:space_char_blankline " "
                         :char_highlight_list ["IndentBlankLineIndent1"]})







