;; bug for emacs 24.5

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cl)

;; 最初のあれを出さない
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; メニューバー、ツールバーを非表示
(menu-bar-mode 0)
(tool-bar-mode 0)

;; スクロールバーを非表示
(scroll-bar-mode 0)

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

;; env
(let* ((zshpath (shell-command-to-string
         "/usr/bin/env zsh -c 'printenv PATH'"))
       (pathlst (split-string zshpath ":")))
  (setq exec-path pathlst)
  (setq eshell-path-env zshpath)
  (setenv "PATH" zshpath))

(setenv "GOROOT" "/usr/local/go")
(setenv "GOPATH" "/home/gc/go")

;; anzu
(global-anzu-mode +1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 1000)
 '(rspec-use-rake-when-possible nil)
 '(safe-local-variable-values (quote ((engine . riot)))))

;; Mozc
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")

;; revert buffer
(defun revert-buffer-no-confirm (&optional force-reverting)
  "Interactive call to revert-buffer. Ignoring the auto-save
 file and not requesting for confirmation. When the current buffer
 is modified, the command refuses to revert it, unless you specify
 the optional argument: force-reverting to true."
  (interactive "P")
  ;;(message "force-reverting value is %s" force-reverting)
  (if (or force-reverting (not (buffer-modified-p)))
      (revert-buffer :ignore-auto :noconfirm)
    (error "The buffer has been modified")))

(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)
(global-auto-revert-mode 1)

;; whitespace
(setq whitespace-style '(trailing       ; 行末
                         empty          ; 先頭/末尾の空行
                         ))

(setq whitespace-action '(auto-cleanup))
(global-whitespace-mode 1)

;; flycheck
(global-flycheck-mode)

(define-key global-map (kbd "C-c C-s") 'flycheck-next-error)
(define-key global-map (kbd "C-c C-r") 'flycheck-previous-error)

;; lsp
(use-package lsp-clients)

(use-package lsp
  :after go-mode
  :hook go-mode)

(use-package lsp-ui
  :after lsp
  :custom (scroll-margin 0)
  :hook lsp)

(use-package lsp-go
  :after (lsp go-mode)
  :custom (lsp-go-language-server-flags '(
    "-gocodecompletion"
    "-diagnostics"
    "-lint-tool=golint")))

(use-package go-mode
  :ensure t)

;; plantuml-mode
(add-to-list 'auto-mode-alist '("\\.pu\\'" . plantuml-mode))

(setq plantuml-jar-path "/usr/share/plantuml/plantuml.jar")
(setq plantuml-java-options "")
(setq plantuml-options "-charset UTF-8")

;; scss-mode
(defun scss-custom ()
  "scss-mode-hook"
  (and
   (set (make-local-variable 'css-indent-offset) 2)
   (set (make-local-variable 'scss-compile-at-save) nil)
   )
  )
(add-hook 'scss-mode-hook
          '(lambda() (scss-custom)))

;; web-mode
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-style-padding 0)
(setq web-mode-script-padding 0)
(setq web-mode-enable-auto-indentation nil)
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tag$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue$" . web-mode))
