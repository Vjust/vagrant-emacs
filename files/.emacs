;------------ setup package manager --------------------
                                                        
(require 'package)

(add-to-list 'package-archives 
    '("melpa" .
      "http://melpa.org/packages/") t)
(unless package-archive-contents (package-refresh-contents))
(package-initialize)

(defvar basePackages
  '(better-defaults
    material-theme
     ))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      basePackages)


;; ~~~~~~~~~~~~~~~~~~~~ Basic customization ~~~~~~~~~~~~~~~~~~~~~~~~~~~
(setq inhibit-startup-message t)
(load-theme 'material t)
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")
;(setq linum-format "%d ")


;; ~~~~~~~~~~~~~~~~ python customizations ~~~~~~~~~~~~~~~~~~~~~~


(defvar pythonPackages
  '(
    ein
    jedi
    elpy
    flycheck
    py-autopep8
    virtualenv
    virtualenvwrapper
	))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      pythonPackages)



;; -- packages installed , now configure them ~~~~~~~~~~~~~~~~~
(elpy-enable)
(elpy-use-ipython)


(when (require 'flycheck nil t)
	(setq eply-modules (delq 'elpy-module-flymake elpy-modules))
	(add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(require 'jedi)
(add-to-list 'ac-sources 'ac-source-jedi-direct)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)   

(defvar jedi-config:with-virtualenv nil
  "Set to non-nil to point to a particular virtualenv.")

(defvar jedi-config:vcs-root-sentinel ".git")


;; remember to run M-x jedi:install-server at the end.
