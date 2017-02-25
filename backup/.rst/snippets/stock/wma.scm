
(ps "加重移動平均(Weighted Moving Average)")

(pw "n日より前の値を考慮しない. 
ある急激に値下がりした場合の値を区間外になると、
突然考慮しなくなる")

(math "
$mbox{WMAをk日目のn日加重平均とおく}
WMA_{nk} &=& $sum_{i=k-n+1}^k (n-k+i) x_i

なお、以下の関係式を考慮
(k-n+1) -> 1
i       -> i - k + n
k       -> n
")
