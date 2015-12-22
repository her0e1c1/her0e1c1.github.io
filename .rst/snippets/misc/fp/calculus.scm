
チャーチ数
----------

数字をラムダで表現する。

チャーチ数というのがあって数字は関数で以下のように定義されています。 ::

 0=λf.λx.x
 1=λf.λx.f(x)
 2=λf.λx.f(f(x))

このままだと分かりにくくて Scheme で書くと以下のようになっています。0 を引数として、引数に1を加算する関数(lambda(x)(+ x 1))を何回適用するかによって数が決まります。 ::

 (define zero (lambda(f) (lambda(x) x)))
 (define one  (lambda(f) (lambda(x) (f x))))
 (define two  (lambda(f) (lambda(x) (f (f x)))))

 ((zero (lambda(x)(+ x 1))) 0)　 ;=> 0
 ((one  (lambda(x)(+ x 1))) 0)　 ;=> 1
 ((two  (lambda(x)(+ x 1))) 0)　 ;=> 2

チャーチ数から整数への変換する関数を作ります。

関数 toInt は数字を表現する関数を受け取り、0 を引数として1を加算する関数を渡します。

数字を表現する関数がその数字の回数だけ1を加算します。 ::

 (define toInt (lambda(n) ((n (lambda(x)(+ x 1)))0)))

 (toInt zero)     ;=> 0
 (toInt one)      ;=> 1
 (toInt two)      ;=> 2


; 0 := λ f x . x
; 1 := λ f x . f x
; 2 := λ f x . f f x

(define zero (lambda (f) (lambda (x) x)))
(define one  (lambda (f) (lambda (x) (f x))))
(define two  (lambda (f) (lambda (x) (f (f x)))))

((two (lambda(x)(+ x 1))) 0)  ; 2
