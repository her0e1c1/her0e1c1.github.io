
(ps "RSI")

(p "30%以下で売られ過ぎ、70以上で買われ過ぎを表す.
つまり、70%以上の株は、今後下がる可能性が高い.
比較的うまく機能するのは保ちあい、あるいは穏やかなトレンド相場.
")

(p "ダイバージェンス(逆行)法則
RSIが下降しているにも関わらず、株価が上昇する現象.
")

(p "
(特定区間における増加の総和) / (同区間での増減の絶対値の総和) * 100
基本的に14日を区間とする. 区間内において、全て増加した場合100%.
逆に、全て減少した場合0%になる.
")

(pw "
14日の場合、差分を取るので15日のデータが必要になる.
区間において、増減がない場合は、分母の総和が0となる.
")

(math "
f(n) = p(n) - p(n-1)
f(0) = p(0) - NaN = 0
g(n) = $begin{cases} f(n) ($ge 0)
0 (else)
$end{cases}
RSI(n) = $frac{ $sum_{i=n-k}^n g(i)} { $sum_{i=n-k}^n |f(i)|}
")

(p "RSを定義して式変形可能")

(math "
$frac{A}{A+B} &=& $frac{A+B-B}{A+B}
              &=& 1 - $frac{B}{A+B}
              &=& 1 - $frac{1}{$frac{A}{B}+1}
              &=& 1 - $frac{1}{rs+1} & (rs = $frac{A}{B})
")
