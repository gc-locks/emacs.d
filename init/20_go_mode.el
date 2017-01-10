(defun auto-complete-for-go ()
  (auto-complete-mode 1))
;; go-mode
(add-hook 'go-mode-hook (lambda ()
                                        ; (company-mode)
                                        ; (set (make-local-variable 'company-backends) '(company-go))
                          (auto-complete-for-go)
                          (setq gofmt-command "goimports")
                          (add-hook 'before-save-hook 'gofmt-before-save)
                          (set (make-local-variable 'compile-command) "go build -v && go test -v && go vet")
                          (local-set-key (kbd "M-.") 'godef-jump)
                          (go-eldoc-setup)
                          (flycheck-mode)
                          )
          )
;(custom-set-variables
; '(ac-go-expand-arguments-into-snippets nil)) ; auto-complete

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))
