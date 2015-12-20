;; stream-consは第２引数を直前まで評価しない特殊形式

(define-syntax -stream-cons
  (syntax-rules ()
    ((_ a b) (cons a (delay b)))))


リストの内側から評価すると、不要な計算が発生します。 ::

 (car (cdr (filter prime?
                  (enumerate-interval 10000 1000000))))

10000から1000000の数のうち素数になる要素を持つリストの２番目を返すという計算をしています。
リストの内側から評価すると(10000, 100001,,,1000000)のリストを作成しますが、明らかに無駄です。

そこで以下の関数を用いて、遅延評価を行います。

* delay
* promise
* force

遅延用の関数を作成します。::

 (define (cons-stream a b)
  (cons a (delay b)))

 ;単純に名前が長くなっただけです。
 (define the-empty-stream null)
 (define (stream-car stream) (car stream))
 (define (stream-cdr stream) (force (cdr stream)))

遅延評価をするリストを用いて、stream-filterを定義します。 ::
 
 (define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (stream-filter pred
                                     (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))

通常のfilterのcons,car,cdrの部分を置き換えたものになります。

(delay x)は ::

 (lambda () x)

の糖衣構文です。

肝心なことは、クロージャによって内側が評価されないことです。
つまり、関数が呼ばれて初めてxを評価します。

また(force x)は ::

 (define (force x)
  (x))

と定義出来ます。

ただし、毎回delayをすると実行速度が遅くなるので ::

 (define (memo-proc proc)
  (let ((already-run? false) (result false))
    (lambda ()
      (if (not already-run?)
          (begin (set! result (proc))
                 (set! already-run? true)
                 result)
          result))))

 (define (delay x)
   (memo-proc (lambda () x)))
