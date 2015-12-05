;; cosmetic-settings.el
;; Robert Blafford
;; Description: The way my editor should look and feel

;; Honour ansi colour character escapes
(require 'ansi-color)
(ansi-color-for-comint-mode-on)

;; Font size and type
(when (window-system)
  (set-frame-font "Source Code Pro")
  (set-face-font 'default "Source Code Pro")
  (set-face-attribute 'default nil
                      :font "Source Code Pro"
                      :height 110
                      :weight 'semibold
		      :width 'normal
                      )
)

;; Cursor settings
(setq-default cursor-in-non-selected-windows 'nil)
(blink-cursor-mode 0)

;; Set emacs theme
(load-theme 'tango-dark)
(set-background-color "#080808")
;; (load-theme 'sanityinc-tomorrow-eighties)
;; (load-theme 'sanityinc-solarized-dark t)
;; (load-theme 'monochrome-bright t)
;; (load-theme 'wombat t)
;; (load-theme 'misterioso t)
;; (load-theme 'soothe t)
;; (load-theme 'zenburn t)
;; (load-theme 'solarized-dark t)
;; (load-theme 'gandalf t)
;; (load-theme 'leuven t)
;; (load-theme 'noctilux t)
;; (load-theme 'ample t)
;; (load-theme 'afternoon t)
;; (load-theme 'spacegray t)
;; (load-theme 'alect-dark t)

;; get rid of clutter
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(provide 'cosmetic-settings)

;;; cosmetic-settings.el ends here
