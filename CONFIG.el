;;; Org-Mode
(add-to-list 'load-path "/home/skaggbag/.emacs.d/lisp/org-mode/lisp")
(add-to-list 'load-path "/home/skaggbag/.emacs.d/lisp/org-mode/contrib/lisp" t)

(use-package org-bullets						
	   :ensure t							
	   :config							
	   (progn
            (global-set-key (kbd "C-c l") 'org-store-link)
            (global-set-key (kbd "C-c a") 'org-agenda)
            (global-set-key (kbd "C-c c") 'org-capture)
	    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))))

;; set up babel support
(require 'org-install)
;(org-eukleides-path "/usr/")
;(require 'ob-eukleides)
;; add additional languages with (require 'ob-language)

(use-package evil
	     :ensure t)
(evil-mode t)

;;; package --- Summary
;;; Provides =C-S-/= for redo
;;; =C-x u= for tree of changes
;;; Commentary:
;;; Code:
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode))

(set-face-attribute 'default nil :height 160)

;(global-display-line-numbers-mode 'relative)
;(global-hl-line-mode t)
(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))

(use-package which-key
	     :ensure t
	     :config (which-key-mode))

(show-paren-mode 1)

(use-package swiper
	     :ensure t
	     :config
	     (progn
	       ;; The following is from swiper docs as recommended
	       (ivy-mode 1)
	       (setq ivy-use-virtual-buffers t)
	       (setq enable-recursive-minibuffers t)
	       (setq ivy-use-selectable-prompt t)
	       ;; enable this if you want `swiper' to use it
	       ;; (setq search-default-mode #'char-fold-to-regexp)
	       (global-set-key "\C-s" 'swiper)
	       (global-set-key (kbd "C-c C-r") 'ivy-resume)
	       (global-set-key (kbd "<f6>") 'ivy-resume)
	       (global-set-key (kbd "M-x") 'counsel-M-x)
	       (global-set-key (kbd "<f1> f") 'counsel-describe-function)
	       (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
	       (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
	       (global-set-key (kbd "<f1> l") 'counsel-find-library)
	       (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
	       (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
	       (global-set-key (kbd "C-c g") 'counsel-git)
	       (global-set-key (kbd "C-c j") 'counsel-git-grep)
	       (global-set-key (kbd "C-c k") 'counsel-ag)
	       (global-set-key (kbd "C-x l") 'counsel-locate)
	       (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
	       (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
	     ))

;;; Provides syntax highlighting on a variety of languages
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))
;;; flycheck ends here

(use-package company
  :ensure t
  :init
  :config
  (global-company-mode t))
;  (global-set-key "" 'global-company-mode)

(use-package company-math
  :ensure t
  :init
  :config
  (add-to-list 'company-backends 'company-math-symbols-unicode)
  (add-hook 'TeX-mode-hook 'my-latex-mode-setup))

;;; auto-complete
;(use-package auto-complete
;	     :ensure t
;	     :init
;	     (progn
;	     (ac-config-default)
;	     (global-auto-complete-mode t)

(setq inhibit-startup-message t)
(auto-fill-mode t)
(follow-mode t)
(icomplete-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
;;; Displays possible buffers in echo-area
;;; Presents
(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
;;;
;;; This changes the buffer menu
(defalias 'list-buffers 'ibuffer)

(use-package ace-window
	    :ensure t
	    :init
	    (progn
	     (global-set-key (kbd "M-o") 'ace-window)
	      (custom-set-faces
	       '(aw-leading-char-face ((
		    t (:inherit ace-jump-face-foreground :height 3.0)))))
		 ;(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
		 ;(global-set-key [remap other-window] 'ace-window)
								      ))    ; of window marker

(use-package counsel
	    :ensure t)

(use-package try
	     :ensure t)

(global-set-key (kbd "C-x C-f") 'set-fill-column)
(global-set-key (kbd "C-x f") 'counsel-find-file)
(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "C-e") 'eval-last-sexp)
(global-set-key (kbd "C-x e") 'eval-last-sexp)

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package tex
  :ensure auctex)

;; local configuration for TeX modes
(defun my-latex-mode-setup ()
  (setq-local company-backends
	      (append '((company-math-symbols-latex company-latex-commands))
		      company-backends)))

;(autoload 'j-mode "j-mode.el" "Major mode for editing J files" t)
;(add-to-list 'auto-mode-alist '("\\.ij[rstp]$" . j-mode))
;;; J
;(add-to-list 'load-path "/home/skaggbag/src/j-mode")

(use-package cheat-sh
	    :ensure t)

(use-package pdf-tools
  :ensure t)

(use-package magit
  :ensure t)
