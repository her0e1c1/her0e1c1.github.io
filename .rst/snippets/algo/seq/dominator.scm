
(ps "ある数列における、半数以上を占める要素を求める")

(math "
f(i,stack_size,n) = $begin{cases}
f(i+1,stack_size+1, n) & (a_i = n)
f(i+1,stack_size-1, n) & (a_i $ne n, stack_size > 0)
f(i+1, 1, a_i) & (else)
$end{cases}
")

(py #!Q
def f(a):
 def g(i, size, n):
  print(i, size, n)
  if i == len(a):
   return n
  elif a[i] == n:
   return g(i+1, size+1, n)
  elif size > 0:
   return g(i+1, size-1, n)
  else:
   return g(i+1, 1, a[i])
 return g(0, 1, a[0])
print(f([1,2,3,4,2,3,4,2,3,2]))

Q:str #t)
