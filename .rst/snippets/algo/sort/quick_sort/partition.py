# パーティションの取りうる値

def partition(a, left, right):
    i = left
    j = right
    pivot = a[left]
    while (i <= j):
        print A
        while (a[i] < pivot):
            i += 1
        while (a[j] > pivot):
            j -= 1
        if i <= j:
            tmp = a[i]
            a[i] = a[j]
            a[j] = tmp
            i += 1
            j -= 1
    return a, i, j

A = [5, 6, 6, 8, 1, 1, 1]
# A = [5, 6, 6, 1, 3, 3, 3]
print(partition(A, 0, len(A) - 1))
