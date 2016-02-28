
(ps "一次結合(線形結合)")
(math "$sum k_i a_i" :msg "和を表現しているだけであって、一次独立とまでは言わない.")

(ps "一次独立")
(math "$sum k_i a_iが一次独立 $leftrightarrow $forall k_i $ne 0 S.T. $sum k_i a_i = 0")
(p "一次従属 $leftrightarrow ベクトルを別の基底の線形結合で表現可能")

(ps "基底")
(p "e_iがVの基底であるとは、 Vの任意のベクトルがe_iの一次結合として一意に表せる")
(p "Vがn個からなる基底をもつとき、nをVの次元と呼び、dim V = nと表す")
(p "基底の個数はdim V個だが、組みは、V上で任意にとることが可能")
(math "e_iがVの基底 $rightarrow e_i $in V")

(p "n個のベクトルa_iが一次独立 $leftrightarrow a_iは、n次元ベクトル空間Vの基底")
(math "n = dim V = dim Ker(T) + dim Im (T)")

(ps "階数")
(math "dim Ker(T) + rank A = n")
; m $times n行列Aに対し、T_A:K^n -> K^n
(math "線形写像T:V->V'に対し、rank T := dim (Im (T))")

(ps "部分空間")
(math "span(a_i) = <a_1, a_2, ..., a_n> := ${ $sum_i^n k_i a_i $mid k_i $in K $}")
(math "b $in span(a_i) $rightarrow $exists k_i $in K S.T. b = $sum k_i a_i" :msg "線形包の要素なら、ある一次結合で表現可能")
(math "V=span(a_i)のa_iが一次独立 $leftrightarrow a_iはVの基底")

(ps "直和")
(ps "表現行列")
(math "A' = Q^{-1}AP")

(p "線形写像T:V->V'において、V=V'の場合、Tを一次変換と呼ぶ")
