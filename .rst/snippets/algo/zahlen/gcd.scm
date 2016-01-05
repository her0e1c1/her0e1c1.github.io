
; IMPLEMENT: GCD
; 最大公約数
; 1のときは互いに素
; 44 12 => 12 8 => 8 4 => 4 0 (ans = 4)

(define (gcd m n)
  (cond ((< m n) (gcd n m))
        ((= n 0) m)
        (else (gcd n (mod m n)))))

(define (main args)
  (print (gcd 24 16))  ; 8
  (print (gcd 18 15))  ; 3
  (print (gcd 18 35))  ; 1
  0)
