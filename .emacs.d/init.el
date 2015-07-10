;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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

(add-hook
  'markdown-mode-hook
  (lambda ()
    (electric-indent-local-mode -1)))

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
(global-set-key "\C-cl" `goto-line)
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
         (inline-open . 0)
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
 '(font-lock-comment-delimiter-face ((t (:inherit shadow))))
 '(font-lock-comment-face ((t (:foreground "brightyellow" :slant italic))))
 '(font-lock-doc-face ((t (:foreground "color-244" :slant italic))))
 '(font-lock-function-name-face ((t (:foreground "magenta"))))
 '(markdown-header-face ((t (:inherit outline-1 :underline t))))
 '(markdown-header-face-1 ((t (:inherit (outline-1 markdown-header-face)))))
 '(markdown-header-face-2 ((t (:inherit (outline-2 markdown-header-face)))))
 '(markdown-header-face-3 ((t (:inherit (outline-3 markdown-header-face)))))
 '(markdown-header-face-4 ((t (:inherit (outline-4 markdown-header-face)))))
 '(markdown-header-face-5 ((t (:inherit (outline-5 markdown-header-face)))))
 '(markdown-header-face-6 ((t (:inherit (outline-6 markdown-header-face)))))
 '(markdown-inline-code-face ((t (:inherit font-lock-constant-face :foreground "brightred"))))
 '(markdown-language-keyword-face ((t (:inherit font-lock-keyword-face))))
 '(markdown-list-face ((t (:inherit shadow))))
 '(markdown-pre-face ((t (:inherit nil :background "color-239"))))
 '(outline-1 ((t (:foreground "red"))))
 '(outline-2 ((t (:foreground "green"))))
 '(outline-3 ((t (:foreground "yellow"))))
 '(outline-4 ((t (:foreground "blue"))))
 '(outline-5 ((t (:foreground "magenta"))))
 '(outline-6 ((t (:foreground "cyan")))))
(put 'upcase-region 'disabled nil)
