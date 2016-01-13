(p #!DOC EOS
======
 fold
======

.. _impl_foldl:

fold*の計算結果
----------------
::

  > foldl (-) 10 [1,2,3]
  4
  > foldl1 (-) [1,2,3]
  -4
  > foldr (-) 10 [1,2,3]
  -8 # (1 - (2 - (3 - 10)))
  > foldr1 (-) [1,2,3]
  2  # (1 - (2 - 3))

foldlの実装
-----------
::

   foldl = lambda f, init, ls:  f(foldl(f, init, ls[1:]), ls[0]) if len(ls) > 1 else f(init, ls[0]);
   print(foldl(lambda x, y: x - y, 0, [1, 2, 3]))  # -6

foldlは左から優先して２項演算する. ::

   # foldl (+) 0 [1, 2, 3]  -- 6
   0 + 1 + 2 + 3
   (((0 + 1) + 2) + 3)

上記の計算の順番は::
  
   (((0 + 1) + 2) + 3)
   ((1 + 2) + 3)
   (3 + 3)
   6

となる。

このことからもわかるように、二項演算子の第一引数に今までの結果が格納されていることになる。

二項演算子を+で一般化すると ::

   # foldl (+) init ls
   a0 + a1 + a2 + ... + an
   (((a0 + a1) + a2) + ... + an)

となる。+でなくて


foldl1の実装
-----------
foldlの実装_ の初期値がなくなった場合のことで、以下と同じ ::

   # foldl1 (+) ls
   a1 + a2 + ... + an
   ((a1 + a2) + ... + an)

pythonの場合::

   # xに今までの計算結果が格納されてる
   reduce(lambda x, y:  x + y, [[1,2,3], [4,5], [6]])


foldrとfoldlの使い分け
----------------------
::

    > foldl (-) 20 [1,2,3,4,5]
    5

    > foldr (:) [] [1,2,3,4,5]
    [1,2,3,4,5]

2項演算は、+のように交換可能なものと交換不可能なものがある。
交換可能な演算子はfoldl/foldrのどちらでもかまわない。

一般的に、

- foldlを使う場合は、-のような左結合 ``((a - b) - c)``
- foldrを使う場合は、 consのような右結合 ``(a : (b : c))``

と、使い分ける

::

    ;; (define (foldl f init ls)
    ;;   (if (null? ls) init
    ;;       (f (foldl f (car ls) (cdr ls)) init)))


foldl1, foldr1に空リストは不可::

    > foldl1 (+) []
    *** Exception: Prelude.foldl1: empty list
EOS
)    
