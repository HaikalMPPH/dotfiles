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

;; DISABLE STARTUP MENU
(setq inhibit-startup-screen t)


;; FONTS
(set-frame-font "JetBrainsMono 13" nil t)

;; LINE NUMBERS
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
