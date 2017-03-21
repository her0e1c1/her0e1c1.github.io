
# Bucket Sort

Order: O(size + range)

```
Ok = sum CNT(i) (0 <= i < k)
Ok <= k < O(k+1)
```
範囲が決まっていれば、個数を調べて、offsetで並べる

## Pros
- 同じ要素の整数があっても良い

## Cons
- [0, max)の制約があるので、maxが大きすぎるとメモリが足りない
