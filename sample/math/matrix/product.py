# coding: utf-8
import numpy as np


# MEMO: :Q:行列AとBの積
def mul(A, B):
    # 正方行列であることの仮定あり
    assert len(A) > 0 and len(B) > 0
    assert len(A[0]) == len(B)
    l, m, n = len(A), len(B), len(B[0])
    C = [[0] * n for _ in range(l)]
    # 3重ループ
    for i in range(l):
        for j in range(n):
            C[i][j] = sum(A[i][k] * B[k][j] for k in range(m))
    return C


A = np.array([[1, 2, 3], [2, 3, 4]])
B = np.array([[1, 0], [0, 1], [1, 1]])
assert (mul(A, B) == np.dot(A, B)).all()
