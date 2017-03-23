# 15241578750190521の平方根を求めよ（なければNone)

# x^2 == nを満たすxを求める


def g(n):
    def f(x):
        return x * x - n
    lo = 0
    hi = 2 ** 30
    while lo <= hi:
        mi = (lo + hi) // 2
        rv = f(mi)
        # 目的の値を取得したところで探索終了
        if rv == 0:
            return mi
        elif rv < 0:
            lo = mi + 1
        else:
            hi = mi - 1

print(g(15241578750190521))  # 123456789
print(g(15241578750190520))  # None
