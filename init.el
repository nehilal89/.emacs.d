;; init.el
;; Robert Blafford
;; Description: Initializes package state then runs core.el script
;; Package-Requires: ((dash "2.12.1"))

;; Install all packages using package.el
(require 'package)
(require 'cl)

;; List the neccessary packages
(setq package-list '(dash
		     helm-projectile
		     magit
		     scala-mode2
		     yaml-mode
		     powerline
		     clang-format))

;; Add melpa and initialze package repositories
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Returns true if at least one item in package-list isn't installed
(defun my-packages-installed-p ()
  (loop for p in package-list
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

;; Refreshes contents from archives and installs all packages
(unless (my-packages-installed-p)
  ;; check for new packages (package versions)
  (package-refresh-contents)
  ;; install the missing packages
  (dolist (p package-list)
    (when (not (package-installed-p p))
      (package-install p))))

;; Configure load path
(add-to-list 'load-path "~/.emacs.d/core/")
(add-to-list 'load-path "~/.emacs.d/modules/")

;; Load the core files
(require 'core)

;;; init.el ends here
