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

;; 行番号表示
(global-linum-mode t)

;; タブをスペースに
(setq-default tab-width 4 indent-tabs-mode nil)

;; バックスペース
(keyboard-translate ?\C-h ?\C-?)

;; proxy
;; private-conf/myproxy.elがあるときだけプロキシ設定をロード
(load "myproxy" t)

;; package関係
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
;(package-refresh-contents)

;; 追加したパッケージ (多分、24.5じゃないと毎回installされる
(package-install 'js2-mode)

;; javascript-mode
(setq js-indent-level 2)

;; js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-basic-offset 2)

