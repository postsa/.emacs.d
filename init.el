;;=======================================================

(when (>= emacs-major-version 24)
  (require 'package)
  ;;melpa
  (add-to-list 'package-archives 
	       '("melpa" .
		 "http://melpa.milkbox.net/packages/") t)
  (package-initialize)
  )
;;=======================================================
;;keep a list of requried packages
(defconst required_packages
  '(helm
    darktooth-theme
    helm-gtags
    helm-swoop
    darktooth-theme
    moe-theme
    smartparens
    ample-theme
    projectile
    helm-projectile
    magit
    helm-git
    markdown-mode
    twittering-mode
    hlinum
    ))

;;iterate the required package list and install if not installed
(defun install-packages()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package required_packages)
	   (unless (package-installed-p package)
	     (package-install package))))



(install-packages)

(require 'moe-theme)
(load-theme 'moe-dark t)
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'hlinum)
(hlinum-activate)

(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

(require 'setup-helm)
(require 'setup-helm-gtags)

(require 'markdown-mode)

(require 'indent-modes)
;;=======================================================

;;=======================================================
;;switch buffer function
(defun my-switch-to-other-buffer ()
  "Switch to other buffer."
  (interactive)
  (switch-to-buffer (other-buffer)))
;;=======================================================

;;=======================================================
;; keybinding to switch buffer
(global-set-key (kbd "M-b") 'my-switch-to-other-buffer)
;;=======================================================

;;=======================================================
;;catch org invisible edits
(setq org-catch-invisible-edits 1)
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
;;get rid of that annoying noise
(setq visible-bell 1)
;;show line numbers
(global-linum-mode t)
;;highlight linum in all buffers
(setq linum-highlight-in-all-buffersp t)
;;=======================================================
