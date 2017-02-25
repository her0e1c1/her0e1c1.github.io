
(p "fibの歩数で移動")

(py "
MAX = 2 ** 30 
def make(N):
    f = [1, 1]
    for i in range(N):
        a = f[i+1] + f[i]
        f.append(a)
        if a > N:
            return f
    return f

def solution(A):
    N = len(A)
    fibs = make(N)
    dp = [MAX] * (N+1)
    for f in fibs:
        n = f - 1
        if n == N or (0<= n < N and A[n] == 1):
            dp[n] = 1
    for i in range(N+1):
        if i == N:
            pass
        elif A[i] == 0:
            continue
        for f in fibs:
            n = i + f
            if not (n <= N):
                break
            elif n == N or A[n] == 1:
                dp[n] = min(dp[n],  dp[i]+1)
    return -1 if dp[N] == MAX else dp[N]
A = [0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0] 
print(solution(A))
" :str #t)
