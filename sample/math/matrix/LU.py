# coding: utf-8
import numpy as np
import scipy.linalg as linalg


# MEMO:
def transpose(A):
    m, n = len(A), len(A[0])
    B = [[None] * m for _ in range(n)]
    for i in range(m):
        for j in range(n):
            B[j][i] = A[i][j]
    return B


# 左下三角行列
# l[i,j] =
# 0 (i<j)
# 1 (i=j)
# l[i,j] (else)

# 右上三角行列
# r[i,j] =
# 0 (i>j)
# r[i,j] (else)

# lrの積は、どちらか一方が0になるところ以降、すべて0の項になる.

# ab[i,j] = sum a[i,k]b[k,j]

# MEMO: :Q:r[i,j]を求める式
# i<=j の時
# lr[i,j] = sum l[i,k]r[k,j] = l[i,1]r[1,j] + ... + l[i,i-1]r[i-1,j] + l[i,i]r[i,j]
# l[i,i] = 1より
# r[i,j] = lr[i,j] - sum(1<=k<=i-1) l[i,k]r[k,j] (i>=2)
# r[1,j] = lr[i,j] (i=1)  # 一番上の行は何もしない

# MEMO: :Q:l[i,j]を求める式
# j<i の時
# lr[i,j] = sum l[i,k]r[k,j] = l[i,1]r[1,j] + ... + l[i,j-1]r[j-1,j] + l[i,j]r[j,j]
# l[i,j] = {lr[i,j] - sum(1<=k<=j-1) l[i,k]r[k,j]} / r[j,j] (j>=2)
# l[i,1] = lr[i,1] / r[1,1] (j=1)  # i>=2以上についてr[1,1]で割る
# なお、 sum(1<=k<=0)=0とすれば、一つの式で表せる

# MEMO: :Q:decomposeWithoutPivot
def decompose(A):
    m, n = len(A), len(A[0])
    for k in range(max(m, n)):
        for i in range(k + 1, m):
            A[i][k] /= float(A[k][k])
        for i in range(k + 1, m):
            for j in range(k + 1, n):
                A[i][j] -= float(A[i][k] * A[k][j])
    return A
# kを固定して[i,j]を動かす
# kまで求めたら、A[k,k]でそれより下の要素を割る


def test_decompose():
    A = [[2, 6, 4], [5, 7, 9]]
    LU = decompose(A)
    print(LU)  # [[2, 6, 4], [2.5, -8.0, -1.0]]

    # A=PLUに分解
    PLU = linalg.lu(A)
    print(PLU)


# MEMO: :Q:Lx=yを求める式
# y[i] = sum A[i,k] x[k] = A[i,1] x[1] + ... + A[i,i-1] x[i-1] + 1 * x[i] + 0 ...
# x[i] = y[i] - sum (1<=k<=i-1) A[i,k] x[k]

# MEMO: :Q:Rx=zを求める式
# z[i] = sum A[i,k] x[k] = A[i,i] x[i] + ... + A[i,n] x[n]  # i-1以下は0
# z[i] = sum (n>=k>=i) A[i,k] x[k]
# A[i,i] x[i] = z[i] - sum (n>=k>=i+1) A[i,k] x[k]  # 最後にA[i,i]で割る

# MEMO: :Q:Ax=yを解くプログラム
def solve(A, y, do_decompose=True):
    # Ax=y => LUx=y => Lz=y => Ux=zの順に求める(y=>z=>xの順に解を上書き)
    n = len(A)  # 連立方程式は正方行列の必要あり
    if do_decompose:
        decompose(A)
    for i in range(n):
        for k in range(i):
            y[i] -= A[i][k] * y[k]  # k<i, y[k]=z[k]
    for i in reversed(range(n)):
        for k in range(i + 1, n):
            y[i] -= A[i][k] * y[k]  # i<k, y[k]=x[k]
        y[i] /= float(A[i][i])
    return y


def test_solve():
    A = [[2, 3, 3], [3, 4, 2], [-2, -2, 3]]
    y = [9, 9, 2]
    print(solve(A, y))  # [3, -1, 2]


# MEMO: :Q:AX=Eの逆行列を求める
def inv(A):
    n = len(A)  # 逆行列は正則である必要あり
    decompose(A)  # LU分解は一度だけ行う
    X = []
    for i in range(n):
        e = [1 if i == j else 0 for j in range(n)]
        X.append(solve(A, e, do_decompose=False))
    return transpose(X)


A = [[2, 3, 3], [3, 4, 2], [-2, -2, 3]]
print(inv(A))
A = [[2, 3, 3], [3, 4, 2], [-2, -2, 3]]
print(np.linalg.inv(A))
# -16  15  6
#  13 -12 -5
#  -2   2  1
