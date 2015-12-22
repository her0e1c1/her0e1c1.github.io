例えば次の関数は慣習に従っている::

    (defun ok (x)
      (nconc (list 'a x) (list 'c)))

これは慣習に従わないnconcを呼んでいるが， nconcが切り張りするリストは新しく作られたもので
okに引数として渡されるリストとは違う． だからokそのものに問題はない． 

しかしこれが僅かに違って ::

    (defun not-ok (x)
      (nconc (list 'a) x (list 'c)))

と書かれていたら， nconcの呼び出しはnot-okに渡された引数に変更を加えるだろう．

関数は安全に書き換えられないものを返してはいけないということだ ::

    (defun exclaim (expression)
      (append expression '(oh my)))

呼び出し後に返り値に破壊的な操作をすると ::

    > (exclaim '(lions and tigers and bears))
    (LIONS AND TIGERS AND BEARS OH MY)
    > (nconc * '(goodness))
    (LIONS AND TIGERS AND BEARS OH MY GOODNESS)

.. note:: *は直前の戻り値を保有している

関数内のリストに変更を及ぼすことになりうる::

    > (exclaim '(fixnums and bignums and floats))
    (FIXNUMS AND BIGNUMS AND FLOATS OH MY GOODNESS)

.. note:: exclaimは '(oh my) を追加するだけなのに ``goodness`` も付随してしまった.

exclaimをそういった問題に対して堅固なものにするには，こう書くべきだ ::

    (defun exclaim (expression)
      (append expression (list 'oh 'my)))
