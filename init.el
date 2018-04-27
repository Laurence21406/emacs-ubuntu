(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")


(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-init-file)

;; Package Management
;; -----------------------------------------------------------------
(require 'init-packages)
(require 'custom)
(require 'init-ui)
(require 'init-better-default)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
