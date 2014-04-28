(add-to-list 'load-path "~/.emacs.d/site-lisp")

;;; Global config

(autoload 'js2-mode      "js2-mode"      "JavaScript2 mode" t)
(autoload 'markdown-mode "markdown-mode" "Markdown files"   t)

(setq font-lock-maximum-decoration t)
(setq make-backup-files            nil) ; no ~ files

(setq-default indent-tabs-mode             nil)
(setq-default show-trailing-whitespace     t)

(global-set-key "\C-l" `goto-line) ; ctrl + l for goto line

(add-to-list 'auto-mode-alist '("[.]hpp$"      . c++-mode))
(add-to-list 'auto-mode-alist '("[.]js$"       . js2-mode))
(add-to-list 'auto-mode-alist '("[.]json$"     . js-mode))
(add-to-list 'auto-mode-alist '("[.]emacs$"    . lisp-mode))
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

(add-hook
  'c++-mode-hook
  (lambda()
    (font-lock-add-keywords nil
      '(
	 "\\<\\(bool\\|char\\|double\\|float\\|int\\|long\\|short\\|unsigned\\|void\\)\\>"
	 "\\<\\(alignof\\|alignas\\|constexpr\\|decltype\\|final\\|noexcept\\|nullptr\\|override\\|static_assert\\|thread_local\\)\\>"
	 "\\<sizeof\\.\\.\\."
	 )
      )
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

(add-hook
  'lisp-mode-hook
  (lambda()
    (setq lisp-indent-offset 2)
    )
  )
