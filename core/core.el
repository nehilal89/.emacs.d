;; core.el
;; Robert Blafford
;; Description: Entrypoint, assumes all desired packages are already installed

;; Required packages/files
(require 'helm-config)
(require 'dash)
(load "~/.emacs.d/core/utilities.el")

;; Enable syntax highlighting with dash functions
(eval-after-load "dash" '(dash-enable-font-lock))

;; Start fullscreen (cross-platform)
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)

;; Auto load personal emacs files if personal folder exists
(if (file-accessible-directory-p "~/.emacs.d/personal")
    (dolist (script (-filter 'is-el-script (directory-files "~/.emacs.d/personal" t)))
      (load script)))

;; Temporary -- Remove default backup file ability
(setq make-backup-files nil)

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
