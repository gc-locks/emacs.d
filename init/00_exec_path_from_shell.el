(let* ((zshpath (shell-command-to-string
         "/usr/bin/env zsh -c 'printenv PATH'"))
       (pathlst (split-string zshpath ":")))
  (setq exec-path pathlst)
  (setq eshell-path-env zshpath)
  (setenv "PATH" zshpath))

(setenv "GOROOT" "/usr/local/go")
(setenv "GOPATH" "/home/gc/go")
