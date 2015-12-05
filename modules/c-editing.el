;; c-editing.el
;; Robert Blafford
;; Description: Settings to use when c/c++ mode is enabled

(require 'cc-mode)
(require 'clang-format)

;; More like a default to programming. Should move out eventually
(setq-default subword-mode 1)

;; Create and enable my personal style.
(defconst my-c-style
  '((c-basic-offset             . 2)
    (c-comment-only-line-offset . 4)
    (c-hanging-braces-alist     . ((substatement-open after)
                                   (brace-list-open)))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                   (substatement-open . 0)
                                   (case-label        . 4)
                                   (block-open        . 0)
				   (innamespace       . 0)
                                   (knr-argdecl-intro . -)))
    (c-echo-syntactic-information-p . t))
  "My C/C++ Programming Style")

(c-add-style "personal-style" my-c-style)
(setq c-default-style "personal-style")

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
  (c-set-style "personal-style")
  (setq tab-width 4 indent-tabs-mode nil) ;; Make sure spaces are used instead of tabs
  (c-toggle-auto-hungry-state nil)
  (c-toggle-electric-state 1)
  (c-toggle-syntactic-indentation 1)
  (c-toggle-auto-newline 1)
  (add-hook 'c-mode-common-hook
	    (lambda () (define-key c-mode-base-map (kbd "M-8") 'compile))))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; Run clang-format before C-x C-s runs
;; (add-hook 'before-save-hook 'asdf)

;; Sample coding style
;; (c-add-style "mycodingstyle"
;; 	     '((c-basic-offset . 2)
;; 	       (c-comment-only-line-offset . 0)
;; 	       (c-hanging-braces-alist . ((substatement-open before after)))
;; 	       (c-offsets-alist . ((topmost-intro        . 0)
;; 				   (topmost-intro-cont   . 0)
;; 				   (substatement         . 3)
;; 				   (substatement-open    . 0)
;; 				   (statement-case-open  . 3)
;; 				   (statement-cont       . 3)
;; 				   (access-label         . -3)
;; 				   (inclass              . 3)
;; 				   (inline-open          . 3)
;; 				   (innamespace          . 0)
;; 				   ))))

(provide 'c-editing)

;; c-editing.el ends here
