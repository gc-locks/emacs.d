;; company-mode
(global-company-mode t)

(setq company-idle-delay 0.05)
(setq company-minimum-prefix-length 2)
(setq company-dabbrev-downcase nil)

(global-set-key (kbd "C-M-i") 'company-complete)

;; C-n, C-pで補完候補を次/前の候補を選択
(define-key company-active-map (kbd "M-n") 'company-select-next)
(define-key company-active-map (kbd "M-p") 'company-select-previous)
(define-key company-search-map (kbd "M-n") 'company-select-next)
(define-key company-search-map (kbd "M-p") 'company-select-previous)

;; C-sで絞り込む
(define-key company-active-map (kbd "C-s") 'company-filter-candidates)

;; TABで候補を設定
(define-key company-active-map (kbd "C-i") 'company-complete-selection)

;; 各種メジャーモードでも C-M-iで company-modeの補完を使う
(define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)

(set-face-attribute 'company-tooltip nil
                    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common nil
                    :foreground "black" :background "lightgrey")
(set-face-attribute 'company-tooltip-common-selection nil
                    :foreground "white" :background "steelblue")
(set-face-attribute 'company-tooltip-selection nil
                    :foreground "black" :background "steelblue")
(set-face-attribute 'company-preview-common nil
                    :background nil :foreground "lightgrey" :underline t)
(set-face-attribute 'company-scrollbar-fg nil
                    :background "gray60")
(set-face-attribute 'company-scrollbar-bg nil
                    :background "gray40")


;; auto-complete
;; (ac-config-default)
;; (define-key ac-mode-map (kbd "M-RET") 'ac-fuzzy-complete)
;; (global-auto-complete-mode t)
;; (setq ac-ignore-case nil)
;; (setq ac-auto-start 2)
;; (setq ac-delay 0.05)
;; (setq ac-auto-show-menu 0.05)
;; (setq ac-use-fuzzy t)
;; (setq ac-use-comphist t)
;; (add-to-list 'ac-modes 'enh-ruby-mode)
;; (add-to-list 'ac-modes 'protobuf-mode)
