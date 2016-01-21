
(ps "0 or N開始")

(p "配列は0から開始するので、できるだけ0開始がよい。
f(n)=f(n+1) (配列と同じ、末尾再帰)
f(n)=f(n-1) (再帰したい場合、条件で分岐)
")

(ps "計算量")

(p "ルートNまでの総和はN")
(math "1 + 2 + ... $sqrt[]{N} = $frac{1 + $sqrt[]{N}}{2} = O(N)")
(py #!Q
def f(N):
 i = 1
 s = 0
 while i*i <= N:
  for j in range(i):
   s += j
 i += 1
 return s
Q:str #t)

(p "logNとなるのは、2で割る場合や余りの場合")
(py #!Q
def f(N):
 while N > 0:
  pass
  N /= 2
Q:str #t)

(py #!Q
def f(N):
 for i in range(N):
  if N % i == 0:
   pass
Q:str #t)

(ps "O(MN)")
(p "掛け算の場合はどちらが外側のループになるか、2通り考えられる")
