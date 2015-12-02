;; utilities.el
;; Robert Blafford
;; Description: Handly lisp functions

;; Expects absolute path, returns true if path exists and ends in ".el"
(defun is-el-script (abspath)
  (string-equal "el" (file-name-extension abspath)))

;; Interactive method that opens init.el file in new buffer
(defun find-user-init-file ()
  "Edit the user-init-file in another window"
  (interactive)
  (find-file-other-window user-init-file))
