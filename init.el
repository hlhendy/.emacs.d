;;; init.el --- Emacs configuration

;;; Commentary:
;;; init.el provides a basic Emacs configuration


;;; Code:

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; add additional packages you want to install here
(defvar my-packages
  '(better-defaults
    osx-clipboard
    rainbow-delimiters
    py-autopep8
    afternoon-theme
    ))

;; this section will install any packages that
;; are not currently installed after refreshing
(when (not package-archive-contents)
  (package-refresh-contents))
(package-initialize)
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq inhibit-startup-message t) ;; hide the startup message
(global-linum-mode t) ;; enable line numbers globally

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'go-mode)

;;(exec-path-from-shell-copy-env "GOPATH")

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook `go-mode-hook `flycheck-mode)


(load-theme 'afternoon t)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (py-autopep8 rainbow-delimiters osx-clipboard json-snatcher json-reformat go-mode flycheck better-defaults afternoon-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
