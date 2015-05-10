;;------------------------------------------------------------------------------------------------;;
;; C/C++

; We can't use autoload, as it must take priority over the normal cc-mode

(add-to-list
  'load-path
  "~/.emacs.d/cc-mode")

(add-to-list
  'auto-mode-alist
  '("\\.h[p]?[p]?\\'" . c++-mode))

;;------------------------------------------------------------------------------------------------;;
;; git

(add-to-list
  'auto-mode-alist
  '(".git\\(?:config\\|ignore\\|modules\\)\\'" . conf-unix-mode))

(add-to-list
  'auto-mode-alist
  '("COMMIT_EDITMSG" . conf-unix-mode)) ; `log-edit-mode`, maybe

;;------------------------------------------------------------------------------------------------;;
;; LLVM

(add-to-list
  'load-path
  "~/.emacs.d/llvm-mode")

(autoload
  'llvm-mode
  "llvm-mode")

(add-to-list
  'auto-mode-alist
  '("\\.ll\\'" . llvm-mode))

;;------------------------------------------------------------------------------------------------;;
;; Make

(define-derived-mode __makefile-mode makefile-mode
  "`makefile-mode` tweaks"
  (defconst __makefile-font-lock-keywords
    (makefile-make-font-lock-keywords
      makefile-var-use-regex
      `(
         "undefine"
         ,@makefile-gmake-statements)
      t))
  (setq font-lock-defaults
    `(__makefile-font-lock-keywords ,@(cdr font-lock-defaults))))

(setq auto-mode-alist
  (append
    (list
      '("Makefile\\'" . __makefile-mode)
      '("\\.mk\\'"    . __makefile-mode))
    auto-mode-alist))

;;------------------------------------------------------------------------------------------------;;
;; Markdown

(add-to-list
  'load-path
  "~/.emacs.d/markdown-mode")

(autoload
  'markdown-mode
  "markdown-mode")

(add-to-list
  'auto-mode-alist
  '("\\.md\\'" . markdown-mode))

;;------------------------------------------------------------------------------------------------;;
;; Python

(add-to-list
  'auto-mode-alist
  '("\\.wsgi\\'" . python-mode))

(add-hook
  'python-mode-hook
  (lambda ()
    (electric-indent-local-mode -1)))

;;------------------------------------------------------------------------------------------------;;

(add-to-list
  'custom-theme-load-path
  "~/.emacs.d/emacs-color-theme-solarized")

(load-theme
  'solarized
  t)

(add-hook 'after-make-frame-functions
  (lambda (frame)
    (set-frame-parameter
      frame
      'background-mode
      'dark)
    (enable-theme 'solarized)))

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

;; Reserved for users:
;; F5 through F9 without modifier keys
;; C-c and a letter

(global-set-key "\C-ca" "∧")
(global-set-key "\C-cd" "÷")
(global-set-key "\C-ci" "•")
(global-set-key "\C-cf" "⊥")
(global-set-key "\C-cm" "×")
(global-set-key "\C-cN" "≠")
(global-set-key "\C-cn" (lambda () (interactive) (insert "¬"))) ; Workaround
(global-set-key "\C-co" "∨")
(global-set-key "\C-ct" "⊤")
(global-set-key "\C-cx" "⊕")

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
  '(c-offsets-alist
     (quote
       ((topmost-intro-cont . 0)
         (statement-cont . 0)
         (statement-case-open . 4)
         (substatement-open . 0)
         (access-label . -2)
         (arglist-intro . +)
         (arglist-close . 0)
         (inextern-lang . 0)
         (innamespace . 0))))
 '(csv-separators (quote ("," ";")))
 '(electric-indent-mode t)
 '(font-lock-maximum-decoration t)
 '(font-lock-support-mode (quote jit-lock-mode))
 '(frame-background-mode (quote dark))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(lisp-backquote-indentation t)
 '(lisp-body-indent 2)
 '(lisp-indent-offset 2)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(show-trailing-whitespace t)
 '(tab-width 4))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
