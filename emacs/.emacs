; MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

;; EVIL MODE
(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("78e6be576f4a526d212d5f9a8798e5706990216e9be10174e3f3b015b8662e27" default))
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(yaml-mode monokai-theme eglot-java lua-mode company eglot evil cmake-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; TOOLBAR, MENUBAR, AND SCROLL BAR
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; DISABLE STARTUP MENU
(setq inhibit-startup-screen t)

;; COMPANY MODE
;; init company mode at init
(add-hook 'after-init-hook 'global-company-mode)

;;;; EGLOT LANGUAGE SERVER
(require 'eglot)
;; C/C++
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
;; lua
(add-to-list 'eglot-server-programs '((lua-mode) "lua-lsp"))
(add-hook 'lua-mode-hook 'eglot-ensure)
;; java
(add-hook 'java-mode-hook 'eglot-java-mode)

;; FONTS
(set-frame-font "JetBrainsMono 13" nil t)

;; LINE NUMBERS
(display-line-numbers-mode)
(setq display-line-numbers 'relative)
