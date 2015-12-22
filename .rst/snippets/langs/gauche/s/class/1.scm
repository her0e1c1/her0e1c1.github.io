
(define-class <human> ()
  ((name :accessor get-name :init-value "" :init-keyword :init-name)))

; 属性を定義して、初期値を設定
(define Bob (make <human> :init-name "Bob"))

; 属性の参照
(print (get-name Bob))
(print (slot-ref Bob 'name))

; 属性の書き換え
(set! (get-name Bob) "rename Bob")
(print (get-name Bob))
(slot-set! Bob 'name "new Bob")
(print (get-name Bob))

; メソッド定義
(define-method say ((human <human>) msg)
  (print (format "~A says ~A" (get-name human) msg)))

(say Bob "hi")




(define-class <human> ()
  ((name :accessor get-name :init-value "" :init-keyword :init-name)))

(define Bob (make <human> :init-name "Bob"))
(test* "get-name by accessor" "Bob" (get-name Bob))

; defineで同名のアクセッサを定義すると、アクセッサが無効になる
(define (get-name human) "HOGE")
(test* "get-name by define" "HOGE" (get-name Bob))
