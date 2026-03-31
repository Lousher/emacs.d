;; 1. 设置包仓库（NonGNU ELPA 包含了 geiser-chez）
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; 2. 确保 use-package 已安装（便于声明式管理配置）
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; 3. 引入 use-package 并配置 geiser-chez
(require 'use-package)

;; manually config geiser
(use-package geiser
  :ensure t
  :config
  ;; 让 Company 使用 geiser 的后端
  (add-hook 'geiser-mode-hook
            (lambda ()
              (setq-local company-backends '(geiser-company-backend company-dabbrev-code))))
  (add-hook 'geiser-repl-mode-hook
            (lambda ()
              (setq-local company-backends '(geiser-company-backend company-dabbrev-code))))
)

(use-package geiser-chez
  :ensure t	    ; 自动安装 geiser-chez（会自动拉取 geiser 基础包）
  :config
  ;; 可选：指定 Chez 可执行文件路径（若 chez 不在 PATH 中才需设置）
  ;; 可选：将 Chez 设为默认 Scheme 实现（避免每次询问）
  (setq geiser-active-implementations '(chez))
  ;; 可选：启动 Geiser REPL 时自动使用 Chez
  ;; (setq geiser-default-implementation 'chez)
  )

;; 提示：在 .scm 或 .ss 文件中，可使用 C-c C-s 手动切换实现为 chez
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(geiser-chez-binary "chez")
 '(package-selected-packages
   '(aggressive-indent company diff-hl flycheck geiser-chez kkp magit
		       paredit rainbow-delimiters)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; 引入paredit
(use-package paredit
  :ensure t
  :hook ((emacs-lisp-mode lisp-mode slime-repl-mode geiser-mode scheme-mode) . enable-paredit-mode)
  )
	 
;; show-paren-mode config
(show-paren-mode 1)
(setq show-paren-style 'mixed)

;; rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode)
  :config
  ;; 在这里定义你想要的9种颜色
  (set-face-foreground 'rainbow-delimiters-depth-1-face "#FF5555")
  (set-face-foreground 'rainbow-delimiters-depth-2-face "#FFB86C")
  (set-face-foreground 'rainbow-delimiters-depth-3-face "#F1FA8C")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "#50FA7B")
  (set-face-foreground 'rainbow-delimiters-depth-5-face "#8BE9FD")
  (set-face-foreground 'rainbow-delimiters-depth-6-face "#BD93F9")
  (set-face-foreground 'rainbow-delimiters-depth-7-face "#FF79C6")
  (set-face-foreground 'rainbow-delimiters-depth-8-face "#FF92D0")
  (set-face-foreground 'rainbow-delimiters-depth-9-face "#C78AFF"))

;; aggressive-indent
;; currently only in lisp
(use-package aggressive-indent
  :ensure t
  :hook (emacs-lisp-mode lisp-mode scheme-mode)
  ;; config (global-aggressive-indent-mode 1)
  )

;; company complete
(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  )

;; which-key for key hint
(use-package which-key
  :ensure t
  :config (which-key-mode 1))

					; magit & diff-hl work together
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch))
  :config
  (setq magit-diff-refine-hunk t))

(use-package diff-hl
  :ensure t
  :hook
  ((after-init . global-diff-hl-mode)
   (diff-hl-mode . diff-hl-margin-mode))
  :config
  (diff-hl-flydiff-mode 1)  
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  )

(use-package kkp
  :ensure t
  :config
  (global-kkp-mode 1))

(use-package hideshow
  :ensure nil
  :hook (scheme-mode . hs-minor-mode)
  :bind (:map hs-minor-mode-map
         ("C-c f s" . hs-show-block)      ; 显示当前块
         ("C-c f S" . hs-show-all)        ; 显示所有块
         ("C-c f h" . hs-hide-block)      ; 隐藏当前块
         ("C-c f H" . hs-hide-all)        ; 隐藏所有块
         ("C-c f t" . hs-toggle-hiding))) ; 切换折叠/展开（可选）


;; some config
(global-display-line-numbers-mode 1) ;cloumn
(column-number-mode 1) ;row
(hl-line-mode 1)
(set-face-background 'hl-line "#333333")

