(require 'rainbow-delimiters)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require '_golang)

(provide 'development)
