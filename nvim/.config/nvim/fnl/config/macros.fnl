; macros.fnl 
; Various macros used across the rest of the config

{:augroup
  (fn [name ...]
    `(do
       (nvim.ex.augroup ,(tostring name))
       (nvim.ex.autocmd_)
       ,...
       (nvim.ex.augroup :END)))
  
  :req
  (fn [name ...]
    (let [str  (require :aniseed.string) 
          a    (require :aniseed.core)
          segs (str.split (tostring name) "%.")
          mod  (str.join "." (a.butlast segs))
          func (a.last segs)]
      `((. (require (tostring ,mod)) (tostring ,func)) ,...)))
 
  :autocmd
  (fn [...]
    `(nvim.ex.autocmd ,...))
 
  :_:
  (fn [name ...]
    `((. nvim.ex ,(tostring name)) ,...))
  
  :viml->fn
  (fn [name]
    `(.. "lua require('" *module-name* "')['" ,(tostring name) "']()"))
 
  :dbg
  (fn [x]
    `(let [view# (require "aniseed.view")]
      (print (.. `,(tostring x) " => " (view#.serialise ,x)))
      ,x))
 
  :dbg-call
  (fn [x ...]
    `(do
      (let [a# (require "aniseed.core")]
        (a#.println ,...))
      (,x ,...)))
 
  :pkg
  (fn [name mappings ...]
    `(if (~= nil (. packer_plugins `,(tostring name)))
        (let ,mappings ,...)
        (print (.. "plugin disabled " `,(tostring name)))))
 
  :vim-let
  (fn [field value]
    (let [text (.. "let " `,(tostring field) "=\"" value "\"")]
     `(vim.cmd ,text)))
 
  :each-pair
  (fn [args ...]
    (let [[l# r# d#] args]
      `(let [a# (require "aniseed.core")
             data# ,d#]
        (for [i# 1 (a#.count data#) 2]
          (let [,l# (. data# i#)
                ,r# (. data# (+ i# 1))]
            ,...)))))

  :if-let
  (fn [[name value] ...]
    `(let [,name ,value]
       (when ,name ,...)))}
 
