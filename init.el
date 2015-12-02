;; init.el
;; Robert Blafford
;; Package-Requires: ((dash "2.12.1"))

;; Initialize dependencies
(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(require 'dash)
(eval-after-load "dash" '(dash-enable-font-lock))
(add-to-list 'load-path "~/.emacs.d/helm")
(require 'helm-config)

;; Utilities
(defun is-el-script (abspath)
  (string-equal "el" (file-name-extension abspath)))

(defun find-user-init-file ()
  "Edit the user-init-file in another window"
  (interactive)
  (find-file-other-window user-init-file))

;; Start fullscreen (cross-platf)
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

;; Auto load personal emacs files if personal folder exists
(if (file-accessible-directory-p "~/.emacs.d/personal")
    (dolist (script (-filter 'is-el-script (directory-files "~/.emacs.d/personal" t)))
      (load script)))

;; Configure helm minibuffer
(setq helm-split-window-in-side-p t)
(setq helm-autoresize-max-height 40)
(setq helm-autoresize-min-height 25)
(helm-autoresize-mode 1)

;; Install global key bindings
(global-set-key (kbd "C-c I") 'find-user-init-file)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c C-b") 'eval-buffer)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)
