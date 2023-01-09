(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(require 'use-package)

;; Disable Toolbar
(tool-bar-mode -1)

;; Show relative line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; Indent Tabs mode
(setq indent-tabs-mode nil)

;; Move backup and auto-saves to systems temp directory
(setq backup-directory-alist
      '((".*" . "~/.saves")))

(use-package modus-themes
  :ensure t
  :init
  (load-theme 'modus-operandi t))

;; Evil mode config
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; Treemacs setup
(use-package treemacs
  :ensure t
  :defer t
  :init
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  :bind
  (:map global-map
	("C-x t t" . treemacs)
	("C-x t /" . treemacs-find-file)))
	
(use-package flycheck
  :ensure t)

(use-package lsp-mode
  :ensure t
  :hook (
	 (c-mode . lsp)
	 (c++-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration))
  :config (setq lsp-completion-enable-additional-text-edit nil
		lsp-enable-on-type-formatting nil
		lsp-enable-snippet nil)
  :bind-keymap
  ("C-c l" . lsp-command-map))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred

(use-package company
  :ensure t
  :config
  (global-company-mode t))

(use-package lsp-ui
  :ensure t
  :config
  (setq lsp-ui-doc-show-with-mouse t
	lsp-ui-doc-show-with-cursor nil
	lsp-ui-doc-position 'at-point
	lsp-ui-flycheck-enable t)
  :bind
  (:map lsp-ui-mode-map
	([remap xref-find-references] . #'lsp-ui-peek-find-references)
	([remap xref-find-definitions] . #'lsp-ui-peek-find-definitions)))

(use-package lsp-java
  :ensure t
  :config
  (add-hook 'java-mode-hook 'lsp)
  (setq lsp-java-format-on-type-enabled nil))

(use-package which-key
  :ensure t
  :config (which-key-mode))

;; Tree-sitter, may be integratet in the future
(use-package tree-sitter
  :ensure t
  :hook (
	 (java-mode . tree-sitter-hl-mode)
	 (c-mode . tree-sitter-hl-mode)
	 (c++-mode . tree-sitter-hl-mode)))

(use-package tree-sitter-langs
  :ensure t)

;; Use helm
(use-package helm
  :ensure t
  :config
  (setq helm-always-two-windows t)
  (helm-mode 1))

;; Magit config
(use-package magit
  :ensure t)

;; AUCTex config
(use-package auctex
  :ensure t
  :defer t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)
(setq TeX-source-correlate-mode t)

;; Set default language to german
(use-package flyspell
  :ensure nil
  :config
  (setq flyspell-default-dictionary "de_DE")
  (setq ispell-dictionary "de_DE"))

;; Gramarchecking with languagetool
;; !!!Needs package languagetool installed on the host!!!
(use-package langtool
  :ensure t
  :config
  (setq langtool-java-classpath
	"/usr/share/languagetool:/usr/share/java/languagetool/*"))

;; Rainbow delimiter for easier Parantases matching
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; Org-mode
(use-package cdlatex
  :ensure t
  :config
  (add-hook 'org-mode-hook #'turn-on-org-cdlatex))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   '((output-pdf "Zathura")
     ((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Evince")
     (output-html "xdg-open")))
 '(ansi-color-names-vector
   ["#212337" "#ff757f" "#c3e88d" "#ffc777" "#82aaff" "#c099ff" "#b4f9f8" "#c8d3f5"])
 '(custom-safe-themes
   '("745d03d647c4b118f671c49214420639cb3af7152e81f132478ed1c649d4597d" "6dc02f2784b4a49dd5a0e0fd9910ffd28bb03cfebb127a64f9c575d8e3651440" default))
 '(fci-rule-color "#444a73")
 '(helm-completion-style 'helm)
 '(helm-minibuffer-history-key "M-p")
 '(highlight-tail-colors
   ((("#31363f" "#31363f" "green")
     . 0)
    (("#2f384a" "#2f384a" "brightcyan")
     . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#161a2a" "#82aaff"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#161a2a" "#c3e88d"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#161a2a" "#444a73"))
 '(objed-cursor-color "#ff757f")
 '(package-selected-packages
   '(pandoc-mode langtool minimap tree-sitter-langs tree-sitter modus-vivendi-theme modus-themes vterm helpful rainbow-delimiters helm dap-java lsp-ui dap-mode flycheck projectile which-key use-package company auctex-latexmk doom-themes auctex magit lsp-java ## evil-collection gruvbox-theme lsp-mode evil))
 '(pdf-view-midnight-colors (cons "#c8d3f5" "#212337"))
 '(rustic-ansi-faces
   ["#212337" "#ff757f" "#c3e88d" "#ffc777" "#82aaff" "#c099ff" "#b4f9f8" "#c8d3f5"])
 '(scheme-program-name "guile")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#212337")
 '(vc-annotate-color-map
   (list
    (cons 20 "#c3e88d")
    (cons 40 "#d7dd85")
    (cons 60 "#ebd27e")
    (cons 80 "#ffc777")
    (cons 100 "#ffb76e")
    (cons 120 "#ffa866")
    (cons 140 "#ff995e")
    (cons 160 "#ea9993")
    (cons 180 "#d599c9")
    (cons 200 "#c099ff")
    (cons 220 "#d58dd4")
    (cons 240 "#ea81a9")
    (cons 260 "#ff757f")
    (cons 280 "#d06a7c")
    (cons 300 "#a15f79")
    (cons 320 "#725476")
    (cons 340 "#444a73")
    (cons 360 "#444a73")))
 '(vc-annotate-very-old-color nil)
 '(which-key-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
