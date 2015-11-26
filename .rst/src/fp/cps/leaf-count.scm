; 継続は、関数の呼び出し元の状態をlambdaで作成しておく
; (count XXX)で呼び出し元に戻る

; 関数を呼んだら、呼び元には返ってこない(結果を橋渡ししていく処理はあり)
; やってほしいことを、次の関数以降に渡す

; labmdaの引数n, mは、leaf-count/cpsの結果が返ってきてる

; 値がまだ確定できないから、他の関数を呼んで、
; その結果を受け取って、処理を返すようにする
; その結果だけでは、確定できないときは別のを呼ぶ


(define (leaf-count/cps tree cont)
  (if (pair? tree)
      (leaf-count/cps (car tree)
                      (lambda (n)
                        (leaf-count/cps (cdr tree)
                                        (lambda (m) (cont (+ n m))))))
      (cont 1)))

(define tree '((a . b) (c . d) . e))
(print
 (leaf-count/cps tree values)  ; 5
 )
