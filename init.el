;;; init.el --- My Emacs initialisation file.

;; Copyright (C) 2018 Sisir Ghimire Chettri <samratsisir294@gmail.com>

;; Author: Sisir Ghimire Chettri <samratsisir294@gmail.com>
;; Keywords: internal

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; There are no commentaries at the moment.
;; Nyah!


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Code:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/")
	     t)

(package-initialize)

;; (add-to-list 'package-darchives
;; 	     '("marmalade" . "http://marmalade-repo.org/packages/")
;; 	     t)


(defun find-user-init-file ()
  "Edit the `user-init-file', in another window."
  (interactive)
  (find-file-other-window user-init-file))

(global-set-key (kbd "C-c i") 'find-user-init-file)
(global-set-key (kbd "<f6>") (lambda() (interactive) (find-file "~/.emacs.d/init.el")))


;; Use package
(eval-when-compile (require 'use-package))

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))


;; highlight indent guides
(use-package highlight-indent-guides :ensure t
  :init
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character))

;; Nlinum mode

(use-package nlinum
  :ensure t
  :init
  (setq nlinum-format "  %d ")
  (add-hook 'prog-mode-hook 'nlinum-mode)
  :config)
  ;; (set-face-attribute 'linum nil :height 0.85 :slant 'normal))

;; Relative Nlinum

;; (use-package nlinum-relative
;;     :config
;;     ;; something else you want
;;     (nlinum-relative-setup-evil)
;;     (add-hook 'prog-mode-hook 'nlinum-relative-mode))

;; all-the-icons-ivy
;; (all-the-icons-ivy-setup)

;; fill-column-indicator ( ruler )
(use-package fill-column-indicator
  :ensure t
  :init
  (setq fci-rule-width 1)
  (setq fci-rule-color "darkblue"))

;; spaceline

(use-package spaceline :ensure t)
(require 'spaceline-config)

;; spaceline-all-the-icons

(use-package spaceline-all-the-icons
  :ensure t
  :after spaceline
  :config
  (spaceline-info-mode)
  (spaceline-all-the-icons-theme)
  (spaceline-all-the-icons--setup-neotree)
  (spaceline-all-the-icons--setup-paradox)
  (spaceline-all-the-icons--setup-git-ahead)
  (spaceline-all-the-icons--setup-package-updates)
  (spaceline-all-the-icons--setup-anzu))

(spaceline-toggle-all-the-icons-bookmark-on)
(spaceline-toggle-all-the-icons-dedicated-on)
(spaceline-toggle-all-the-icons-fullscreen-on)
(spaceline-toggle-all-the-icons-buffer-position-on)
(spaceline-toggle-all-the-icons-time-on)
(spaceline-toggle-all-the-icons-battery-status-on)
(spaceline-toggle-version-control-on)
;; (spaceline-all-the-icons-separator-type 'none)

;; rainbow mode
(use-package rainbow-mode :ensure t)


;; window number mode
(use-package winum :ensure t)
(winum-mode)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(nlinum-current-line ((t (:inherit linum :background "gray22" :foreground "DarkGoldenrod3" :weight semi-bold))))
 '(spaceline-highlight-face ((t (:foreground "#D3CBC3" :background "#0E5893")))))

;; (spaceline-all-the-icons-separator-type 'arrow)

(use-package rainbow-delimiters :ensure t :defer 1
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package move-text :ensure t
  :bind ("M-p" . move-text-up)
  ("M-n" . move-text-down))

;; Flycheck mode -- Everything related to flycheck resides here
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

;; On MacOS add the following to fix your $PATH environment variable: [[ from flycheck docs ]]
(package-install 'exec-path-from-shell)
(exec-path-from-shell-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Obsolete ido configs

;; (use-package ido-vertical-mode :ensure t)
;; (ido-mode t)
;; (ido-vertical-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Ivy mode

(use-package ivy :demand
      :config
      (setq ivy-use-virtual-buffers t
            ivy-count-format "%d/%d "))

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-height 18)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (global-set-key (kbd "M-x") 'smex)

(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(ac-config-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package neotree
  :ensure t
  :bind (([f8] . neotree-toggle))
  :config (setq neo-autorefresh nil))


(use-package magit
  :ensure t
  :bind("C-x g" . magit-status))

;; Dashboard for emacs

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner "~/.emacs.d/gnu/gnu-left-white.png"))
  (setq dashboard-banner-logo-title "Welcome to the Holy Church of Emacs | 'There is no system but GNU, and Linux is one of its kernels.' - St IGNUcius")
  (setq dashboard-buffer-last-width 20)
  (setq dashboard-items '((recents . 5)
			  (bookmarks . 5)
			  (projects . 5)
			  (agenda . 5)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package which-key :ensure t
  :config
  (which-key-mode))


;; Projectile

;;; Project management with Projectile

;; (use-package projectile                 ; Project management for Emacs
;;   :ensure t
;;   :defer 1
;;   :config
;;   (projectile-global-mode)
;;   ;; Remove dead projects when Emacs is idle
;;   (run-with-idle-timer 10 nil #'projectile-cleanup-known-projects)

;;   (setq projectile-completion-system 'ivy
;;                  projectile-find-dir-includes-top-level t)

;;   (defun lunaryorn-neotree-project-root (&optional directory)
;;     "Open a NeoTree browser for a project DIRECTORY."
;;     (interactive)
;;     (let ((default-directory (or directory default-directory)))
;;       (if (and (fboundp 'neo-global--window-exists-p)
;;                (neo-global--window-exists-p))
;;           (neotree-hide)
;;         (neotree-find (projectile-project-root)))))
;;   :diminish projectile-mode)

;; (use-package counsel-projectile         ; Counsel interface to projectile
;;   :ensure t
;;   :after projectile
;;   :config
;;   (counsel-projectile-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Diff hl mode
;; (use-package diff-hl
;;   :ensure t
;;   :defer t
;;   :init
;;   ;; Highlight changes to the current file in the fringe
;;   (global-diff-hl-mode)
;;   ;; Highlight changed files in the fringe of Dired
;;   (add-hook 'dired-mode-hook 'diff-hl-dired-mode)

;;   ;; Fall back to the display margin, if the fringe is unavailable
;;   (unless (display-graphic-p)
;;     (diff-hl-margin-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Beacon

(use-package beacon :ensure t
  :config
  (setq beacon-size '20)
  (setq beacon-color "#efefef"))

;; Duplicate line

(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line.  (as ARG) ."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))

(global-set-key (kbd "C-c d") 'duplicate-line)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; load theme
(load-theme 'base16-onedark t)

;; Trust all the themes
(setq custom-safe-themes t)

;; Set the cursory-type to bar
(set-default 'cursor-type
	     'bar)

;; set the title for the window
(setq frame-title-format "emacs - the holy!")

;; set line spacing
(setq-default line-spacing 3)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode)
(show-paren-mode)
(electric-pair-mode)
(electric-indent-mode 1)
(global-hl-line-mode t)

(winner-mode t)
(windmove-default-keybindings)

;; Global set keys

(global-undo-tree-mode)

(global-set-key (kbd "M-/") 'undo-tree-visualize)

(global-set-key (kbd "C-M-z") 'switch-window)

(global-set-key (kbd "C-x j") 'ace-jump-mode)


(setq whitespace-space 'underline)
(setq-default indent-tabs-mode nil)

;; don't keep backup files
(setq make-backup-files nil)


(require 'multiple-cursors)


;; PYTHON
(use-package anaconda-mode              ; Powerful Python backend for Emacs
  :ensure t
  :defer t
  :init (add-hook 'python-mode-hook #'anaconda-mode))

(use-package company-anaconda           ; Python backend for Company
  :ensure t
  :after company
  :config (add-to-list 'company-backends 'company-anaconda))

;; (require 'virtualenvwrapper)
;; (venv-initialize-interactive-shells) ;; if you want interactive shell support
;; (venv-initialize-eshell) ;; if you want eshell support

(use-package pyvenv :ensure t)

;; git gutter

(use-package git-gutter-fringe :ensure t
  :init
  (global-git-gutter-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(git-gutter:update-interval 2)
 '(package-selected-packages
   (quote
    (vue-mode hideshow-org git-gutter-fringe flx-ido fill-column-indicator eyebrowse pyvenv django-mode python-django exec-path-from-shell which-key web-mode use-package telephone-line tangotango-theme switch-window subatomic256-theme subatomic-theme spacemacs-theme spaceline-all-the-icons smex restart-emacs rainbow-mode rainbow-delimiters python-mode powerline-evil noctilux-theme nlinum-relative neotree multiple-cursors move-text material-theme markdown-mode magit js2-mode highlight-indent-guides hackernews gruvbox-theme flycheck-pycheckers firecode-theme dracula-theme doom-themes dashboard counsel-projectile company-web company-anaconda color-theme-sanityinc-tomorrow blank-mode beacon base16-theme auto-complete atom-one-dark-theme atom-dark-theme all-the-icons-ivy all-the-icons-gnus ag ace-jump-mode))))

(set-face-foreground 'git-gutter-fr:modified "#72ABE8")
(set-face-foreground 'git-gutter-fr:added    "#A7D36E")
(set-face-foreground 'git-gutter-fr:deleted  "#FF6470")

(setq-default left-fringe-width  9)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; HTML & Javascript
(use-package web-mode
  :ensure t
  :defer t
  :mode (("\\.html\\'" . web-mode)))


(use-package css-mode                   ; CSS
  :defer t
  :config (setq css-indent-offset 2))

(use-package js2-mode                   ; Powerful Javascript mode
  :ensure t
  :defer t
  :mode (("\\.js\\'" . js2-mode))
  :config
  ;; Disable parser errors and strict warnings.  We have Flycheck 8)
  (setq js2-mode-show-parse-errors nil
                 js2-mode-show-strict-warnings nil
                 js2-highlight-level 3  ; Try to highlight most ECMA built-ins
                 ))


;;; Date and time
(use-package calendar                   ; Built-in calendar
  :bind ("C-c a c" . calendar)
  :config
  ;; In Kathmandu, Nepal we start on Sunday
  (setq calendar-week-start-day 0))


(use-package time                       ; Show current time
  :bind (("C-c a C" . display-time-world))
  :config
  (setq display-time-world-time-format "%H:%M %Z, %d. %b"
                 display-time-world-list '(("Europe/Berlin"    "Berlin")
                                           ("Europe/London"    "London")
                                           ("Europe/Istanbul"  "Istanbul")
                                           ("America/Winnipeg" "Winnipeg (CA)")
                                           ("America/New_York" "New York (USA)")
                                           ("Asia/Tokyo"       "Tokyo (JP)"))))


;; (add-to-list 'default-frame-alist '(font . "FuraMono Nerd Font"))

;; fonts
(set-face-attribute 'default nil
                    :family "FuraMono Nerd Font"
                    :height 120
                    :weight 'light
                    :width 'normal)


;;; Init.el ends here
