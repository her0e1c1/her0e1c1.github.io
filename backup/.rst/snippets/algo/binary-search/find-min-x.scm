
(ps "Compute the square root")
(math "n $in N S.T. $min_{x} f(x) = x^2 - n $ge 0")
(p "min f(x) >= 0の場合は、foldを使えないが、whileによる解法あり.
foldが使えるのは、high側が常に失敗する場合のみ。今回はhigh側がTrueの場合")

(py "
def g(n):
    def f(x):
        return x * x - n >= 0
    lo = rv = 0
    hi = 2 ** 30
    while lo <= hi:
        mi = (lo + hi) / 2
        if f(mi):
            hi = mi - 1
            rv = mi
        else:
            lo = mi + 1
    return rv
print(g(15241578750190521))
" :str #t :msg "[0, 2^30]の範囲で探索")
