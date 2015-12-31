; ; this temp buffer name is *temp*.
(emacs (current-buffer) :msg "in case of oneliner, buffer is *scratch*")
(emacs (buffer-name (current-buffer)))
(emacs (bufferp (current-buffer)))

(emacs (with-temp-buffer (insert "hoge") (buffer-string)))
(emacs (with-temp-buffer (insert "hoge") (erase-buffer) (buffer-string)))
(emacs (with-temp-buffer (insert "hoge") (buffer-size)))

(emacs (get-buffer "HOGE"))
(emacs (get-buffer "*scratch*"))
(emacs (buffer-list))

(get-buffer-process (current-buffer))
; (with-current-buffer (get-buffer-create "NEW"))

;;   (setq buff (pop-to-buffer "buffer name"))
;;   (set-buffer buff)

;; ; rename-buffer
;; ; buffer-file-name (func/var)
;; ; kill-buffer

;; (switch-to-buffer "*scratch*")


; scriptから実行するとnilになる
;; (print (buffer-file-name))
;; (f-this-file)  ; return this buffer' filepath

;; ; 上記の表現は以下の範囲指定と同じ
;; (buffer-substring (point-min) (point-max))
;; ; buffer内の文字列取得
;; (buffer-substring-no-properties (point-min) (point-max))


; (eval-buffer)
; warn: eval-bufferを評価するbufferdで
; 再度(eval-buffer)を呼び出すと無限ループになる

; (buffer-modified-p)
; 上記関数でtを返す場合であっても
; 強制的にnilにすることも可能
; (set-buffer-modified-p nil)
