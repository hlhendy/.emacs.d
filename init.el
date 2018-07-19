(package-initialize)

(let ((default-directory "~/.emacs.d/")))
(normal-top-level-add-subdirs-to-load-path)

(add-to-list 'load-path' "~/.emacs.d/development")

(global-linum-mode t)

(setq inhibit-startup-message t
      linum-format "%4d \u2502 ")

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;;(require 'package)
(require 'development)

(add-to-list 'package-archives
	          '("melpa" . "http://melpa.org/packages/"))


(when (not package-archive-contents)
  (package-refresh-contents))
;;(package-initialize)

(load-theme 'afternoon t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (xclip rainbow-delimiters go-mode flycheck better-defaults afternoon-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
