
;; enable ido mode THis is feaking awesome !
(ido-mode t)
(setq ido-enable-flex-matching t) ; fuzzy matching is a must have

;; =========== IRC stuff =========== ;;
;; http://emacs-fu.blogspot.com/2009/06/erc-emacs-irc-client.html ;;

(defvar erc-nick-notify-last '(0 0 0))
(defvar erc-nick-notify-delay '(0 5 0))
(defvar erc-nick-notify-cmd "notify-send")
(defvar erc-nick-notify-icon "/usr/share/icons/default.kde4/32x32/apps/emacs.png")
(defvar erc-nick-notify-timeout 10000)
(defvar erc-nick-notify-urgency "low")
(defvar erc-nick-notify-category "im.received")

(require 'erc)
(require 'erc-nick-notify)

(load-library "ercstuff")

;;======= blogging stuff =======;;
;; run weblogger-setup thingamajig to setup the blog

(require 'xml-rpc)
(require 'weblogger)

;;======= yasnippet =======;; 

(require 'yasnippet-bundle)
;;invoke yasnippet using a custom key 
(global-set-key "\C-c\C-y" 'yas/insert-snippet)

;;======= c++ stuff =======;;
(load-library "cppstuff")

;;======= pythong stuff =========;;

;;======= C# Stuff ==============;;

(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
    (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

