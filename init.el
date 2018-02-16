;; bug for emacs 24.5
(require 'cl)

;; 最初のあれを出さない
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; メニューバー、ツールバーを非表示
(menu-bar-mode 0)
(tool-bar-mode 0)

;; tab indent
(setq-default tab-width 2 indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

;; hをバックスペースに
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\M-h" 'backward-kill-word)

;; フォント
(set-face-attribute 'default nil
                    :family "Ricty" ;; font
                    :height 120)    ;; font size

;; バッファの移動
(define-key global-map[C-tab] 'other-window)
(define-key global-map [S-C-tab]
  (lambda () (interactive) (other-window -1)))

;; coding: utf-8
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; backup files
(setq make-backup-files t)
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))

;; theme
(load-theme 'tango-dark t)

;; Cask
(add-to-list 'auto-mode-alist '("Cask$" . emacs-lisp-mode))

(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; auto loads
(init-loader-load "~/.emacs.d/init")
(put 'upcase-region 'disabled nil)
