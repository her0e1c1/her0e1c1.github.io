
(ps "移動平均線の関係式")

(pw "n日より前の値を考慮しない. 新旧の価格に優劣をつけていない.")

(math "
$mbox{_xをk日目のn日平均とおく}
$overline{x}_{nk} &=& $sum_{i=k-n+1}^k x_i
$overline{x}_{n(k+1)} &=& $sum_{i=(k+1)-n+1}^(k+1) x_i
 &=& $sum_{i=k-n+2}^(k+1) x_i
 &=& x_{k+1} - x_{k-n+1} + x_{k-n+1} + $sum_{i=k-n+2}^(k) x_i
 &=& x_{k+1} - x_{k-n+1} + $sum_{i=k-n+1}^(k) x_i
 &=& x_{k+1} - x_{k-n+1} + $overline{x}_{nk}
")

(p "上記の式変形により、k+1日が目k日目より大きくなるには、
(k-n+1)日目の価格よりも大きいことが必要")
