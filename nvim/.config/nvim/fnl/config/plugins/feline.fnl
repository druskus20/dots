(module dots.plugins.feline
 {autoload {utils config.utils
            a aniseed.core
            nvim aniseed.nvim
            str aniseed.string
            colors config.colors
            feline feline
            feline-git feline.providers.git
            feline-lsp feline.providers.lsp
            devicons nvim-web-devicons}
  require-macros [config.macros]})

(set vim.opt.termguicolors true)

(local modes 
   {:n   {:text "NORMAL"       :color colors.neutral_purple}
    :i   {:text "INSERT"       :color colors.neutral_aqua}
    :c   {:text "COMMAND"      :color colors.neutral_purple}
    :ce  {:text "NORMEX"       :color colors.neutral_purple}
    :cv  {:text "EX"           :color colors.neutral_purple}
    :ic  {:text "INSCOMP"      :color colors.neutral_purple}
    :no  {:text "OP-PENDING"   :color colors.neutral_purple}
    :r   {:text "HIT-ENTER"    :color colors.neutral_purple}
    :r?  {:text "CONFIRM"      :color colors.neutral_purple}
    :R   {:text "REPLACE"      :color colors.neutral_purple}
    :Rv  {:text "VIRTUAL"      :color colors.neutral_purple}
    :s   {:text "SELECT"       :color colors.neutral_purple}
    :S   {:text "SELECT"       :color colors.neutral_purple}
    :t   {:text "TERM"         :color colors.neutral_purple}
    :v   {:text "VISUAL"       :color colors.neutral_blue}
    :V   {:text "VISUAL LINE"  :color colors.neutral_blue}
    "" {:text "VISUAL BLOCK" :color colors.neutral_blue}})

;(def bar-bg colors.dark1)
(def bar-bg colors.dark0)
(def horiz-separator-color colors.light1) 

; https://github.com/famiu/feline.nvim/blob/master/USAGE.md#thin-line-for-horizontal-splits
; Not working I think because of plugin order?
;(string.format "#%06x" 
;               (. (vim.api.nvim_get_hl_by_name :VertSplit true)
;                  :foreground))

(defn or-empty [x] (or x ""))
(defn spaces [x] (if x (.. " " x " ") ""))

; Helper Functions >>>
(defn get-current-filepath []
   (let [file (utils.shorten-path (vim.fn.bufname) 5 30)]
      (if (a.empty? file) ""
         nvim.bo.readonly (.. "RO " file)
         (and nvim.bo.modifiable nvim.bo.modified) (.. file " ●")
         (.. file " "))))

(defn vim-mode-hl [use-as-fg?]
   (let [color (. modes (vim.fn.mode) :color)] 
      (if use-as-fg? {:bg bar-bg :fg color} {:bg color :fg bar-bg})))

(defn git-status-provider []
   (or-empty (utils.keep-if #(~= "master" $1) ; TODO: Why only master?
                            (?. vim.b :gitsigns_status_dict :head))))

(defn vim-mode []
  (.. " " (or (. modes (vim.fn.mode) :text) vim.fn.mode) " "))

(defn lsp-progress-provider []
   (let [msgs (vim.lsp.util.get_progress_messages)
         s (icollect [_ msg (ipairs msgs)]
                     (when msg.message
                        (.. msg.title " " msg.message)))]
      (or-empty (str.join " | " s))))

(defn lsp-diagnostic-component [kind color]
   {:enabled #(~= 0 (vim.lsp.diagnostic.get_count 0 kind))
    :provider #(spaces (vim.lsp.diagnostic.get_count 0 kind))
    :left_sep ""
    :right_sep ""
    :hl {:fg bar-bg :bg color}})

(defn filetype-with-icon []
  (let [icon (devicons.get_icon (vim.fn.expand "%:e"))]
    (if icon
      (.. icon " " vim.bo.filetype)
      vim.bo.filetype)))

(defn filetype []
  vim.bo.filetype)

(defn coordinates []
  (let [[line col] (vim.api.nvim_win_get_cursor 0)] (.. " #" line " ")))


; Fills the bar with an horizontal line
(defn inactive-separator-provider []
  (if (not= (vim.fn.winnr) (vim.fn.winnr :j))
    (string.rep "─" (vim.api.nvim_win_get_width 0))
    ""))
; <<<
        
; Components >>>
(def components {:active {} :inactive {}})

(tset components.active 1
     [{:provider vim-mode :hl #(vim-mode-hl false)} 
      {:provider get-current-filepath :left_sep " "}
      {:provider git-status-provider :left_sep " " :hl #(vim-mode-hl true)}]) 

(tset components.active 2
     [{:provider lsp-progress-provider
       :left_sep " "
       :right_sep " "
       :enabled #(< 0 (length (vim.lsp.buf_get_clients)))}])

(tset components.active 3
     [{:provider filetype-with-icon :right_sep " " :hl #(vim-mode-hl true)}
      (lsp-diagnostic-component "Information" colors.neutral_green)
      (lsp-diagnostic-component "Hint" colors.neutral_aqua)
      (lsp-diagnostic-component "Warning" colors.neutral_yellow)  
      (lsp-diagnostic-component "Error" colors.neutral_red)
      {:provider coordinates :hl #(vim-mode-hl false)}])

(tset components.inactive 1
     [{:provider inactive-separator-provider 
       :hl {:bg "NONE" :fg horiz-separator-color}}])
; <<< 

(feline.setup 
  {:colors {:fg colors.light1 :bg colors.dark0}
   :default_hl  {:inactive 
                 {:fg horiz-separator-color 
                  :bg "NONE"}}
   :components components})

; vim:foldmarker=>>>,<<<
