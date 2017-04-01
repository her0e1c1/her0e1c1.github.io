# coding: utf-8

# MEMO: :Q:fibを行列で表現
# a(n+2)=1*a(n+1)+1*a(n)
# a(n+1)=1*a(n+1)+0*a(n)
# A=[[1,1],[1,0]]の行列で、３項間を表せる
# また(現在)=定数(一つ前)のような等比数列の形をしているので
# [a(n+2), a(n+1)]=A[a(n+1), a(n+0)]=A^2[a(n+0), a(n-1)] = ... =A^(n+1)[a1, a0]
# 検算(n=-1の時, 左辺=右辺に成る必要があるのでA^0=Eになる必要がある)


def mul(A, B):
    l, m, n = len(A), len(B), len(B[0])
    C = [[0] * n for _ in range(l)]
    for i in range(l):
        for j in range(n):
            C[i][j] = sum(A[i][k] * B[k][j] for k in range(m))
    return C


# MEMO: :Q:行列計算でのfib
def fib(n):
    # mulは行列の積の計算. 繰り返し二乗法を用いてO(log n)
    def loop(n):
        if n == 0:
            return E
        elif n == 1:
            return A
        elif n % 2 == 0:
            a = loop(n / 2)
            return mul(a, a)
        else:
            a = loop((n - 1) / 2)
            return mul(A, mul(a, a))
    E = [[1, 0], [0, 1]]
    A = [[1, 1], [1, 0]]
    return mul(loop(n), [[1], [0]])[1][0]


def fib1(n):
    s0, s1 = 0, 1
    for _ in range(n):
        t = s0
        s0 = s1
        s1 = s1 + t
    return s0


print(fib(10 ** 6))  # ちょっと高速
# print(fib1(10 ** 6))
