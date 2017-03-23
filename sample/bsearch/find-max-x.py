# x^2 <= 101 を満たす最大のxは?

# x^2 <= nを満たすxを求める
# f(x) <= 0の場合に、+ 2^xを大きい方から累積する。単調増加関数である必要あり

from functools import reduce


# reduceが使えるのは実数値(連続)の時のみ離散の場合は使えない
def g(N):
    def f(k):
        return k * k <= N
    bits = list(reversed([2 ** i for i in range(30)]))
    return reduce(lambda acc, x: acc + x if f(acc + x) else acc, bits, 0)

print(g(101))
