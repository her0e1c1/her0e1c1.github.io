
(p "各一定区間内に極大値をもつよう区分")

(py "
def f(groups, S):
    N = len(S)
    assert N % groups == 0
    interval = N / groups
    for _ in range(groups):
        for i in range(0, N, interval):
            last = i + interval
            while i < last:
                if S[i]: break
                i += 1
            if i == last: return False
    return True
A = [False, True, False, True, False, False, False, False, True, False, True, False]
print(f(2, A))
print(f(3, A))
print(f(4, A))
" :str #t)
