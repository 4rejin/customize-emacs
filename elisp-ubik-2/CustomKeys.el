
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

;; ==== Lots of C++ specific stuff ====

(global-set-key [f11] 'compile)
(global-set-key [f12] 'recompile)

;; C++ stuff for auto updating gtags 
(defun gtags-create-or-update ()
  "create or update the gnu global tag file"
  (interactive)
  (if (not (= 0 (call-process "global" nil nil nil " -p"))) ; tagfile doesn't exist?
    (let ((olddir default-directory)
          (topdir (read-directory-name  
                    "gtags: top of source tree:" default-directory)))
      (cd topdir)
      (shell-command "gtags && echo 'created tagfile'")
      (cd olddir)) ; restore   
    ;;  tagfile already exists; update it
    (shell-command "global -u && echo 'updated tagfile'")))

(add-hook 'gtags-mode-hook 
  (lambda()
    (local-set-key (kbd "M-.") 'gtags-find-tag)   ; find a tag, also M-.
    (local-set-key (kbd "M-,") 'gtags-find-rtag)))  ; reverse tag

(add-hook 'c-mode-common-hook
  (lambda ()
    (require 'gtags)
    (gtags-mode t)
    (gtags-create-or-update)))

;; C++ stuff for quickly switching between header and implementation
(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))
