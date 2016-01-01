;; core.el
;; Robert Blafford
;; Description: Entrypoint, assumes all desired packages are already installed

;; Required packages/files
(require 'helm-config)
(require 'dash)
(require 'utilities)
(require 'telephone-line)

;; Enable syntax highlighting with dash functions
(eval-after-load "dash" '(dash-enable-font-lock))

;; Set global state
(setq make-backup-files nil) ;; Temporary -- Remove default backup file ability

;; Configure helm minibuffer
(setq helm-split-window-in-side-p           t
      helm-autoresize-max-height           40
      helm-autoresize-min-height           25
      helm-buffers-fuzzy-matching           t
      helm-recentf-fuzzy-match              t
      helm-ff-file-name-history-use-recentf t)

;; Enable helm-projectile before enabling autoresize mode
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(helm-autoresize-mode 1)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; Customize and enable Telephone Line
(telephone-line-mode 1)

;; Load allf modules
(if (file-exists-p "~/.emacs.d/custom-modules.el")
    (load-file "~/.emacs.d/custom-modules.el"))

;; Install global key bindings
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c I") 'find-user-init-file)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)

;; Install custom hooks
(add-hook 'window-configuration-change-hook 'auto-balance-windows)
;;(add-hook 'window-setup-hook 'toggle-frame-fullscreen t) ;; Start fullscreen

;; Finally.. auto load personal emacs files if personal folder exists
(if (file-accessible-directory-p "~/.emacs.d/personal")
    (-map (lambda (s) (load s))
	  (-filter 'is-el-script (directory-files "~/.emacs.d/personal" t))))

(provide 'core)
;; core.el ends here
