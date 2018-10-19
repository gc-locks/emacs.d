(let ((envs '("PATH" "GOROOT" "GOPATH" "GO111MODULE")))
  (exec-path-from-shell-copy-envs envs))
