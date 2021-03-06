;; default-input-method
;; C-x RET C-\ , then choose an input method.

;; fsbot: dk C-x RET f
;; <fsbot> set-buffer-file-coding-system is an interactive compiled Lisp function

;; M-x grep RET C-a C-k grep -nH THREADPROC_SIGNATURE *.d RET

(add-to-list 'load-path "~/.emacs.d/")

;(setq shell-file-name "c:/cygwin/bin/bash.exe")
(setq shell-file-name "d:/emacs-24.3/bin/cmdproxy.exe")

(setq exec-path (append exec-path '("c:/Program Files/Mozilla Firefox/")))
;(setq exec-path (append exec-path '("c:/app/opera/26.0.1656.60/")))

;disable logging to *Messages*
;(fset 'message 'ignore)
(setq messages-buffer-max-lines nil)

;disable checking of git ...
(setq vc-handled-backends nil)

(require 'cl)

(when (> emacs-major-version 22)
  (with-no-warnings
	(byte-compile-disable-warning 'cl-functions)))

;(load "init-elp")
(load "init-base")
(load "init-key")

(load "init-eshell")

(load "init-dict")
(load "init-erc")

(load "init-w3m") ;will slow down loading mew
(load "init-mew")

;(load "init-ac")

;(load "init-slime")
(load "init-maxima")

(load "init-scheme")
;(load "init-clojure")

;(load "init-erlang")
;(load "init-prolog")

;(load "init-haskell")
;(load "init-ocaml")

;(load "init-ruby")
;(load "init-forth")
;(load "init-lua")

;(load "init-git")
;(load "init-sqlite")

;(load "init-emms")
;(load "init-radio")

;(load "init-package")

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;默认链接网络浏览器打开
;(setq browse-url-generic-program (executable-find "opera"))
(setq browse-url-generic-program (executable-find "firefox.exe"))
(setq browse-url-browser-function 'browse-url-generic)
(global-set-key "\C-c\C-g" 'browse-url-at-point)

;; ------------------------------------------------------------ [ ispell ]
(eval-after-load "ispell"
  '(progn
     ;; Use the -C option when running aspell, which will
     ;; ConsiderCamelCaseToBeCorrect
     (setq ispell-extra-args '("-C"))))

(setq initial-frame-alist '((top . 357) (left . 0) (width . 158) (height . 30)))
(add-hook 'after-init-hook '(lambda ()
							  ;(server-start)
							  (split-window-horizontally)
							  (list-bookmarks)
							  (switch-to-buffer (get-buffer-create "*Bookmark List*"))))

(setq kill-buffer-query-functions (remove 'process-kill-buffer-query-function kill-buffer-query-functions))

(defadvice ibuffer-do-print (before print-buffer-query activate)
   (unless (y-or-n-p "Print buffer? ")
     (error "Cancelled")))

(blink-cursor-mode -1)

;(require 'dired+)
;(put 'dired-find-alternate-file 'disabled nil)  ;enable `a' command

;;这个东西必须放在最后%%
;;desktop.el是一个可以保存你上次emacs关闭时的状态，下一次启动时恢复为上次关闭的状态。就和vmware的suspend一样。
;;因为我要使用sawfish-mode,wiki-mode,html-helper-mode，放在这里才能保证下次启动时能正确辨认文件需要的模式。
;(load "desktop") 
;(desktop-load-default) 
;(desktop-read)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((Syntax . Common-Lisp) (eval add-hook (quote write-file-hooks) (quote time-stamp)))))
 '(scheme-program-name "guile -q -l /D/qachina/db/doc/scheme/money-guile.scm")
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(erc-command-indicator-face ((t (:foreground "red"))))
 '(vertical-border ((nil (:background "black" :foreground "black")))))
