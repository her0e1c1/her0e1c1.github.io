;; # car/cdrを実行できるのはリストのみ. つまりatomとnullは引数に指定してはいけない
;; gosh -e "(car '())  ; error" -E exit
;; gosh -e "(car 1)    ; error" -E exit
;; gosh -e "(cdr '())  ; error" -E exit
;; gosh -e "(cdr 1)    ; error" -E exit

;; # cdrの戻り値はatomでない(list or null)
;; gosh -e "(print (cdr '(1 2))) ; (2)" -E exit
;; # ただしdot listの場合はcdrの戻り値atom
;; gosh -e "(print (cdr '((1 2) . (3 4)))) ; (3 4)" -E exit


;; # 最後の要素の前にしかドットはつきません
;; gosh -e "(print '(1 2 3 . 4))      ; ok" -E exit
;; gosh -e "(print '(1 2 . 3 4))      ; no" -E exit
;; gosh -e "(print '(1 (2 . 3) 4))    ; ok" -E exit
;; gosh -e "(print '(1 2 . 3 . 4))    ; no" -E exit
;; gosh -e "(print '(1 (2 . 3) . 4))  ; ok" -E exit
;; gosh -e "(print '(1 . 2 3 4))      ; no" -E exit
;; gosh -e "(print '(1.  2 3 4))      ; ok (1.0の代わり)" -E exit 


;; # ,@の内側のリストは評価される
;; # `x => 'x; `,x => x; `(,@x y) => (append x y)
;; # `(x ,@y z) => (append x y z) ???
;; gosh -e '(print `(,@(list 1 2 3 4)))  ; (1 2 3 4)' -E exit
;; gosh -e "(print \`(,@'(1 2 3 4)))  ; (1 2 3 4)" -E exit
;; gosh -e "(print \`(1 2 3 4))  ; (1 2 3 4)" -E exit
;; gosh -e "\`(1 ,@(2 3) 4)       ; error! 2が関数でないから" -E exit
;; gosh -e "\`(,@(1 2 3))         ; no" -E exit
;; gosh -e "(print \`(1 ,@(list 2 3) 4))  ; (1 2 3 4)" -E exit

;; gosh -e "(print \`(1 ,@'() 3)) ;(1 3)" -E exit
;; gosh -e "(print \`(1 ,@() 3))  ;(1 3)" -E exit

;; # バッククオートと組み合わせて使うので, ``,@`` 単体では使えない
;; gosh -e "(print ,@(1 2 3))        ; no" -E exit
;; gosh -e "(print (list ,@(1 2 3))) ; no" -E exit
