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
    gruvbox-theme
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
    hlinum
    company
    yasnippet
    helm-company
    company-jedi
    neotree
    magit
    exec-path-from-shell
    )
  )

;;=======================================================
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

;;=======================================================
(require 'gruvbox-theme)
(require 'moe-theme)
(load-theme 'wombat t)



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

(add-hook 'after-init-hook 'global-company-mode)

(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/lisp/snippets"))
(yas-global-mode 1)

(require 'helm-company)
(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "C-:") 'helm-company)))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)(require 'company-jedi)
;;=======================================================

;;=======================================================
;;Helm Projectile Settings
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
;;=======================================================

;;=======================================================
;;switch buffer function
(defun my-switch-to-other-buffer ()
  "Switch to other buffer."
  (interactive)
  (switch-to-buffer (other-buffer)))
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
;;stop making autosave files
(setq auto-save-default nil);
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
;;rebind undo to something more intuitive
(global-set-key (kbd "C-z") 'undo)
;;get rid of the yellow warning triangle
(setq visible-bell nil)
;;an the annoying noise
(setq ring-bell-function 'ignore)
;;use spaces instead of tabs
(setq-default indent-tabs-mode nil)
;;=======================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packagesfd
   (quote
    (neotree exec-path-from-shell virtualenv gruvbox-theme twittering-mode smartparens moe-theme markdown-mode magit hlinum helm-swoop helm-projectile helm-gtags helm-git helm-company elpy darktooth-theme company-jedi ample-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

