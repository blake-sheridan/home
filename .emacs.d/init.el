(add-to-list
  'load-path
  "~/elisp")

(load-file
  "~/elisp/.loaddefs.el")

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

(global-set-key "\C-u" `insert-char)
(global-set-key "\C-ca" `align-current)
(global-set-key "\C-cc" '(lambda () (interactive) (print (current-column) t)))
(global-set-key "\C-ce" `eval-buffer)
(global-set-key "\C-ct" `delete-trailing-whitespace)
(global-set-key "\M-," `beginning-of-buffer)
(global-set-key "\M-." `end-of-buffer)

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
         (brace-list-open . 0)
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
(put 'upcase-region 'disabled nil)
