(module config.plugins.dashboard
  {autoload {dashboard dashboard}})


(set vim.g.dashboard_disable_at_vimenter 0)

(set vim.g.dashboard_disable_statusline 1)

(set vim.g.dashboard_default_executive :telescope)

(set vim.g.dashboard_custom_header
     {1 "                                   "
      2 "                                   "
      3 "                                   "
      4 "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          "
      5 "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       "
      6 "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     "
      7 "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    "
      8 "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   "
      9 "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  "
      10 "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   "
      11 " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  "
      12 " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ "
      13 "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     "
      14 "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     "
      15 "                                   "})

(set vim.g.dashboard_custom_section
     {:b {:command "Telescope oldfiles"
          :description {1 "  Recents                   SPC f o"}}
      :f {:command :SessionLoad
          :description {1 "  Load Last Session         SPC l  "}}
      :d {:command :DashboardNewFile
          :description {1 "  New File                  SPC f n"}}
      :c {:command "Telescope live_grep"
          :description {1 "  Find Word                 SPC f w"}}
      :a {:command "Telescope find_files"
          :description {1 "  Find File                 SPC f f"}}
      :e {:command "Telescope marks"
          :description {1 "  Bookmarks                 SPC b m"}}})

(set vim.g.dashboard_custom_footer {1 "   "})


                   
