
(ps "線形回帰")
(p "モデルy = ax + bとし、xからyを予測する. (x_i, y_i)は観測データ")

(math "
$hat{y_i} = a x_i + b
F(a,b) = $sum_i (y_i - $hat{y_i})^2 = $sum_i (y_i - a x_i - b)^2
min F(a, b)を求める
")
