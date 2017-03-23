
def f(S, K, a):
    def g(s, k, a):
        if a[0] + s <= K:
            g()
