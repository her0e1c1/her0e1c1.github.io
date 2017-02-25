
(math "A $cup B")

(py "
def f(A, B):
 return set(A + B)
print(f([1,2,3,4,5], [1,3,5,7,9]))
" :str #t)

(py "
def f(A, B):
 return set(A).union(B)
print(f([1,2,3,4,5], [1,3,5,7,9]))
" :str #t)
