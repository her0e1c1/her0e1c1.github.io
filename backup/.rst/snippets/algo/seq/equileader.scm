
(math "
${a_n$} $mbox{の半分超過の要素x} S.T.
2集合 ${a_1, a_2 ... a_i$}, ${a_{i+1}, a_{i+2} ... a_n $} $mbox{が、それぞれxが超過要素となる場合の数}")

(math "
f(i, n, s) &=& f(i+1, N, S)
where
num &=& ${a_n$}におけるxの要素数
N   &=& n + 1 (IF a_i = x)
S   &=& s + 1 (IF 2n $gl i + 1 and 2(num - n) $gl length(a_n) - (i + 1))
")

(py #!Q
def f(A, x):
 num = len([a for a in A if a == x])
 # nは、i番目までにおけるxの要素数
 s = n = 0
 for i in range(len(A)):
  if A[i] == x:
   n += 1
  # 区間[0, i]にて、    xが半分超過すること
  # 区間[i+1, n-1]にて、xが半分超過すること
  if 2 * n > i + 1 and 2 * (num - n) > len(A) - (i + 1):
   s += 1
 return s
print(f([4, 3, 4, 4, 4, 2], 4))  # ([4], [3,4,4,4,2]), ([4,3,4], [4,4,2])
print(f([2, 4, 4, 4, 4, 4], 4))
Q:str #t)
