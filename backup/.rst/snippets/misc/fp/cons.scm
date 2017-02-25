
(py #!Q
def car(l):
    return l[0]
def cdr(l):
    return l[0:]
def cons(a, b):
    return [a] + b
l = cons(1,cons(2,cons(3,[4])))
print(l)
print(car(cdr(cdr(l))))
Q :str #t)
