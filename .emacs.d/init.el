;; ロードパスの追加
(setq load-path (append
		 '("~/.emacs.d/packages")
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


;; Javascript
(setq js-indent-level 2)
