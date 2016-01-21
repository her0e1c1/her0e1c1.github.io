
(p "極大値")

(math "x[i-1] < x[i] > x[i+1] S.T. i $in $[1, n-1$]")

(py "
A = [5,6,5,6,1,1,1,1,6,5,6,5]
N = len(A)
P = [False] * N  # 極大値ならTrue
Q = []  # 極大値をとるxを順に格納
for i in range(1, N-1):
    if A[i-1] < A[i] > A[i+1]:
        P[i] = True
        Q.append(i)
print(P)
print(Q)
" :str #t)
