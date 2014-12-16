(setq-default tab-width 2 indent-tabs-mode nil)
(setq load-path (cons "~/.emacs.d/elisp" load-path))

(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

(define-key global-map[C-tab] 'other-window)
(define-key global-map [S-C-tab]
  (lambda () (interactive) (other-window -1)))

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(ac-config-default)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;;
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

(global-whitespace-mode 1)

;; (defvar my/bg-color "#ffffff")
;; (set-face-attribute 'whitespace-trailing nil
;;                     :background "#cccccc"
;;                     :foreground "DeepPink")
;; (set-face-attribute 'whitespace-tab nil
;;                     :background my/bg-color
;;                     :foreground "#ffffff")
;; (set-face-attribute 'whitespace-space nil
;;                     :background my/bg-color
;;                     :foreground "GreenYellow"
;;                     :weight 'bold)
;; (set-face-attribute 'whitespace-empty nil
;;                     :background my/bg-color)

;; c++ mode
(add-hook 'c++-mode-hook
          '(lambda()
             (c-set-style "gnu")
             (setq c-auto-newline nil)
             (c-set-offset 'innamespace 0)   ; namespace {}の中はインデントしない
             (c-set-offset 'arglist-close 0) ; 関数の引数リストの閉じ括弧はインデントしない
             ))

;; haml-mode
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;; sass-mode
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))

;; yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Gemfile ruby-mode
(add-to-list 'auto-mode-alist '("\\Gemfile$" . ruby-mode))

;;--------------------------------------------------------------------------
;; csharp-mode
;; (install-elisp-from-emacswiki "csharp-mode.el")
;;--------------------------------------------------------------------------
(require 'csharp-mode)

;; Cモード共通フック
(add-hook 'csharp-mode-hook
          '(lambda()
             (setq indent-tabs-mode 2)
             (setq comment-column 40)
             (setq c-basic-offset 2)
             (font-lock-add-magic-number)
             ;; オフセットの調整
             (c-set-offset 'substatement-open 0)
             (c-set-offset 'case-label '+)
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'arglist-close 0)
             )
          )

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

;; Matlab support
;; You don't need this line if you placed it in prelude/personal
(add-to-list 'load-path "~/.emacs.d/plugins/matlab-emacs")
(load-library "matlab-load")
(matlab-cedet-setup)
(add-hook 'matlab-mode
          (lambda ()
            (auto-complete-mode 1)
            ))

;; (autoload 'octave-mode "octave-mod" nil t)
;; (setq auto-mode-alist
;;       (cons '("\\.m$" . octave-mode) auto-mode-alist))
;; (add-hook 'octave-mode-hook
;;           (lambda ()
;;             (abbrev-mode 1)
;;             (auto-fill-mode 1)
;;             (if (eq window-system 'x)
;;                 (font-lock-mode 1))))

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
 '(inhibit-startup-screen t)
 '(matlab-indent-level 2)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "ricty")))))
