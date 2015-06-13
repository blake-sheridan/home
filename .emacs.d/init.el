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

(load "~/mojo/emacs/__init__.el")

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

;; escape
;; f1
;;   <alt>: put keyboard focus on the launcher
;; f2
;;   <alt>: execute command
;; f3
;; f4
;;   <alt>: close window
;; f5
;; f6
;; f7
;;   <alt>: move window
;; f8
;;   <alt>: resize window
;; f9
;; f10
;; f11: close terminal
;; f12: new terminal

;; `
;;   <super>: show the launcher
;; 1
;; 2
;; 3
;; 4
;; 5
;;   <ctrl><alt>: toggle maximization state
;; 6
;; 7
;; 8
;; 9
;; 0
;;   <ctrl>: normal size
;;   <ctrl><alt>: minimize window
;; -
;;   <ctrl>: zoom out
;; +
;;   <ctrl>: zoom in
;; backspace

;; q
;;   <shift><ctrl>: close all terminals
;; w
;;   <super>: initiate window picker
;;   <super><shift>: initiate window picker for all windows
;; e
;; r
;; t
(global-set-key "\C-x\C-t" `delete-trailing-whitespace)
(global-set-key "\C-ct" "⊤")
;; y
;; u
(global-set-key "\C-u" `insert-char)
;; i
(global-set-key "\C-ci" "•")
;; o
(global-set-key "\C-co" "∨")
;; p
;; [
;; ]
;; \

;; a
;; s
;;   <ctrl><alt>: toggle shaded state
;;   <super>: expo key
;; d
;;   <ctrl><super>: hide all normal windows
;; f
;;   <shift><ctrl>: find
;; g
;;   <shift><ctrl>: find next
;; h
;;   <shift><ctrl>: find previous
;; j
;;   <shift><ctrl>: clear find highlight
;; k
;; l
;;   <ctrl><alt>: lock screen
;; ;

(global-set-key "\M-;" "…")

;; z
;; x
;; c
;;   <ctrl>: print current column
;;   <shift><ctrl>: copy

(global-set-key "\C-cc" '(lambda () (interactive) (print (current-column) t)))

;; v
;;   <ctrl>: align current
;;   <shift><ctrl>: paste

(global-set-key "\C-v" `align-current)

;; b
;; n

(global-set-key "\C-cn" (lambda () (interactive) (insert "¬"))) ; Workaround
(global-set-key "\C-cN" "≠")

;; m

(global-set-key "\C-cm" "×")

;; ,
;;   <meta>: beginning-of-buffer

(global-set-key "\M-," `beginning-of-buffer)

;; .
;;   <meta>: end-of-buffer

(global-set-key "\M-." `end-of-buffer)

;; /

;; space
;;   <alt>: activate window menu
;;   <super>: switch to next source
;;   <shift><super>: switch to previous source

;; insert
;; delete
;;   <ctrl><alt>: log out

;; home
;;   <shift><super>: move window to workspace 1
;;   <super>: switch to workspace 1
;; end

;; page up
;;   <shift><ctrl>: move terminal to the left
;; page down
;;   <shift><ctrl>: move terminal to the right

;; ↑
;;   <ctrl><super>: maximize window
;;   <shift><ctrl><alt>: move window one workspace up
;; ↓
;;   <ctrl><super>: restore window
;;   <shift><ctrl><alt>: move window one workspace down
;; ←
;;   <shift><ctrl><alt>: move window one workspace to the left
;;   <ctrl><alt>: switch to workspace left
;; →
;;   <shift><ctrl><alt>: move window one workspace to the right
;;   <ctrl><alt>: switch to workspace right

;;------------------------------------------------------------------------------------------------;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
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
