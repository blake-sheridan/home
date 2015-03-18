;;------------------------------------------------------------------------------------------------;;
;; B

(add-to-list
  'load-path
  "~/src/b-mode")

(autoload
  'b-mode
  "b-mode"
  nil
  t)

(autoload
  'b-keymap-mode
  "~/src/b-mode/b-keymap-mode")

(add-to-list
  'auto-mode-alist
  '("[.]b$" . b-mode))

;;------------------------------------------------------------------------------------------------;;
;; C/C++

; We can't use autoload, as it must take priority over the normal cc-mode

(add-to-list
  'load-path
  "~/.emacs.d/cc-mode")

(add-to-list
  'auto-mode-alist
  '("[.]h[p]?[p]?$" . c++-mode))

;;------------------------------------------------------------------------------------------------;;
;; git

(add-to-list
  'auto-mode-alist
  '(".git\\(?:config\\|modules\\)" . conf-unix-mode))

;;------------------------------------------------------------------------------------------------;;
;; LLVM

(add-to-list
  'load-path
  "~/src/llvm-mode")

(autoload
  'llvm-mode
  "llvm-mode")

(add-to-list
  'auto-mode-alist
  '("[.]ll$" . llvm-mode))

;;------------------------------------------------------------------------------------------------;;
;; Markdown

(add-to-list
  'auto-mode-alist
  '("[.]md$" . markdown-mode))

;;------------------------------------------------------------------------------------------------;;
;; Python

(add-to-list
  'auto-mode-alist
  '("[.]wsgi$" . python-mode))

(add-hook
  'python-mode-hook
  (lambda() ()
    (setq electric-indent-inhibit t)))

;;------------------------------------------------------------------------------------------------;;

(add-to-list
  'custom-theme-load-path
  "~/src/emacs-color-theme-solarized")

(load-theme
  'solarized-dark
  t)

;;------------------------------------------------------------------------------------------------;;

(global-set-key
  [f12]
  `beginning-of-buffer)

(global-set-key
  "\C-u"
  `insert-char)

(global-set-key
  "\C-v"
  `align-current)

(global-set-key
  "\C-x\C-t"
  `delete-trailing-whitespace)

(global-set-key
  "\C-\M-e"
  `eval-expression)

(global-set-key
  "\M-,"
  "←")

(global-set-key
  "\M-."
  "→")

(global-set-key
  "\M-;"
  "…")

; Print the current column

(global-set-key
  "\C-cc"
  '(lambda ()
     (interactive)
     (print (current-column) t)))

;;------------------------------------------------------------------------------------------------;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(c-offsets-alist (quote ((topmost-intro-cont . 0) (statement-cont . 0) (statement-case-open . 4) (substatement-open . 0) (access-label . -2) (arglist-intro . +) (arglist-close . 0) (inextern-lang . 0) (innamespace . 0))))
 '(csv-separators (quote ("," ";")))
 '(electric-indent-mode t)
 '(font-lock-maximum-decoration t)
 '(font-lock-support-mode (quote jit-lock-mode))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(lisp-backquote-indentation t)
 '(lisp-body-indent 2)
 '(lisp-indent-offset 2)
 '(make-backup-files nil)
 '(show-trailing-whitespace t)
 '(tab-width 4))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
