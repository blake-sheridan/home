(add-to-list 'load-path "~/.emacs.d/site-lisp")

;;; Global config

(setq make-backup-files nil) ; no ~ files
(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)

;;; Key bindings

(global-set-key "\C-l" `goto-line) ; ctrl + l for goto line

;;; C

(c-add-style "my-c-style"
         '((c-basic-offset . 4)
           (c-comment-only-line-offset . 0)
           (c-hanging-braces-alist . ((substatement-open before after)))
           (c-offsets-alist . (
                   (access-label        . -2)
                   (case-label          . 2)
                   (inclass             . 4)
                   (inline-open         . 4)
                   (innamespace         . 0)
                   (substatement        . 4)
                   (substatement-open   . 0)
                   (statement-case-open . 4)
                   (statement-cont      . 4)
                   (topmost-intro       . 0)
                   (topmost-intro-cont  . 0)
                   )))
)

(defun my-c-mode-hook ()
  (setq c-basic-offset 4)
  (setq c-indent-level 4)
)

;;; C++

(defun my-c++-mode-hook ()
  (c-set-style "my-c-style")
)

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;;; JavaScript

(autoload 'js2-mode "js2-mode" "JavaScript2 mode" t)

(setq js2-mirror-mode nil)
(setq js2-auto-indent-flag nil)
(setq js2-indent-on-enter-key nil)
(setq js2-enter-indents-newline nil)

(add-to-list 'auto-mode-alist '("[.]js$" . js2-mode))

;;; JSON

(add-to-list 'auto-mode-alist '("[.]json$" . js-mode))

;;; Markdown

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;; Python

(add-to-list 'auto-mode-alist '("[.]wsgi$" . python-mode))

(c-add-style
  "python-new"
  '((indent-tabs-mode . nil)
    (fill-column      . 78)
    (c-basic-offset   . 4)
    (c-offsets-alist  . ((substatement-open . 0)
                         (inextern-lang . 0)
                         (arglist-intro . +)
                         (knr-argdecl-intro . +)))
    (c-hanging-braces-alist . ((brace-list-open)
                               (brace-list-intro)
                               (brace-list-close)
                               (brace-entry-open)
                               (substatement-open after)
                               (block-close . c-snug-do-while)))
    (c-block-comment-prefix . "* "))
  )

(defun c-select-style ()
   (save-excursion
     (if (re-search-forward "^\t" 3000 t)
         (c-set-style "python")
       (c-set-style "python-new"))))
(add-hook 'c-mode-hook 'c-select-style)
