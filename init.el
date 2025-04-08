;; Setup MELPA package source
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Personal Customize
(add-to-list 'load-path "/Users/song.lin/Desktop/MiracleBegin/Fun/emacs-lib")
(require 'newline-below)
(global-set-key (kbd "<S-return>") 'newline-below)
;;(require 'hello-world)

;; Setup SLIME
(setq inferior-lisp-program "sbcl")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(geiser-chez-binary "chez")
 '(package-selected-packages '(geiser-chez rainbow-delimiters slime)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "#E0F4FF"))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "#B7C9E2"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "#89CFF0"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "#00BFFF"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "#0066CC"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "#0F52BA"))))
 '(rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "#1F497D"))))
 '(rainbow-delimiters-depth-8-face ((t (:inherit rainbow-delimiters-base-face :foreground "#2A3F5F"))))
 '(rainbow-delimiters-depth-9-face ((t (:inherit rainbow-delimiters-base-face :foreground "#000080"))))
)

;; Enable bracket autocomplete
(electric-pair-mode 1)

;; Colorful bracket
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

