

;; (define (fact n)
;;   (if (= n 1)
;;       1
;;       (* n #?=(fact (- n 1)))))

;; (fact 5)

;; ; 手続きとは違い、関数型は、以下のようにデバッグするとよさそう
;; ; デバッガでステップ実行するよりも、 関数単位で入力と出力を見てデバッグ
;; ; print式を好きな場所に埋め込む

;; (define (sum n)
;;   (print "n => " n)
;;   (if (= n 1)
;;       1
;;       (+ n (sum (- n 1)))))

;; (sum 10)

;; ; print文を関数の引数の直後に設定
;; (define (flt ls tree)
;;   (print ls ", " tree)
;;   (if (pair? ls)
;;       (foldr flt tree ls)
;;       (cons ls tree)))
