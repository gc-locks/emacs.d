(setq-default tab-width 4 indent-tabs-mode nil)
(setq load-path (cons "~/.emacs.d/elisp" load-path))

(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;; haml-mode
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; backup files
(setq make-backup-files t)
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))

;; php-mode
;;(load-library "php-mode")
;;(require 'php-mode)
;; (autoload 'php-mode "php-mode" t)

;; mmm-mode

;; (require 'mmm-mode)
;; (setq mmm-global-mode 'maybe)
;; (set-face-background 'mmm-default-submode-face "snow2")
;; (mmm-add-mode-ext-class nil "\\.php?\\'" 'html-php)
;; (mmm-add-classes
;; '((html-php
;; :submode php-mode
;; :front "<\\?\\(php\\)?"
;; :back "\\?>")))
;; (add-to-list 'auto-mode-alist '("\\.php?\\'" . xml-mode))

;; set utf8
;; (set-language-environment "Japanese")
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-buffer-file-coding-system 'utf-8)
;; (setq default-buffer-file-coding-system 'utf-8)

;; default
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "ricty")))))
