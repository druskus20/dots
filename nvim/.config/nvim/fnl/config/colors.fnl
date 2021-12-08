; colors.fnl
                              
; Colors used across the config

(module config.colors
  {autoload {utils config.utils}})
  
(local colors 
  {:dark0             "#292f3a"
   :dark1             "#2e3440"
   :dark2             "#343346"
   :dark3             "#3e3d50"
   :dark4             "#494859"
   :dark5             "#545363"
   :dark6             "#5f5e6d"

   :light0            "#eaeaec"
   :light1            "#dfdfe2"
   :light2            "#d4d4d8"
   :light3            "#cac9ce"
   :light4            "#b4b4bb"
   :light5            "#a9a9b1"
   :light6            "#696977"

   :bright_red        "#ffc4c4"
   :bright_green      "#eff6ab"
   :bright_yellow     "#ffe6b5"
   :bright_blue       "#c9e6fd"
   :bright_purple     "#f7d7ff"
   :bright_aqua       "#ddfcf8"
   :bright_orange     "#ffd3c2"

   :neutral_red       "#eca8a8"
   :neutral_green     "#ccd389"
   :neutral_yellow    "#efd5a0"
   :neutral_blue      "#a5c6e1"
   :neutral_purple    "#e1bee9"
   :neutral_aqua      "#c7ebe6"
   :neutral_orange    "#efb6a0"

   :faded_red         "#ec8989"
   :faded_green       "#c9d36a"
   :faded_yellow      "#ceb581"
   :faded_blue        "#8abae1"
   :faded_purple      "#db9fe9"
   :faded_aqua        "#abebe2"
   :faded_orange      "#E69E83"

   :gray              "#c5c8c6"})

colors

; vim:foldmarker=>>>,<<<
