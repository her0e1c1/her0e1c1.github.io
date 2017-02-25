
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

(ps "memo")

(py "
def memo(f):
 cache = {}
 def wrap(*args):
  if args in cache:
   return cache[args]
  cache[args] = f(*args)
  return cache[args]
 return wrap
@memo
def fib(n):
 if n == 0 or n == 1:
  return n
 return fib(n-1) + fib(n-2)
print(fib(35))
" :str #t)
