
(p "２つの素数の積の集合(同じ者を含む)")

(py "
def f(N):
 p = [True] * (N+1)
 p[0] = p[1] = False
 i = 2
 while i*i <= N:
  if p[i]:
   for j in range(i*i, N+1, i):
    p[j] = False
  i += 1
 s = [False] * (N+1)
 for i in range(N+1):
  if p[i]:
   j = i
   while j*i <= N:
    if p[j]:
     s[j*i] = True
    j += 1
 return [i for i in range(N+1) if s[i]]
print(f(4))
print(f(100))
" :str #t)
