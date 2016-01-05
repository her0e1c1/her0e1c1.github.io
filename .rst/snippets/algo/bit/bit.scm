
;; trailing zeros
;; --------------
;; 10進数の場合は、10^nの倍数だとイメージがつきやすい ::

;;    12345000

;; 同じように、2進数でも ::

;;    101010000

;; とすれば、2^4の倍数である

(p"
マイナスの表現
---------------

::

   NUM = a1b

とおく。
bは全て0とするので、1が一番最後の桁となる

2の補数表現を使うと ::

   -NUM = (a1b)~ + 1

とおける。

チルダ演算子は、それぞれのbitを反転させるだけなので ::

   -NUM = a~0b~ + 1

bは全て0なので反転させると全て1 ::

   -NUM = a~0(111...1) + 1 = a~1(000...0) = a~1b

よって ::

   -NUM = a~1b
")

(math "f(x) = $frac2x")
(py "f=lambda x:x<<1; P(f(10))")

(math "f(x) = $frac{1}{2}x")
(py "f=lambda x:x>>1; P(f(10))")

(math "f(x) = 2^x")
(py "f=lambda x:1<<x; P(f(10))")

(ps "check whether a number is even or odd")
(math "f(x) = $begin{cases} 1 (if x is odd)
0 (else) $end{cases}")
(py "f=lambda x: x & 1; P(f(11))")

(ps "Check power of 2")
(p "2の累乗数は、10...00で表せる。そこから1引いた数は11..11となる。そのため２つの&は常に0")
(py "f=lambda x: (x & (x-1)) == 0; P(f(16))")

;; .. QUESTION: (1 << i) - 1の値は?
;; すべてのbitが1になっている(1からi番目まで)

;; .. QUESTION: 1 << jのとき、右から何番目が1となっている？また値は？
;; j+1番目(1から数えた場合)
;; j 番目(0から数えた場合)

;; 2 ^ j

;; 1 << 0 == 0b1
;; 1 << 1 == 0b10
;; 1 << 2 == 0b100

;; .. QUESTION: ~0
;; -1

;; .. QUESTION: all, any, not all, not anyがTrueになる条件
;; all: 全てTrue
;; any: 少なくとも一つTrue
;; not all: 少なくとも一つFalse
;; not any: 全てFalse
