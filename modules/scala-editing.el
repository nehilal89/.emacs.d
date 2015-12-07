;; scala-editing.el
;; Robert Blafford
;; Description: Settings to use when scala is enabled

(require 'scala-mode2)
(require 'whitespace)

(add-hook 'scala-mode-hook '(lambda ()
  ;; Bind the 'newline-and-indent' command to RET (aka 'enter'). This
  ;; is normally also available as C-j. The 'newline-and-indent'
  ;; command has the following functionality: 1) it removes trailing
  ;; whitespace from the current line, 2) it create a new line, and 3)
  ;; indents it.  An alternative is the
  ;; 'reindent-then-newline-and-indent' command.
  (local-set-key (kbd "RET") 'newline-and-indent)

  ;; Alternatively, bind the 'newline-and-indent' command and
  ;; 'scala-indent:insert-asterisk-on-multiline-comment' to RET in
  ;; order to get indentation and asterisk-insertion within multi-line
  ;; comments.
  ;; (local-set-key (kbd "RET") '(lambda ()
  ;;   (interactive)
  ;;   (newline-and-indent)
  ;;   (scala-indent:insert-asterisk-on-multiline-comment)))

  ;; Bind the backtab (shift tab) to
  ;; 'scala-indent:indent-with-reluctant-strategy command. This is usefull
  ;; when using the 'eager' mode by default and you want to "outdent" a
  ;; code line as a new statement.
  (local-set-key (kbd "<backtab>") 'scala-indent:indent-with-reluctant-strategy)

  ;; Jump to the start of relevant class in file
  (scala-mode:goto-start-of-code)

   ;;; TODO: Maybe this should be an all programming languages thing?
   ;; clean-up whitespace at save
   (make-local-variable 'before-save-hook)
   (add-hook 'before-save-hook 'whitespace-cleanup)
  ))

(provide 'scala-editing)

;; scala-editing.el ends here

