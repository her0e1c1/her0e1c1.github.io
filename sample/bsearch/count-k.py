# [1, 1, 1, 2, 2, 3, 4, 4, 4, 5, 6, 6]にある4の個数

# 長さlのソート配列(alist)に含まれるNの個数
# upper_bound/lower_boundは、有限な配列に対してのみ有効
# upper_bound(a, a + n, k) - lower_bound(a, a + n, k);

from functools import reduce


# Nの範囲を考えると左側から探索する場合は x < N と x <= Nで分けて考える
def f(N, alist):
    l = len(alist)
    bits = list(reversed([2 ** i for i in range(30)]))

    def g(acc, x):
        a = acc + x
        return a if a < l and alist[a] < N else acc

    def h(acc, x):
        a = acc + x
        return a if a < l and alist[a] <= N else acc

    return reduce(h, bits, 0) - reduce(g, bits, 0)


# 0の区別ができないので-1のダミーが必要
for i in range(1, 6 + 1):
    print(f(i, [-1, 1, 1, 1, 2, 2, 3, 4, 4, 4, 5, 6, 6]))


# def upper_bound(n, alist):
#     def f(x):
#         return alist[x] < n
#     lv, hv = g(f, alist)
#     return hv, lv


# def lower_bound(n, alist):
#     def f(x):
#         return alist[x] <= n
#     lv, hv = g(f, alist)
#     return hv, lv


# # n < alist[x]

# def g(f, alist):
#     lo, hi = 0, len(alist) - 1
#     lv = hv = None
#     while lo <= hi:
#         mi = (lo + hi) // 2
#         if f(mi):
#             hi = mi - 1
#             hv = mi
#         else:
#             lo = mi + 1
#             lv = mi
#     return lv, hv
