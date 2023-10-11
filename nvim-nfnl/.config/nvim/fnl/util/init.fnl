; Various utilities

; there's definitely a more lispy way to do this
(local M {})

(set M.root_patterns [:.git :lua])

; https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/util/init.lua
(fn M.get_root []
  (var path (vim.api.nvim_buf_get_name 0))
  (set path (or (and (not= path "") (vim.loop.fs_realpath path)) nil))
  (local roots {})
  (when path
    (each [_ client (pairs (vim.lsp.get_active_clients {:bufnr 0}))]
      (local workspace client.config.workspace_folders)
      (local paths (or (or (and workspace
                                (vim.tbl_map (fn [ws] (vim.uri_to_fname ws.uri))
                                             workspace))
                           (and client.config.root_dir [client.config.root_dir]))
                       {}))
      (each [_ p (ipairs paths)]
        (local r (vim.loop.fs_realpath p))
        (when (path:find r 1 true)
          (tset roots (+ (length roots) 1) r)))))
  (table.sort roots (fn [a b] (> (length a) (length b))))
  (var root (. roots 1))
  (when (not root)
    (set path (or (and path (vim.fs.dirname path)) (vim.loop.cwd)))
    (set root (. (vim.fs.find M.root_patterns {: path :upward true}) 1))
    (set root (or (and root (vim.fs.dirname root)) (vim.loop.cwd))))
  root)


; https://github.com/LazyVim/LazyVim/blob/e8c26c70e27d468cec11926890105d61f99f9218/lua/lazyvim/util/init.lua#L333
; Wrapper around vim.keymap.set that will
; not create a keymap if a lazy key handler exists.
; It will also set `silent` to true by default.
(fn M.safe_keymap_set [mode lhs rhs opts]
  (let [keys (. (. (require :lazy.core.handler) :handlers) :keys)]
    (var modes (or (and (= (type mode) :string) [mode]) mode))
    (set modes (vim.tbl_filter (fn [m]
                                 (not (and keys.have (keys:have lhs m))))
                               modes))
    (when (> (length modes) 0)
      (set-forcibly! opts (or opts {}))
      (set opts.silent (not= opts.silent false))
      (when (and opts.remap (not vim.g.vscode)) (set opts.remap nil))
      (vim.keymap.set modes lhs rhs opts))))

(fn M.on_load [name ___fn___]
  (let [Config (require :lazy.core.config)]
    (if (and (. Config.plugins name)
             (. (. (. Config.plugins name) "_") :loaded))

        (___fn___ name)
        (vim.api.nvim_create_autocmd :User
                                     {:callback (fn [event]
                                                  (when (= event.data name)
                                                    (___fn___ name)
                                                    true))
                                      :pattern :LazyLoad}))))

M                                                                                                                                                                                                                                        	
