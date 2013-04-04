;;add color-themes to load path
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
;;(add-to-list 'load-path "~/.emacs.d/markdown-mode.el")
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-late-night)


;;markdown mode
;;(autoload 'markdown-mode "markdown-mode"
;;  "Major mode for editing Markdown files" t)
;;(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))


;;prevent the startup screen from opening
(setq inhibit-startup-message t)
;;line by line scrolling
(setq scroll-step 1)
;;mouse wheel
(mouse-wheel-mode t)
;;stop making backup files
(setq make-backup-files nil)
;;enable line numbering
(line-number-mode 1)
;;disable cursor blinking
(blink-cursor-mode 0)
;;show parenthesis close
(show-paren-mode 1)
;;bufferswitch
(ido-mode 1)
;;shell
(global-set-key "\C-xt" 'eshell)
;;get rid of the toolbar
(tool-bar-mode -1)
;;get rid of the scroll bar
(scroll-bar-mode -1)
;;get rid of the menu bar
(menu-bar-mode -1)
