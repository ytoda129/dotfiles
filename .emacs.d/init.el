;; ロードパスの追加
(setq load-path (append
                 '(
                   "~/.emacs.d/packages"
                   "~/.emacs.d/private-conf"
                   )
		 load-path))

;; 言語設定
(set-locale-environment nil)

;; スタートアップ非表示
(setq inhibit-startup-screen t)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; ツールバー非表示
(tool-bar-mode -1)

;; スクロールバー非表示
(set-scroll-bar-mode nil)

;; タイトルバーにフルパス表示
;(setq frame-title-format
;      (format "%%f - Emacs@%s" (system-name)))

;; 行、桁番号表示
(global-linum-mode t)
(line-number-mode 1)
(column-number-mode 1)

;; 括弧のハイライト
(show-paren-mode t)

;; タブをスペースに
(setq-default tab-width 4
              indent-tabs-mode nil)

;; バックスペース
(keyboard-translate ?\C-h ?\C-?)

;; proxy
;; private-conf/myproxy.elがあるときだけプロキシ設定をロード
(load "myproxy" t)

;; package関係
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

;; 追加したパッケージ (多分、24.5じゃないと毎回installされる
(package-install 'js2-mode)
(package-install 'helm)
(package-install 'company)
(package-install 'company-tern)
(package-install 'helm-gtags)
(package-install 'markdown-mode)
(package-install 'racket-mode)

;; javascript-mode
(setq js-indent-level 2)

;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-basic-offset 2)

;; helm
(require 'helm-config)
(helm-mode 1)

;; company-mode
(require 'company)
(global-company-mode)

;; company-tern
(add-hook 'js2-mode-hook 'tern-mode)
(add-to-list 'company-backends 'company-tern)

;; helm-gtags
(require 'helm-gtags)
(add-hook 'js2-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
;; key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
             (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))

;; cc-mode common setting
(setq-default c-basic-offset 4)

;; c-mode
(add-hook 'c-mode-common-hook
          '(lambda ()
             (c-set-style "stroustrup")))
