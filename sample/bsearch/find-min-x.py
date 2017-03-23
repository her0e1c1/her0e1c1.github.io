# [0, 2^30)の範囲で探索
# (n + n+1) / 2 = n + (1/2) => nなので左側に


def g(n):
    def f(x):
        return x * x - n >= 0

    (lo, hi, rv) = (0, 2 ** 30, -1)
    while lo <= hi:
        mi = (lo + hi) // 2  # lo + (hi - lo) / 2
        # 条件を満たしたら最小値を更新
        if f(mi):
            hi = mi - 1
            rv = mi
        else:
            lo = mi + 1
    return rv

print(g(15241578750190521))  # 123456789
