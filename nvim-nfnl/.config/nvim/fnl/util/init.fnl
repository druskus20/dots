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
M                                                                                                                                                                                                                      	
