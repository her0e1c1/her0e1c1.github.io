
(p "f = wrap(f)")

(ps "partial")

(py "
def partial(f, *a1, **k1):
 def wrap(*a2, **k2):
  k2.update(k1)
  return f(*(a1 + a2), **k2)
 return wrap
add = lambda x, y: x + y
add10 = partial(add, 10)
print(add10(20))
add10 = partial(add, x=10)
print(add10(y=20))
" :str #t)
