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
