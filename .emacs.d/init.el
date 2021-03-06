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

;; 1行ずつスクロールさせる
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)

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
(package-install 'company-irony)
(package-install 'helm-gtags)
(package-install 'markdown-mode)
(package-install 'geiser)
(package-install 'flycheck)
(package-install 'srefactor)
(package-install 'function-args)
(package-install 'yasnippet)
(package-install 'irony)

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
(when (locate-library "company")
  (global-company-mode 1)
  (global-set-key (kbd "C-M-i") 'company-complete)
  ;; (setq company-idle-delay nil) ; 自動補完をしない
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "<tab>") 'company-complete-selection))

;; company-tern
(add-hook 'js2-mode-hook 'tern-mode)
(add-to-list 'company-backends 'company-tern)

;; helm-gtags
(add-hook 'js2-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-common-hook 'helm-gtags-mode)
(setq helm-gtags-auto-update t)
;; key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
             (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))



;; cc-mode common setting
(setq-default c-basic-offset 4)
(add-hook 'c-mode-common-hook 'flycheck-mode)

;; c-mode
(add-hook 'c-mode-hook
          '(lambda ()
             (c-set-style "linux")
             (setq tab-width 4)
             (setq c-basic-offset 4)))

;; c++-mode
(add-hook 'c++-mode-hook
          '(lambda ()
             (c-set-style "ellemtel")
             (c-set-offset 'innamespace 0)))

;(setq geiser-racket-binary "/Applications/Racket v6.6/bin/racket")
;(setq geiser-active-implementations '(racket))
;(setq geiser-repl-read-only-prompt-p nil) ;; Racket REPL上で(read)の入力を取る際に必要

;; srefactor
(require 'srefactor)
(require 'srefactor-lisp)

(semantic-mode 1)

(define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
(global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
(global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
(global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)

;; function-args
(fa-config-default)

;; yasnippet
(with-eval-after-load "yasnippet"
  (define-key yas-keymap (kbd "<tab>") nil)
  (yas-global-mode 1))

;; irony
(with-eval-after-load "irony"
  (custom-set-variables '(irony-additional-clang-options '("-std=c++11")))
  (add-to-list 'company-backends 'company-irony)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'c-mode-common-hook 'irony-mode))

