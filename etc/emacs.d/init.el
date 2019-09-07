;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list
  'custom-theme-load-path
  "~/.emacs.d/color-theme-solarized")

(load-theme 'solarized t)

(add-hook 'after-make-frame-functions
  (lambda (frame)
    (set-frame-parameter
      frame
      'background-mode
      'dark)
    (enable-theme 'solarized)))

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
 '(electric-indent-mode nil)
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
 '(safe-local-variable-values (quote ((tab-always-indent))))
 '(show-trailing-whitespace t)
 '(standard-indent 2)
 '(tab-width 4))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((t (:foreground "magenta"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "black" :slant italic))))
 '(font-lock-comment-face ((t (:foreground "brightyellow" :slant italic))))
 '(font-lock-doc-face ((t (:foreground "brightgreen" :slant italic))))
 '(font-lock-function-name-face ((t (:foreground "brightred"))))
 '(font-lock-string-face ((t (:foreground "cyan"))))
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
