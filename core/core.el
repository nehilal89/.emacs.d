;; core.el
;; Robert Blafford
;; Description: Entrypoint, assumes all desired packages are already installed

;; Required packages/files
(require 'helm-config)
(require 'dash)
(require 'utilities)
(require 'powerline)

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
;;    helm-locate-fuzzy-match               t
      helm-ff-file-name-history-use-recentf t)

;; Enable helm before enabling autoresize mode
(helm-mode 1)
(helm-autoresize-mode 1)

;; Customize and enable powerline
(powerline-default-theme)
(setq powerline-arrow-shape 'rounded)
(custom-set-faces
 '(mode-line ((t (:foreground "#FFFFFF" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

;; Load allf modules
(if (file-exists-p "~/.emacs.d/custom-modules.el")
    (load-file "~/.emacs.d/custom-modules.el"))


;; Remap helm specific keybindings
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

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
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t) ;; Start fullscreen

;; Finally.. auto load personal emacs files if personal folder exists
(if (file-accessible-directory-p "~/.emacs.d/personal")
    (-map (lambda (s) (load s))
	  (-filter 'is-el-script (directory-files "~/.emacs.d/personal" t))))

(provide 'core)
;; core.el ends here
