
;; turn on global line numbers 
(global-linum-mode 1)
(setq linum-format "%1d ")


;; Steve Yegge's emacs keybindings from http://steve.yegge.googlepages.com/effective-emacs 
;; akes sense to me :D
(global-set-key "\C-x\C-m" 'execute-extended-command) ;; M-x
(global-set-key "\C-c\C-m" 'execute-extended-command) ;; also M-x

(global-set-key "\C-w" 'backward-kill-word) ;; self explanatory. This is to avoid hitting BKSP key
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)



(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) ;;kill scroll bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1)) ;; kill tool bar
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1)) ;; kill menu bar

;; show unique file names 
(require 'uniquify) 
(setq 
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

;; set the compile/recompile global options

(global-set-key [f11] 'compile)
(global-set-key [f12] 'recompile)

