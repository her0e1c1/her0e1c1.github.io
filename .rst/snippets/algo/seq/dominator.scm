
(ps "ある数列における、半数超過を占める要素を求める")

(math "
f(i,stackSize,n) = $begin{cases} f(i+1,stackSize+1, n) & (a_i = n)
f(i+1,stackSize-1, n) & (a_i $ne n, stackSize > 0)
f(i+1, 1, a_i) & (else)
$end{cases}
")

(py #!Q
def f(a):
 def g(i, size, n):
  if i == len(a):
   return n
  elif a[i] == n:
   return g(i+1, size+1, n)
  elif size > 0:
   return g(i+1, size-1, n)
  else:
   assert size == 0
   return g(i+1, 1, a[i])
 d = g(0, 0, None)
 if 2 * len([x for x in a if x == d]) > len(a):
  return d
print(f([1,1,1,2,1,2,3]))
print(f([1,1,1,1,2,2,2]))
print(f([1,1,1,2,2,2]))
print(f([1,1,2,2,3]))
print(f([2,1,2,3,4,2,3,4,2,3,2,1,1]))
Q:str #t)
