;;; package -- Personal Init.el

(setq inhibit-startup-message t)
(setq default-directory "~/projects/")
(setq make-backup-files nil)

(if (display-graphic-p)
    (progn
      ;; if graphic mode
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (set-face-attribute 'default nil :height 160 :family "Agave Nerd Font Mono")
      (add-to-list 'default-frame-alist '(height . 28))
      (add-to-list 'default-frame-alist '(width . 100))
      (add-to-list 'default-frame-alist '(top . 20))
      (add-to-list 'default-frame-alist '(left . 200))
      ))

(menu-bar-mode -1)
(global-linum-mode t)
(electric-pair-mode t)
(delete-selection-mode 1)


(require 'subr-x)

;; Package management
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
	     :ensure t)

(use-package which-key
	     :ensure t
	     :config
	     (progn
;;	       (which-key-setup-side-window-right-bottom)
	       (which-key-mode)))

(use-package auto-complete
	     :ensure t
	     :init
	     (progn
	       (ac-config-default)
	       (global-auto-complete-mode)))

(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme
	  (if (display-graphic-p) 'icons 'arrow)))
  :bind ("C-'" . 'neotree-toggle))

(use-package undo-fu
  :ensure t)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)
(setq evil-undo-system 'undo-fu)

(use-package ace-window
  :ensure t
  :bind ("C-x o" . ace-window))

(use-package projectile
  :ensure t)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;(use-package gruvbox-theme :ensure t :config (load-theme 'gruvbox t))
;(use-package railscasts-theme :ensure t :config (load-theme 'railscasts t))
;(use-package monokai-theme :ensure t :config (load-theme 'monokai t))
(use-package rebecca-theme :ensure t :config (load-theme 'rebecca t))




(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t))


;; Custom Short-Cuts
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shring-window)


;; -------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(ace-window neotree all-the-icons auto-complete wich-key try use-package))
 '(warning-suppress-types '((comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; init.el ends here
