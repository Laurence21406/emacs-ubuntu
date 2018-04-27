(require 'cl)
(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
(defvar my/packages '(
		      
              auto-complete
                swiper
                counsel
		autopair
		flycheck
                monokai-theme
		switch-window
		yasnippet
		 yasnippet-snippets
		 ace-jump-mode
		 pdf-tools
                ) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))

(add-to-list 'my/packages 'monokai-theme)
(load-theme 'monokai 1)

(ivy-mode 1)
(ac-config-default)


(require 'switch-window)
(global-set-key (kbd "C-x o") 'switch-window)

(global-set-key (kbd "C-h") 'ace-jump-mode)
(require 'yasnippet)
(yas-global-mode 1)
(global-flycheck-mode 1)
(provide 'init-packages)
