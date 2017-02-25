
(ps "not (A and B)")
(math "(A $cup B) - A $cap B")
(py "
def f(A, B):
 return [x for x in A if x in B]
print(f([1,2,3,4,5], [1,3,5,7,9]))
")
(py "f=lambda a,b: (set(a)|set(b)) -(set(a)&set(b)); P(f([1,2,3,4,5], [1,3,5,7,9]))")

(ps "not (A or B)")
(math "ALL - A $cup B")
(py "
def f(A, B):
 return [x for x in A if x in B]
print(f([1,2,3,4,5], [1,3,5,7,9]))
")
