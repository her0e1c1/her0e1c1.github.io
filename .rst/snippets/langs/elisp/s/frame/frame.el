
; X window 上での設定となります. CUIでは無効です.

  (setq initial-frame-alist
    (append
     '((top     . 0)   ; フレームの Y 位置(ピクセル数)
       (left    . 0)   ; フレームの X 位置(ピクセル数)
       (width   . 108) ; フレーム幅(文字数)
       (height  . 50)) ; フレーム高(文字数)
      initial-frame-alist))

  ;新規フレームのデフォルト設定
  (setq default-frame-alist
        (append
         '((top     . 0)   ; フレームの Y 位置(ピクセル数)
           (left    . 0)   ; フレームの X 位置(ピクセル数)
           (width   . 108) ; フレーム幅(文字数)
           (height  . 26)) ; フレーム高(文字数)
         default-frame-alist))

; initial-frame-alist
; default-frame-alist

フレームの状態得る関数には以下のものがあります。
しかし、値を書き換えることはできません。

(frame-height)  ; 56

frame-width
display-pixel-width
display-pixel-height

(setq initial-frame-alist '((top . 2) (left . 2))) 
(add-to-list 'initial-frame-alist (cons 'width tx)) 
(add-to-list 'initial-frame-alist (cons 'height ty))))


(add-to-list 'default-frame-alist '(alpha . (0.95 0.90)))