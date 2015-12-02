;;; package --- Summary
;;; Commentary:
;;; Code:

;;make sure ansi colour character escapes are honoured
(require 'ansi-color)
(ansi-color-for-comint-mode-on)

;;;set font
(when (window-system)
  (set-frame-font "Source Code Pro")
  (set-face-font 'default "Source Code Pro")
  (set-face-attribute 'default nil
                      :font "Source Code Pro"
                      :height 110
                      :weight 'semibold
                      )
)

;;set cursor colour ; load both
(set-cursor-color "#ffeb8e")
(setq-default cursor-in-non-selected-windows 'nil)
(blink-cursor-mode 0)

;;set emacs theme
(load-theme 'tango-dark)
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

;;get rid of clutter
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;;Add line numbers
;; (global-hl-line-mode 1)
;; (setq linum-format " %2i ")
;; (add-hook 'prog-mode-hook 'linum-mode)
;; (setq column-number-mode t)

(provide 'cosmetic-settings)
;;; cosmetic-settings.el ends here
