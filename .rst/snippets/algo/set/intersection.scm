
(math "A $cap B")

(py "
# set(A) & set(B)
def f(A, B):
 return [x for x in A if x in B]
print(f([1,2,3,4,5], [1,3,5,7,9]))
" :str #t)

