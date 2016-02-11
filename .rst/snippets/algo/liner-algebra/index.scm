
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
(p "全単射は、単射かつ全射")

(p "f(x) = ax + bは、全単射")
(p "f(x) = e^xは、単射")
(p "f(x) = x^2は、f(x)>=0において、全射")

(ps "行列の積")
(math "l $times m 行列Aと m $times n 行列Bの積は、 l $times n 行列AB")
(math "c_{ij} = $sum_{k=1}^m a_{ik} b_{kj}")
(math "(AB)C = A(BC)" :msg "結合法則")

(ps "転置行列")
(math "{}^t A = a_{ji}")
(math "{}^t (AB) = {}^t B {}^A")

(ps "エルミート行列")

(ps "正則行列")
(math "XA=AX=E" :msg "n次正方行列Aに対してXが存在すれば、Aは正方行列でXはAの逆行列")
(math "" :msg "逆行列は一意に決まる")
(math "(AB)^{-1} = B^{-1} A^{-1}")

(ps "置換")

(ps "ベクトル空間")
(math "$forall x, y $in V S.T. x + y $in V" :msg "+について可換群")
(math "$forall x $in V, $forall l $in K S.T. l x $in V" :msg "2種分配法則, 結合法則, 1の存在")

(ps "線形写像")
(p "V, V'をK上のベクトル空間とし、写像T:V->V'が以下を満たすときTを線形写像と呼ぶ")
(math "T(x+y) = T(x) + T(y)" :msg "x, y $in V")
(math "T(lx) = lT(x)" :msg "x $in V, l $in K")
(math "Tが全単射 $Leftrightarrow V $cong V'" :msg "VとV'は同型")

(ps "部分空間")
(math "W $subset V, $forall x,y $in W, $forall m,n $in K S.T. m x + n y $in W")

(ps "Ker, Im")
(p "線形写像T:V->V'")
(math "Ker(T) = ${x $in V $mid T(x) = 0 $}")
(math "Im(T) = ${T(x) $in V' $mid x $in V $}")

(ps "内積")
(p "VをR上のベクトル空間とし、Vの任意のベクトルa,bについて、実数(a,b)が定義されるとき、(,)をV上の内積という")
(math "(a,b) = (b,a)" :msg "対称性")
(math "(a_1+a_2,b) = (a_1,b)+(a_2,b)" :msg "線形性(和)")
(math "(la,b) = l(a,b)" :msg "線形性(定数倍)")
(math "(a,a) $ge 0 and (a,a)=0 $Rightarrow a=0" :msg "正値性")
