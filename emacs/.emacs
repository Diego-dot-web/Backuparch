(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See package-archive-priorities
;; and package-pinned-packages. Most users will not need or want to do this.
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(require 'lsp-java)
(require 'lsp-java-boot)

(use-package lsp-java
  :ensure t
  :config
  (setq lsp-java-java-path "java")

  (defun my/lsp-java-with-lombok ()
    "Return JDTLS command with Lombok agent included."
    (let* ((home (getenv "HOME"))
           (lombok-path (concat home "/.config/nvim/lombok.jar"))
           (jdtls-cache (concat home "/.emacs.d/.cache/lsp/eclipse.jdt.ls"))
           (launcher-jar (car (file-expand-wildcards
                               (concat jdtls-cache "/plugins/org.eclipse.equinox.launcher_*.jar"))))
           (config-dir (concat jdtls-cache "/config_linux"))
           (workspace (concat home "/.emacs.d/workspace/"
                              (md5 (or (buffer-file-name) default-directory)))))
      `("java"
        ,(concat "-javaagent:" lombok-path)
        "-Xmx4G"
        "-XX:+UseG1GC"
        "-XX:+UseStringDeduplication"
        "--add-modules=ALL-SYSTEM"
        "--add-opens" "java.base/java.util=ALL-UNNAMED"
        "--add-opens" "java.base/java.lang=ALL-UNNAMED"
        "-jar" ,launcher-jar
        "-configuration" ,config-dir
        "-data" ,workspace)))

  ;; override the default ls command
  (advice-add 'lsp-java--ls-command :override #'my/lsp-java-with-lombok)

  (add-hook 'java-mode-hook #'lsp))

(add-hook 'lsp-mode-hook #'lsp-lens-mode)
(add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)

(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)

(setq display-line-numbers-type 'relative)
(setq custom-file "~/custom.el")
(load-file custom-file)

(setq inhibit-startup-screen t
      initial-scratch-message "")

(setq visible-bell 1)

(ffap-bindings)

(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font-12"))

(load "~/.emacs.rc/misc-rc.el")
(load "~/.emacs.rc/rc.el")

(rc/require-theme 'gruber-darker)
(rc/require 'smex 'ido-completing-read+)
(rc/require 'paredit)
(rc/require 'cl-lib)
(rc/require 'magit)
(rc/require 'multiple-cursors)
(rc/require 'helm 'helm-ls-git)
(rc/require 'yasnippet)
(rc/require 'typescript-mode)
(rc/require 'tide)
(rc/require
 'yaml-mode
 'lua-mode
 'less-css-mode
 'cmake-mode
 'markdown-mode
 'dockerfile-mode
 'toml-mode
 'typescript-mode
 )
(rc/require 'undo-tree)
(rc/require 'diff-hl)
(rc/require 'expand-region)

(diff-hl-margin-mode 1)
(global-diff-hl-mode 1)


(yas-global-mode 1)


(set-display-table-slot standard-display-table 0 ?\ )

(global-undo-tree-mode 1)


(setq helm-ff-transformer-show-only-basename nil)

(defun rc/turn-on-paredit ()
  (interactive)
  (paredit-mode 1))

(defun rc/set-up-whitespace-handling ()
  (interactive)
  (whitespace-mode 1)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(defun rc/turn-on-tide-and-flycheck ()  ;Flycheck is a dependency of tide
  (interactive)
  (tide-setup)
  (flycheck-mode 1))

(add-hook 'typescript-mode-hook 'rc/turn-on-tide-and-flycheck)

(add-hook 'emacs-lisp-mode 'rc/set-up-whitespace-handling)
(add-hook 'java-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'c-mode-hook 'rc/set-up-whitespace-handling)

(add-hook 'emacs-lisp-mode-hook  'rc/turn-on-paredit)
(add-hook 'java-mode-hook  'rc/turn-on-paredit)
(add-hook 'c-mode-hook  'rc/turn-on-paredit)

(require 'ido-completing-read+)


(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(global-set-key (kbd "C-c h t") 'helm-cmd-t)
(global-set-key (kbd "C-c h g l") 'helm-ls-git-ls)
(global-set-key (kbd "C-c h f") 'helm-find)
(global-set-key (kbd "C-c h a") 'helm-org-agenda-files-headings)
(global-set-key (kbd "C-c h r") 'helm-recentf)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-c C-n")         'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-p")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-a")     'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-s")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-S-s")         'mc/skip-to-previous-like-this)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(rc/require 'move-text)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

(global-set-key (kbd "C-x C-p") 'previous-buffer)
(global-set-key (kbd "C-x C-n") 'next-buffer)
(global-set-key (kbd "C-x C-k") 'kill-buffer)
(global-set-key (kbd "C-,") 'duplicate-line)
(global-set-key (kbd "C-x C-a") 'beginning-of-buffer)
(global-set-key (kbd "C-x C-e") 'end-of-buffer)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c u") 'undo-tree-undo)
(global-set-key (kbd "C-c r") 'undo-tree-redo)
(global-set-key (kbd "C-=") 'er/expand-region)



(add-to-list 'compilation-error-regexp-alist
             '("\\([a-zA-Z0-9\\.]+\\)(\\([0-9]+\\)\\(,\\([0-9]+\\)\\)?) \\(Warning:\\)?"
               1 2 (4) (5)))

(use-package corfu
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  :init

  ;; Recommended: Enable Corfu globally.  Recommended since many modes provide
  ;; Capfs and Dabbrev can be used globally (M-/).  See also the customization
  ;; variable `global-corfu-modes' to exclude certain modes.
  (global-corfu-mode)

  ;; Enable optional extension modes:
  ;; (corfu-history-mode)
  ;; (corfu-popupinfo-mode)
  )
;; Enable auto completion and configure quitting
(setq corfu-auto t
      corfu-quit-no-match 'separator) ;; or t
