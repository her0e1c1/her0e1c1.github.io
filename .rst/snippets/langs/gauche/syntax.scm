
; <>でアクセス
(case 5
  ((2 4 6 8) => (cut + <> 1))
  (else => (cut - <> 1)))  ; 5

(case 4
  ((2 4 6 8) => (cut + <> 1)) 
  (else => (cut - <> 1)))  ; 5

; cutとlambda
(map (cut + <> 10) (iota 5))
; (10 11 12 13 14)
; <>は複数使える
(map (cut + <> <>) (iota 5) (iota 5))

(match 1 (1 2))  ; 2
(match 10 (1 2) (else 0))  ; 0


; cond-listは、tのものを全て結果として取得
; => はobjに対して適用する
(let ((alist '((x 3) (y -1) (z 6))))
  (cond-list ((assoc 'x alist) 'have-x)
             ((assoc 'w alist) 'have-w)
             ((assoc 'z alist) => cadr)))


(begin (define (f a :optional (b 2)) (+ a b)) (f 1))  ; 3


; (= a 10)が終了条件
; (do ([a 1 (+ a 1)]) ((= a 10) (quote ok)) (print a))




(let-args (list "-a" "2") ([a "a=i"] [b "b=i" 10]) (+ a b))  ; 12
(let-args (list "-a") ([ok "a"]) ok)  ; #t
(let-args (list "--test" "1" "2") ([else (a . b) a]))  ; test
(let-args (list "--test" "1" "2") ([else (a . b) b]))  ; ((1 2) #<closure (parse-cmdargs loop)>)
(let-args (list "a" "b" "c") ([else ()] . args) args)  ; ("a" "b" "c")

(begin (define a (make-parameter 1)) (parameterize ([a 10]) (a)))  ; 10
; (parameterize)の外では、あたいは元に戻る
(begin (define a (make-parameter 1)) (parameterize ([a 10]) (a)) (a))  ; 1
; グローバル変数aのように扱える
(begin (define a (make-parameter 1)) (define (call) (a)) (parameterize ([a 10]) (call)))  ; 10



; ^[]で引数指定
(map (^[x y] (+ x (+ y 1))) (iota 5) (iota 5))


(if-let1 it (+ 1 2 3) (* it 10) 1)  ; 60
