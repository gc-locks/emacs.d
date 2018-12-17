(defun auto-complete-for-go ()
  (auto-complete-mode 1))

(flycheck-gometalinter-setup)
(setq flycheck-gometalinter-fast t) ;; only run fast linters
(setq flycheck-gometalinter-test t) ;; use in tests files
(setq flycheck-gometalinter-deadline "10s")
(setq flycheck-gometalinter-disable-linters '("gotype" "gosec"))

;; go-mode
(add-hook 'go-mode-hook (lambda ()
                                        ; (company-mode)
                                        ; (set (make-local-variable 'company-backends) '(company-go))
                          (auto-complete-for-go)
                          (make-local-variable 'ac-ignore-case)
                          (setq ac-ignore-case nil)
                          (setq gofmt-command "goimports")
                          (add-hook 'before-save-hook 'gofmt-before-save)
                          (set (make-local-variable 'compile-command) "go build -v && go test -v && go vet")
                          (local-set-key (kbd "M-.") 'godef-jump)
                          (local-set-key (kbd "C-c M-.") 'godef-jump-other-window)
                          (go-eldoc-setup)
                          (flycheck-mode)
                          )
          )
;(custom-set-variables
; '(ac-go-expand-arguments-into-snippets nil)) ; auto-complete

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))
