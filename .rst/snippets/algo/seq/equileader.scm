
(math "
${a_n$} $mbox{の半分超過の要素x} S.T. 2集合 ${a_1, a_2 ... a_k$}, ${a_{k+1}, a_{k+2} ... a_n $}
$mbox{が、それぞれxが超過要素となる場合の数}")

(math "
f(i, n, s) = f(i+1, N, S)
where
num = $mbox{${a_n$}におけるxの要素数}
N = n + 1 (if a_i = x)
S = s + 1 (if 2n > i + 1, 2(num - n) > length(a_n) - (i + 1))
")

(py #!Q
def f(A, d):
 num = len([a for a in A if a == d])
 s = 0
 n = 0
 for i in range(len(A)):
  if A[i] == d:
   n += 1
  if 2 * n > i + 1 and 2 * (num - n) > len(A) - (i + 1):
   s += 1
 return s
print(f([4, 3, 4, 4, 4, 2], 4))
Q:str #t)
