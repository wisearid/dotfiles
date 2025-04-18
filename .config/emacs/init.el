;; init.el

;; Set up package sources
(require 'package)
(setq package-enable-at-startup nil) ; let use-package handle packages
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Speed up startup
(setq gc-cons-threshold (* 50 1000 1000)) ; 50MB
(setq read-process-output-max (* 1024 1024)) ;; 1MB

;; UI Tweaks - Doom-like
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(set-fringe-mode 10)
(setq visible-bell t)
(global-display-line-numbers-mode t)
(column-number-mode)

;; Font
(set-face-attribute 'default nil :font "Iosevka Nerd Font" :height 120)

;; Theme - Dracula
(use-package dracula-theme
  :config
  (load-theme 'dracula t))

;; Doom-like Modeline
(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 15))

;; Icons (for modeline, etc)
(use-package all-the-icons
  :if (display-graphic-p))

;; Projectile for project management
(use-package projectile
  :init
  (projectile-mode +1)
  :custom ((projectile-completion-system 'auto))
  :bind-keymap
  ("C-c p" . projectile-command-map))

;; Ivy for completion (Doom uses vertico now, but Ivy is snappy and similar)
(use-package ivy
  :diminish
  :config
  (ivy-mode 1))

;; Which-key (Doom has it too)
(use-package which-key
  :defer 0
  :diminish
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'dashboard)
(dashboard-setup-startup-hook)
