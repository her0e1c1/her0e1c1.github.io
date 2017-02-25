
(ps "左基本変形(連立方程式を解く場合の手法)")
(p "
- 行と行を入れ替える
- 行に0でない定数をかける
- 別の行の程数倍を加える
")
(p "基本行列を左側から掛けることを左基本変形と呼ぶ.")

(pw "行列式は行と行の入れ替えに、符号を反転させる必要があるので、行列式の計算とは若干異なる")

(p "基本行列P,Q,Rは正則行列. また逆行列も基本行列")

(ps "斎次方程式")

(p "Aが正則ならば、Ax = 0の解は、自明でない解のみ")
(math "
正則なのでA^{-1}が存在し、x=0が解となる。
また、x $ne 0の場合、A = 0が成立するが、Aが正則であることに矛盾。
よって、x ne 0において、Ax = 0が成立することはない。
以上より、自明でない解のみをもつことが言える。
")