
(ps "Compute the square root")
(math "n $in N s.t. $max_{x} f(x) = x^2 - n $le 0")
(p "f(x) <= 0の場合に、+ 2^xを大きい方から累積する。単調増加関数である必要あり ")

(ghc "
h n = foldl g 0 (map (2^) [64,63..0]) where
 f x = x * x - n <= 0
 g acc a = let x = a + acc in if f x then x else acc
main = print $ h 15241578750190521
" :str #t)

(py "
def g(n):
    def f(x):
        return x * x - n <= 0
    lo = rv = 0
    hi = 2 ** 30
    while lo <= hi:
        mi = (lo + hi) / 2
        if f(mi):
            lo = mi + 1
            rv = mi
        else:
            hi = mi - 1
    return rv
print(g(15241578750190521))
" :str #t :msg "[0, 2^30]の範囲で探索")

(py "
def g(n):
    def f(x):
        return x * x - n
    lo = 0
    hi = 2 ** 30
    while lo <= hi:
        mi = (lo + hi) / 2
        rv = f(mi)
        if rv == 0:
            return mi
        elif rv < 0:
            lo = mi + 1
        else:
            hi = mi - 1
print(g(15241578750190521))
" :str #t :msg "目的の値を取得したところで探索終了")
