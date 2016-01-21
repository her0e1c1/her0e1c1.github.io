
(p "極大値における最大一定間隔")

(math "0 $le j $le K, S_n $mbox{を極大値の数列としたとき} |a_{ij} - a_{i(j+1)}| $ge $max K")

(p "
K=1のとき、間隔1の区間が1つとれるようにする。
K=1のとき、間隔Kの区間がkつとれるようにする。
なお、Kの最大は2分探索で求める
")

(py "
# 極大値が間隔Kで取れる場合はTrue
def f(K, S):
    i = 0  # 左端から貪欲に
    N = len(S)
    for _ in range(K-1):  # 2つ目の間隔が取れるか?から開始
        if (i == N): return False
        P = S[i]
        j = i + 1
        while j < N:
            Q = S[j]
            if Q - P >= K: break
            j += 1
        if j == N: return False
        i = j
    return True
A = [1,3,5,10]
print(f(2, A))
print(f(3, A))
print(f(4, A))
" :str #t)
