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
 '(package-selected-packages
   '(company company-coq diff-hl emmet-mode emms geiser-chez kotlin-mode
	     lsp-mode magit proof-general rainbow-delimiters slime
	     smartparens treemacs-projectile treesit-auto))
 '(smartparens-global-mode t)
 '(sp-highlight-pair-overlay t)
 '(sp-highlight-wrap-overlay t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Enable bracket autocomplete
(electric-pair-mode 1)

;; Colorful bracket
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; ido mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; Helm
;;(helm-mode 1)

;; projectile settings
(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '("~/projects/" "~/work/" "~/playground"))
  :config
  ;; I typically use this keymap prefix on macOS
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  ;; On Linux, however, I usually go with another one
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (global-set-key (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

;; treesit-auto
(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;; treemacs
(use-package treemacs
  :ensure t
  :config
  (treemacs-project-follow-mode t))

;; projectile setting
(use-package projectile
  :ensure t
  :init
  (setq projectile-project-search-path '("~/TW/" "~/Desktop/MiracleBegin/Fun/"))
  :config
  (define-key projectile-mode-map (kbd "C-c C-p") 'projectile-command-map)
  (global-set-key (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

;; treesit setting
(use-package treesit
  :mode (("\\.tsx\\'" . tsx-ts-mode)
         ("\\.js\\'"  . typescript-ts-mode)
         ("\\.mjs\\'" . typescript-ts-mode)
         ("\\.mts\\'" . typescript-ts-mode)
         ("\\.cjs\\'" . typescript-ts-mode)
         ("\\.ts\\'"  . typescript-ts-mode)
         ("\\.jsx\\'" . tsx-ts-mode)
         ("\\.json\\'" .  json-ts-mode)
         ("\\.Dockerfile\\'" . dockerfile-ts-mode)
         ))

;; lsp-mode setting
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  (kotlin-mode-hook .lsp)
  )

;; company mode
(add-hook 'after-init-hook 'global-company-mode)

;; projectile setting in nested repo
(setq projectile-project-root-files-bottom-up
      (append '(".projectile" "package.json" "pom.xml")
              projectile-project-root-files-bottom-up))

;; define behaviour like vim J
(global-set-key (kbd "C-c v J") 'join-line)

;; line number mode
(global-display-line-numbers-mode)

;; block hide and show only in prog mode
(require 'hideshow)
(add-hook 'prog-mode-hook 'hs-minor-mode)
(define-key hs-minor-mode-map (kbd "C-c f h") 'hs-hide-block)
(define-key hs-minor-mode-map (kbd "C-c f s") 'hs-show-block)
(define-key hs-minor-mode-map (kbd "C-c f t") 'hs-toggle-hiding)
(define-key hs-minor-mode-map (kbd "C-c f S") 'hs-show-all)
(define-key hs-minor-mode-map (kbd "C-c f H") 'hs-hide-all)

;; emmet mode (short code abbr)
(require 'emmet-mode)

;; diff-hl (show diff)
(require 'diff-hl)
(diff-hl-margin-mode)

;; Org mode
(global-set-key (kbd "C-c o l") #'org-store-link)
(global-set-key (kbd "C-c o a") #'org-agenda)
(global-set-key (kbd "C-c o l") #'org-capture)


