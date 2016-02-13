
(ps "arithmetic mean")
(math "$overline{x} = $frac{$sum_{i=1}^{n} x_i}{n}")

(ps "geometric meahn")
(math "x_G = $sqrt{n}{x_1 x_2 ... x_n}")

(ps "harmonic mean")
(math "$frac{1}{x_H} = $frac{1}{n} $sum_{i=1}^n $frac{1}{x_i}")

(ps "variance")
(math "s^2 = $frac{1}{n} $sum_{i=1}^n (x_i - $overline{x})^2")
(math "
s^2 &=& $frac{1}{n} $sum_{i=1}^n (x_i - $overline{x})^2
    &=& $frac{1}{n} $sum_{i=1}^n (x_i^2 - 2 x_i $overline{x} + $overline{x}^2)
    &=& $frac{1}{n} $sum_{i=1}^n (x_i^2) - 2 $overline{x}^2 + $overline{x}^2
    &=& $frac{1}{n} $sum_{i=1}^n (x_i^2) - $overline{x}^2

(because $frac{1}{n} $sum_i x_i = $overline{x}, $sum_i $overline{x}^2 = n $overline{x}^2)
")

(ps "median")
(ps "percentile")
(ps "mode")

(ps "Cross Validation")
(p "標本を集めるのが困難な場合などは交差検定を行う.
これは 標本データの一部を解析して残る部分でテストを行う手法.")

(ps "")

(p"
Question
========
.. toctree::
   :glob:

   q/*

References
==========
- http://ruby.kyoto-wu.ac.jp/~konami/Text/Statistics.pdf
")
