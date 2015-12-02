;; init.el
;; Robert Blafford
;; Description: Initializes package state then runs core.el script
;; Package-Requires: ((dash "2.12.1"))

;; Install all packages using package.el
(require 'package)
(require 'cl)

;; List the neccessary packages
(setq package-list '(dash helm magit))

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

;; Load the core file
(load-file "~/.emacs.d/core/core.el")
