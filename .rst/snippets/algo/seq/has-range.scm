
(p "数列a_nの要素が、少なくとも一つ[x, y]に含まれているか?")

(math "
$forall a_i $ge 0 $in ${a_n$} S.T.
S_i &=& a_1 + a_2 + ... + a_i
S_j &=& a_1 + a_2 + ... + a_i + ... + a_j
よって
S_j - S_i &=& a_{i+1} + ... + a_j
$mbox{0の場合は、以下成立}
S_j - S_i &=& 0 $Leftrightarrow a_{i+1} = ... = a_j = 0
つまり
$mbox{区間[i, j]において、要素が全て0の場合、S_j - S_{i-1}も0になる}
")

(p "[x,y]に要素が存在するかは、a_n全体を調べる必要はなく、
一度和を求めれば、S[y]-S[x-1]の計算だけ済むので、計算量がO(1)")

(py "
M = 100
def f(A, x, y):
 N = len(A)
 s = [0] * M
 for a in A:
  s[a] = 1
 for i in range(len(s)-1):
  s[i+1] += s[i]
 return s[y] != s[x-1]
A = [1,4,7]
print(f(A, 3, 5))
print(f(A, 2, 3))
print(f(A, 3, 3))
" :str #t)
