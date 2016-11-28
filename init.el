;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Setup the GUI as early as posible to keep           ;;
;; the display from flashing and changing at start up. ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(tooltip-mode -1)
(column-number-mode t)
(global-linum-mode t)
(size-indication-mode t)
(setq delete-by-moving-to-trash t) ; Move deleted files to Recycle.
(setq visible-bell t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
;;;;;;;;;;;;;;;;;;;
;; end GUI setup ;;
;;;;;;;;;;;;;;;;;;;

;; Store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; From use-package README
(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)

(add-to-list 'load-path "~/.emacs.d/custom")

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package anzu
  :ensure t)

(use-package async
  :ensure t)

(use-package avy
  :ensure t)

(use-package clean-aindent-mode
  :ensure t
  :config
  (require 'clean-aindent-mode)
  (add-hook 'prog-mode-hook 'clean-aindent-mode))

(use-package cmake-mode
  :ensure t)

(use-package comment-dwim-2
  :ensure t)

(use-package company
  :ensure t
  :config
  (require 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  (delete 'company-semantic company-backends))

(use-package dash
  :ensure t)

(use-package dtrt-indent
  :ensure t
  :config
  (dtrt-indent-mode 1))

(use-package duplicate-thing
  :ensure t)

(use-package epl
  :ensure t)

(use-package function-args
  :ensure t
  :config
  (fa-config-default))

(use-package ggtags
  :ensure t)

(use-package helm
  :ensure t
  :config
  (require 'setup-helm))

(use-package helm-core
  :ensure t)

(use-package helm-gtags
  :ensure t
  :init
  ;; this variables must be set before load helm-gtags
  ;; you can change to any prefix key of your choice
  (setq helm-gtags-prefix-key "\C-cg")
  :config
  (require 'setup-helm-gtags))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'alien))

(use-package helm-swoop
  :ensure t)

(use-package iedit
  :ensure t)

(use-package magit
  :ensure t)

(use-package pkg-info
  :ensure t)

(use-package popup
  :ensure t)

(use-package projectile
  :ensure t
  :config
  (require 'projectile)
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (setq sp-base-key-bindings 'paredit)
  (setq sp-autoskip-closing-pair 'always)
  (setq sp-hybrid-kill-entire-symbol nil)
  (sp-use-paredit-bindings)
  (show-smartparens-global-mode +1)
  (smartparens-global-mode 1))

(use-package swiper
  :ensure t)

(use-package undo-tree
  :ensure t)

(use-package volatile-highlights
  :ensure t)

(use-package ws-butler
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'ws-butler-mode))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package zygospore
  :ensure t)

(use-package zzz-to-char
  :ensure t)

(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-my-modes)
(require 'setup-my-keybinds)
(require 'setup-my-defuns)

(windmove-default-keybindings)

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; C style “stroustrup”: What Stroustrup, the author of C++ used in his book
(setq c-default-style "stroustrup")

(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t)

;; Package zygospore
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(column-number-mode t)
 '(package-selected-packages
   (quote
    (cmake-mode zzz-to-char zygospore yasnippet ws-butler volatile-highlights use-package undo-tree smartparens magit iedit helm-swoop helm-projectile helm-gtags ggtags function-args duplicate-thing dtrt-indent company comment-dwim-2 clean-aindent-mode anzu)))
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
