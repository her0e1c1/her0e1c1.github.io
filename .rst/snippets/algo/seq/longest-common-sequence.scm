
(p "２数列の最長共通部分数列")

(math "
f(x, y) = $begin{cases} 0 (x = 0 or y = 0)
f(x-1, y-1) (x = y)
max{f(x-1,y), f(x, y-1)}
$end{cases}
")

(p "１変数のみ動かし、他の変数を固定して考えるのだと思うけど、まだよくわかってない")
