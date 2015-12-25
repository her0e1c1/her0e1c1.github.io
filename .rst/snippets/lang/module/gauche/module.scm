;; 二つのモジュールAとBを作成し、グローバル変数'x'をその中で定義
; R7RSでは、フォームの直下にしかexport記述できない
(define-module A (define x 3)
  ;(export x)
 (export-all)
 )
(define-module B (define x 4) (define y 1))
(define-module C
    (import A B))

;;  #<symbol 'x'> ---[module A]--> #<binding that has 3>
(print (with-module A x)); ⇒ 3

;;  #<symbol 'x'> ---[module B]--> #<binding that has 4>
(print (with-module B x)); ⇒)


(print (with-module C x)) ; 3
; (print (with-module C y)) ; error

; 以下カレントモジュールA
(select-module A)
(print (* x 10))


; 継承可能(子供からは親をexportされていないものも参照可能)
(define-module b
  (extend B)
  (export x)
  (define x (+ y 20)))

(print (with-module b x))  ; 21
(print (current-module))  ; 静的に決定

; (print (module? A))  ; error


; glocにhogeが加わる (global location)
(define hoge 10)
(let1 table (module-table (find-module 'user))
        (describe (ref table 'hoge)))
; (hash-table-get (module-table (current-module)) 'import)

;; (describe 1)
;; 1 is an instance of class <integer>


(define-macro (import-only module . syms)
  `(begin
     ,@(map (lambda (sym) `(define ,sym (with-module ,module ,sym))) syms)))

(import-only gauche.internal extended-pair? extended-cons pair-attribute-get pair-attribute-set! pair-attributes)
