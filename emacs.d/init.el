(setq evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)
(setenv "PATH" (concat (getenv "PATH") ":/home/jds/bin:/home/jds/.cask/bin"))
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(require 'use-package)
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(load-library "iso-transl")

(global-linum-mode t)
(global-hl-line-mode t)
(setq default-tab-width 2)
(setq inhibit-startup-message t)
(setq visible-bell 'top-bottom)
(setq x-underline-at-descent-line t)
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(menu-bar-mode -1)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq default-directory (getenv "HOME"))

(setq inhibit-startup-message t)

(setq default-indicate-empty-lines t)
(setq require-final-newline t)
(setq show-trailing-whitespace t)

(setq auto-save-default nil)
(setq make-backup-files nil)

(require 'org)
(require 'evil-org)
(require 'org-habit)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/org/work.org"
														 "~/org/home.org"))
(setq org-log-done t)

(use-package powerline
  :init
  (use-package diminish
    :config
    (progn
      (eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
      (eval-after-load "simple" '(diminish 'auto-fill-function))
      (eval-after-load "eldoc" '(diminish 'eldoc-mode))
      (eval-after-load "guide-key" '(diminish 'guide-key-mode))
      (eval-after-load "highlight-parentheses" '(diminish 'highlight-parentheses-mode))
      (eval-after-load "elisp-slime-nav" '(diminish 'elisp-slime-nav-mode " sln"))
      (eval-after-load "projectile" '(diminish 'projectile-mode " prj"))
      (eval-after-load "paredit" '(diminish 'paredit-mode " par"))
      (eval-after-load "company" '(diminish 'company-mode " cmp"))
      (eval-after-load "cider" '(diminish 'cider-mode " cid"))
      (eval-after-load "typed-clojure-mode" '(diminish 'typed-clojure-mode " typ"))))
  :config
  (progn
    (require 'weft-powerline)
    (powerline-weft-theme)))

(eval-after-load "flyspell"
 '(defun flyspell-mode (&optional arg)))

(add-hook 'emacs-lisp-mode-hook 'prettify-symbols-mode)
(add-hook 'clojure-mode-hook 'prettify-symbols-mode)
(add-hook 'clojure-mode-hook '(lambda () (interactive) (column-marker-1 80)))
(add-hook 'clojure-mode-hook '(lambda () (rainbow-delimiters-mode 1)))

(use-package highlight-parentheses
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)
    (add-hook 'clojure-mode-hook 'highlight-parentheses-mode)))

(use-package company
             :init (global-company-mode)
             :config
             (progn
               (defun indent-or-complete ()
                 (interactive)
                 (if (looking-at "\\_>")
                   (company-complete-common)
                   (indent-according-to-mode)))
               (global-set-key "\t" 'indent-or-complete)))

(use-package evil
             :init
             (progn
               (evil-mode 1)
               (use-package evil-leader
                            :init (global-evil-leader-mode)
                            :config
                            (progn
                              (evil-leader/set-leader ",")
                              (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
                              (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
                              (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
                              (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
                              (evil-leader/set-key
                                "c" 'comment-or-uncomment-region
                                "w" 'save-buffer
                                "b" 'switch-to-buffer
                                "k" 'kill-buffer
                                "f" 'toggle-frame-fullscreen)
                              (evil-leader/set-key "d" 'delete-window)
                              (evil-leader/set-key "o" 'delete-other-windows)
                              (evil-leader/set-key "s" 'split-window-below)))
               (use-package evil-surround
                            :init (global-evil-surround-mode 1)))
             :config
             (setq evil-cross-lines t))

(use-package guide-key
             :init (guide-key-mode 1)
             :config
             (progn
               (setq guide-key/idle-delay 1)
               (setq guide-key/recursive-key-sequence-flag t)
               (setq guide-key/popup-window-position 'bottom)
               (setq guide-key/guide-key-sequence
                     `("C-h" "C-x" "C-c" ,evil-leader/leader "g" "z"))))

(use-package ido)

(use-package flx-ido
             :init (progn (flx-ido-mode 1)
                          (ido-everywhere 1))
             :config (progn
                       (setq ido-enable-flex-matching t)
                       (setq ido-use-faces nil)
                       (setq ido-use-faces nil)))

(use-package projectile
             :init (projectile-global-mode)
             :config
             (progn
               (evil-leader/set-key "," 'projectile-find-file
                                    "a" 'projectile-ag)))

(use-package yaml-mode
               :mode ("\\.yml$" . yaml-mode))

(use-package markdown-mode
             :mode (("\\.markdown$" . markdown-mode)
                    ("\\.md$" . markdown-mode)))

(use-package clojure-mode
             :mode (("\\.edn$" . clojure-mode)
                    ("\\.cljc$" . clojure-mode))
             :init
             (progn
               (use-package cider
                            :init
                            (progn
                              (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
                              (add-hook 'cider-repl-mode-hook 'subword-mode)
                              (use-package slamhound))
                            :config
                            (progn
															(setq cider-lein-command "/home/jds/bin/lein")
                              (setq nrepl-hide-special-buffers t)
                              (setq cider-popup-stacktraces-in-repl t)
                              (setq cider-repl-history-file "~/.emacs.d/nrepl-history")
                              (setq cider-repl-pop-to-buffer-on-connect nil)
                              (setq cider-repl-use-clojure-font-lock t)
                              (setq cider-auto-select-error-buffer nil)
                              (setq cider-prompt-save-file-on-load nil))))
             :config
             (progn
               (define-clojure-indent
                 (defroutes 'defun)
                 (GET 2)
                 (POST 2)
                 (PUT 2)
                 (DELETE 2)
                 (HEAD 2)
                 (ANY 2)
                 (context 2))

               (define-clojure-indent
                 (fnk 2)
                 (defnk 'defun)
                 (ajax-lite 1)
                 (execute! 1))

               (define-clojure-indent
                 (form-to 1))

               (define-clojure-indent
                 (match 1)
                 (are 2))

               (define-clojure-indent
                 (select 1)
                 (insert 1)
                 (update 1)
                 (delete 1))

               (define-clojure-indent
                 (run* 1)
                 (fresh 1))

               (define-clojure-indent
                 (extend-freeze 2)
                 (extend-thaw 1))

               (define-clojure-indent
                 (go-loop 1))

               (define-clojure-indent
                 (this-as 1)
                 (specify 1)
                 (specify! 1))

               (setq clojure--prettify-symbols-alist
                     '(("fn"  . ?λ)
                       ("comp" . ?∘)
                       ("not=" . ?≠)
                       ("<=" . ?≤)
                       (">=" . ?≥)
                       ("identical?" . ?≡)))

               (defun toggle-nrepl-buffer ()
                 "Toggle the nREPL REPL on and off"
                 (interactive)
                 (if (string-match "cider-repl" (buffer-name (current-buffer)))
                   (delete-window)
                   (cider-switch-to-relevant-repl-buffer)))

               (defun cider-project-reset ()
                 (interactive)
                 (cider-interactive-eval "(reloaded.repl/reset)"))

               (evil-leader/set-key "eb" 'cider-eval-buffer)
               (evil-leader/set-key "ee" 'cider-eval-last-sexp)
               (evil-leader/set-key "er" 'cider-eval-region)
               (evil-leader/set-key "ef" 'cider-eval-defun-at-point)

               (evil-leader/set-key "d" 'cider-doc)
               (evil-leader/set-key "t" 'cider-test-run-tests)
               (evil-leader/set-key "n" 'toggle-nrepl-buffer)
               (evil-leader/set-key "r" 'cider-project-reset)))

(use-package align-cljlet
	:config
	(evil-leader/set-key "l" 'align-cljlet))

(use-package jsx-mode
             :config
             (progn
               (setq web-mode-markup-indent-offset 2)
               (setq jsx-indent-level 2)
               (setq javascript-indent-level 2)))

(use-package recentf
             :init (recentf-mode 1)
             :config
             (progn
               (defun recentf-ido-find-file ()
                 (interactive)
                 (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
                   (when file
                     (find-file file))))
               (evil-leader/set-key "f" 'recentf-ido-find-file)))

(use-package rainbow-delimiters
             :init (rainbow-delimiters-mode 1))

(use-package git-gutter
             :init (global-git-gutter-mode t))

(use-package smart-parens
	:init (smartparens-global-mode t))

(use-package ag
             :config
             (setq ag-highlight-search t))

(defvar my-linum-format-string "%3d")

(add-hook 'linum-before-numbering-hook 'my-linum-get-format-string)

(defun my-linum-get-format-string ()
  (let* ((width (1+ (length (number-to-string
                             (count-lines (point-min) (point-max))))))
         (format (concat "%" (number-to-string width) "d")))
    (setq my-linum-format-string format)))

(defvar my-linum-current-line-number 0)

(setq linum-format 'my-linum-relative-line-numbers)

(defun my-linum-relative-line-numbers (line-number)
  (let ((offset (abs (- line-number my-linum-current-line-number))))
    (propertize (format my-linum-format-string offset) 'face 'linum)))

(defadvice linum-update (around my-linum-update)
  (let ((my-linum-current-line-number (line-number-at-pos)))
    ad-do-it))

(ad-activate 'linum-update)

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(global-set-key (kbd "C-x C-r") 'sudo-edit)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 (quote
		("f21caace402180ab3dc5157d2bb843c4daafbe64aadc362c9f4558ac17ce43a2" "8e3f020f1ce69cfa0c1ebee4e198feb28dd7eb31b7d77927e9c790819210c654" "b4ec581daad15aa7020b722523dc6bcea850bfbdbe31bfeb11c45ea51899bd75" "aed73c6d0afcf2232bb25ed2d872c7a1c4f1bda6759f84afc24de6a1aec93da8" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "2a051a3f76f66920ce6f38a11f406bd2f7f18fb57b32c5661879e870661408aa" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
