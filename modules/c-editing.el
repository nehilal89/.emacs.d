;; c-editing.el
;; Robert Blafford
;; Description: Settings to use when c/c++ mode is enabled

(require 'cc-mode)
(require 'clang-format)

;; Personal settings when in c mode
(defun my-c-mode-common-hook ()
  (c-set-style "gnu")
  (c-set-offset 'innamespace 0)
  (setq-default subword-mode 1)
  (setq tab-width 4 indent-tabs-mode nil))

;; Hooks to enable functionality when in c/c++ mode only
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-common-hook
	  (lambda () (local-set-key (kbd "M-8") 'compile)))
(add-hook 'c++-mode-hook
	  (lambda () (local-set-key (kbd "C-x C-s") #'clang-format-region)))

(provide 'c-editing)

;; c-editing.el ends here
