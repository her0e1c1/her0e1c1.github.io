
(ps "In Python")
(py "ones=[1, lambda: ones]; P(ones[1]()[1]()[0])")

(py #!Q
def cons(a, b):
    return [a, lambda: b]
def car(l):
    return l[0]
def cdr(l):
    return l[1]()
l = cons(1,cons(2,cons(3,4)))
print(l)
print(car(cdr(cdr(l))))
Q :str #t :msg "stream_cons etc")
