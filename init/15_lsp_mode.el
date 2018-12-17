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
