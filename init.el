(setq-default tab-width 2 indent-tabs-mode nil)
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;; shell mode
(add-hook 'shell-mode-hook
   (function
    (lambda ()
      ;;; シェルバッファの行数の上限を3000行にする
      (setq comint-buffer-maximum-size 3000)
      (ansi-color-for-comint-mode-on)
      )
    )
   )

;; hをバックスペースに
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\M-h" 'backward-kill-word)

;; フォント
(set-face-attribute 'default nil
                    :family "Ricty" ;; font
                    :height 120)    ;; font size

;; 最初のあれを出さない
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

;; メニューバーを非表示
(menu-bar-mode 0)
;; ツールバーを非表示
(tool-bar-mode 0)

;; バッファの移動
(define-key global-map[C-tab] 'other-window)
(define-key global-map [S-C-tab]
  (lambda () (interactive) (other-window -1)))

(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

;; スペースは全角のみを可視化
(setq whitespace-space-regexp "\\(\u3000+\\)")

;; 保存前に自動でクリーンアップ
(setq whitespace-action '(auto-cleanup))

;; 空白の色
(global-whitespace-mode 1)

(set-face-attribute 'whitespace-trailing nil
                    :background "#cccccc")
(set-face-attribute 'whitespace-empty nil
                    :background "#cccccc")

;; coding: utf-8
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; backup files
(setq make-backup-files t)
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))

;; c++ mode
(add-hook 'c++-mode-hook
          '(lambda()
             (c-set-style "gnu")
             (setq c-auto-newline nil)
             (c-set-offset 'innamespace 0)   ; namespace {}の中はインデントしない
             (c-set-offset 'arglist-close 0) ; 関数の引数リストの閉じ括弧はインデントしない
             ))

;; perl-mode for php
(add-to-list 'auto-mode-alist '("\\.php$" . perl-mode))

;; ruby-mode
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))

;; MELPA
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; protobuf-mode
(require 'protobuf-mode)
(setq auto-mode-alist (append '(("\\.proto$" . protobuf-mode)) auto-mode-alist))

;; anzu
(require 'anzu)
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

;; Color-Theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-blue4)

;; elscreen
(require 'elscreen)
(setq elscreen-prefix-key (kbd "C-z"))
(elscreen-start)
(setq elscreen-tab-display-kill-screen nil)
(setq elscreen-tab-display-control nil)
(global-set-key [?\C-\;] 'elscreen-next)
(global-set-key [?\C-'] 'elscreen-toggle)

;; enhanced-ruby-mode
(require 'enh-ruby-mode)
(setq enh-ruby-bounce-deep-indent t)
(setq enh-ruby-deep-indent-paren nil)

;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;; rspec-mode
(require 'rspec-mode)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(global-set-key [f9] 'rspec-verify-single)
(global-set-key [S-f9] 'rspec-verify)
(global-set-key [C-f9] 'rspec-rerun)
(global-set-key [C-S-f9] 'rspec-verify-all)

;; HAML
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;; YAML
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$\\|\\.yaml$" . yaml-mode))

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(define-key ac-mode-map (kbd "M-RET") 'ac-fuzzy-complete)
(setq ac-ignore-case nil)
(setq ac-auto-start 2)
(setq ac-delay 0.05)
(setq ac-auto-show-menu 0.05)
(setq ac-use-fuzzy t)
(setq ac-use-comphist t)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'protobuf-mode)

;; Robe
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; YaTeX
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist (append
  '(("\\.tex$" . yatex-mode)
    ("\\.ltx$" . yatex-mode)
    ("\\.cls$" . yatex-mode)
    ("\\.sty$" . yatex-mode)
    ("\\.clo$" . yatex-mode)
    ("\\.bbl$" . yatex-mode)) auto-mode-alist))

;; web-mode
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-style-padding 2)
(setq web-mode-script-padding 2)
