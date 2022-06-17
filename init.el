;;; init.el --- Emacs configuration

;;; Commentary:
;;; init.el provides a basic Emacs configuration


;;; Code:

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(when (not package-archive-contents)
  (package-refresh-contents))

;; add additional packages you want to install here
(defvar my-packages
  '(better-defaults
    osx-clipboard
    rainbow-delimiters
    pylint
    py-autopep8
    go-mode
    typescript-mode
    afternoon-theme
    elpy
    flycheck
    lsp-mode
    lsp-ui
    company
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

;; Enable autopep8
(require 'py-autopep8)
;;(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;;(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'go-mode)
(require 'typescript-mode)

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;(add-hook 'before-save-hook 'py-autopep8-before-save)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook `go-mode-hook `flycheck-mode)

(load-theme 'afternoon t)

(elpy-enable)

;; Company mode
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;; Go - lsp-mode
;; Set up before-save hooks to format buffer and add/delete imports.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'yas-minor-mode)

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-checker-error-threshold 6000)
 '(package-selected-packages
   '(yasnippet-classic-snippets lsp-ui lsp-mode yaml-mode ## typescript-mode typescript-mode pylint gnu-elpa-keyring-update py-autopep8 rainbow-delimiters osx-clipboard json-snatcher json-reformat go-mode flycheck better-defaults afternoon-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
