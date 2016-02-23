
(ps "Exponentially Weighted Moving Average")

(p "移動平均線とは違い、全ての区間の値を利用する.
EMAの値よりも価格が大きければ、EMA自体も必ず大きくなる")

(math "
$mbox{平滑化係数} a = $frac{2}{N+1} ($mbox{Nは時系列区間})
EWMA_{i+1} &=& (1 - a) EWMA_i + a price_i
 &=& EWMA_i + a (price_i - EWMA_i)
")
