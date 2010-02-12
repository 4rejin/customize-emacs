
;; enalble ido mode THis is feaking awesome !
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have

;;yasnippet
(add-to-list 'load-path "~/.emacs.d/elisp-ubik-2/")
(require 'yasnippet-bundle)
;;invoke yasnippet using a custom key 

(global-set-key "\C-c\C-y" 'yas/insert-snippet)

;; use spaces instead of tab

(require 'cc-mode)
(defun my-build-tab-stop-list (width)
  (let ((num-tab-stops (/ 80 width))
	(counter 1)
	(ls nil))
    (while (<= counter num-tab-stops)
      (setq ls (cons (* width counter) ls))
      (setq counter (1+ counter)))
    (set (make-local-variable 'tab-stop-list) (nreverse ls))))
(defun my-c-mode-common-hook ()
  (setq tab-width 5) ;; change this to taste, this is what K&R uses :)
  (my-build-tab-stop-list tab-width)
  (setq c-basic-offset tab-width)
  (setq indent-tabs-mode nil)) ;; force only spaces for indentation
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


;;c++ stuff
(setq compilation-window-height 8)
(setq compilation-finish-function
      (lambda (buf str)

        (if (string-match "exited abnormally" str)

            ;;there were errors
            (message "compilation errors, press C-x ` to visit")

          ;;no errors, make the compilation window go away in 0.5 seconds
          (run-at-time 0.5 nil 'delete-windows-on buf)
          (message "NO COMPILATION ERRORS!"))))


;; python stuff - will add later :D

