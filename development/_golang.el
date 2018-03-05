(require 'go-mode)

;;(exec-path-from-shell-copy-env "GOPATH")

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook `go-mode-hook `flycheck-mode)

(provide '_golang)
