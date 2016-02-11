
(math "A $cup B = A $cup (B $setminus A)")

(py "
def f(A, B):
 return A + [b for b in B if b not in A]
print(f([1,2,3,4,5], [1,3,5,7,9]))
" :str #t :msg "Aの要素は全て使うので、共通部分を除いたB")

(py "
def f(A, B):
 C = []
 for x in A + B:
  if x not in C:
   C.append(x)
 return C
print(f([1,2,3,4,5], [1,3,5,7,9]))
" :str #t :msg "O(N^2)")

(py "P(set([1,2,3,4,5]) | set([1,3,5,7,9]))")
