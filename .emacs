;; -*- Emacs-Lisp -*-

(add-to-list 'load-path "~/lisp")
(add-to-list 'load-path "~/lisp/b-mode")
(add-to-list 'load-path "~/lisp/cc-mode")
(add-to-list 'load-path "~/lisp/llvm-mode")

(add-to-list 'custom-theme-load-path "~/lisp/emacs-color-theme-solarized")
(load-theme 'solarized-dark t)

(autoload 'b-mode        "b-mode"        "B mode"           t)
(autoload 'js2-mode      "js2-mode"      "JavaScript2 mode" t)
(autoload 'llvm-mode     "llvm-mode"     "LLVM mode"        t)
(autoload 'markdown-mode "markdown-mode" "Markdown files"   t)

(setq font-lock-support-mode nil)
(setq font-lock-maximum-decoration t)
(setq make-backup-files            nil) ; no ~ files

(global-set-key [(meta    ?.)   ] "…")
(global-set-key [(control ?v)   ] `align-current)
(global-set-key [(control ?x) ?t] `delete-trailing-whitespace)
(global-set-key [(control ?l)   ] `goto-line)
(global-set-key [(control ?u)   ] `insert-char)

(add-to-list 'auto-mode-alist '("[.]b$"        . b-mode))
(add-to-list 'auto-mode-alist '("[.]hpp$"      . c++-mode))
(add-to-list 'auto-mode-alist '("[.]js$"       . js2-mode))
(add-to-list 'auto-mode-alist '("[.]json$"     . js-mode))
(add-to-list 'auto-mode-alist '("[.]emacs$"    . lisp-mode))
(add-to-list 'auto-mode-alist '("[.]ll$"       . llvm-mode))
(add-to-list 'auto-mode-alist '("[.]markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("[.]md$"       . markdown-mode))
(add-to-list 'auto-mode-alist '("[.]text$"     . markdown-mode))
(add-to-list 'auto-mode-alist '("[.]wsgi$"     . python-mode))

(add-hook
  'c-mode-common-hook
  (lambda()
    (setq c-basic-offset 4)
    (setq c-indent-level 4)

    (c-set-offset 'access-label       -2)
    (c-set-offset 'arglist-close       0)
    (c-set-offset 'arglist-intro       4)
    (c-set-offset 'case-label          0)
    (c-set-offset 'inclass             4)
    (c-set-offset 'innamespace         0)
    (c-set-offset 'label               2)
    (c-set-offset 'substatement-open   0)
    (c-set-offset 'statement-case-open 4)
    (c-set-offset 'statement-cont      0)
    (c-set-offset 'topmost-intro       0)
    (c-set-offset 'topmost-intro-cont  0)
    )
  )

(add-hook
  'js2-mode-hook
  (lambda()
    (setq js2-auto-indent-flag      nil)
    (setq js2-enter-indents-newline nil)
    (setq js2-indent-on-enter-key   nil)
    (setq js2-mirror-mode           nil)
    )
  )

;; LaTeX

(setq-default TeX-master nil)

(setq TeX-auto-save  t)
(setq TeX-parse-self t)
(setq TeX-PDF-mode   t)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq reftex-plug-into-AUCTeX t)

(add-hook
  'reftext-load-hook
  (lambda()
    (setq c-basic-offset 4)
    (setq c-indent-level 4)

    (c-set-offset 'access-label       -2)
    (c-set-offset 'arglist-close       0)
    (c-set-offset 'arglist-intro       4)
    (c-set-offset 'case-label          2)
    (c-set-offset 'inclass             4)
    (c-set-offset 'innamespace         0)
    (c-set-offset 'label               2)
    (c-set-offset 'substatement-open   0)
    (c-set-offset 'statement-case-open 4)
    (c-set-offset 'statement-cont      4)
    (c-set-offset 'topmost-intro       0)
    (c-set-offset 'topmost-intro-cont  0)

    (font-lock-add-keywords nil
      '(
	 ("\\<\\(FIXME\\|XXX\\):" 1 font-lock-warning-face t)
	 )
      )
    )
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(csv-separators (quote ("," ";")))
 '(indent-tabs-mode nil)
 '(lisp-body-indent 2)
 '(lisp-indent-offset 2)
 '(make-backup-files nil)
 '(show-trailing-whitespace t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'upcase-region 'disabled nil)
