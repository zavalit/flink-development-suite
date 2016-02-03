
(setq debug-on-error t)

(tool-bar-mode 0)
(menu-bar-mode 0)
;;(toggle-frame-fullscreen)
(scroll-bar-mode 0)
(fset `yes-or-no-p `y-or-n-p) 



(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
(setq custom-safe-themes t)


;; fetch the list of packages available 
(when (not package-archive-contents)
  (package-refresh-contents))

; install the missing packages
(defvar my-packages
  '(;;; scala interactive compiler and much more
    ensime
    
    ;; template
    monokai-theme

    ;; allow ido usage in as many contexts as possible. see
    ;; customizations/navigation.el line 23 for a description
    ;; of ido
    ido-ubiquitous

    ;; Enhances M-x to allow easier execution of commands. Provides
    ;; a filterable list of possible commands in the minibuffer
    ;; http://www.emacswiki.org/emacs/Smex
    smex

    ;; project navigation
    projectile

    ;; git integration
    magit))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))


;; scala env
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-hook 'scala-mode-hook #'yas-minor-mode)




;; ui 
(when (display-graphic-p)
  (load-theme 'monokai t)
  )
(set-frame-font "DejaVu Sans Mono-10")
;;(setq initial-frame-alist '((top . 0) (left . 0) (width . 200) (height . 280)))
