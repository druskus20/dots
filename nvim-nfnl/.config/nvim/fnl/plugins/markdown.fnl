; Requires tree-sitter

[{1 :lukas-reineke/headlines.nvim
    :enabled false
    :ft [:markdown :norg :rmd :org]
    :config true}]
    ;:opts (fn []
    ;        (local opts {})
    ;        ; TODO: ugly
    ;        (each [_ ft (ipairs [:markdown :norg :rmd :org])]
    ;          (tset opts ft {:headline_highlights {}})
    ;          (for [i 1 6]
    ;            (table.insert (. opts ft :headline_highlights) (.. :Headline i))))
    ;        opts]}]
  
