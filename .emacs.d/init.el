(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
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
 '(package-selected-packages (quote (solarized-theme)))
 '(safe-local-variable-values (quote ((tab-always-indent))))
 '(show-trailing-whitespace t)
 '(standard-indent 2)
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;(load-theme 'solarized-dark t)
;(load-theme 'solarized-light t)

(setq vc-follow-symlinks nil)

;; Display current line and column number
(setq column-number-mode t)
