
(p (sphinx-contents))

(ps "群")
(p "群とは、以下の3つ満たす演算Xを定めることができる集合G")
(math "(a X b) X c = a X (b X c)" :msg "結合法則")
(math "a X e = e X a = a" :msg "単位元の存在")
(math "a X x = x X a = e" :msg "逆元xの存在")

(ps "可換群(アーベル群)")
(math "a X b = b X a" :msg "群の性質に加えて可換も成立")

(ps "写像")
(math "f : A $rightarrow B, a $in A, f(a) $in B" :msg "集合AからBへの写像f")
(math "a $ne b $Rightarrow f(a) $ne f(b)" :msg "fが単射")
(math "$forall b $in B, $exists a $in A S.T. f(a) = b" :msg "fが全射")
(math "全単射 $Leftrightarrow 逆写像f^{-1}が存在")
(math "全単射 $Leftrightarrow 単射かつ全射")

(p "関数は入力1つに対して出力1つだけ.つまり、減ることはあっても増えることは絶対ない.")
(math "| ${ f(a) $} | $le | A |" :msg "等号が成立するのは、fが単射の場合のみ.そうでない場合、f(a)と同じ値をとるf(b)が存在する")
(math "| ${ f(a) $} | $ge 1" :msg "等号が成立するのは、全て同じ値へ変換される場合.")

(p "f(x) = ax + bは、全単射")
(p "f(x) = e^xは、単射")
(p "f(x) = x^2は、f(x)>=0において、全射")

(ps "行列の積")
(math "l $times m 行列Aと m $times n 行列Bの積は、 l $times n 行列AB")
(math "c_{ij} = $sum_{k=1}^m a_{ik} b_{kj}")
(math "(AB)C = A(BC)" :msg "結合法則")

(ps "転置行列")
(math "{}^t A = a_{ji} = tr A")
(math "{}^t (AB) = {}^t B {}^A")

(ps "エルミート行列")

(ps "正則行列")
(pw "行列式は、正方行列でしか定義されていないm * n行列に対しては未定義")
(math "XA=AX=E" :msg "n次正方行列Aに対してXが存在すれば、Aは正方行列でXはAの逆行列")
(math "Aが正則 $Leftrightarrow |A| $ne 0")
(math "Aが正則 $Leftrightarrow 逆行列A^{-1}が存在")
(math "Aが正則 $Leftrightarrow rank A = n")
(math "Aが正則 $Leftrightarrow 斎次方程式Ax=0は自明の解のみ")
(math "Aが正則 $Leftrightarrow 線形写像T_A(x)=Axは全単射")
(math "Aが正則 $Leftrightarrow $sum_i^n x_i a_iが一次独立")

(math "" :msg "逆行列は一意に決まる")
(math "(AB)^{-1} = B^{-1} A^{-1}")

(ps "置換")
(math "$mbox{{1..n}から{1..n}への全単射の集合をS_nとし、その要素を置換と呼ぶ }")

(ps "互換")
(math "$mbox{ {1..n}のうち2のみを動かし残りはそのままな置換を互換と呼ぶ}")

(ps "sgn")
(p "+1 or -1")
(math "sgn($sigma) = $prod_{i,j} $frac{$sigma(i) - $sigma(j)}{i-j}" :msg "分母は正にできるので、s(i)>s(j)の転倒数が偶数なら1")
(math "sgn(e) = 1")
(math "sgn(互換) = -1")

(ps "行列式")
(math "|A| = det A = $sum_{s $in S_n} sgn(s) a_{1s(1)} a_{2s(2)} ... a_{ns(n)}")
(p "0を含む列 or 行が存在するならば|A|=0")
(math "a_{11}a_{22} - a_{12}a_{21}" :msg "n=2")

(math "|{}_t A| = |A|")
(math "det (a_1, ..., a_i, ..., a_j, ... a_n) = det (a_1, ... a_i + k a_j, ..., a_j, ... a_n)"
      :msg "多重線形性+交代性(ある列に他の列の定数倍を加えてもよい)")
(math "det AB = det A det B")

(ps "第1列に関する|A|の余因子展開")
(math "det A = $sum_{i=1}^n (-1)^{i-1} a_{i1} |i行目以外| = $sum_{i=1} a_{i1} $tilde{a_{i1}}")
(math "$tilde{a_{ij}} = (-1)^{i+j} $Delta_{ij}" :msg "行列Aからi行j列を除いた行列を第(i,j)小行列D_{ij}と表す.(i,j)余因子")

(ps "逆行列")
(math "A^{-1} = $frac{$tilde{A}}{|A|}")

(ps "対象行列(symmetric matrix)")
(math "
A = {}_^t A
a_{ij} = a_{ji}
")

(ps "交代行列(skew symmetric matrix)")
(math "
A = - {}_^t A
a_{ij} = - a_{ji}
")

(ps "余因子行列")
(math "$overline{A} = $overline{a_{ji}}")

(ps "エルミート行列")
(math "A = {}^t $overline {A}" :msg "共役複素数")

(ps "歪エルミート行列")
(math "A = - {}^t $overline {A}")

(ps "rank")
(p "rank自体は、 m*nの行列に対して定義される.")
(math "0 <= rank A <= min {m, n}" :msg "一方を超えることは、ありえない.")
(math "0 <= rank A <= n" :msg "とくに行列Aがn次正方行列の場合")
(math "Aが正則 $rightarrow rank A = n $rightarrow m = n")
