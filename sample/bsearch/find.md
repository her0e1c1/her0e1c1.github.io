
# min arg f(x) <= k
```
f x = x <= k   -- upper_bound
foldl acc x = if f (acc + x) then acc + x else acc
```
畳み込みできるのは、f(x)が単調増加の場合のみ.(大きい方から加算)

# man arg f(x) >= k
```
f x = x >= k  -- lower_bound
foldl (\acc x -> if f (acc - x) then acc - x else acc)
```
畳み込みできるのは、f(x)が減少関数の場合のみ. (大きい方から減算)

# 長さlの重複ソート配列に含まれるNの個数
```
[1, 1, 1, 2, 2, 3, 4, 4, 4, 5, 6, 6]
```
- `a_i <= N` を満たす最大のi
- `a_j >= N` を満たす最小のj

この場合、j-i+1個となる
