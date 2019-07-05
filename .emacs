;; antonyh/dotfiles/.emacs

;; identity information
(setq user-full-name "Antony Hutchison"
      user-mail-address "antonyh@gmail.com") 

;; I keep my secrets... secret.
(load "~/.emacs.secrets" t)

;; UNICODE settings
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))


;; put backups in a common place instead of polluting my workspace
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; file management options
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; history options
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; display options - remove the toolbar - I don't use it
(tool-bar-mode -1)
;;(use-package smart-mode-line)

;;;;;;;;;;;
;; MELPA ;;
;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;;;;;;;;;;;;
;; STARTUP ;;
;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (smart-mode-line helm-descbinds elfeed helm magit))))

;; I prefer y/n instead of yes/no - less typing
(defalias 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;
;; THEME ;;
;;;;;;;;;;;

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;
;; ORGMODE ;;
;;;;;;;;;;;;;

;; If you would like a TODO entry to automatically change to DONE when all children are done, you can use the following setup:
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; OrgMode keys
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; TODO word list
(setq org-todo-keywords
      '((sequence "TODO(t)" "IN PROGRESS(I)" "|" "DONE(d)")))

;;;;;;;;;;
;; HELM ;;
;;;;;;;;;;

;; common bindings for Helm
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; use Helm for help
;;(use-package helm-descbinds
;;	     :defer t
;;	     :bind (("C-h b" . helm-descbinds)
;;		    ("C-h w" . helm-descbinds)))

