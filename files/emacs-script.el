;------------ setup package manager --------------------
                                                        
(require 'cl)
(require 'package)

(setq cfg-var:packages '(
       emmet-mode
       ergoemacs-mode
       flycheck
       flycheck-pyflakes
       monokai-theme
       py-autopep8
       py-isort
       rainbow-mode
       yafolding
       yasnippet
       git))

(defun cfg:install-packages ()
    (let ((pkgs (remove-if #'package-installed-p cfg-var:packages)))
        (when pkgs
            (message "%s" "Emacs refresh packages database...")
            (package-refresh-contents)
            (message "%s" " done.")
            (dolist (p cfg-var:packages)
                (package-install p)))))

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(cfg:install-packages)

;---------------------------------------------------------

