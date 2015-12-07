;; c-editing.el
;; Robert Blafford
;; Description: Settings to use when c/c++ mode is enabled

(require 'cc-mode)
(require 'clang-format)

;; Personal settings when in c mode
(defun rb-c-mode-common-hook ()
  (setq c-default-style "gnu"
	c-basic-offset 2)
  (c-set-offset 'innamespace 0)
  (setq-default subword-mode 1))

;; Hooks to enable functionality when in c/c++ mode only
(add-hook 'c-mode-common-hook 'rb-c-mode-common-hook)
(add-hook 'c-mode-common-hook
	  (lambda () (local-set-key (kbd "M-8") 'compile)))
(add-hook 'c++-mode-hook
	  (lambda () (local-set-key (kbd "C-x C-s") #'clang-format-region)))


(defun rb-makefile-mode-defaults ()
  (whitespace-toggle-options '(tabs))
  (setq indent-tabs-mode t ))

(add-hook 'makefile-mode-hook 'rb-makefile-mode-defaults)

(provide 'c-editing)

;; c-editing.el ends here
