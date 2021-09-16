(module dots.plugins.indent_blankline
        {autoload {indent_blankline indent_blankline
                   colors dots.colors
                   utils dots.utils}})

(indent_blankline.setup {:char "|"
                         :buftype_exclude {1 :terminal}})

(utils.highlight :IndentBlankLineChar {:fg colors.light4})

