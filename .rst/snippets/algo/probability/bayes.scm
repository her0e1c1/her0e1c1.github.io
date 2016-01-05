(p #!DOC EOS
==============
 ベイズの定理
==============

簡易証明
========

AとBの事象があり、それぞれN回中にa,b回起こるものとする。
これにより、以下が成り立つ。

- :math:`P(A) = \frac{a}{N}`
- :math:`P(B) = \frac{b}{N}`
- :math:`P(A \cap B) = \frac{a \cap b}{N}`

なお `A and B` はAとBが同時に起こる場合の回数

ところで、Aが起きた時に、Bが起こる確率は、

.. math::

   P(B|A) = \frac{a \cap b}{a} = \frac{a \cap b}{N} \cdot \frac{N}{a}
   = \frac{P(A \cap B)}{P(A)}

となる。

P(A|B)についても同様のことが言える.

.. math::

   P(A|B) = \frac{P(A \cap B)}{P(B)}

P(A and B)を除去するよう式変形することで :math:`P(A|B)P(B) = P(B|A)P(A)`
   
すなわち :math:`P(B|A) = \frac{P(A|B)P(B)}{P(B)}` が成立する。

２事象のみの場合
================

`S = A + B` の２つの事象のみが独立かつ標本空間を占めているときを考える.
(つまりB=全体-Aということ)

このとき、ある事象Eが起こる確率P(E)とすると、
:math:`P(E) = P(A)P(E|A) \cdot P(B)P(E|B)` が成立するため、
:math:`P(E|A) = \frac{P(A|E)P(E)}{P(E)}` をP(E)を用いずに求めることができる
EOS
)
