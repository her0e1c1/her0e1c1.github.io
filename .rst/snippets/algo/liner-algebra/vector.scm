
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
