
(p "範囲[x, y]にtrueの要素がいくつあるか?")

(p "xからyまでを探索するとO(n)になる.
計算量をO(1)になるよう、予めprefix sumを求めておき
S[y]-S[x-1]でO(1)に計算量を減らす")

(py "
def f(A, x, y):
 assert x <= y
 N = len(A)
 s = [0] * N
 s[0] = A[0]
 for i in range(1, N):
  s[i] = s[i-1] + A[i]
 return s[y] if x == 0 else s[y] - s[x-1]
# 2 3 5 7 11 13
A = [0,0,1,1,0,1,0,1,0,0,0,1,0,1,0,0]
print(f(A, 0, 15))
print(f(A, 3, 10))
print(f(A, 5, 11))
" :str #t)
